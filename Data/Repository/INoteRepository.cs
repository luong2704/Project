using Notes.Data.Model;
namespace Notes.Data.Repository
{
    public interface INoteRepository
    {
        NoteDataModel ReadItem(string filename);
        List<NoteDataModel> ReadItems(string filename);
        bool Write(string name, string data);
        bool Delete(string filename,string data);
        NoteDataModel Update(int id, string filename, string data);
        NoteDataModel UpdateName(string oldname, string newname);

    }
}
