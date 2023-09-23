INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, Email)
VALUES 
    ('NCC001', N'Trần Việt Hoàng', '1234567890', 'ncc1@example.com'),
    ('NCC002', N'Trịnh Quí Đôn', '0987654321', 'ncc2@example.com'),
    ('NCC003', N'Dương Thành Linh', '2345678901', 'ncc3@example.com'),
    ('NCC004', N'Nguyễn Hồng Anh', '4567890123', 'ncc4@example.com'),
    ('NCC005', N'Trần Kim Long', '6789012345', 'ncc5@example.com'),
    ('NCC006', N'Trần Văn Minh', '8901234567', 'ncc6@example.com'),
    ('NCC007', N'Nguyễn Thị Mai Anh', '0123456789', 'ncc7@example.com'),
    ('NCC008', N'Nguyễn Thị Hồng Nhung', '5432109876', 'ncc8@example.com');
SELECT*FROM NhaCungCap

INSERT INTO SanPham (MaSP, TenSP, GiaBan, GiaGoc, SoLuong, Size, TrangThai)
VALUES 
    (N'SP001', N'Áo sơ mi trắng', 29.99, 39.99, 50, 'M', N'Còn hàng'),
    (N'SP002', N'Quần jean nam', 39.99, 49.99, 30, 'L', N'Còn hàng'),
    (N'SP003', N'Áo khoác nữ', 49.99, 59.99, 40, 'S', N'Còn hàng'),
    (N'SP004', N'Áo thun nam', 19.99, 29.99, 60, 'XL', N'Còn hàng'),
    (N'SP005', N'Váy dài hoa nữ', 34.99, 44.99, 25, 'M', N'Hết hàng'),
    (N'SP006', N'Quần short nam', 24.99, 34.99, 35, 'S', N'Còn hàng'),
    (N'SP007', N'Áo len đỏ', 29.99, 39.99, 20, 'M', N'Còn hàng'),
    (N'SP008', N'Áo khoác da nam', 59.99, 69.99, 15, 'L', N'Còn hàng');
SELECT*FROM SanPham

INSERT INTO ChiTietSanPham (MaSP, MaNCC, MoTa, ChiTiet)
VALUES 
    (N'SP001', 'NCC001', N'Áo sơ mi trắng nam', N'Áo sơ mi trắng dành cho nam, kiểu dáng thoải mái'),
    (N'SP002', 'NCC002', N'Quần jean nam', N'Quần jean dành cho nam, màu xanh đậm, size từ 28 đến 36.'),
    (N'SP003', 'NCC003', N'Áo khoác nữ', N'Áo khoác dành cho nữ, màu đen, kiểu dáng dễ phối đồ.'),
    (N'SP004', 'NCC004', N'Áo thun nam', N'Áo thun dành cho nam, màu đen, chất liệu cotton.'),
    (N'SP005', 'NCC005', N'Váy dài hoa nữ', N'Váy dài với họa tiết hoa, phù hợp dự tiệc hoặc dạo phố.'),
    (N'SP006', 'NCC006', N'Quần short nam', N'Quần short dành cho nam, màu xanh nhạt, size từ 28 đến 36.'),
    (N'SP007', 'NCC007', N'Áo len đỏ', N'Áo len màu đỏ, dáng dài, phù hợp cho mùa đông.'),
    (N'SP008', 'NCC008', N'Áo khoác da nam', N'Áo khoác da dành cho nam, màu đen, kiểu dáng thời trang.');

INSERT INTO SanPham_NCC (MaSP, MaNCC)
VALUES 
    (N'SP001', 'NCC001'),
    (N'SP002', 'NCC002'),
    (N'SP003', 'NCC003'),
    (N'SP004', 'NCC004'),
    (N'SP005', 'NCC005'),
    (N'SP006', 'NCC006'),
    (N'SP007', 'NCC007'),
    (N'SP008', 'NCC008');

INSERT INTO HoaDonNhap (MaHDN, MaNCC, NgayNhap)
VALUES 
    ('HDN001', 'NCC001', '2023-09-20'),
    ('HDN002', 'NCC002', '2023-09-21'),
    ('HDN003', 'NCC003', '2023-09-22'),
    ('HDN004', 'NCC004', '2023-09-23'),
    ('HDN005', 'NCC005', '2023-09-7'),
    ('HDN006', 'NCC006', '2023-09-17'),
    ('HDN007', 'NCC007', '2023-09-10'),
    ('HDN008', 'NCC008', '2023-09-15');

INSERT INTO KhachHang (MaKH, TenKH, MaSoThe, GioiTinh, Diachi, Email, SDT)
VALUES 
    (N'KH001', N'Nguyễn Văn Hoàng', '1234567890', N'Nam', N'Hà Nội', 'nva@example.com', '0987654321'),
    (N'KH002', N'Nguyễn Thị Vân Anh', '2345678901', N'Nữ', N'Hồ Chí Minh', 'ntb@example.com', '0123456789'),
    (N'KH003', N'Trần Văn Câu', '3456789012', N'Nam', N'Đà Nẵng', 'tvc@example.com', '0234567890'),
    (N'KH004', N'Hoàng Thị Dung', '4567890123', N'Nữ', N'Hải Phòng', 'htd@example.com', '0345678901'),
    (N'KH005', N'Lê Văn Dương', '5678901234', N'Nam', N'Quảng Ninh', 'lve@example.com', '0456789012'),
    (N'KH006', N'Nguyễn Văn Minh', '6789012345', N'Nam', N'Bắc Ninh', 'nvf@example.com', '0567890123'),
    (N'KH007', N'Phạm Thị Giang', '7890123456', N'Nữ', N'Hà Tây', 'ptg@example.com', '0678901234'),
    (N'KH008', N'Đỗ Văn Huy', '8901234567', N'Nam', N'Ninh Bình', 'dvh@example.com', '0789012345');
