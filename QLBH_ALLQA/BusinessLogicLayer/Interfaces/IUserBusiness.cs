using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public  partial interface IUserBusiness
    {
        bool Login(string taikhoan, string matkhau);

        bool Create_TaiKhoan(UserModel model);
        bool Update_TaiKhoan(UserModel model);
        bool Delete_TaiKhoan(int mtk);
    }
}
