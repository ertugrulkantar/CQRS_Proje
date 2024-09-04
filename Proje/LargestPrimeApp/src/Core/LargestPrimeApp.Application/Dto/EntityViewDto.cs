using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Application.Dto
{
    public class EntityViewDto //Sadece disariya gosterecegimiz proplar
    {
        public Guid Id { get; set; }
        public String NumbersString { get; set; }
        public int LargestPrime { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}
