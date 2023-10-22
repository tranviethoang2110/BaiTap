using DataAccessLayer.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class UserRepository:IUserRepository
    {
        private IDatabaseHelper _dbHelper;
        public UserRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public bool Login(string taikhoan, string matkhau)
        {
            
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_DangNhap",
                    "@TenDangNhap", taikhoan,
                    "@MatKhau", matkhau
                    );
                int tk=dt.ConvertTo<UserModel>().ToList().Count;
                if (tk > 0)
                {
                    return true;
                }

                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool Create_TaiKhoan(UserModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_taikhoan_create",
                   
                    "@LoaiTaiKhoan", model.LoaiTaiKhoan,
                    "@TenDangNhap", model.TenDangNhap,
                    "@MatKhau", model.MatKhau,
                    "@Email", model.Email,
                    "@Token", model.Token
                    );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError); ;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool Update_TaiKhoan(UserModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_taikhoan_update",
                    "@MaTaiKhoan",model.MaTaiKhoan,
                    "@LoaiTaiKhoan", model.LoaiTaiKhoan,
                    "@TenDangNhap", model.TenDangNhap,
                    "@MatKhau", model.MatKhau,
                    "@Email", model.Email,
                    "@Token", model.Token
                    );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError); ;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool Delete_TaiKhoan(int mtk)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_taikhoan_delete",
                    "@MaTaiKhoan", mtk
                    );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError); ;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
