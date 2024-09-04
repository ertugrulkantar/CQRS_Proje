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

namespace LargestPrimeApp.Application.Features.Queries.GetEntryById
{
    public class GetEntryByIdQueryHandler : IRequestHandler<GetEntryByIdQuery, ServiceResponse<GetEntryByIdViewModel>>
    {
        IEntryRepository largestPrimeRepository;
        private readonly IMapper mapper;

        public GetEntryByIdQueryHandler(IEntryRepository largestPrimeRepository,IMapper mapper)
        {
            this.largestPrimeRepository = largestPrimeRepository;
            this.mapper = mapper;
        }

        public async Task<ServiceResponse<GetEntryByIdViewModel>> Handle(GetEntryByIdQuery request, CancellationToken cancellationToken)
        {
            var largestPrime = await largestPrimeRepository.GetByIdAsync(request.Id);
            var dto=mapper.Map<GetEntryByIdViewModel>(largestPrime);
            return new ServiceResponse<GetEntryByIdViewModel>(dto);
        }
    }
}
