using AutoMapper;
using MediatR;
using LargestPrimeApp.Application.Dto;
using LargestPrimeApp.Application.Interfaces.Repository;
using LargestPrimeApp.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Application.Features.Queries.GetAllEntries
{
    public class GetAllEntriesQuery : IRequest<ServiceResponse<List<EntityViewDto>>>  //Handler'ini yine icerisine yaziyoruz.
    {
        public class GetAllEntriesQueryHandler : IRequestHandler<GetAllEntriesQuery, ServiceResponse<List<EntityViewDto>>>
        {
            private readonly IEntryRepository largestPrimeRepository;
            private readonly IMapper mapper;

            public GetAllEntriesQueryHandler(IEntryRepository largestPrimeRepository,IMapper mapper)
            {
                this.largestPrimeRepository = largestPrimeRepository;
                this.mapper = mapper;
            }
            public async Task<ServiceResponse<List<EntityViewDto>>> Handle(GetAllEntriesQuery request, CancellationToken cancellationToken)
            {
                var largestPrimes = await largestPrimeRepository.GetAllAsync();

                var viewModel = mapper.Map<List<EntityViewDto>>(largestPrimes);

                //var dto= products.Select(i => new ProductViewDto() //Buna yukarıdaki satir sebebiyle gerek kalmadi.
                //{
                //    Id = i.Id,
                //    Name = i.Name
                //}).ToList();

                return new ServiceResponse<List<EntityViewDto>>(viewModel);
            }
        }
    }
}
