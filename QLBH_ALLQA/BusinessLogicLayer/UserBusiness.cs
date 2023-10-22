using BusinessLogicLayer.Interfaces;
using DataAccessLayer.Interfaces;
using DataModel;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class UserBusiness: IUserBusiness
    {
        private IUserRepository _res;
        public UserBusiness(IUserRepository res)
        {
            _res = res;
        }
        public bool Login(string taikhoan,string matkhau)
        {
            return _res.Login(taikhoan,matkhau);
        }
        public bool Create_TaiKhoan(UserModel model)
        {
            return _res.Create_TaiKhoan(model);
        }
        public bool Update_TaiKhoan(UserModel model)
        {
            return _res.Update_TaiKhoan(model);
        }
        public bool Delete_TaiKhoan(int mtk)
        {
            return _res.Delete_TaiKhoan(mtk);
        }
    }
}
