using System;
using System.Collections.Generic;

namespace HoVanHoang_WebBanHang.Models;

public partial class DonHang
{
    public int Id { get; set; }

    public int KhachHangId { get; set; }

    public DateTime? NgayDat { get; set; }

    public decimal? TongTien { get; set; }

    public string? TrangThai { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual KhachHang KhachHang { get; set; } = null!;
}
