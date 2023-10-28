using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class HoaDonNhapModel
    {
        public string MaHDN {  get; set; }
        public string MaNCC { get;}
        public DateTime NgayNhap { get; set; }
        public string KieuThanhToan {  get; set; }
        public bool TrangThai { get; set; }
        public List<ChiTietHoaDonNhapModel> ChiTietHoaDonNhap { get; set; }
    }
    
}
