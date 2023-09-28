﻿--Bảng Khách Hàng
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

SELECT*FROM KhachHang

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
