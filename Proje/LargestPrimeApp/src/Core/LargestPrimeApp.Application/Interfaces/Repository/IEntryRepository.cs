using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LargestPrimeApp.Domain.Entities;
namespace LargestPrimeApp.Application.Interfaces.Repository
{
    public interface IEntryRepository:IGenericRepositoryAsync<NumberEntity>
    {
        
    }
}
