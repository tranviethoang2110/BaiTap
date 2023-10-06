using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace API.BanHangQA.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class KhachHangController : ControllerBase
    {
        private IKhachHangBusiness _khachHangBusiness;
        public KhachHangController(IKhachHangBusiness khachBusiness)
        {
            _khachHangBusiness = khachBusiness;
        }
        [Route("get-by-MaKH/{MaKH}")]
        [HttpGet]
        public KhachHangModel GetDatabyId(string MaKH)
        {
            return _khachHangBusiness.GetDatabyId(MaKH);
        }

        [Route("create-khach")]
        [HttpPost]
        public KhachHangModel Create_KhachHang([FromBody] KhachHangModel model)
        {
            _khachHangBusiness.Create_KhachHang(model);
            return model;
        }

        [Route("update-khachhang")]
        [HttpPut]
        public KhachHangModel Update_KhachHang([FromBody] KhachHangModel model)
        {
            _khachHangBusiness.Update_KhachHang(model);
            return model;
        }

        [Route("delete-khachhang")]
        [HttpDelete]
        public IActionResult Delete_KhachHang([FromBody] string model)
        {
            _khachHangBusiness.Delete_KhachHang(model);
            return Ok();
        }
    };
}