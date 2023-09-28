using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataModel;

namespace DataAccessLayer.Interfaces
{
    public partial interface INhaCungCapRepository
    {
        NhaCungCapModel GetDatabyId(string MaNCC);
        bool Create_NCC(NhaCungCapModel model);
        bool Update_NCC(NhaCungCapModel model);
        bool Delete_NCC(string ncc);
    }
}
