CREATE DATABASE WebBanHoa
DROP DATABASE WebBanHoa

USE WebBanHoa

-- Tạo bảng DanhMucSanPham
CREATE TABLE DanhMucSanPham(
	idDanhMucSanPham INT IDENTITY(1,1) NOT NULL,
	KHidDanhMucSanPham AS 'DMSP' + RIGHT('00000' + CAST(idDanhMucSanPham AS VARCHAR(5)), 5) PERSISTED,
	tenDanhMuc NVARCHAR(50),
	active BIT,
	CONSTRAINT pk_DanhMucSanPham PRIMARY KEY (idDanhMucSanPham),
)

DROP TABLE DanhMucSanPham

-- Tạo bảng ChiTietSanPham
CREATE TABLE SanPham(
	idSanPham INT IDENTITY(1,1) NOT NULL,
	KHidSanPham AS 'SP' + RIGHT('00000' + CAST (idSanPham AS VARCHAR(5)), 5) PERSISTED,
	idDanhMucSanPham INT,
	tenSanPham NVARCHAR(50),
	moTa NVARCHAR(1000),
	hinhAnh NVARCHAR(200),
	soLuongTon NVARCHAR(100),
	donGia NVARCHAR(50),
	cao INT,
	mau NVARCHAR(20),
	active BIT,
	CONSTRAINT pk_SanPham PRIMARY KEY (idSanPham),
	CONSTRAINT fk_SanPham_DanhMucSanPham FOREIGN KEY (idDanhMucSanPham) REFERENCES DanhMucSanPham(idDanhMucSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)

DROP TABLE SanPham

-- Tạo bảng ThongTinMuaHang
CREATE TABLE ThongTinMuaHang(
	idGioHang INT IDENTITY(1,1) NOT NULL,
	KHidThongTinMuaHang AS 'GH' + RIGHT('00000' + CAST (idGioHang AS VARCHAR(5)), 5) PERSISTED,
	tenKH NVARCHAR(100),
	diaChi NVARCHAR(100),
	soDienThoai NVARCHAR(50),
	email NVARCHAR(50),
	ngayTao DATE,
	tongTien NVARCHAR(50),
	active BIT,
	CONSTRAINT pk_ThongTinMuaHang PRIMARY KEY (idGioHang),
)

DROP TABLE ThongTinMuaHang

-- Tạo bảng ChiTietDonHang
CREATE TABLE ChiTietDonHang(
	idChiTietDonHang INT IDENTITY(1, 1) NOT NULL,
	KHidChiTietDonHang AS 'CTDH' + RIGHT ('00000' + CAST (idChiTietDonHang AS VARCHAR(5)), 5) PERSISTED,
	idGioHang INT,
	idSanPham INT,
	soLuongMua INT,
	donGia NVARCHAR(50),
	CONSTRAINT pk_ChiTietDonHang PRIMARY KEY (idChiTietDonHang),
	CONSTRAINT fk_ChiTietDonHang_GioHang FOREIGN KEY (idGioHang) REFERENCES ThongTinMuaHang(idGioHang) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_ChiTietDonHang_SanPham FOREIGN KEY (idSanPham) REFERENCES SanPham(idSanPham) ON DELETE CASCADE ON UPDATE CASCADE
)

DROP TABLE ChiTietDonHang


--Tạo bảng DanhMucTinTuc --VD: Quảng cáo, các chương trình khuyến mại
CREATE TABLE DanhMucTintuc(
	idDanhMucTinTuc INT IDENTITY (1,1) NOT NULL,
	KHidDanhMucTintuc AS 'DMTT' + RIGHT('00000' + CAST (idDanhMucTinTuc AS VARCHAR(5)), 5) PERSISTED,
	tenDanhMucTinTuc NVARCHAR(50),
	active BIT,
	CONSTRAINT pk_DanhMucTintuc PRIMARY KEY (idDanhMucTinTuc),
)

DROP TABLE DanhMucTintuc

-- Tạo bảng ChiTietTinTuc
CREATE TABLE ChiTietTinTuc(
	idTinTuc INT IDENTITY (1,1) NOT NULL,
	KHidChiTietTinTuc AS 'CTTT' + RIGHT('00000' + CAST (idTinTuc AS VARCHAR(5)), 5) PERSISTED,
	idDanhMucTinTuc INT,
	tieuDe NVARCHAR(1000),
	anh NVARCHAR(1000),
	noiDung NTEXT,
	tacGia NVARCHAR(100),
	ngayDang DATETIME,
	active BIT,
	CONSTRAINT pk_ChiTietTinTuc PRIMARY KEY (idTinTuc),
	CONSTRAINT fk_ChiTietTinTuc_DanhMucTinTuc FOREIGN KEY (idDanhMucTinTuc) REFERENCES DanhMucTinTuc(idDanhMucTinTuc) ON DELETE CASCADE ON UPDATE CASCADE
)

DROP TABLE ChiTietTinTuc

-- Tạo bảng LienHe -- VD: những ý kiến đóng góp của khách hàng
CREATE TABLE LienHe(
	idLienHe INT IDENTITY(1,1) NOT NULL,
	KHidLienHe AS 'LH' + RIGHT('00000' + CAST (idLienHe AS VARCHAR(5)), 5) PERSISTED,
	tenKH NVARCHAR(50),
	soDienThoai NVARCHAR(50),
	email NVARCHAR(50),
	noiDung NTEXT,
	active BIT,
	CONSTRAINT pk_LienHe PRIMARY KEY (idLienHe),
)

DROP TABLE LienHe

-- Tạo bảng AdimUser
CREATE TABLE AdimUser(
	idAdimUser INT IDENTITY(1,1) NOT NULL ,
	KHidAdimUser AS 'ID' + RIGHT('00000' + CAST (idAdimUser AS VARCHAR(5)), 5) PERSISTED,
	UserName VARCHAR(20),
	Password VARCHAR(1000),
	CONSTRAINT pk_AdimUser PRIMARY KEY (idAdimUser),
)

DROP TABLE AdimUser

