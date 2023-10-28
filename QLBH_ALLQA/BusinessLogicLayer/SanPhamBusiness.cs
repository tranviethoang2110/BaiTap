using BusinessLogicLayer.Interfaces;
using DataAccessLayer.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public  class SanPhamBusiness : ISanPhamBusiness
    {
        private ISanPhamRepository _res;
        public SanPhamBusiness(ISanPhamRepository res)
        {
            _res = res;
        }
        public SanPhamModel GetDataByMaSP(string MaSP)
        {
            return _res.GetDataByMaSP(MaSP);
        }
        public bool Create_SanPham(SanPhamModel model)
        {
            return _res.Create_SanPham(model);
        }
        public bool Update_SanPham(SanPhamModel model)
        {
            return _res.Update_SanPham(model);
        }
        public bool Delete_SanPham(string MaSP)
        {
            return _res.Delete_SanPham(MaSP);
        }
        public List<SanPhamModel> SearchSP(int pageIndex, int pageSize, out int total, string TenSP, string GiaBan)
        {
            return _res.SearchSP(pageIndex, pageSize, out total, TenSP, GiaBan);
        }
        public List<SanPhamModel> SearchALL()
        {
            return _res.SearchALL();
        }
    }
}
