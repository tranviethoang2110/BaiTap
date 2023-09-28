using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IKhachHangBusiness
    {
        KhachHangModel GetDatabyId(string MaKH);
        bool Create_KhachHang(KhachHangModel model);
        bool Update_KhachHang(KhachHangModel model);
        bool Delete_KhachHang(string model);
    }
}
