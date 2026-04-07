using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HoVanHoang_WebBanHang.Models;

namespace HoVanHoang_WebBanHang.Controllers
{
    public class SanPhamController : Controller
    {
        private readonly QuanLyBanHangContext _context;
        public SanPhamController(QuanLyBanHangContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            var danhSachSanPham = _context.SanPhams.Include(s => s.DanhMuc).ToList();
            return View(danhSachSanPham);
        }
    }
}