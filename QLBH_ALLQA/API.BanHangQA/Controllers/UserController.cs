using BusinessLogicLayer;
using BusinessLogicLayer.Interfaces;
using DataModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API.BanHangQA.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserBusiness _userBusiness;
        public UserController(IUserBusiness userBusiness)
        {
            _userBusiness = userBusiness;
        }
        [AllowAnonymous]
        [HttpGet("login")]
        public IActionResult Login(string taikhoan,string matkhau)
        {
            bool check = _userBusiness.Login(taikhoan, matkhau);
            if (check==true)
            {
                return Ok("ok");
               
            }
            return BadRequest("không");
        }
        [Route("create-taikhoan")]
        [HttpPost]
        public UserModel Create([FromBody] UserModel model)
        {
            _userBusiness.Create_TaiKhoan(model);
            return model;
        }
        [Route("update-taikhoan")]
        [HttpPut]
        public UserModel Update([FromBody] UserModel model)
        {
            _userBusiness.Update_TaiKhoan(model);
            return model;
        }
        [Route("delete-taikhoan")]
        [HttpDelete]
        public IActionResult Delete([FromBody] int mtk)
        {
            _userBusiness.Delete_TaiKhoan(mtk);
            return Ok();
        }
    }
}
