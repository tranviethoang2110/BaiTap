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
        [Route("search_SP")]
        [HttpPost]
        public IActionResult SearchSanPham([FromBody] Dictionary<string, object> ch)
        {
            try
            {
                int page = ch.ContainsKey("page") ? Convert.ToInt32(ch["page"].ToString()) : 1;
                int pageSize = ch.ContainsKey("pageSize") ? Convert.ToInt32(ch["pageSize"].ToString()) : 10;
                string tenSanPham = ch.ContainsKey("TenSP") ? Convert.ToString(ch["TenSP"].ToString()) : "";
                string giatien = ch.ContainsKey("GiaBan") ? Convert.ToString(ch["GiaBan"].ToString()) : "";

                int total = 0;
                var data = _spBusiness.SearchSP(page, pageSize, out total, tenSanPham, giatien);

                return Ok(new
                {
                    TotalItems = total,
                    Data = data,
                    Page = page,
                    PageSize = pageSize
                });
            }
            catch (Exception ex)
            {
                return BadRequest($"Lỗi: {ex.Message}");
            }
        }
        [Route("ALLSP")]
        [HttpGet]
        public List<SanPhamModel> SearchALL() 
        {
            return _spBusiness.SearchALL();
        }
    }
}
