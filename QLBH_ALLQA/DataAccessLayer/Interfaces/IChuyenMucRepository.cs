using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    public partial interface IChuyenMucRepository
    {
        ChuyenMucModel GetDatabyCM(string cm);
        bool Create_CM(ChuyenMucModel model);
        bool Update_CM(ChuyenMucModel model);
        bool Delete_CM(string cm);
    }
}
