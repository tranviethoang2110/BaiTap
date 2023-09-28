using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer.Interfaces
{
    public partial interface IChuyenMucBusiness
    {
        ChuyenMucModel GetDatabyCM(string cm);
        bool Create_CM(ChuyenMucModel model);
        bool Update_CM(ChuyenMucModel model);
        bool Delete_CM(string cm);
    }
}
