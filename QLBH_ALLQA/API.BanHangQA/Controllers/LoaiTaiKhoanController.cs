using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.BanHangQA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiTaiKhoanController : ControllerBase
    {
        private ILoaiTaiKhoanBusiness _ltkBusiness;
        public LoaiTaiKhoanController(ILoaiTaiKhoanBusiness ltkBusiness)
        {
            _ltkBusiness = ltkBusiness;
        }
        [Route("get-by-id/{id}")]
        [HttpGet]
        public LoaiTaiKhoanModel GetDatabyId(string id)
        {
            return _ltkBusiness.GetDatabyId(id);
        }
        [Route("create-id")]
        [HttpPost]
        public LoaiTaiKhoanModel Create([FromBody] LoaiTaiKhoanModel model)
        {
            _ltkBusiness.Create_LTK(model);
            return model;
        }

        [Route("update-id")]
        [HttpPut]
        public LoaiTaiKhoanModel Update([FromBody] LoaiTaiKhoanModel model)
        {
            _ltkBusiness.Update_LTK(model);
            return model;
        }
        [Route("delete-ltk")]
        [HttpDelete]
        public IActionResult Delete([FromBody] string model)
        {
            _ltkBusiness.Delete_LTK(model);
            return Ok();
        }
    }
}
