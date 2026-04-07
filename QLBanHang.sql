CREATE DATABASE QuanLyBanHang;
GO

USE QuanLyBanHang;
GO

CREATE TABLE SanPham (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TenSanPham NVARCHAR(100) NOT NULL,
    Gia DECIMAL(18,2) NOT NULL
);
GO

INSERT INTO SanPham (TenSanPham, Gia) VALUES 
(N'Điện thoại iPhone 15 Pro', 25000000),
(N'Laptop Dell XPS 13', 35000000),
(N'Tai nghe AirPods Pro', 5000000);
GO

CREATE TABLE DanhMuc (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL
);
GO

ALTER TABLE SanPham ADD DanhMucId INT NULL;
GO
ALTER TABLE SanPham ADD CONSTRAINT FK_SanPham_DanhMuc 
    FOREIGN KEY (DanhMucId) REFERENCES DanhMuc(Id);
GO

CREATE TABLE KhachHang (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    DiaChi NVARCHAR(255)
);
GO

CREATE TABLE DonHang (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    KhachHangId INT NOT NULL,
    NgayDat DATETIME DEFAULT GETDATE(),
    TongTien DECIMAL(18,2) DEFAULT 0,
    TrangThai NVARCHAR(50) DEFAULT N'Chờ xử lý',
    CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (KhachHangId) REFERENCES KhachHang(Id)
);
GO

CREATE TABLE ChiTietDonHang (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    DonHangId INT NOT NULL,
    SanPhamId INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_ChiTiet_DonHang FOREIGN KEY (DonHangId) REFERENCES DonHang(Id),
    CONSTRAINT FK_ChiTiet_SanPham FOREIGN KEY (SanPhamId) REFERENCES SanPham(Id)
);
GO

INSERT INTO DanhMuc (TenDanhMuc) VALUES (N'Điện thoại'), (N'Laptop'), (N'Phụ kiện');
UPDATE SanPham SET DanhMucId = 1 WHERE TenSanPham LIKE N'%iPhone%';
UPDATE SanPham SET DanhMucId = 2 WHERE TenSanPham LIKE N'%Laptop%';
UPDATE SanPham SET DanhMucId = 3 WHERE TenSanPham LIKE N'%Tai nghe%';