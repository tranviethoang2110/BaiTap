using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.BanHangQA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private ISanPhamBusiness _spBusiness;
        public SanPhamController(ISanPhamBusiness spBusiness)
        {
            _spBusiness = spBusiness;
        }
        [Route("get-by-MaSP/{MaSP}")]
        [HttpGet]
        public SanPhamModel GetDataByMaSP(string MaSP)
        {
            return _spBusiness.GetDataByMaSP(MaSP);
        }
        [Route("create-sanpham")]
        [HttpPost]
        public SanPhamModel Create([FromBody] SanPhamModel model)
        {
            _spBusiness.Create_SanPham(model);
            return model;
        }

        [Route("update-sanpham")]
        [HttpPut]
        public SanPhamModel Update([FromBody] SanPhamModel model)
        {
            _spBusiness.Update_SanPham(model);
            return model;
        }
        [Route("delete-sanpham")]
        [HttpDelete]
        public IActionResult Delete([FromBody] string MaSP)
        {
            _spBusiness.Delete_SanPham(MaSP);
            return Ok();
        }
    }
}
