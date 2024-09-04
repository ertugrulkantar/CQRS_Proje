using LargestPrimeApp.Domain.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Domain.Entities
{
    public class NumberEntity:BaseEntity
    {
        public String NumbersString { get; set; }
        public int LargestPrime { get; set; }
    }
}
