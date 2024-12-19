using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class Product
    {
        public string ProductArticleNumber { get; set; } = null!;

        public string? ProductName { get; set; }

        public string? ProductDescription { get; set; }

        public string? ProductCategory { get; set; }

        public byte[]? ProductPhoto { get; set; }

        public string? ProductManufacturer { get; set; }

        public decimal? ProductCost { get; set; }

        public byte? ProductDiscountAmount { get; set; }

        public int? ProductQuantityInStock { get; set; }

        public string? ProductStatus { get; set; }

        public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();
    }
}
