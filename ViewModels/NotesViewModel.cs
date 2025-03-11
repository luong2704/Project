using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Notes.Models;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace Notes.ViewModels;

internal class NotesViewModel : ObservableObject, IQueryAttributable
{
    private string _searchQuery;
    public string SearchQuery
    {
        get => _searchQuery;
        set
        {
            SetProperty(ref _searchQuery, value);
            PerformSearch();
        }
    }

    public ObservableCollection<NoteViewModel> AllNotes { get; }
    public ObservableCollection<NoteViewModel> FilteredNotes { get; }

    // Commands
    public ICommand NewCommand { get; }
    public ICommand SelectNoteCommand { get; }

    public NotesViewModel()
    {
        // Load all notes into AllNotes
        AllNotes = new ObservableCollection<NoteViewModel>(
            Note.LoadAll().Select(n => new NoteViewModel(n))
        );

        // Initialize FilteredNotes with the same contents
        FilteredNotes = new ObservableCollection<NoteViewModel>(AllNotes);

        // Set up commands
        NewCommand = new AsyncRelayCommand(NewNoteAsync);
        SelectNoteCommand = new AsyncRelayCommand<NoteViewModel>(SelectNoteAsync);
    }

    private void PerformSearch()
    {
        // Clear the filtered list
        FilteredNotes.Clear();

        // If there's no search text, display all notes
        if (string.IsNullOrWhiteSpace(SearchQuery))
        {
            foreach (var note in AllNotes)
                FilteredNotes.Add(note);
        }
        else
        {
            // Otherwise, filter notes by text
            var filtered = AllNotes
                .Where(n => n.Text.Contains(SearchQuery, StringComparison.OrdinalIgnoreCase))
                .ToList();

            foreach (var note in filtered)
                FilteredNotes.Add(note);
        }
    }

    private async Task NewNoteAsync()
    {
        await Shell.Current.GoToAsync(nameof(Views.NotePage));
    }

    private async Task SelectNoteAsync(NoteViewModel note)
    {
        if (note != null)
        {
            await Shell.Current.GoToAsync($"{nameof(Views.NotePage)}?load={note.Identifier}");
        }
    }

    public void ApplyQueryAttributes(IDictionary<string, object> query)
    {
        if (query.ContainsKey("deleted"))
        {
            string noteId = query["deleted"].ToString();
            var matchedNote = AllNotes.FirstOrDefault(n => n.Identifier == noteId);
            if (matchedNote != null)
                AllNotes.Remove(matchedNote);
        }
        else if (query.ContainsKey("saved"))
        {
            string noteId = query["saved"].ToString();
            var matchedNote = AllNotes.FirstOrDefault(n => n.Identifier == noteId);

            // If note is found, update it
            if (matchedNote != null)
            {
                matchedNote.Reload();
                AllNotes.Move(AllNotes.IndexOf(matchedNote), 0);
            }
            // If note isn't found, it's new; add it
            else
            {
                var newNote = new NoteViewModel(Note.Load(noteId));
                AllNotes.Insert(0, newNote);
            }
        }

        // Re-run search in case notes have changed
        PerformSearch();
    }
}
