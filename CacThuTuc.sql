--BẢNG LoaiTaiKhoan
--hiển thị LoaiTaiKhoan theo id
CREATE PROCEDURE sp_get_by_id
	@MaLoai INT
AS
BEGIN
	SELECT*FROM LoaiTaiKhoan AS ltk
	WHERE ltk.MaLoai=@MaLoai
END
--Thêm LoaiTaiKhoan
CREATE PROCEDURE sp_loaitaikhoan_create
	@TenLoai NVARCHAR(50)
AS
BEGIN
	INSERT INTO LoaiTaiKhoan(TenLoai)
	VALUES(@TenLoai)
END
DROP PROCEDURE sp_loaitaikhoan_create
--Sửa LoaiTaiKhoan
CREATE PROCEDURE sp_loaitaikhoan_update
	@MaLoai INT,
	@TenLoai NVARCHAR(50)
AS
BEGIN
	UPDATE LoaiTaiKhoan 
	SET TenLoai=@TenLoai
	WHERE MaLoai=@MaLoai
END
--XÓA LoaiTaiKhoan
CREATE PROCEDURE sp_loaitaikhoan_delete
    @MaLoai INT
AS
BEGIN
	DELETE FROM LoaiTaiKhoan
	WHERE MaLoai=@MaLoai
END

--Bảng TaiKhoan
--hiển thị TaiKhoan
CREATE PROCEDURE sp_DangNhap
	@TenDangNhap NVARCHAR(50),
	@MatKhau NVARCHAR(50)
AS
BEGIN
	SELECT*FROM TaiKhoan
	WHERE TaiKhoan.TenDangNhap=@TenDangNhap AND TaiKhoan.MatKhau=@MatKhau
END
EXEC sp_DangNhap @TenDangNhap='admin1',@MatKhau='admin1'
--Thêm TaiKhoan
ALTER PROCEDURE sp_taikhoan_create
	@LoaiTaiKhoan INT,
	@TenDangNhap NVARCHAR(50),
	@MatKhau NVARCHAR(50),
	@Email NVARCHAR(50),
	@Token NVARCHAR(100)
AS
BEGIN
	INSERT INTO TaiKhoan (LoaiTaiKhoan,TenDangNhap, MatKhau,Email,Token)
    VALUES (@LoaiTaiKhoan,@TenDangNhap,@MatKhau,@Email,@Token)
END
--Sửa TaiKhoan
 CREATE PROCEDURE sp_taikhoan_update
	@MaTaiKhoan INT,
    @LoaiTaiKhoan INT,
	@TenDangNhap NVARCHAR(50),
	@MatKhau NVARCHAR(50),
	@Email NVARCHAR(50),
	@Token NVARCHAR(100)
AS
BEGIN
    UPDATE TaiKhoan
    SET LoaiTaiKhoan = @LoaiTaiKhoan,
        TenDangNhap = @TenDangNhap,
        MatKhau = @MatKhau,
        Email = @Email,
        Token = @Token
    WHERE MaTaiKhoan = @MaTaiKhoan
END
--Xóa TaiKhoan
CREATE PROCEDURE sp_taikhoan_delete
    @MaTaiKhoan INT
AS
BEGIN
	DELETE FROM TaiKhoan
	WHERE TaiKhoan.MaTaiKhoan=@MaTaiKhoan
END

SELECT*FROM TaiKhoan
--Bảng Khách Hàng
--hiển thị khách hàng theo mã khách hàng
CREATE PROCEDURE sp_khach_get_by_maKh
	@MaKH VARCHAR(10)
AS
BEGIN
	SELECT*FROM KhachHang AS kh
	WHERE kh.MaKH=@MaKH
END
EXEC sp_khach_get_by_maKh @MaKH='KH001'

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

SELECT*FROM ChuyenMuc

