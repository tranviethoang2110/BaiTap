using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
     public  partial interface ISanPhamBusiness
    {
        SanPhamModel GetDataByMaSP(string MaSP);
        bool Create_SanPham(SanPhamModel model);
        bool Update_SanPham(SanPhamModel model);
        bool Delete_SanPham(string MaSP);
        List<SanPhamModel> SearchSP(int pageIndex, int pageSize, out int total, string TenSP, string GiaBan);
        List<SanPhamModel> SearchALL();
    }
}
