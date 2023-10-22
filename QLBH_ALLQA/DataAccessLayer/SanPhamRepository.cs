using DataAccessLayer.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public  class SanPhamRepository:ISanPhamRepository
    {
        private IDatabaseHelper _dbHelper;
        public SanPhamRepository (IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public SanPhamModel GetDataByMaSP(string MaSP)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_msp_get_by_sp",
                     "@MaSP", MaSP);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPhamModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create_SanPham(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_create",
                    "@MaSP", model.MaSP,
                    "@MaCM", model.MaCM,
                    "@TenSP", model.TenSP,
                    "@GiaBan", model.GiaBan,
                    "@GiamGia", model.GiamGia,
                    "@SoLuong", model.SoLuong,
                    "@Size", model.Size,
                    "@TrangThai", model.TrangThai,
                    "@LuotXem", model.LuotXem
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
        public bool Update_SanPham(SanPhamModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_update",
                    "@MaSP", model.MaSP,
                    "@MaCM", model.MaCM,
                    "@TenSP", model.TenSP,
                    "@GiaBan", model.GiaBan,
                    "@GiamGia", model.GiamGia,
                    "@SoLuong", model.SoLuong,
                    "@Size", model.Size,
                    "@TrangThai", model.TrangThai,
                    "@LuotXem", model.LuotXem
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
        public bool Delete_SanPham(string MaSP)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_delete",
                    "@MaSP", MaSP
                    );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
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
