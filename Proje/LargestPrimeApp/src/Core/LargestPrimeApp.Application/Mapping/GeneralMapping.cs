using AutoMapper;
using LargestPrimeApp.Application.Features.Commands.CreateEntry;
using LargestPrimeApp.Application.Features.Queries.GetEntryById;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Application.Mapping
{
    public class GeneralMapping:Profile
    {
        public GeneralMapping()
        {
            CreateMap<Domain.Entities.NumberEntity,Dto.EntityViewDto>().ReverseMap();
            CreateMap<Domain.Entities.NumberEntity, CreateEntryCommand>().ReverseMap();
            CreateMap<Domain.Entities.NumberEntity, GetEntryByIdViewModel>().ReverseMap();
        }
    }
}
