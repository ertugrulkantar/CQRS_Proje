using LargestPrimeApp.Application.Interfaces.Repository;
using LargestPrimeApp.Domain.Entities;
using LargestPrimeApp.Persistence.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Persistence.Repositories
{
    public class LargestPrimeRepository : GenericRepository<NumberEntity>, IEntryRepository
    {
        public LargestPrimeRepository(ApplicationDbContext dbContext) : base(dbContext)
        {
        }
    }
}
