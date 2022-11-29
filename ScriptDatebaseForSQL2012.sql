USE [master]
GO
/****** Object:  Database [PayrollManagementSystem2]    Script Date: 11/29/2022 7:50:21 PM ******/
CREATE DATABASE [PayrollManagementSystem2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PayrollManagementSystem_Data2', FILENAME = N'D:\DataSQL\PayrollManagementSystem2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PayrollManagementSystem_Log2', FILENAME = N'D:\DataSQL\PayrollManagementSystem2.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PayrollManagementSystem2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PayrollManagementSystem2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PayrollManagementSystem2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PayrollManagementSystem2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PayrollManagementSystem2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PayrollManagementSystem2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PayrollManagementSystem2] SET  MULTI_USER 
GO
ALTER DATABASE [PayrollManagementSystem2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PayrollManagementSystem2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PayrollManagementSystem2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PayrollManagementSystem2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [PayrollManagementSystem2]
GO
/****** Object:  UserDefinedFunction [dbo].[GENERATE_EMPLOYEE_OFFICE_ID]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GENERATE_EMPLOYEE_OFFICE_ID]()
	RETURNS CHAR(9)
AS BEGIN
	DECLARE @ID CHAR(9), @ID_INT INT
	SET @ID_INT = (SELECT (CAST(MAX(RIGHT(MANHANVIEN, 5)) AS INT) + 1) FROM NhanVienHanhChinh)
	IF @ID_INT < 10
		SET @ID = 'NVHC0000' + CONVERT(CHAR(1), @ID_INT)
	ELSE IF @ID_INT < 100
		SET @ID = 'NVHC000' + CONVERT(CHAR(2), @ID_INT)
	ELSE IF @ID_INT < 1000
		SET @ID = 'NVHC00' + CONVERT(CHAR(3), @ID_INT)
	ELSE IF @ID_INT < 10000
		SET @ID = 'NVHC0' + CONVERT(CHAR(4), @ID_INT)
	ELSE
		SET @ID = 'NVHC' + CONVERT(CHAR(5), @ID_INT)
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[GENERATE_WORKER_ID]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GENERATE_WORKER_ID]()
	RETURNS CHAR(9)
AS BEGIN
	DECLARE @ID CHAR(9), @ID_INT INT
	SET @ID_INT = (SELECT (CAST(MAX(RIGHT(MANHANVIEN, 5)) AS INT) + 1) FROM NhanVienSanXuat)
	IF @ID_INT < 10
		SET @ID = 'NVSX0000' + CONVERT(CHAR(1), @ID_INT)
	ELSE IF @ID_INT < 100
		SET @ID = 'NVSX000' + CONVERT(CHAR(2), @ID_INT)
	ELSE IF @ID_INT < 1000
		SET @ID = 'NVSX00' + CONVERT(CHAR(3), @ID_INT)
	ELSE IF @ID_INT < 10000
		SET @ID = 'NVSX0' + CONVERT(CHAR(4), @ID_INT)
	ELSE
		SET @ID = 'NVSX' + CONVERT(CHAR(5), @ID_INT)
	RETURN @ID
END
GO
/****** Object:  Table [dbo].[ChamCongHanhChinh]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongHanhChinh](
	[MaNhanVien] [char](9) NOT NULL,
	[NgayChamCong] [date] NOT NULL,
	[CheckInSang] [time](0) NULL,
	[CheckOutSang] [time](0) NULL,
	[CheckInChieu] [time](0) NULL,
	[CheckOutChieu] [time](0) NULL,
 CONSTRAINT [PK_ChamCongHanhChinh_1] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC,
	[NgayChamCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChamCongSanXuat]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongSanXuat](
	[MaChamCong] [int] IDENTITY(1,1) NOT NULL,
	[NgayChamCong] [date] NOT NULL,
	[SoLuongThanhPham] [int] NOT NULL,
	[MaPhanCong] [int] NULL,
 CONSTRAINT [PK_ChamCongSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaChamCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanXuat]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanXuat](
	[MaCTSX] [char](7) NOT NULL,
	[SoLuongSanXuat] [int] NULL,
	[SoLuongHoanThanh] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[MaSanPham] [char](5) NOT NULL,
	[ThoiGian] [date] NULL,
 CONSTRAINT [PK_ChiTietSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaCTSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhenThuongKyLuat]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuongKyLuat](
	[MaKT_KL] [char](10) NOT NULL,
	[LyDo] [nvarchar](100) NOT NULL,
	[NgayApDung] [date] NOT NULL,
	[SoTien] [float] NOT NULL,
	[MaNVSX] [char](9) NULL,
	[MaNVHC] [char](9) NULL,
 CONSTRAINT [PK_KhenThuongKyLuat] PRIMARY KEY CLUSTERED 
(
	[MaKT_KL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NghiPhep]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NghiPhep](
	[MaNghiPhep] [nchar](10) NOT NULL,
	[NgayNghi] [date] NOT NULL,
	[NghiDen] [date] NOT NULL,
	[LyDo] [nvarchar](100) NOT NULL,
	[HuongLuong] [float] NOT NULL,
	[MaNhanVien] [char](9) NOT NULL,
 CONSTRAINT [PK_NghiPhep] PRIMARY KEY CLUSTERED 
(
	[MaNghiPhep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienHanhChinh]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienHanhChinh](
	[MaNhanVien] [char](9) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[TenNganHang] [char](10) NULL,
	[SoTaiKhoan] [char](20) NULL,
	[TenNguoiThuHuong] [nchar](50) NULL,
	[LuongTheoChucDanh] [float] NOT NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
	[MaPhongBan] [char](4) NOT NULL,
 CONSTRAINT [PK_NhanVienHanhChinh] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVienSanXuat]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVienSanXuat](
	[MaNhanVien] [char](9) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[TenNganHang] [char](10) NULL,
	[SoTaiKhoan] [char](20) NULL,
	[TenNguoiThuHuong] [nchar](50) NULL,
	[ChuyenMon] [nvarchar](50) NOT NULL,
	[MaTo] [char](6) NOT NULL,
	[ChucVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVienSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPhanCong] [int] NOT NULL,
	[MaQuyTrinh] [char](7) NULL,
	[MaNhanVien] [char](9) NOT NULL,
	[NgayThamGia] [date] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanXuong]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanXuong](
	[MaPhanXuong] [char](4) NOT NULL,
	[TenPhanXuong] [nvarchar](50) NOT NULL,
	[MaQuanDoc] [char](9) NULL,
 CONSTRAINT [PK_PhanXuong] PRIMARY KEY CLUSTERED 
(
	[MaPhanXuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPhongBan] [char](4) NOT NULL,
	[TenPhongBan] [nvarchar](50) NOT NULL,
	[MaTruongPhong] [char](9) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPhongBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyTrinh]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyTrinh](
	[MaQuyTrinh] [char](7) NOT NULL,
	[TenQuyTrinh] [nvarchar](50) NOT NULL,
	[GiaQuyTrinh] [float] NOT NULL,
	[MaSanPham] [char](5) NULL,
	[ThuTuSanXuat] [int] NULL,
 CONSTRAINT [PK_QuyTrinh] PRIMARY KEY CLUSTERED 
(
	[MaQuyTrinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [char](5) NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[SoLuongSanXuat] [int] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [char](9) NOT NULL,
	[MatKhau] [char](44) NOT NULL,
	[GiaTriSalt] [char](30) NULL,
	[MaNVSX] [char](9) NULL,
	[MaNVHC] [char](9) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToSanXuat]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToSanXuat](
	[MaTo] [char](6) NOT NULL,
	[TenTo] [nvarchar](50) NOT NULL,
	[MaToTruong] [char](9) NULL,
	[MaPhanXuong] [char](4) NULL,
 CONSTRAINT [PK_ToSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_CHAMCONGHANHCHINH]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_CHAMCONGHANHCHINH] AS
SELECT NhanVien = CCHC.MaNhanVien + ' - ' + NVHC.TenNhanVien
      ,NgayChamCong
      ,CheckInSang
      ,CheckOutSang
      ,CheckInChieu
      ,CheckOutChieu
FROM ChamCongHanhChinh AS CCHC INNER JOIN NhanVienHanhChinh AS NVHC ON CCHC.MaNhanVien = NVHC.MaNhanVien
GO
/****** Object:  View [dbo].[VIEW_CHAMCONGSX]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_CHAMCONGSX] AS
SELECT        PC.MaNhanVien + ' - ' + NVSX.TenNhanVien AS NhanVien, SP.MaSanPham + ' - ' + SP.TenSanPham AS SanPham, PC.MaQuyTrinh + ' - ' + QT.TenQuyTrinh AS QuyTrinh, PC.NgayThamGia, CCSX.NgayChamCong, 
                         CCSX.SoLuongThanhPham, CCSX.MaChamCong
FROM            PhanCong AS PC INNER JOIN
                         NhanVienSanXuat AS NVSX ON PC.MaNhanVien = NVSX.MaNhanVien INNER JOIN
                         QuyTrinh AS QT ON PC.MaQuyTrinh = QT.MaQuyTrinh INNER JOIN
                         SanPham AS SP ON QT.MaSanPham = SP.MaSanPham INNER JOIN
                         ChamCongSanXuat AS CCSX ON PC.MaPhanCong = CCSX.MaPhanCong
WHERE YEAR(CCSX.NgayChamCong) = YEAR(GETDATE()) AND MONTH(CCSX.NgayChamCong) = MONTH(GETDATE())
GO
/****** Object:  View [dbo].[VIEW_PHANCONG]    Script Date: 11/29/2022 7:50:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_PHANCONG] AS
SELECT      MaPhanCong,NhanVien =  PC.MaNhanVien +' - ' + NVSX.TenNhanVien, SanPham = SP.MaSanPham +' - '+ SP.TenSanPham, QuyTrinh = PC.MaQuyTrinh + ' - '+ QT.TenQuyTrinh, PC.NgayThamGia
FROM            PhanCong AS PC INNER JOIN
                         NhanVienSanXuat AS NVSX ON PC.MaNhanVien = NVSX.MaNhanVien INNER JOIN
                         QuyTrinh AS QT ON PC.MaQuyTrinh = QT.MaQuyTrinh INNER JOIN
                         SanPham AS SP ON QT.MaSanPham = SP.MaSanPham
WHERE PC.NgayThamGia = (SELECT MAX(NgayThamGia) FROM PhanCong WHERE PC.MaNhanVien = MaNhanVien)
GO
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00081', CAST(N'2022-10-30' AS Date), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:30:00' AS Time), CAST(N'17:30:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00081', CAST(N'2022-11-29' AS Date), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:30:00' AS Time), CAST(N'17:30:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00083', CAST(N'2022-08-15' AS Date), CAST(N'08:15:00' AS Time), CAST(N'11:10:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'17:31:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00084', CAST(N'2022-07-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'17:30:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00089', CAST(N'2022-08-02' AS Date), CAST(N'08:15:00' AS Time), CAST(N'11:10:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'17:31:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00089', CAST(N'2022-08-18' AS Date), CAST(N'08:05:00' AS Time), CAST(N'11:06:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'17:34:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00089', CAST(N'2022-08-28' AS Date), CAST(N'08:05:00' AS Time), CAST(N'11:06:00' AS Time), CAST(N'13:00:00' AS Time), CAST(N'17:34:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00093', CAST(N'2022-09-24' AS Date), CAST(N'08:00:00' AS Time), CAST(N'11:03:00' AS Time), CAST(N'13:14:00' AS Time), CAST(N'17:23:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00094', CAST(N'2022-09-10' AS Date), CAST(N'08:09:00' AS Time), CAST(N'12:35:00' AS Time), CAST(N'13:01:00' AS Time), CAST(N'17:36:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00094', CAST(N'2022-09-11' AS Date), CAST(N'08:09:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:01:00' AS Time), CAST(N'17:36:00' AS Time))
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00097', CAST(N'2022-09-24' AS Date), CAST(N'09:00:00' AS Time), CAST(N'11:03:00' AS Time), CAST(N'13:14:00' AS Time), CAST(N'17:23:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[ChamCongSanXuat] ON 

INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (1, CAST(N'2022-11-19' AS Date), 500, 1)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (2, CAST(N'2022-11-19' AS Date), 500, 2)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (3, CAST(N'2022-11-19' AS Date), 500, 3)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (4, CAST(N'2022-11-19' AS Date), 500, 4)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (5, CAST(N'2022-11-19' AS Date), 1000, 5)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (6, CAST(N'2022-11-19' AS Date), 1000, 6)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (7, CAST(N'2022-11-19' AS Date), 850, 7)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (8, CAST(N'2022-11-19' AS Date), 500, 8)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (9, CAST(N'2022-11-19' AS Date), 150, 7)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (10, CAST(N'2022-11-19' AS Date), 500, 8)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (11, CAST(N'2022-11-19' AS Date), 800, 9)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (12, CAST(N'2022-11-19' AS Date), 800, 10)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (13, CAST(N'2022-11-19' AS Date), 800, 11)
SET IDENTITY_INSERT [dbo].[ChamCongSanXuat] OFF
GO
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'1      ', 100, 0, N'Sản Xuất', N'BR044', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'10     ', 500, 0, N'Ngưng Sản Xuất', N'JQ539', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'11     ', 1000, 0, N'Ngưng Sản Xuất', N'NH140', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'12     ', 1000, 0, N'Sản Xuất', N'NH140', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'13     ', 0, 0, N'Hoàn Thành', N'NH140', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'14     ', 0, 0, N'Hoàn Thành', N'NI735', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'15     ', 1000, 0, N'Sản Xuất', N'QX946', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'16     ', 0, 0, N'Hoàn Thành', N'QX946', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'17     ', 1000, 1000, N'Hoàn Thành', N'WF376', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'18     ', 1000, 1000, N'Hoàn Thành', N'WF376', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'19     ', 0, 0, N'Hoàn Thành', N'YL617', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'2      ', 0, 0, N'Hoàn Thành', N'BR044', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'3      ', 1000, 0, N'Sản Xuất', N'CB127', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'4      ', 0, 0, N'Hoàn Thành', N'CB127', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'5      ', 1000, 800, N'Ngưng Sản Xuất', N'GS039', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'6      ', 1000, 0, N'Sản Xuất', N'GS039', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'7      ', 0, 0, N'Hoàn Thành', N'IZ753', CAST(N'2022-11-20' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'8      ', 500, 500, N'Hoàn Thành', N'JQ539', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[ChiTietSanXuat] ([MaCTSX], [SoLuongSanXuat], [SoLuongHoanThanh], [TinhTrang], [MaSanPham], [ThoiGian]) VALUES (N'9      ', 500, 500, N'Hoàn Thành', N'JQ539', CAST(N'2022-11-19' AS Date))
GO
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL001   ', N'Làm việc tăng ca', CAST(N'2022-08-22' AS Date), 500000, N'NVSX00001', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL002   ', N'Làm việc không đạt chỉ tiêu', CAST(N'2022-08-28' AS Date), -200000, N'NVSX00023', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL003   ', N'Làm việc vượt chỉ tiêu', CAST(N'2022-08-29' AS Date), 200000, N'NVSX00014', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL004   ', N'nghỉ làm không có lý do', CAST(N'2022-09-10' AS Date), -250000, NULL, N'NVHC00083')
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL005   ', N'Xây dựng kế hoạch tốt', CAST(N'2022-09-20' AS Date), 500000, NULL, N'NVHC00088')
GO
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP001     ', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-20' AS Date), N'Nhập viện vì tăng ca quá nhiều', 1300000, N'NVHC00082')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP002     ', CAST(N'2022-06-16' AS Date), CAST(N'2022-06-18' AS Date), N'Công việc gia đình', 0, N'NVHC00087')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP003     ', CAST(N'2022-07-17' AS Date), CAST(N'2022-07-19' AS Date), N'Đi khám bệnh', 0, N'NVHC00091')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP004     ', CAST(N'2022-08-18' AS Date), CAST(N'2022-08-20' AS Date), N'Đi công tác', 1000000, N'NVHC00085')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP005     ', CAST(N'2022-09-19' AS Date), CAST(N'2022-09-21' AS Date), N'Đám cưới', 500000, N'NVHC00096')
GO
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00081', N'Lê Văn Lượng', 1, CAST(N'1998-04-12' AS Date), N'Lý Thường Kiệt Gò Vấp', N'0365896541', N'Agribank  ', N'012305062010        ', N'Lê Văn Lượng                                      ', 30000000, N'Trưởng Phòng', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00082', N'Lê Thanh Sĩ', 1, CAST(N'1999-03-22' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897256', N'Agribank  ', N'012305459010        ', N'Lê Thanh Sĩ                                       ', 20000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00083', N'Trần Văn Công', 1, CAST(N'1998-05-12' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897257 ', N'Agribank  ', N'012305459010        ', N'Trần Văn Công                                     ', 12000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00084', N'Lý Công Uẩng', 1, CAST(N'1992-04-24' AS Date), N'Lê Đức Thọ, Gò Vấp, HCM', N'354897258 ', N'Agribank  ', N'012305459010        ', N'Lý Công Uẩng                                      ', 12000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00085', N'Lê Thanh Chung', 1, CAST(N'1993-05-25' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897259 ', N'MB Bank   ', N'012305459010        ', N'Lê Thanh Chung                                    ', 20000000, N'Trưởng Phòng', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00086', N'Phạm Thái Sư', 1, CAST(N'1994-06-26' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897260 ', N'MB Bank   ', N'012305459010        ', N'Phạm Thái Sư                                      ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00087', N'Nguyễn Thị Kim Liên', 1, CAST(N'1995-03-27' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897261 ', N'MB Bank   ', N'012305459010        ', N'Nguyễn Thị Kim Liên                               ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00088', N'Tống Gia Hào', 1, CAST(N'1994-04-28' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897262 ', N'MB Bank   ', N'012305459010        ', N'Tống Gia Hào                                      ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00089', N'Nguyễn Thanh Liên', 0, CAST(N'1993-07-29' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897263 ', N'BIDV      ', N'012305459010        ', N'Nguyễn Thanh Liên                                 ', 20000000, N'Trưởng Phòng', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00090', N'Phạm Thúy Thẩm', 0, CAST(N'1999-03-25' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897264 ', N'BIDV      ', N'012305459010        ', N'Phạm Thúy Thẩm                                    ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00091', N'Trịnh Thị Thanh Tuyền', 0, CAST(N'1999-06-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897265 ', N'BIDV      ', N'012305459010        ', N'Trịnh Thị Thanh Tuyền                             ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00092', N'Võ Tấn Đạt', 1, CAST(N'1997-04-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897266 ', N'BIDV      ', N'012305459010        ', N'Võ Tấn Đạt                                        ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00093', N'Trần Thanh Tính', 1, CAST(N'1997-04-20' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897267 ', N'VPBank    ', N'012305459010        ', N'Trần Thanh Tính                                   ', 20000000, N'Trưởng Phòng', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00094', N'Công Văn Luyện', 1, CAST(N'1995-04-23' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897268 ', N'VPBank    ', N'012305459010        ', N'Công Văn Luyện                                    ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00095', N'Phạm Thái Tuấn', 1, CAST(N'1995-04-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897269 ', N'VPBank    ', N'012305459010        ', N'Phạm Thái Tuấn                                    ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00096', N'Nguyễn Thị Tuyết Nhung', 0, CAST(N'1998-04-05' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897270', N'BIDV      ', N'012305459010        ', N'Nguyễn Thị Tuyết Nhung                            ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00097', N'Lý Công Duyệt', 1, CAST(N'1994-04-06' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897271 ', N'ACB       ', N'012305459010        ', N'Lý Công Duyệt                                     ', 20000000, N'Trưởng Phòng', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00098', N'Nguyễn Thị Hồng', 0, CAST(N'1999-04-07' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897272 ', N'ACB       ', N'012305459010        ', N'Nguyễn Thị Hồng                                   ', 12000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00099', N'Nguyễn Thị Thu Thảo', 0, CAST(N'1996-04-08' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897273 ', N'ACB       ', N'012305459010        ', N'Nguyễn Thị Thu Thảo                               ', 12000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00100', N'Lê Thanh Sĩ', 1, CAST(N'1999-03-22' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897256', NULL, NULL, NULL, 20000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00101', N'Tống Gia Hào', 1, CAST(N'1994-04-28' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897262 ', NULL, NULL, NULL, 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00102', N'Trần Văn Công', 1, CAST(N'1998-05-12' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897257 ', NULL, NULL, NULL, 12000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00103', N'Nguyễn Thị Tuyết Nhung', 0, CAST(N'1998-04-05' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897270', N'BIDV      ', N'012305459010        ', N'Nguyễn Thị Tuyết Nhung                            ', 12000000, N'Nhân Viên', N'PB04')
GO
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00001', N'Bùi Công Minh', 1, CAST(N'1994-03-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924608193 ', N'Agribank  ', N'4901234567890       ', N'Bùi Công Minh                                     ', N'May cúc áo thun', N'PX0101', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00002', N'Nguyễn Thanh Tâm', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'962342550 ', N'Agribank  ', N'12305061997         ', N'Nguyễn Thanh Tâm                                  ', N'May cúc áo thun', N'PX0101', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00003', N'Trần Thanh Công', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'834082001 ', N'Agribank  ', N'12305061998         ', N'Trần Thanh Công                                   ', N'May cúc áo thun', N'PX0101', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00004', N'Trần Thanh Công', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'834082001 ', N'ACB       ', N'12305061999         ', N'Trần Thị Thanh Nhã                                ', N'May cúc áo thun', N'PX0102', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00005', N'Nguyễn Diệp Anh', 0, CAST(N'2001-12-08' AS Date), N'Thường Tín, Hà Nội', N'984476509 ', N'Agribank  ', N'12305062000         ', N'Nguyễn Diệp Anh                                   ', N'May cổ áo thun', N'PX0102', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00006', N'Trần Nam Anh', 1, CAST(N'1999-12-06' AS Date), N'Thanh Xuân, Hà Nội', N'973266558 ', N'BIDV      ', N'12305062001         ', N'Trần Nam Anh                                      ', N'May cổ áo thun', N'PX0102', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00007', N'Hoàng Ngọc Bách', 1, CAST(N'1998-12-05' AS Date), N'Thường Tín, Hà Nội', N'924655434 ', N'MB Bank   ', N'12305062002         ', N'Hoàng Ngọc Bách                                   ', N'May cổ áo thun', N'PX0102', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00008', N'Nguyễn Thị Kim Dung', 0, CAST(N'2000-12-02' AS Date), N'Quận 2, HCM', N'941688538 ', N'MB Bank   ', N'12305062003         ', N'Nguyễn Thị Kim Dung                               ', N'May cổ áo thun', N'PX0102', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00009', N'Phạm Hồng Đăng', 1, CAST(N'1990-11-04' AS Date), N'Thanh Xuân, Hà Nội', N'162765429 ', N'MB Bank   ', N'12305062004         ', N'Phạm Hồng Đăng                                    ', N'May tay áo thun', N'PX0103', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00010', N'Vũ Việt Hà', 1, CAST(N'1997-09-11' AS Date), N'Hoàn Kiếm, Hà Nội', N'924655435 ', N'SHB       ', N'12305062005         ', N'Vũ Việt Hà                                        ', N'May tay áo thun', N'PX0103', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00011', N'Trần Ngọc Hà', 0, CAST(N'2000-10-06' AS Date), N'Hà Đông, Hà Nội', N'924655437 ', N'Agribank  ', N'12305062006         ', N'Trần Ngọc Hà                                      ', N'May tay áo thun', N'PX0103', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00012', N'Đào Minh Hạnh', 0, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'924655441 ', N'Agribank  ', N'12305062007         ', N'Đào Minh Hạnh                                     ', N'May tay áo thun', N'PX0103', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00013', N'Đỗ Quốc Hưng', 1, CAST(N'1988-04-08' AS Date), N'Cầu Giấy, Hà Nội', N'924655440 ', N'BIDV      ', N'12305062008         ', N'Đỗ Quốc Hưng                                      ', N'May thân áo thun', N'PX0104', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00014', N'Lê Phương Liên', 0, CAST(N'1997-06-07' AS Date), N'Thường Tín, Hà Nội', N'924655436 ', N'Sacombank ', N'12305062009         ', N'Lê Phương Liên                                    ', N'May thân áo thun', N'PX0104', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00015', N'Nguyễn Anh Mai', 0, CAST(N'1988-02-08' AS Date), N'Thường Tín, Hà Nội', N'924655443 ', N'VPBank    ', N'12305062010         ', N'Nguyễn Anh Mai                                    ', N'May thân áo thun', N'PX0104', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00016', N'Nguyễn Hoàng Nam', 1, CAST(N'1988-02-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681193 ', N'Agribank  ', N'12305062011         ', N'Nguyễn Hoàng Nam                                  ', N'May thân áo thun', N'PX0104', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00017', N'Trịnh Hà Phương', 0, CAST(N'1989-08-12' AS Date), N'Thanh Xuân, Hà Nội', N'924655438 ', N'Vietinbank', N'12305062012         ', N'Trịnh Hà Phương                                   ', N'May cúc áo khoác', N'PX0201', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00018', N'Trần Lê Nguyên', 1, CAST(N'1996-08-03' AS Date), N'Đống Đa, Hà Nội', N'924655433 ', N'SHB       ', N'12305062013         ', N'Trần Lê Nguyên                                    ', N'May cúc áo khoác', N'PX0201', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00019', N'Lê Minh Tâm', 1, CAST(N'1999-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924655439 ', N'ACB       ', N'12305062014         ', N'Lê Minh Tâm                                       ', N'May cúc áo khoác', N'PX0201', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00020', N'Trần Diệu Thúy', 0, CAST(N'1988-09-08' AS Date), N'Thủ Đức, HCM', N'924655442 ', N'Agribank  ', N'12305062015         ', N'Trần Diệu Thúy                                    ', N'May cúc áo khoác', N'PX0201', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00021', N'Trịnh Minh Thư', 0, CAST(N'1999-09-06' AS Date), N'Thanh Xuân, Hà Nội', N'366638592 ', N'VPBank    ', N'12305062016         ', N'Trịnh Minh Thư                                    ', N'May cổ áo khoác', N'PX0202', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00022', N'Lê Minh Trí', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'354298675 ', N'Sacombank ', N'12305062017         ', N'Lê Minh Trí                                       ', N'May cổ áo khoác', N'PX0202', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00023', N'Định Quốc Trung', 1, CAST(N'2000-07-06' AS Date), N'Đống Đa, Hà Nội', N'986354872 ', N'VPBank    ', N'12305062018         ', N'Định Quốc Trung                                   ', N'May cổ áo khoác', N'PX0202', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00024', N'Vũ Quang Vinh', 1, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'365928521 ', N'Agribank  ', N'12305062019         ', N'Vũ Quang Vinh                                     ', N'May cổ áo khoác', N'PX0202', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00025', N'Mai Chiến Thắng', 1, CAST(N'1988-04-08' AS Date), N'Thủ Đức, HCM', N'369852475 ', N'Vietinbank', N'12305062020         ', N'Mai Chiến Thắng                                   ', N'May tay áo khoác', N'PX0203', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00026', N'Bùi Công Hải', 1, CAST(N'1995-10-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681101 ', N'Agribank  ', N'12305062021         ', N'Bùi Công Hải                                      ', N'May tay áo khoác', N'PX0203', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00027', N'Nguyễn Thanh Tín', 1, CAST(N'1999-10-06' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681102 ', N'Agribank  ', N'12305062022         ', N'Nguyễn Thanh Tín                                  ', N'May tay áo khoác', N'PX0203', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00028', N'Trần Thanh Thẳng', 0, CAST(N'1989-11-09' AS Date), N'Cầu Giấy, Hà Nội', N'924681103 ', N'Agribank  ', N'12305062023         ', N'Trần Thanh Thẳng                                  ', N'May tay áo khoác', N'PX0203', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00029', N'Trần Thị Thanh Phi', 0, CAST(N'2001-12-08' AS Date), N'Hoàng Mai, Hà Nội', N'924681104 ', N'ACB       ', N'12305062024         ', N'Trần Thị Thanh Phi                                ', N'May thân áo khoác', N'PX0204', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00030', N'Nguyễn Diệp Tú', 1, CAST(N'1999-04-06' AS Date), N'Thường Tín, Hà Nội', N'924681105 ', N'Agribank  ', N'12305062025         ', N'Nguyễn Diệp Tú                                    ', N'May thân áo khoác', N'PX0204', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00031', N'Trần Nam Anh Bắc', 1, CAST(N'1998-03-05' AS Date), N'Thanh Xuân, Hà Nội', N'924681106 ', N'BIDV      ', N'12305062026         ', N'Trần Nam Anh Bắc                                  ', N'May thân áo khoác', N'PX0204', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00032', N'Hoàng Ngọc Thu', 0, CAST(N'2000-06-02' AS Date), N'Thường Tín, Hà Nội', N'924681107 ', N'MB Bank   ', N'12305062027         ', N'Hoàng Ngọc Thu                                    ', N'May thân áo khoác', N'PX0204', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00033', N'Nguyễn Thị Kim Tuyền', 1, CAST(N'1990-06-04' AS Date), N'Quận 2, HCM', N'924681108 ', N'MB Bank   ', N'12305062028         ', N'Nguyễn Thị Kim Tuyền                              ', N'May cúc áo sơ mi', N'PX0301', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00034', N'Phạm Hồng Hồ', 1, CAST(N'1997-05-11' AS Date), N'Thanh Xuân, Hà Nội', N'924681109 ', N'MB Bank   ', N'12305062029         ', N'Phạm Hồng Hồ                                      ', N'May cúc áo sơ mi', N'PX0301', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00035', N'Vũ Việt Thu', 0, CAST(N'2000-07-06' AS Date), N'Hoàn Kiếm, Hà Nội', N'924681110 ', N'SHB       ', N'12305062030         ', N'Vũ Việt Thu                                       ', N'May cúc áo sơ mi', N'PX0301', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00036', N'Trần Ngọc Bích', 0, CAST(N'2000-11-07' AS Date), N'Hà Đông, Hà Nội', N'924681111 ', N'Agribank  ', N'12305062031         ', N'Trần Ngọc Bích                                    ', N'May cúc áo sơ mi', N'PX0301', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00037', N'Đào Minh Hồ', 1, CAST(N'1988-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681112 ', N'Agribank  ', N'12305062032         ', N'Đào Minh Hồ                                       ', N'May cổ áo sơ mi', N'PX0302', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00038', N'Đỗ Quốc Thái', 0, CAST(N'1997-06-07' AS Date), N'Cầu Giấy, Hà Nội', N'924681113 ', N'BIDV      ', N'12305062033         ', N'Đỗ Quốc Thái                                      ', N'May cổ áo sơ mi', N'PX0302', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00039', N'Lê Phương Linh', 0, CAST(N'1988-06-08' AS Date), N'Thường Tín, Hà Nội', N'924681114 ', N'Sacombank ', N'12305062034         ', N'Lê Phương Linh                                    ', N'May cổ áo sơ mi', N'PX0302', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00040', N'Nguyễn Anh Thư', 1, CAST(N'1988-02-08' AS Date), N'Thường Tín, Hà Nội', N'924681115 ', N'VPBank    ', N'12305062035         ', N'Nguyễn Anh Thư                                    ', N'May cổ áo sơ mi', N'PX0302', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00041', N'Nguyễn Hoàng Đông', 0, CAST(N'1989-08-12' AS Date), N'Cầu Giấy, Hà Nội', N'924681116 ', N'Agribank  ', N'12305062036         ', N'Nguyễn Hoàng Đông                                 ', N'May tay áo sơ mi', N'PX0303', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00042', N'Trịnh Hà Phùng', 1, CAST(N'1996-08-03' AS Date), N'Thanh Xuân, Hà Nội', N'924681117 ', N'Vietinbank', N'12305062037         ', N'Trịnh Hà Phùng                                    ', N'May tay áo sơ mi', N'PX0303', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00043', N'Trần Lê Sơn', 1, CAST(N'1999-04-08' AS Date), N'Đống Đa, Hà Nội', N'924681118 ', N'SHB       ', N'12305062038         ', N'Trần Lê Sơn                                       ', N'May tay áo sơ mi', N'PX0303', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00044', N'Lê Minh Tình', 0, CAST(N'1988-09-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681119 ', N'ACB       ', N'12305062039         ', N'Lê Minh Tình                                      ', N'May tay áo sơ mi', N'PX0303', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00045', N'Trần Diệu Thi', 0, CAST(N'1999-09-06' AS Date), N'Thủ Đức, HCM', N'924681120 ', N'Agribank  ', N'12305062040         ', N'Trần Diệu Thi                                     ', N'May thân áo sơ mi', N'PX0304', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00046', N'Trịnh Minh Phong', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681121 ', N'VPBank    ', N'12305062041         ', N'Trịnh Minh Phong                                  ', N'May thân áo sơ mi', N'PX0304', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00047', N'Lê Minh Duẩn', 1, CAST(N'2000-07-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681122 ', N'Sacombank ', N'12305062042         ', N'Lê Minh Duẩn                                      ', N'May thân áo sơ mi', N'PX0304', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00048', N'Định Quốc Bắc', 1, CAST(N'2000-11-07' AS Date), N'Đống Đa, Hà Nội', N'924681123 ', N'VPBank    ', N'12305062043         ', N'Định Quốc Bắc                                     ', N'May thân áo sơ mi', N'PX0304', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00049', N'Vũ Quang Minh', 1, CAST(N'1988-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681124 ', N'Agribank  ', N'12305062044         ', N'Vũ Quang Minh                                     ', N'May đai quần tây', N'PX0401', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00050', N'Đông Thất Bại', 1, CAST(N'1994-03-10' AS Date), N'Thủ Đức, HCM', N'924681125 ', N'Vietinbank', N'12305062045         ', N'Đông Thất Bại                                     ', N'May đai quần tây', N'PX0401', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00051', N'Bùi Công Thu', 1, CAST(N'1994-03-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681126 ', N'Agribank  ', N'12305062046         ', N'Bùi Công Thu                                      ', N'May đai quần tây', N'PX0401', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00052', N'Nguyễn Thanh Tú', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681127 ', N'Agribank  ', N'12305062047         ', N'Nguyễn Thanh Tú                                   ', N'May đai quần tây', N'PX0401', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00053', N'Trần Thanh Tèo', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'924681128 ', N'Agribank  ', N'12305062048         ', N'Trần Thanh Tèo                                    ', N'May khóa quần tây', N'PX0402', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00054', N'Trần Thị Thanh Nhí', 0, CAST(N'1989-11-09' AS Date), N'Hoàng Mai, Hà Nội', N'924681129 ', N'ACB       ', N'12305062049         ', N'Trần Thị Thanh Nhí                                ', N'May khóa quần tây', N'PX0402', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00055', N'Nguyễn Diệp Em', 0, CAST(N'2001-12-08' AS Date), N'Thường Tín, Hà Nội', N'924681130 ', N'Agribank  ', N'12305062050         ', N'Nguyễn Diệp Em                                    ', N'May khóa quần tây', N'PX0402', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00056', N'Trần Nam Em', 1, CAST(N'1999-04-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681131 ', N'BIDV      ', N'12305062051         ', N'Trần Nam Em                                       ', N'May khóa quần tây', N'PX0402', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00057', N'Hoàng Ngọc Thi', 1, CAST(N'1998-03-05' AS Date), N'Thường Tín, Hà Nội', N'924681132 ', N'MB Bank   ', N'12305062052         ', N'Hoàng Ngọc Thi                                    ', N'May túi quần tây', N'PX0403', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00058', N'Nguyễn Thị Kim Nhung', 0, CAST(N'2000-06-02' AS Date), N'Quận 2, HCM', N'924681133 ', N'MB Bank   ', N'12305062053         ', N'Nguyễn Thị Kim Nhung                              ', N'May túi quần tây', N'PX0403', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00059', N'Phạm Hồng Quang', 1, CAST(N'1990-06-04' AS Date), N'Thanh Xuân, Hà Nội', N'924681134 ', N'MB Bank   ', N'12305062054         ', N'Phạm Hồng Quang                                   ', N'May túi quần tây', N'PX0403', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00060', N'Vũ Việt Hồ', 1, CAST(N'1997-05-11' AS Date), N'Hoàn Kiếm, Hà Nội', N'924681135 ', N'SHB       ', N'12305062055         ', N'Vũ Việt Hồ                                        ', N'May túi quần tây', N'PX0403', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00061', N'Trần Ngọc Hồ', 0, CAST(N'2000-07-06' AS Date), N'Hà Đông, Hà Nội', N'924681136 ', N'Agribank  ', N'12305062056         ', N'Trần Ngọc Hồ                                      ', N'May ống quần tây', N'PX0404', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00062', N'Đào Minh Vân', 0, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'924681137 ', N'Agribank  ', N'12305062057         ', N'Đào Minh Vân                                      ', N'May ống quần tây', N'PX0404', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00063', N'Đỗ Quốc Hiền', 1, CAST(N'1988-04-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681138 ', N'BIDV      ', N'12305062058         ', N'Đỗ Quốc Hiền                                      ', N'May ống quần tây', N'PX0404', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00064', N'Lê Phương Bích', 0, CAST(N'1997-06-07' AS Date), N'Thường Tín, Hà Nội', N'924681139 ', N'Sacombank ', N'12305062059         ', N'Lê Phương Bích                                    ', N'May ống quần tây', N'PX0404', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00065', N'Nguyễn Anh Mãi', 0, CAST(N'1988-06-08' AS Date), N'Thường Tín, Hà Nội', N'924681140 ', N'VPBank    ', N'12305062060         ', N'Nguyễn Anh Mãi                                    ', N'May đai quần jean', N'PX0501', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00066', N'Nguyễn Hoàng Bắc', 1, CAST(N'1988-02-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681141 ', N'Agribank  ', N'12305062061         ', N'Nguyễn Hoàng Bắc                                  ', N'May đai quần jean', N'PX0501', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00067', N'Trịnh Hà Pháp', 0, CAST(N'1989-08-12' AS Date), N'Thanh Xuân, Hà Nội', N'924681142 ', N'Vietinbank', N'12305062062         ', N'Trịnh Hà Pháp                                     ', N'May đai quần jean', N'PX0501', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00068', N'Trần Lê Dúng', 1, CAST(N'1996-08-03' AS Date), N'Đống Đa, Hà Nội', N'924681143 ', N'SHB       ', N'12305062063         ', N'Trần Lê Dúng                                      ', N'May đai quần jean', N'PX0501', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00069', N'Lê Minh Tú', 1, CAST(N'1999-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681144 ', N'ACB       ', N'12305062064         ', N'Lê Minh Tú                                        ', N'May khóa quần jean', N'PX0502', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00070', N'Trần Diệu Nga', 0, CAST(N'1988-09-08' AS Date), N'Thủ Đức, HCM', N'924681145 ', N'Agribank  ', N'12305062065         ', N'Trần Diệu Nga                                     ', N'May khóa quần jean', N'PX0502', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00071', N'Trịnh Minh My', 0, CAST(N'1999-09-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681146 ', N'VPBank    ', N'12305062066         ', N'Trịnh Minh My                                     ', N'May khóa quần jean', N'PX0502', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00072', N'Lê Minh Tuệ', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681147 ', N'Sacombank ', N'12305062067         ', N'Lê Minh Tuệ                                       ', N'May khóa quần jean', N'PX0502', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00073', N'Định Quốc Tây', 1, CAST(N'2000-07-06' AS Date), N'Đống Đa, Hà Nội', N'924681148 ', N'VPBank    ', N'12305062068         ', N'Định Quốc Tây                                     ', N'May túi quần jean', N'PX0503', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00074', N'Vũ Quang Hệ', 1, CAST(N'2000-01-07' AS Date), N'Thanh Xuân, Hà Nội', N'924681149 ', N'Agribank  ', N'12305062069         ', N'Vũ Quang Hệ                                       ', N'May túi quần jean', N'PX0503', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00075', N'Mai Chiến Đấu', 1, CAST(N'1988-04-08' AS Date), N'Thủ Đức, HCM', N'924681150 ', N'Vietinbank', N'12305062070         ', N'Mai Chiến Đấu                                     ', N'May túi quần jean', N'PX0503', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00076', N'Bùi Công Minh', 1, CAST(N'1995-10-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681151 ', N'Agribank  ', N'12305062071         ', N'Bùi Công Minh                                     ', N'May túi quần jean', N'PX0503', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00077', N'Nguyễn Thanh Tính', 1, CAST(N'1999-10-06' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681152 ', N'Agribank  ', N'12305062072         ', N'Nguyễn Thanh Tính                                 ', N'May ống quần jean', N'PX0504', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00078', N'Trần Thanh Hà', 0, CAST(N'1989-11-09' AS Date), N'Cầu Giấy, Hà Nội', N'924681153 ', N'Agribank  ', N'12305062073         ', N'Trần Thanh Hà                                     ', N'May ống quần jean', N'PX0504', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00079', N'Trần Thị Thanh Vũ', 0, CAST(N'2001-12-08' AS Date), N'Hoàng Mai, Hà Nội', N'924681154 ', N'ACB       ', N'12305062074         ', N'Trần Thị Thanh Vũ                                 ', N'May ống quần jean', N'PX0504', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00080', N'Nguyễn Diệp Tâm', 1, CAST(N'1999-01-06' AS Date), N'Thường Tín, Hà Nội', N'924681155 ', N'Agribank  ', N'12305062075         ', N'Nguyễn Diệp Tâm                                   ', N'May ống quần jean', N'PX0504', N'Công Nhân')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo], [ChucVu]) VALUES (N'NVSX00081', N'Nguyễn Thanh Tâm', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'962342550 ', NULL, NULL, NULL, N'May cúc áo thun', N'PX0101', N'Công Nhân')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (1, N'JQ53999', N'NVSX00001', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (2, N'JQ53956', N'NVSX00002', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (3, N'JQ53950', N'NVSX00003', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (4, N'JQ53957', N'NVSX00004', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (5, N'WF37609', N'NVSX00005', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (6, N'WF37614', N'NVSX00006', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (7, N'WF37630', N'NVSX00007', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (8, N'WF37648', N'NVSX00008', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (9, N'GS03975', N'NVSX00009', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (10, N'GS03954', N'NVSX00010', CAST(N'2022-11-19' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (11, N'GS03927', N'NVSX00011', CAST(N'2022-11-19' AS Date))
GO
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX01', N'Phân xưởng may áo thun', N'NVSX00001')
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX02', N'Phân xưởng may áo khoác', N'NVSX00006')
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX03', N'Phân xưởng may áo sơ mi', N'NVSX00011')
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX04', N'Phân xưởng may quần tây', N'NVSX00016')
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX05', N'Phân xưởng may quần jean', N'NVSX00021')
INSERT [dbo].[PhanXuong] ([MaPhanXuong], [TenPhanXuong], [MaQuanDoc]) VALUES (N'PX58', N'Phan xuong', N'NVSX00031')
GO
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB01', N'Phòng nhân sự', N'NVHC00081')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB02', N'Phòng tài chính kế toán', N'NVHC00085')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB03', N'Phòng hành chính', N'NVHC00089')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB04', N'Phòng marketing', N'NVHC00093')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB05', N'Phòng kinh doanh', N'NVHC00097')
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB06', N'Phong ban 1', NULL)
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB07', N'pb2', NULL)
GO
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'BR04408', N'cúc áo', 25000, N'BR044', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'BR04446', N'tay áo', 25000, N'BR044', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'BR04480', N'thân áo', 40000, N'BR044', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'BR04495', N'cổ áo', 30000, N'BR044', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CB12732', N'khóa áo', 25000, N'CB127', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CB12739', N'thân áo', 35000, N'CB127', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CB12748', N'tay áo', 30000, N'CB127', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CB12781', N'cổ áo', 20000, N'CB127', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'GS03927', N'thân áo', 30000, N'GS039', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'GS03941', N'cúc áo', 20000, N'GS039', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'GS03954', N'tay áo', 25000, N'GS039', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'GS03975', N'cổ áo', 20000, N'GS039', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'JQ53950', N'tay áo', 30000, N'JQ539', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'JQ53956', N'cổ áo', 25000, N'JQ539', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'JQ53957', N'thân áo', 40000, N'JQ539', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'JQ53999', N'cúc áo', 25000, N'JQ539', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'NH14006', N'cúc áo vip', 20000, N'NH140', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'NH14024', N'thân áo vip', 40000, N'NH140', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'NH14051', N'vip update', 55000, N'NH140', 5)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'NH14071', N'tay áo vip', 30000, N'NH140', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'NH14075', N'cổ áo vip', 25000, N'NH140', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QX94615', N'cổ áo', 25000, N'QX946', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QX94621', N'thân áo', 40000, N'QX946', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QX94642', N'tay áo', 30000, N'QX946', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QX94685', N'khóa áo', 25000, N'QX946', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'WF37609', N'cúc áo', 20000, N'WF376', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'WF37614', N'cổ áo', 25000, N'WF376', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'WF37630', N'tay áo', 30000, N'WF376', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'WF37648', N'thân áo', 40000, N'WF376', 4)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'BF327', N'Áo thun nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'BL588', N'Áo khoác cùi', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'BR044', N'Áo thun nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'CB127', N'Áo khoác nam', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'GS039', N'Áo thun nam', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'HP730', N'áo', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'IZ753', N'Áo khoác babay', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'JQ539', N'Áo sơ mi nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'KC693', N'á', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'NH140', N'Áo khoác vip', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'NI735', N'áo khoác sịn', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'NQ985', N'Áo thun nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'OF262', N'Áo khoác baby', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'OX162', N'Áo khoác nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'PA872', N'Áo', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QX946', N'Áo khoác nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'TJ630', N'a', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'UX153', N'a', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'WF376', N'Áo sơ mi nam', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'WZ695', N'Áo thun nữ', 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'YL617', N'Áo khoác cùi', 1)
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVHC00081', N'DOcr0ReFI71nDyKTyrVeEAywTdZnGfLd0gzPI/ic7l0=', N'ldj9ds892ha9dl8dos9sf442aadw8o', NULL, N'NVHC00081')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVHC00082', N'aXgj+pk6+xchGbpaQvPAV6c5j81HwP9qk+rfaESuQQ4=', N'fs98ddssd882sdahdld94fsja9h9so', NULL, N'NVHC00082')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVHC00083', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', NULL, N'NVHC00083')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVHC00084', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', NULL, N'NVHC00084')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVSX00001', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', N'NVSX00001', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVSX00002', N'4iA/WPzJJv2MGY1ThUl0miybtk/QKa9j6BsWSMCnzvQ=', N'oh8hhsfslfhnass8ofnh898dshl4f2', N'NVSX00002', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NVSX00003', N'FVGyilxcN4PV9c+DKCtpLZYL0jJwNUJf03XUMdkC9NU=', N'hsfd2df4hs8lo9l9898944fsofdhd4', N'NVSX00003', NULL)
GO
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0101', N'Tổ may cúc áo thun', N'NVSX00002', N'PX01')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0102', N'Tổ may cổ áo thun', N'NVSX00003', N'PX01')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0103', N'Tổ may tay áo thun', N'NVSX00004', N'PX01')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0104', N'Tổ may thân áo thun', N'NVSX00005', N'PX01')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0201', N'Tổ may cúc áo khóac', N'NVSX00007', N'PX02')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0202', N'Tổ may cổ áo khoác', N'NVSX00008', N'PX02')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0203', N'Tổ may tay áo khoác', N'NVSX00009', N'PX02')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0204', N'Tổ may thân áo khoác', N'NVSX00010', N'PX02')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0301', N'Tổ may cúc áo sơ mi', N'NVSX00012', N'PX03')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0302', N'Tổ may cổ áo sơ mi', N'NVSX00013', N'PX03')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0303', N'Tổ may tay áo sơ mi', N'NVSX00014', N'PX03')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0304', N'Tổ may thân áo sơ mi', N'NVSX00015', N'PX03')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0401', N'Tổ may đai quần tây', N'NVSX00017', N'PX04')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0402', N'Tổ may khóa quần tây', N'NVSX00018', N'PX04')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0403', N'Tổ may túi quần tây', N'NVSX00019', N'PX04')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0404', N'Tổ may ống quần tây', N'NVSX00020', N'PX04')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0501', N'Tổ may đai quần jean', N'NVSX00022', N'PX05')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0502', N'Tổ may khóa quần jean', N'NVSX00023', N'PX05')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0503', N'Tổ may túi quần jean', N'NVSX00024', N'PX05')
INSERT [dbo].[ToSanXuat] ([MaTo], [TenTo], [MaToTruong], [MaPhanXuong]) VALUES (N'PX0504', N'Tổ may ống quần jean', N'NVSX00025', N'PX05')
GO
ALTER TABLE [dbo].[NhanVienHanhChinh] ADD  CONSTRAINT [DF_NhanVienHanhChinh_MaNhanVien]  DEFAULT ([DBO].[GENERATE_EMPLOYEE_OFFICE_ID]()) FOR [MaNhanVien]
GO
ALTER TABLE [dbo].[NhanVienSanXuat] ADD  CONSTRAINT [DF_NhanVienSanXuat_MaNhanVien]  DEFAULT ([DBO].[GENERATE_WORKER_ID]()) FOR [MaNhanVien]
GO
ALTER TABLE [dbo].[NhanVienSanXuat] ADD  CONSTRAINT [DF_NhanVienSanXuat_ChucVu]  DEFAULT (N'Công Nhân') FOR [ChucVu]
GO
ALTER TABLE [dbo].[ChamCongHanhChinh]  WITH CHECK ADD  CONSTRAINT [FK_ChamCongHanhChinh_NhanVienHanhChinh] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVienHanhChinh] ([MaNhanVien])
GO
ALTER TABLE [dbo].[ChamCongHanhChinh] CHECK CONSTRAINT [FK_ChamCongHanhChinh_NhanVienHanhChinh]
GO
ALTER TABLE [dbo].[ChamCongSanXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChamCongSanXuat_PhanCong] FOREIGN KEY([MaPhanCong])
REFERENCES [dbo].[PhanCong] ([MaPhanCong])
GO
ALTER TABLE [dbo].[ChamCongSanXuat] CHECK CONSTRAINT [FK_ChamCongSanXuat_PhanCong]
GO
ALTER TABLE [dbo].[ChiTietSanXuat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanXuat_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietSanXuat] CHECK CONSTRAINT [FK_ChiTietSanXuat_SanPham]
GO
ALTER TABLE [dbo].[KhenThuongKyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuongKyLuat_NhanVienHanhChinh] FOREIGN KEY([MaNVHC])
REFERENCES [dbo].[NhanVienHanhChinh] ([MaNhanVien])
GO
ALTER TABLE [dbo].[KhenThuongKyLuat] CHECK CONSTRAINT [FK_KhenThuongKyLuat_NhanVienHanhChinh]
GO
ALTER TABLE [dbo].[KhenThuongKyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuongKyLuat_NhanVienSanXuat] FOREIGN KEY([MaNVSX])
REFERENCES [dbo].[NhanVienSanXuat] ([MaNhanVien])
GO
ALTER TABLE [dbo].[KhenThuongKyLuat] CHECK CONSTRAINT [FK_KhenThuongKyLuat_NhanVienSanXuat]
GO
ALTER TABLE [dbo].[NghiPhep]  WITH CHECK ADD  CONSTRAINT [FK_NghiPhep_NhanVienHanhChinh] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVienHanhChinh] ([MaNhanVien])
GO
ALTER TABLE [dbo].[NghiPhep] CHECK CONSTRAINT [FK_NghiPhep_NhanVienHanhChinh]
GO
ALTER TABLE [dbo].[NhanVienSanXuat]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienSanXuat_ToSanXuat] FOREIGN KEY([MaTo])
REFERENCES [dbo].[ToSanXuat] ([MaTo])
GO
ALTER TABLE [dbo].[NhanVienSanXuat] CHECK CONSTRAINT [FK_NhanVienSanXuat_ToSanXuat]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVienSanXuat] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVienSanXuat] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVienSanXuat]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_QuyTrinh] FOREIGN KEY([MaQuyTrinh])
REFERENCES [dbo].[QuyTrinh] ([MaQuyTrinh])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_QuyTrinh]
GO
ALTER TABLE [dbo].[PhongBan]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan_NhanVienHanhChinh] FOREIGN KEY([MaTruongPhong])
REFERENCES [dbo].[NhanVienHanhChinh] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhongBan] CHECK CONSTRAINT [FK_PhongBan_NhanVienHanhChinh]
GO
ALTER TABLE [dbo].[QuyTrinh]  WITH CHECK ADD  CONSTRAINT [FK_QuyTrinh_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[QuyTrinh] CHECK CONSTRAINT [FK_QuyTrinh_SanPham]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVienHanhChinh] FOREIGN KEY([MaNVHC])
REFERENCES [dbo].[NhanVienHanhChinh] ([MaNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVienHanhChinh]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_NhanVienSanXuat] FOREIGN KEY([MaNVSX])
REFERENCES [dbo].[NhanVienSanXuat] ([MaNhanVien])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_NhanVienSanXuat]
GO
ALTER TABLE [dbo].[ToSanXuat]  WITH CHECK ADD  CONSTRAINT [FK_ToSanXuat_PhanXuong] FOREIGN KEY([MaPhanXuong])
REFERENCES [dbo].[PhanXuong] ([MaPhanXuong])
GO
ALTER TABLE [dbo].[ToSanXuat] CHECK CONSTRAINT [FK_ToSanXuat_PhanXuong]
GO
USE [master]
GO
ALTER DATABASE [PayrollManagementSystem2] SET  READ_WRITE 
GO
