--Bảng Khách Hàng
﻿
---Thủ tục thêm KhachHang
CREATE PROCEDURE sp_khachhang_create
    @MaKH VARCHAR(10),
    @TenKH NVARCHAR(30),
    @MaSoThe VARCHAR(10),
    @GioiTinh NVARCHAR(5),
    @Diachi VARCHAR(30),
    @Email VARCHAR(50),
    @SDT CHAR(10)
AS
BEGIN
    INSERT INTO KhachHang (MaKH, TenKH, MaSoThe, GioiTinh, Diachi, Email, SDT)
    VALUES (@MaKH, @TenKH, @MaSoThe, @GioiTinh, @Diachi, @Email, @SDT)
END
 EXEC sp_khachhang_create 'NV030',N'Gà Nè' ,N'V',N'Nam','Hưng Yên','gn@gmail.com','0973912878'
 ﻿---Thủ tục sửa KhachHang
 CREATE PROCEDURE sp_khachhang_update
    @MaKH VARCHAR(10),
    @TenKH NVARCHAR(30),
    @MaSoThe VARCHAR(10),
    @GioiTinh NVARCHAR(5),
    @Diachi VARCHAR(30),
    @Email VARCHAR(50),
    @SDT CHAR(10)
AS
BEGIN
    UPDATE KhachHang
    SET TenKH = @TenKH,
        MaSoThe = @MaSoThe,
        GioiTinh = @GioiTinh,
        Diachi = @Diachi,
        Email = @Email,
        SDT = @SDT
    WHERE MaKH = @MaKH
END
EXEC sp_khachhang_update 
    @MaKH = 'KH008',
    @TenKH = N'Nguyễn Văn Anh',
    @MaSoThe = 'BK',
    @GioiTinh = N'Nam',
    @Diachi = N'Hà Nội',
    @Email = 'nva@example.com',
    @SDT = '0987654321';

--Thủ tục xóa KhachHang
CREATE PROCEDURE sp_khachhang_delete
    @MaKH VARCHAR(10)
AS
BEGIN
	DELETE FROM KhachHang
	WHERE KhachHang.MaKH=@MaKH
END

EXEC sp_khachhang_delete
@MaKH='KH09'

--tìm kiếm khách hàng bằng mã
CREATE PROCEDURE sp_khachhang_search_by_MaKH
    @MaKH NVARCHAR(10)
AS
BEGIN
    SELECT *
    FROM KhachHang
    WHERE MaKH = @MaKH
END
EXEC sp_khachhang_search_by_MaKH 
    @MaKH = 'KH001';

SELECT*FROM KhachHang

--Bảng Nhà Cung Cấp
--Thủ tục thêm NhaCungCap
CREATE PROCEDURE sp_nhacungcap_create
    @MaNCC VARCHAR(10), 
	@TenNCC NVARCHAR(50),
	@SDT CHAR(11), 
	@Email VARCHAR(50)
AS
BEGIN
    INSERT INTO NhaCungCap (MaNCC,TenNCC,SDT,Email)
    VALUES (@MaNCC, @TenNCC,@SDT,@Email)
END
EXEC sp_nhacungcap_create 
    @MaNCC = 'NCC009',
    @TenNCC = N'Phan Văn Hoàng',
    @SDT = '01234567890',
    @Email = 'phoang@example.com';

---Thủ tục sửa NhaCungCap
 CREATE PROCEDURE sp_nhacungcap_update
    @MaNCC VARCHAR(10), 
	@TenNCC NVARCHAR(50),
	@SDT CHAR(11), 
	@Email VARCHAR(50)
AS
BEGIN
    UPDATE NhaCungCap
    SET TenNCC = @TenNCC,
        SDT = @SDT,
        Email = @Email
    WHERE MaNCC = @MaNCC
END
EXEC sp_nhacungcap_update 
    @MaNCC = 'NCC001',
    @TenNCC = N'Trần Việt Hoàng',
    @SDT = '0973912878',
    @Email = 'hoang@gmail.com';

---Thủ tục xóa NhaCungCap

CREATE PROCEDURE sp_nhacungcap_delete
    @MaNCC VARCHAR(10)
AS
BEGIN
	DELETE FROM NhaCungCap
	WHERE NhaCungCap.MaNCC=@MaNCC
END

EXEC sp_nhacungcap_delete @MaNCC='NCC009'
SELECT*FROM NhaCungCap