--Bảng Nhà Cung Cấp
--Hiển thị thông tin NhaCungCap theo mã ncc
CREATE PROCEDURE sp_ncc_get_by_ncc
	@MaNCC VARCHAR(10)
AS
BEGIN
	SELECT*FROM NhaCungCap AS ncc
	WHERE ncc.MaNCC=@MaNCC
END
DROP PROCEDURE sp_ncc_get_by_ncc
EXEC sp_ncc_get_by_ncc @MaNCC='NCC002'

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
DROP PROCEDURE sp_nhacungcap_delete
SELECT*FROM NhaCungCap



--test
create PROCEDURE [dbo].[sp_khach_search] (
	@page_index INT,
	@page_size INT,
	@ten_khach NVARCHAR(10),
	@mst_khach VARCHAR(10),
	@diachi_khach VARCHAR(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.MaSoThe,
							  k.DiaChi,
							  k.Email
                        INTO #Results1
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@mst_khach = '' Or k.MaSoThe like N'%'+@mst_khach+'%') and
						(@diachi_khach='' Or k.DiaChi like N'%'+@diachi_khach+'%') and
						(@diachi_khach='' Or k.DiaChi like N'%'+@diachi_khach+'%')
						;                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.MaSoThe,
							  k.DiaChi,
							  k.Email
                        INTO #Results2
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@mst_khach = '' Or k.MaSoThe like N'%'+@mst_khach+'%') and
						(@diachi_khach='' Or k.DiaChi like N'%'+@diachi_khach+'%') and
						(@diachi_khach='' Or k.DiaChi like N'%'+@diachi_khach+'%')
						;                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
END;
EXEC [dbo].[sp_khach_search]
    @page_index = 1,
    @page_size = 10,
    @ten_khach = N'Thủy',
    @mst_khach = 'KC',
    @diachi_khach = 'HN'
Select*from KhachHang

--BẢNG CHUYÊN MỤC
--Lấy chuyên mục
CREATE PROCEDURE sp_cm_get_by_cm
	@MaCM VARCHAR(10)
AS
BEGIN
	SELECT*FROM ChuyenMuc AS cm
	WHERE cm.MaCM=@MaCM
END
DROP PROCEDURE sp_cm_get_by_cm
EXEC sp_cm_get_by_cm @MaCM='CM001'

--thêm chuyên mục
CREATE PROCEDURE sp_chuyenmuc_create
    @MaCM VARCHAR(10), 
	@MaCMC VARCHAR(10),
	@TenCM NVARCHAR(50), 
	@DacBiet NVARCHAR(50),
	@NoiDung NVARCHAR(100)
AS
BEGIN
    INSERT INTO ChuyenMuc (MaCM,MaCMC,TenCM,DacBiet,NoiDung)
    VALUES (@MaCM, @MaCM,@TenCM,@DacBiet,@NoiDung)
END

EXEC sp_chuyenmuc_create 
    @MaCM = 'CM001', 
    @MaCMC = 'CMC001',
    @TenCM = N'Giảm Giá', 
    @DacBiet = N'',
    @NoiDung = N'Nội dung của chuyên mục 1';
--sửa chuyên mục
CREATE PROCEDURE sp_chuyenmuc_update
    @MaCM VARCHAR(10), 
	@MaCMC VARCHAR(10),
	@TenCM NVARCHAR(50), 
	@DacBiet NVARCHAR(50),
	@NoiDung NVARCHAR(100)
AS
BEGIN
    UPDATE ChuyenMuc
    SET MaCMC = @MaCMC,
        TenCM = @TenCM,
        DacBiet = @DacBiet,
		NoiDung=@NoiDung
    WHERE MaCM = @MaCM
END
--XÓA CHUYÊN MỤC
CREATE PROCEDURE sp_chuyenmuc_delete
    @MaCM VARCHAR(10)
AS
BEGIN
	DELETE FROM ChuyenMuc
	WHERE ChuyenMuc.MaCM=@MaCM
END

