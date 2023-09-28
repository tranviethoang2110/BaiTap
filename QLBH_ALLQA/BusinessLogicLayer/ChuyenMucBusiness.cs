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
    public class ChuyenMucBusiness:IChuyenMucBusiness
    {
        private IChuyenMucRepository _res;
        public ChuyenMucBusiness(IChuyenMucRepository res)
        {
            _res = res;
        }
        public ChuyenMucModel GetDatabyCM(string cm)
        {
            return _res.GetDatabyCM(cm);
        }
        public bool Create_CM(ChuyenMucModel model)
        {
            return _res.Create_CM(model);
        }
        public bool Update_CM(ChuyenMucModel model)
        {
            return _res.Update_CM(model);
        }
        public bool Delete_CM(string cm)
        {
            return _res.Delete_CM(cm);
        }
    }
}
