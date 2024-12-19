using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseLibrary.Services
{
    public class PickupPointService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<List<PickupPoint>> GetPickupPointsAsync()
            => await _context.PickupPoints.ToListAsync();
    }
}
