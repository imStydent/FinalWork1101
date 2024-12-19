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
    public class UserService
    {
        public readonly FragrantWorldContext _context = new();

        public async Task<User> GetUserByLoginAsync(string login)
            => await _context.Users.Where(u => u.UserLogin == login).FirstOrDefaultAsync();
    }
}
