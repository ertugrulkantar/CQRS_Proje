using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductApp.Application.Wrappers
{
    public class BaseResponse //Servisten geriye her turlu bu objeyi doneriz
    {
        public Guid Id { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
    }
}
