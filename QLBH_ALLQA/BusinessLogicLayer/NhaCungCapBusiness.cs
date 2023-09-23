
using BusinessLogicLayer.Interfaces;
using DataAccessLayer;
using DataAccessLayer.Interfaces;
using DataModel;

namespace BusinessLogicLayer
{
    public class NhaCungCapBusiness : INhaCungCapBusiness
    {
        private INhaCungCapRepository _res;
        public NhaCungCapBusiness (INhaCungCapRepository res)
        {
            _res = res;
        }
        public NhaCungCapModel GetDatabyId(string ncc)
        {
            return _res.GetDatabyId(ncc);
        }
        public bool Create_NCC(NhaCungCapModel model)
        {
            return _res.Create_NCC(model);
        }
        public bool Update_NCC(NhaCungCapModel model)
        {
            return _res.Update_NCC(model);
        }
        public bool Delete_NCC(string ncc)
        {
            return _res.Delete_NCC(ncc);
        }
    }
}
