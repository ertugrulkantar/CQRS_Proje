using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace LargestPrimeApp.Application.Wrappers
{
    public class ServiceResponse<T>
    {
        public T Value { get; set; }
        public List<string> Errors { get; set; } = new List<string>();


        public ServiceResponse(T value)
        {
            Value = value;
        }
        public ServiceResponse()
        {
            
        }
    }
}
