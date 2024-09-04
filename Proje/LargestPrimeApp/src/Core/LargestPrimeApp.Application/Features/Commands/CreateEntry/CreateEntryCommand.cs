using AutoMapper;
using MediatR;
using LargestPrimeApp.Application.Interfaces.Repository;
using LargestPrimeApp.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace LargestPrimeApp.Application.Features.Commands.CreateEntry
{
    public class CreateEntryCommand : IRequest<ServiceResponse<int>>
    {
        public String NumbersString { get; set; }
        public int LargestPrime { get; set; }

        public DateTime CreatedAt { get; set; }

        public class CreateEntryCommandHandler : IRequestHandler<CreateEntryCommand, ServiceResponse<int>>
        {
            IEntryRepository largestPrimeRepository;
            private readonly IMapper mapper;
            


            public CreateEntryCommandHandler(IEntryRepository largestPrimeRepository,IMapper mapper)
            {
                this.largestPrimeRepository = largestPrimeRepository;
                this.mapper = mapper;
            }

            public async Task<ServiceResponse<int>> Handle(CreateEntryCommand request, CancellationToken cancellationToken)
            {
                var largestPrime = mapper.Map<Domain.Entities.NumberEntity>(request);
                await largestPrimeRepository.AddAsync(largestPrime);
                
                return new ServiceResponse<int>(largestPrime.LargestPrime);
            }
        }
    }
}
