using Microsoft.Graph;
using Notes.Data.Repository;

namespace Notes.Models;

internal class Note
{
    public string Filename { get; set; }
    public string Text { get; set; }
    public DateTime Date { get; set; }

    private INoteRepository _noteRepository;
    public Note()
    {
        Filename = $"{Path.GetRandomFileName()}.notes.txt";
        Date = DateTime.Now;
        Text = "";
        _noteRepository = new NoteRepository();
    }
//    public void Save() =>
//File.WriteAllText(System.IO.Path.Combine(FileSystem.AppDataDirectory, Filename), Text);
    public void Save()
    {
        var item = _noteRepository.ReadItem(Filename);
        if (item is null)
        {
            _noteRepository.Write(Filename, Text);
        }
        else
        {
            item.Data = Text;
            _noteRepository.Update(item.Id, Filename, Text);
        }
    }
    public void Delete()
    {
        var item = _noteRepository.ReadItem(Filename);
        if (item is not null)
        {
            _noteRepository.Delete(Filename, Text);
        }
    }
    //public void Delete() =>
    //    File.Delete(System.IO.Path.Combine(FileSystem.AppDataDirectory, Filename));
    //public static Note Load(string filename)
    //{
    //    filename = System.IO.Path.Combine(FileSystem.AppDataDirectory, filename);

    //    if (!File.Exists(filename))
    //        throw new FileNotFoundException("Unable to find file on local storage.", filename);

    //    return
    //        new()
    //        {
    //            Filename = Path.GetFileName(filename),
    //            Text = File.ReadAllText(filename),
    //            Date = File.GetLastWriteTime(filename)
    //        };
    //}
    public static Note Load(string filename)
    {
        var item = new NoteRepository().ReadItem(filename);
        return new Note
        {
            Filename = item.Name,
            Text = item.Data,
            Date = item.Date
        };
    }
    //public static IEnumerable<Note> LoadAll()
    //{
    //    // Get the folder where the notes are stored.
    //    string appDataPath = FileSystem.AppDataDirectory;

    //    // Use Linq extensions to load the *.notes.txt files.
    //    return Directory

    //            // Select the file names from the directory
    //            .EnumerateFiles(appDataPath, "*.notes.txt")

    //            // Each file name is used to load a note
    //            .Select(filename => Note.Load(Path.GetFileName(filename)))

    //            // With the final collection of notes, order them by date
    //            .OrderByDescending(note => note.Date);
    //}
    public static IEnumerable<Note> LoadAll()
    {
        var items = new NoteRepository().ReadItems("");
        return items.Select(item => new Note
        {
            Filename = item.Name,
            Text = item.Data,
            Date = item.Date
        });
    }
}
