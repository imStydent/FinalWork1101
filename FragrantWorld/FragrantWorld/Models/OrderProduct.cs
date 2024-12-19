using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace FragrantWorld.Models
{
    public class OrderProduct
    {
        public int OrderId { get; set; }

        public string ProductArticleNumber { get; set; } = null!;

        public byte OrderQuantity { get; set; }

        public virtual Order Order { get; set; } = null!;

        public virtual Product ProductArticleNumberNavigation { get; set; } = null!;
    }
}
