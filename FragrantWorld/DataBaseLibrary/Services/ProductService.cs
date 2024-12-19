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
    public class ProductService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<List<Product>> GetProductsAsync()
            => await _context.Products.ToListAsync();

        public async Task<List<Product>> GetFilteredProductsAsync(int? sortBy, string? name, string? maker, decimal? minPrice = null, decimal? maxPrice = null)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(name))
                query = query.Where(p => p.ProductName.Contains(name));

            if (!string.IsNullOrEmpty(maker) && maker != "Все производители")
                query = query.Where(p => p.ProductManufacturer.Contains(maker));

            if (minPrice != null && maxPrice != null)
                query = query.Where(p => p.ProductCost >= minPrice && p.ProductCost <= maxPrice);

            query = sortBy switch
            {
                0 => query.OrderBy(p => p.ProductCost),
                1 => query.OrderByDescending(p => p.ProductCost),
                _ => query
            };

            return await query.ToListAsync();
        }

        public async Task<List<string>> GetManufacterers()
            => await _context.Products.Select(p => p.ProductManufacturer).Distinct().ToListAsync();
    }
}
