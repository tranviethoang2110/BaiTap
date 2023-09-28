using DataAccessLayer.Interfaces;
using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ChuyenMucRepository :IChuyenMucRepository
    {
        private IDatabaseHelper _dbHelper;
        public ChuyenMucRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public ChuyenMucModel GetDatabyCM(string cm)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_cm_get_by_cm",
                     "@MaCM", cm);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ChuyenMucModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create_CM(ChuyenMucModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_chuyenmuc_create",
                    "@MaCM", model.MaCM,
                    "@MaCMC", model.TenCMC,
                    "@TenCM", model.TenCM,
                    "@DacBiet", model.DacBiet,
                    "@NoiDung", model.NoiDung

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
        public bool Update_CM(ChuyenMucModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_chuyenmuc_update",
                    "@MaCM", model.MaCM,
                    "@MaCMC", model.TenCMC,
                    "@TenCM", model.TenCM,
                    "@DacBiet", model.DacBiet,
                    "@NoiDung", model.NoiDung
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
        public bool Delete_CM(string cm)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_chuyenmuc_delete",
                    "@MaCM", cm
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
