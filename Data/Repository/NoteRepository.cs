using Notes.Data.Model;
using SQLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Notes.Data.Repository
{
    public class NoteRepository : INoteRepository
    {
        private SQLiteAsyncConnection Database;
        async Task Init()
        {
            if (Database is not null)
                return;

            Database = new SQLiteAsyncConnection(Constants.DatabasePath, Constants.Flags);
            var result = await Database.CreateTableAsync<NoteDataModel>();
        }
        public NoteRepository()
        {
            Init().GetAwaiter().GetResult();
        }

        bool INoteRepository.Delete(string filename, string data)
        {
            var item = new NoteDataModel
            {
                Name = filename,
                Data = data
            };
            Database.DeleteAsync(item).GetAwaiter().GetResult();
            return true;
        }

        bool INoteRepository.Write(string name, string data)
        {
            var item = new NoteDataModel
            {
                Name = name,
                Data = data
            };
            Database.InsertAsync(item).GetAwaiter().GetResult();
            return true;
        }

        NoteDataModel INoteRepository.ReadItem(string filename)
        {
            return Database.Table<NoteDataModel>().FirstOrDefaultAsync(x => x.Name == filename).GetAwaiter().GetResult();
        }

        List<NoteDataModel> INoteRepository.ReadItems(string filename)
        {
            return Database.Table<NoteDataModel>().ToListAsync().GetAwaiter().GetResult();
        }

        NoteDataModel INoteRepository.Update(int id, string filename, string data)
        {
            var item = new NoteDataModel
            {
                Id = id,
                Name = filename,
                Data = data
            };
            Database.UpdateAsync(item).GetAwaiter().GetResult();
            return item;
        }

        NoteDataModel INoteRepository.UpdateName(string oldname, string name)
        {
            var olditem = ((INoteRepository)this).ReadItem(oldname);
            olditem.Name = name;
            ((INoteRepository)this).Update(olditem.Id, olditem.Name, olditem.Data);
            return olditem;
        }
    }
}
