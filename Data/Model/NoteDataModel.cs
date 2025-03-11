using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Notes.Data.Model
{
    public class NoteDataModel
    {
        public NoteDataModel() { }

        public string Data { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public int Id { get; internal set; }
    }
}
