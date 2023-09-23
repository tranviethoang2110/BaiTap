using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface INhaCungCapBusiness
    {
        NhaCungCapModel GetDatabyId(string ncc);
        bool Create_NCC(NhaCungCapModel model);
        bool Update_NCC(NhaCungCapModel model);
        bool Delete_NCC(string ncc);
    }
}
