﻿using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace FragrantWorldWebApi.Models;

public partial class Order
{
    public int OrderId { get; set; }

    public string OrderStatus { get; set; } = null!;

    public DateOnly OrderDate { get; set; }

    public DateOnly OrderDeliveryDate { get; set; }

    public int OrderPickupPoint { get; set; }

    public short OrderReceiptCode { get; set; }

    public virtual PickupPoint OrderPickupPointNavigation { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();
}
