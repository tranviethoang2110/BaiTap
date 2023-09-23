using DataAccessLayer.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class NhaCungCapRepository :INhaCungCapRepository
    {
        private IDatabaseHelper _dbHelper;
        public NhaCungCapRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public NhaCungCapModel GetDatabyId(string ncc) 
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhacungcap_get_by_id",
                    "@ncc",ncc
                    );
                if (!string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(msgError); ;
                }
                return dt.ConvertTo<NhaCungCapModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool Create_NCC(NhaCungCapModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhacungcap_create",
                    "@MaNCC", model.MaNCC,
                    "@TenNCC",model.TenNCC,
                    "@SDT",model.SDT,
                    "@Email",model.Email
                    );
                if ((result!=null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result)+msgError); ;
                }
                return true;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public bool Update_NCC(NhaCungCapModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhacungcap_update",
                    "@MaNCC", model.MaNCC,
                    "@TenNCC", model.TenNCC,
                    "@SDT", model.SDT,
                    "@Email", model.Email
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
        public bool Delete_NCC(string ncc)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_nhacungcap_delete",
                    "@MaNCC", ncc
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
