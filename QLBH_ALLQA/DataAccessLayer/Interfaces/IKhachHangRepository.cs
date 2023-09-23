using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;

namespace DataAccessLayer.Interfaces
{
    public partial interface IKhachHangRepository
    {
        KhachHangModel GetDatabyId(string model);
        bool Create_KhachHang(KhachHangModel model);
        bool Update_KhachHang(KhachHangModel model);
        bool Delete_KhachHang(string model);
    }
}
