﻿using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace FragrantWorldWebApi.Models;

public partial class PickupPoint
{
    public int PickupPointId { get; set; }

    public int PostCode { get; set; }

    public string Address { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
