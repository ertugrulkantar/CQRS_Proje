using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Application.Features.Queries.GetEntryById
{
    public class GetEntryByIdViewModel
    {
        public Guid Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public String NumbersString { get; set; }
        public int LargestPrime { get; set; }
    }
}
