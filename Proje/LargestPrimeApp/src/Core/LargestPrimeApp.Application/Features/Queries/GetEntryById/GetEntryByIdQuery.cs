using MediatR;
using LargestPrimeApp.Application.Dto;
using LargestPrimeApp.Application.Wrappers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LargestPrimeApp.Application.Features.Queries.GetEntryById
{
    public class GetEntryByIdQuery:IRequest<ServiceResponse<GetEntryByIdViewModel>> //Burada Handler'i ayirmayi secti.
    {
        public Guid Id { get; set; }


    }
}
