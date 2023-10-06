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
    public class LoaiTaiKhoanBusiness:ILoaiTaiKhoanBusiness
    {
        private ILoaiTaiKhoanRepository _res;
        public LoaiTaiKhoanBusiness(ILoaiTaiKhoanRepository res)
        {
            _res = res;
        }
        public LoaiTaiKhoanModel GetDatabyId(string id)
        {
            return _res.GetDatabyId(id);
        }
        public bool Create_LTK(LoaiTaiKhoanModel model)
        {
            return _res.Create_LTK(model);
        }
        public bool Update_LTK(LoaiTaiKhoanModel model)
        {
            return _res.Update_LTK(model);
        }
        public bool Delete_LTK(string ltk)
        {
            return _res.Delete_LTK(ltk);
        }
    }
}
