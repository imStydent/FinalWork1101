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
            return await _client.GetFromJsonAsync<IEnumerable<Product>>("Products");
        }

        public async Task<IEnumerable<Product>?> GetFilteredProductsAsync(int? sortBy, string? name,string? maker="", decimal? minPrice=null, decimal? maxPrice=null)
        {
            return await _client.GetFromJsonAsync<IEnumerable<Product>>($"Products/{sortBy}/{name}");
        }

        public async Task<IEnumerable<string>> GetManufacterersAsync()
        {
            return await _client.GetFromJsonAsync<IEnumerable<string>>($"Products/manufacters");
        }

        public async Task<User> GetUserByLoginAsync(string login)
        {
            return await _client.GetFromJsonAsync<User>($"Users/{login}");
        }

        public async Task<IEnumerable<PickupPoint>> GetPickupPointsAsync()
        {
            return await _client.GetFromJsonAsync<IEnumerable<PickupPoint>>($"PickupPoints");
        }

        public async Task<int> GetOrderNextIdAsync()
        {
            return await _client.GetFromJsonAsync<int>($"Orders/lastId");
        }

        public async Task AddOrderAsync(Order order)
        {
            var response = await _client.PostAsJsonAsync($"Orders", order);
            response.EnsureSuccessStatusCode();
        }
    }
}
