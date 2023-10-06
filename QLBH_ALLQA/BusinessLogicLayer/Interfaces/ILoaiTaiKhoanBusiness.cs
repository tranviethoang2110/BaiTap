using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface ILoaiTaiKhoanBusiness
    {
        LoaiTaiKhoanModel GetDatabyId(string id);
        bool Create_LTK(LoaiTaiKhoanModel model);
        bool Update_LTK(LoaiTaiKhoanModel model);
        bool Delete_LTK(string ltk);
    }
}