EXEC sp_chuyenmuc_delete @MaCM='CM008'
SELECT*FROM ChuyenMuc

--Bảng SanPham

CREATE PROCEDURE sp_msp_get_by_sp
	@MaSP NVARCHAR(10)
AS
BEGIN
	SELECT*FROM SanPham AS sp
	WHERE sp.MaSP=@MaSP
END
DROP PROCEDURE sp_msp_get_by_sp
EXEC sp_msp_get_by_sp 'SP001'

--Thêm SanPham

CREATE PROCEDURE sp_sanpham_create
	@MaSP NVARCHAR(10),
    @MaCM VARCHAR(10), 
	@TenSP NVARCHAR(50), 
	@GiaBan FLOAT,
	@GiamGia FLOAT,
	@SoLuong INT,
	@Size CHAR(3),
	@TrangThai NVARCHAR(50),
	@LuotXem FLOAT
AS
BEGIN
    INSERT INTO SanPham (MaSP,MaCM,TenSP,GiaBan,GiamGia,SoLuong,Size,TrangThai,LuotXem)
    VALUES (@MaSP,@MaCM, @TenSP,@GiaBan,@GiamGia,@SoLuong,@Size,@TrangThai,@LuotXem)
END
--Sửa SanPham
--lấy tất cả sanpham
CREATE PROCEDURE sp_Search_sanpham
AS
BEGIN
	SELECT*FROM SanPham
END

CREATE PROCEDURE sp_sanpham_update
    @MaSP NVARCHAR(10),
    @MaCM VARCHAR(10), 
	@TenSP NVARCHAR(50), 
	@GiaBan FLOAT,
	@GiamGia FLOAT,
	@SoLuong INT,
	@Size CHAR(3),
	@TrangThai NVARCHAR(50),
	@LuotXem FLOAT
AS
BEGIN
    UPDATE SanPham
    SET MaCM = @MaCM,
        TenSP = @TenSP,
        GiaBan = @GiaBan,
		GiamGia=@GiamGia,
		SoLuong = @SoLuong,
		Size=@Size,
		TrangThai = @TrangThai,
		LuotXem = @LuotXem
    WHERE MaSP = @MaSP
END

--Xóa SanPham
CREATE PROCEDURE sp_sanpham_delete
    @MaSP NVARCHAR(10)
AS
BEGIN
	DELETE FROM SanPham
	WHERE SanPham.MaSP=@MaSP
END
EXEC sp_sanpham_delete @MaSP='CM008'
SELECT*FROM SanPham

ALTER PROCEDURE sp_TimKiemVaPhanTrang
    @page_index INT,
    @page_size INT,
    @ten_sanpham NVARCHAR(250) ,
    @gia_tien VARCHAR(50) 
AS
BEGIN
    SET NOCOUNT ON;

    IF @page_size = 0
    BEGIN
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaSP ASC) AS RowNumber, 
          sp.*
        FROM SanPham AS sp
        WHERE
            (@ten_sanpham ='' OR sp.TenSP LIKE '%' + @ten_sanpham + '%')
            AND (@gia_tien ='' OR sp.GiaBan LIKE '%' + @gia_tien + '%');
  
    END
    ELSE
    BEGIN
        DECLARE @RecordCount INT;
        
        SELECT
            ROW_NUMBER() OVER (ORDER BY MaSP ASC) AS RowNumber, 
            sp.*
        INTO #Results
        FROM SanPham AS sp
        WHERE
            (@ten_sanpham ='' OR sp.TenSP LIKE '%' + @ten_sanpham + '%')
            AND (@gia_tien ='' OR sp.GiaBan LIKE '%' + @gia_tien + '%');
        SELECT @RecordCount = COUNT(*)
        FROM #Results;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results
        WHERE
            RowNumber BETWEEN (@page_index - 1) * @page_size + 1
            AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;
        
        DROP TABLE #Results;
    END;
END;