using Azure;
using FragrantWorld.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Services
{
    public class WebApiService
    {
        private readonly HttpClient _client;

        public WebApiService()
        {
            _client = new() { BaseAddress = new Uri("http://localhost:5006/api/") };
        }

        public async Task<IEnumerable<Product>?> GetProductsAsync()
        {
            var response = await _client.GetAsync("Products");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }

        public async Task<IEnumerable<Product>?> GetFilteredProductsAsync(int? sortBy, string? name,string? maker="", decimal? minPrice=null, decimal? maxPrice=null)
        {
            var response = await _client.GetAsync($"Products/{sortBy}/{name}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Product>>();
        }

        public async Task<IEnumerable<string>?> GetManufacterersAsync()
        {
            var response = await _client.GetAsync($"Products/manufacters");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<string>?>();
        }

        public async Task<User?> GetUserByLoginAsync(string login)
        {
            var response = await _client.GetAsync($"Users/{login}");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<User>();
        }

        public async Task<IEnumerable<PickupPoint>?> GetPickupPointsAsync()
        {
            var response = await _client.GetAsync($"PickupPoints");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<PickupPoint>?>();
        }

        public async Task<int> GetOrderNextIdAsync()
        {
            var response = await _client.GetAsync($"Orders/lastId");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<int>();
        }

        public async Task AddOrderAsync(Order order)
        {
            var response = await _client.PostAsJsonAsync($"Orders", order);
            response.EnsureSuccessStatusCode();
        }
    }
}
