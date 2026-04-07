using System;
using System.Collections.Generic;

namespace HoVanHoang_WebBanHang.Models;

public partial class SanPham
{
    public int Id { get; set; }

    public string TenSanPham { get; set; } = null!;

    public decimal Gia { get; set; }

    public int? DanhMucId { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual DanhMuc? DanhMuc { get; set; }
}
