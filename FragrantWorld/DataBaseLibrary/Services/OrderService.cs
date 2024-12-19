﻿using DataBaseLibrary.Data;
using DataBaseLibrary.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseLibrary.Services
{
    public class OrderService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<int> GetOrderNextIdAsync()
        {
            var lastItem = await _context.Orders.OrderByDescending(o => o.OrderId).FirstOrDefaultAsync();
            return lastItem.OrderId + 1;
        }

        public async Task AddOrderAsync(Order order)
        {
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
        }
    }
}
