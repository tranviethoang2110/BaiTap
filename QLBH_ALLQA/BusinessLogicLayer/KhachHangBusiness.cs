using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class KhachHangBusiness : IKhachHangBusiness
    {
        private IKhachHangRepository _res;
        public KhachHangBusiness(IKhachHangRepository res)
        {
            _res = res;
        }
        public KhachHangModel GetDatabyId(string id)
        {
            return _res.GetDatabyId(id);
        }
        public bool Create_KhachHang(KhachHangModel model)
        {
            return _res.Create_KhachHang(model);
        }
        public bool Update_KhachHang(KhachHangModel model)
        {
            return _res.Update_KhachHang(model);
        }
        public bool Delete_KhachHang(string model)
        {
            return _res.Delete_KhachHang(model);
        }

    }
}