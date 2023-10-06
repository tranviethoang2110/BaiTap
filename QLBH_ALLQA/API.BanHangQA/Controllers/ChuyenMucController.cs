using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.BanHangQA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChuyenMucController : ControllerBase
    {
        private IChuyenMucBusiness _chuyenmucBusiness;
        public ChuyenMucController(IChuyenMucBusiness chuyenmucBusiness)
        {
            _chuyenmucBusiness = chuyenmucBusiness;
        }
        [Route("get-by-MaCM/{cm}")]
        [HttpGet]
        public ChuyenMucModel GetDatabyCM(string cm)
        {
            return _chuyenmucBusiness.GetDatabyCM(cm);
        }
        [Route("create-chuyenmuc")]
        [HttpPost]
        public ChuyenMucModel Create_CM([FromBody] ChuyenMucModel model)
        {
            _chuyenmucBusiness.Create_CM(model);
            return model;
        }
        [Route("update-chuyenmuc")]
        [HttpPut]
        public ChuyenMucModel Update_CM([FromBody] ChuyenMucModel model)
        {
            _chuyenmucBusiness.Update_CM(model);
            return model;
        }
        [Route("delete-chuyenmuc")]
        [HttpDelete]
        public IActionResult Delete_CM([FromBody] string cm)
        {
            _chuyenmucBusiness.Delete_CM(cm);
            return Ok();
        }
    }
}
