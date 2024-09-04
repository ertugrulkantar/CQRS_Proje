using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using LargestPrimeApp.Application.Interfaces.Repository;
using LargestPrimeApp.Persistence.Context;
using LargestPrimeApp.Persistence.Repositories;
using Microsoft.Extensions.Configuration;

namespace LargestPrimeApp.Persistence
{
    public static class ServiceRegistration
    {
        public static void AddPersistenceRegistration(this IServiceCollection serviceCollection, IConfiguration configuration)
        {
            serviceCollection.AddDbContext<ApplicationDbContext>(opt =>
                opt.UseMySql(
                    configuration.GetConnectionString("DefaultConnection"),
                    new MySqlServerVersion(new Version(8, 0, 36))));

            serviceCollection.AddScoped<IEntryRepository, LargestPrimeRepository>();
        }
    }
}