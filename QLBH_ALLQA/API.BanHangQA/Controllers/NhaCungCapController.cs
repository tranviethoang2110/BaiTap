using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.BanHangQA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhaCungCapController : ControllerBase
    {
        private INhaCungCapBusiness _nccBusiness;
        public NhaCungCapController(INhaCungCapBusiness nccBusiness)
        {
            _nccBusiness = nccBusiness;
        }
        [Route("get-by-MaNCC/{MaNCC}")]
        [HttpGet]
        public NhaCungCapModel GetDatabyId(string MaNCC)
        {
            return _nccBusiness.GetDatabyId(MaNCC);
        }
        [Route("create-ncc")]
        [HttpPost]
        public NhaCungCapModel Create([FromBody] NhaCungCapModel model)
        {
            _nccBusiness.Create_NCC(model);
            return model;
        }

        [Route("update-ncc")]
        [HttpPut]
        public NhaCungCapModel Update([FromBody] NhaCungCapModel model)
        {
            _nccBusiness.Update_NCC(model);
            return model;
        }
        [Route("delete-NCC")]
        [HttpDelete]
        public IActionResult Delete([FromBody] string model)
        {
            _nccBusiness.Delete_NCC(model);
            return Ok();
        }
    }
}
