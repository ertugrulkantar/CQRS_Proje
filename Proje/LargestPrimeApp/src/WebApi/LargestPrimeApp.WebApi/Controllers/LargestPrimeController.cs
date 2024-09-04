using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using LargestPrimeApp.Application.Dto;
using LargestPrimeApp.Application.Features.Commands.CreateEntry;
using LargestPrimeApp.Application.Features.Queries.GetAllEntries;
using LargestPrimeApp.Application.Features.Queries.GetEntryById;
using LargestPrimeApp.Application.Interfaces.Repository;

namespace LargestPrimeApp.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LargestPrimeController : ControllerBase
    {
        private readonly IMediator mediator;

        public LargestPrimeController(IMediator mediator)  //Hata mesajlarini islemeye calistim fluentvalidator ile
        {                                                  //ancak birkacini isleyebilirken birkaci buradan(direkt constructordan) dondu.
            this.mediator = mediator;                      //ornegin listeye harf ekledigimde hatayi islemeye gelemeden
        }                                                  //direkt burada hatayi firlatiyor. Sanirim mediator ile fluentin
        [HttpGet]                                          //birlikte kullanilmasinda bir detay var. Cozmeyi uzun sure denedim, kaynaklari taradim.  
        public async Task<IActionResult> Get()             //Cozulmeyinmeyince cok sikinti yaratmayacagini dusunerek biraktim. Bir kaynak: https://codewithmukesh.com/blog/validation-with-mediatr-pipeline-behavior-and-fluentvalidation/
        {
            var query=new GetAllEntriesQuery();

            return Ok(await mediator.Send(query));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            var query = new GetEntryByIdQuery() { Id=id};

            return Ok(await mediator.Send(query));
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] List<int> numbers)
        {
            var largestPrime = GetLargestPrime(numbers);
            var command = new CreateEntryCommand
            {
                NumbersString = string.Join(",", numbers),
                LargestPrime = largestPrime,
                CreatedAt = DateTime.UtcNow
            };
            return Ok(await mediator.Send(command));
        }

        private int GetLargestPrime(IEnumerable<int> numbers)
        {
            return numbers.Where(IsPrime).OrderByDescending(n => n).FirstOrDefault();
        }
        private bool IsPrime(int number)
        {
            if (number <= 1) return false;
            if (number == 2) return true;
            if (number % 2 == 0) return false;

            for (int i = 3; i <= Math.Sqrt(number); i += 2)
            {
                if (number % i == 0) return false;
            }
            return true;
        }
    }
}
