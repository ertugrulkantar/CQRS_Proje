﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Domain.Common
{
    public class BaseEntity  //Veritabanindaki butun tablolarda bulunacak alanlar eklenir.
    {
        public Guid Id { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
