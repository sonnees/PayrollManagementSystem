USE [master]
GO
/****** Object:  Database [PayrollManagementSystem]    Script Date: 11/2/2022 7:13:58 PM ******/
CREATE DATABASE [PayrollManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PayrollManagementSystem_Data', FILENAME = N'D:\DataSQL\PayrollManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PayrollManagementSystem_Log', FILENAME = N'D:\DataSQL\PayrollManagementSystem.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PayrollManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PayrollManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PayrollManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PayrollManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PayrollManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PayrollManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PayrollManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [PayrollManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PayrollManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PayrollManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PayrollManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [PayrollManagementSystem]
GO
/****** Object:  Table [dbo].[ChamCongHanhChinh]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[ChamCongSanXuat]    Script Date: 11/2/2022 7:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCongSanXuat](
	[MaChamCong] [char](10) NOT NULL,
	[NgayChamCong] [date] NOT NULL,
	[SoLuongThanhPham] [int] NOT NULL,
	[MaPhanCong] [char](10) NULL,
 CONSTRAINT [PK_ChamCongSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaChamCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhenThuongKyLuat]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[NghiPhep]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[NhanVienHanhChinh]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[NhanVienSanXuat]    Script Date: 11/2/2022 7:13:58 PM ******/
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
 CONSTRAINT [PK_NhanVienSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 11/2/2022 7:13:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPhanCong] [char](10) NOT NULL,
	[MaQuyTrinh] [char](7) NULL,
	[MaNhanVien] [char](9) NOT NULL,
	[NgayThamGia] [date] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaPhanCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanXuong]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[PhongBan]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[QuyTrinh]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  Table [dbo].[ToSanXuat]    Script Date: 11/2/2022 7:13:58 PM ******/
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
/****** Object:  View [dbo].[VIEW_CHAMCONGHANHCHINH]    Script Date: 11/2/2022 7:13:58 PM ******/
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
INSERT [dbo].[ChamCongHanhChinh] ([MaNhanVien], [NgayChamCong], [CheckInSang], [CheckOutSang], [CheckInChieu], [CheckOutChieu]) VALUES (N'NVHC00081', CAST(N'2022-10-30' AS Date), CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'13:30:00' AS Time), CAST(N'17:30:00' AS Time))
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
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (N'CCSX001   ', CAST(N'2022-07-20' AS Date), 200, NULL)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (N'CCSX002   ', CAST(N'2022-08-12' AS Date), 250, NULL)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (N'CCSX003   ', CAST(N'2022-08-23' AS Date), 300, NULL)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (N'CCSX004   ', CAST(N'2022-09-14' AS Date), 350, NULL)
INSERT [dbo].[ChamCongSanXuat] ([MaChamCong], [NgayChamCong], [SoLuongThanhPham], [MaPhanCong]) VALUES (N'CCSX005   ', CAST(N'2022-09-23' AS Date), 300, NULL)
GO
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL001   ', N'Làm việc tăng ca', CAST(N'2022-08-22' AS Date), 500000, N'NVSX00001', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL002   ', N'Làm việc không đạt chỉ tiêu', CAST(N'2022-08-28' AS Date), -200000, N'NVSX00023', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL003   ', N'Làm việc vượt chỉ tiêu', CAST(N'2022-08-29' AS Date), 200000, N'NVSX00014', NULL)
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL004   ', N'nghỉ làm không có lý do', CAST(N'2022-09-10' AS Date), -250000, NULL, N'NVHC00083')
INSERT [dbo].[KhenThuongKyLuat] ([MaKT_KL], [LyDo], [NgayApDung], [SoTien], [MaNVSX], [MaNVHC]) VALUES (N'KTKL005   ', N'Xây dựng kế hoạch tốt', CAST(N'2022-09-20' AS Date), 500000, NULL, N'NVHC00088')
GO
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP001     ', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-20' AS Date), N'Nhập viện vì tăng ca quá nhiều', 1300000, N'NVHC00082')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP002     ', CAST(N'2022-06-16' AS Date), CAST(N'2022-06-18' AS Date), N'Công việc gia đình', 0, N'NVHC00087')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP003     ', CAST(N'2022-07-17' AS Date), CAST(N'2022-07-19' AS Date), N'Đi khám bệnh', 0, N'NVHC00091')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP004     ', CAST(N'2022-08-18' AS Date), CAST(N'2022-08-20' AS Date), N'Đi công tác', 1000000, N'NVHC00085')
INSERT [dbo].[NghiPhep] ([MaNghiPhep], [NgayNghi], [NghiDen], [LyDo], [HuongLuong], [MaNhanVien]) VALUES (N'NP005     ', CAST(N'2022-09-19' AS Date), CAST(N'2022-09-21' AS Date), N'Đám cưới', 500000, N'NVHC00096')
GO
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00081', N'Lê Văn Lượng', 1, CAST(N'1998-04-12' AS Date), N'Lý Thường Kiệt Gò Vấp', N'0365896541', N'Agribank  ', N'012305062010        ', N'Lê Văn Lượng                                      ', 30000000, N'Trưởng Phòng', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00082', N'Lê Thanh Sĩ', 1, CAST(N'1999-03-22' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897256', N'Agribank  ', N'012305459010        ', N'Lê Thanh Sĩ                                       ', 20000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00083', N'Trần Văn Công', 1, CAST(N'1998-05-12' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897257 ', N'Agribank  ', N'012305459010        ', N'Trần Văn Công                                     ', 12000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00084', N'Lý Công Uẩng', 1, CAST(N'1992-04-24' AS Date), N'Lê Đức Thọ, Gò Vấp, HCM', N'354897258 ', N'Agribank  ', N'012305459010        ', N'Lý Công Uẩng                                      ', 12000000, N'Nhân Viên', N'PB01')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00085', N'Lê Thanh Chung', 1, CAST(N'1993-05-25' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897259 ', N'MB Bank   ', N'012305459010        ', N'Lê Thanh Chung                                    ', 20000000, N'Trưởng Phòng', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00086', N'Phạm Thái Sư', 1, CAST(N'1994-06-26' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897260 ', N'MB Bank   ', N'012305459010        ', N'Phạm Thái Sư                                      ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00087', N'Nguyễn Thị Kim Liên', 1, CAST(N'1995-03-27' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897261 ', N'MB Bank   ', N'012305459010        ', N'Nguyễn Thị Kim Liên                               ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00088', N'Tống Gia Hào', 1, CAST(N'1994-04-28' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897262 ', N'MB Bank   ', N'012305459010        ', N'Tống Gia Hào                                      ', 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00089', N'Nguyễn Thanh Liên', 0, CAST(N'1993-07-29' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897263 ', N'BIDV      ', N'012305459010        ', N'Nguyễn Thanh Liên                                 ', 20000000, N'Trưởng Phòng', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00090', N'Phạm Thúy Thẩm', 0, CAST(N'1999-03-25' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897264 ', N'BIDV      ', N'012305459010        ', N'Phạm Thúy Thẩm                                    ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00091', N'Trịnh Thị Thanh Tuyền', 0, CAST(N'1999-06-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897265 ', N'BIDV      ', N'012305459010        ', N'Trịnh Thị Thanh Tuyền                             ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00092', N'Võ Tấn Đạt', 1, CAST(N'1997-04-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897266 ', N'BIDV      ', N'012305459010        ', N'Võ Tấn Đạt                                        ', 12000000, N'Nhân Viên', N'PB03')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00093', N'Trần Thanh Tính', 1, CAST(N'1997-04-20' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897267 ', N'VPBank    ', N'012305459010        ', N'Trần Thanh Tính                                   ', 20000000, N'Trưởng Phòng', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00094', N'Công Văn Luyện', 1, CAST(N'1995-04-23' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897268 ', N'VPBank    ', N'012305459010        ', N'Công Văn Luyện                                    ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00095', N'Phạm Thái Tuấn', 1, CAST(N'1995-04-10' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897269 ', N'VPBank    ', N'012305459010        ', N'Phạm Thái Tuấn                                    ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00096', N'Nguyễn Thị Tuyết Nhung', 0, CAST(N'1998-04-05' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897270 ', N'VPBank    ', N'012305459010        ', N'Nguyễn Thị Tuyết Nhung                            ', 12000000, N'Nhân Viên', N'PB04')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00097', N'Lý Công Duyệt', 1, CAST(N'1994-04-06' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897271 ', N'ACB       ', N'012305459010        ', N'Lý Công Duyệt                                     ', 20000000, N'Trưởng Phòng', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00098', N'Nguyễn Thị Hồng', 0, CAST(N'1999-04-07' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897272 ', N'ACB       ', N'012305459010        ', N'Nguyễn Thị Hồng                                   ', 12000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00099', N'Nguyễn Thị Thu Thảo', 0, CAST(N'1996-04-08' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897273 ', N'ACB       ', N'012305459010        ', N'Nguyễn Thị Thu Thảo                               ', 12000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00100', N'Lê Thanh Sĩ', 1, CAST(N'1999-03-22' AS Date), N'Lê Đức Thọ Gò Vấp', N'0354897256', NULL, NULL, NULL, 20000000, N'Nhân Viên', N'PB05')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00101', N'Tống Gia Hào', 1, CAST(N'1994-04-28' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897262 ', NULL, NULL, NULL, 12000000, N'Nhân Viên', N'PB02')
INSERT [dbo].[NhanVienHanhChinh] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [LuongTheoChucDanh], [ChucVu], [MaPhongBan]) VALUES (N'NVHC00102', N'Trần Văn Công', 1, CAST(N'1998-05-12' AS Date), N'Lê Đức Thọ Gò Vấp', N'354897257 ', NULL, NULL, NULL, 12000000, N'Nhân Viên', N'PB01')
GO
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00001', N'Bùi Công Minh', 1, CAST(N'1994-03-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924608193 ', N'Agribank  ', N'4901234567890       ', N'Bùi Công Minh                                     ', N'May cúc áo thun', N'PX0101')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00002', N'Nguyễn Thanh Tâm', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'962342550 ', N'Agribank  ', N'12305061997         ', N'Nguyễn Thanh Tâm                                  ', N'May cúc áo thun', N'PX0101')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00003', N'Trần Thanh Công', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'834082001 ', N'Agribank  ', N'12305061998         ', N'Trần Thanh Công                                   ', N'May cúc áo thun', N'PX0101')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00004', N'Trần Thanh Công', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'834082001 ', N'ACB       ', N'12305061999         ', N'Trần Thị Thanh Nhã                                ', N'May cúc áo thun', N'PX0102')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00005', N'Nguyễn Diệp Anh', 0, CAST(N'2001-12-08' AS Date), N'Thường Tín, Hà Nội', N'984476509 ', N'Agribank  ', N'12305062000         ', N'Nguyễn Diệp Anh                                   ', N'May cổ áo thun', N'PX0102')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00006', N'Trần Nam Anh', 1, CAST(N'1999-12-06' AS Date), N'Thanh Xuân, Hà Nội', N'973266558 ', N'BIDV      ', N'12305062001         ', N'Trần Nam Anh                                      ', N'May cổ áo thun', N'PX0102')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00007', N'Hoàng Ngọc Bách', 1, CAST(N'1998-12-05' AS Date), N'Thường Tín, Hà Nội', N'924655434 ', N'MB Bank   ', N'12305062002         ', N'Hoàng Ngọc Bách                                   ', N'May cổ áo thun', N'PX0102')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00008', N'Nguyễn Thị Kim Dung', 0, CAST(N'2000-12-02' AS Date), N'Quận 2, HCM', N'941688538 ', N'MB Bank   ', N'12305062003         ', N'Nguyễn Thị Kim Dung                               ', N'May cổ áo thun', N'PX0102')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00009', N'Phạm Hồng Đăng', 1, CAST(N'1990-11-04' AS Date), N'Thanh Xuân, Hà Nội', N'162765429 ', N'MB Bank   ', N'12305062004         ', N'Phạm Hồng Đăng                                    ', N'May tay áo thun', N'PX0103')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00010', N'Vũ Việt Hà', 1, CAST(N'1997-09-11' AS Date), N'Hoàn Kiếm, Hà Nội', N'924655435 ', N'SHB       ', N'12305062005         ', N'Vũ Việt Hà                                        ', N'May tay áo thun', N'PX0103')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00011', N'Trần Ngọc Hà', 0, CAST(N'2000-10-06' AS Date), N'Hà Đông, Hà Nội', N'924655437 ', N'Agribank  ', N'12305062006         ', N'Trần Ngọc Hà                                      ', N'May tay áo thun', N'PX0103')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00012', N'Đào Minh Hạnh', 0, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'924655441 ', N'Agribank  ', N'12305062007         ', N'Đào Minh Hạnh                                     ', N'May tay áo thun', N'PX0103')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00013', N'Đỗ Quốc Hưng', 1, CAST(N'1988-04-08' AS Date), N'Cầu Giấy, Hà Nội', N'924655440 ', N'BIDV      ', N'12305062008         ', N'Đỗ Quốc Hưng                                      ', N'May thân áo thun', N'PX0104')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00014', N'Lê Phương Liên', 0, CAST(N'1997-06-07' AS Date), N'Thường Tín, Hà Nội', N'924655436 ', N'Sacombank ', N'12305062009         ', N'Lê Phương Liên                                    ', N'May thân áo thun', N'PX0104')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00015', N'Nguyễn Anh Mai', 0, CAST(N'1988-02-08' AS Date), N'Thường Tín, Hà Nội', N'924655443 ', N'VPBank    ', N'12305062010         ', N'Nguyễn Anh Mai                                    ', N'May thân áo thun', N'PX0104')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00016', N'Nguyễn Hoàng Nam', 1, CAST(N'1988-02-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681193 ', N'Agribank  ', N'12305062011         ', N'Nguyễn Hoàng Nam                                  ', N'May thân áo thun', N'PX0104')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00017', N'Trịnh Hà Phương', 0, CAST(N'1989-08-12' AS Date), N'Thanh Xuân, Hà Nội', N'924655438 ', N'Vietinbank', N'12305062012         ', N'Trịnh Hà Phương                                   ', N'May cúc áo khoác', N'PX0201')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00018', N'Trần Lê Nguyên', 1, CAST(N'1996-08-03' AS Date), N'Đống Đa, Hà Nội', N'924655433 ', N'SHB       ', N'12305062013         ', N'Trần Lê Nguyên                                    ', N'May cúc áo khoác', N'PX0201')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00019', N'Lê Minh Tâm', 1, CAST(N'1999-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924655439 ', N'ACB       ', N'12305062014         ', N'Lê Minh Tâm                                       ', N'May cúc áo khoác', N'PX0201')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00020', N'Trần Diệu Thúy', 0, CAST(N'1988-09-08' AS Date), N'Thủ Đức, HCM', N'924655442 ', N'Agribank  ', N'12305062015         ', N'Trần Diệu Thúy                                    ', N'May cúc áo khoác', N'PX0201')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00021', N'Trịnh Minh Thư', 0, CAST(N'1999-09-06' AS Date), N'Thanh Xuân, Hà Nội', N'366638592 ', N'VPBank    ', N'12305062016         ', N'Trịnh Minh Thư                                    ', N'May cổ áo khoác', N'PX0202')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00022', N'Lê Minh Trí', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'354298675 ', N'Sacombank ', N'12305062017         ', N'Lê Minh Trí                                       ', N'May cổ áo khoác', N'PX0202')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00023', N'Định Quốc Trung', 1, CAST(N'2000-07-06' AS Date), N'Đống Đa, Hà Nội', N'986354872 ', N'VPBank    ', N'12305062018         ', N'Định Quốc Trung                                   ', N'May cổ áo khoác', N'PX0202')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00024', N'Vũ Quang Vinh', 1, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'365928521 ', N'Agribank  ', N'12305062019         ', N'Vũ Quang Vinh                                     ', N'May cổ áo khoác', N'PX0202')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00025', N'Mai Chiến Thắng', 1, CAST(N'1988-04-08' AS Date), N'Thủ Đức, HCM', N'369852475 ', N'Vietinbank', N'12305062020         ', N'Mai Chiến Thắng                                   ', N'May tay áo khoác', N'PX0203')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00026', N'Bùi Công Hải', 1, CAST(N'1995-10-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681101 ', N'Agribank  ', N'12305062021         ', N'Bùi Công Hải                                      ', N'May tay áo khoác', N'PX0203')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00027', N'Nguyễn Thanh Tín', 1, CAST(N'1999-10-06' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681102 ', N'Agribank  ', N'12305062022         ', N'Nguyễn Thanh Tín                                  ', N'May tay áo khoác', N'PX0203')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00028', N'Trần Thanh Thẳng', 0, CAST(N'1989-11-09' AS Date), N'Cầu Giấy, Hà Nội', N'924681103 ', N'Agribank  ', N'12305062023         ', N'Trần Thanh Thẳng                                  ', N'May tay áo khoác', N'PX0203')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00029', N'Trần Thị Thanh Phi', 0, CAST(N'2001-12-08' AS Date), N'Hoàng Mai, Hà Nội', N'924681104 ', N'ACB       ', N'12305062024         ', N'Trần Thị Thanh Phi                                ', N'May thân áo khoác', N'PX0204')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00030', N'Nguyễn Diệp Tú', 1, CAST(N'1999-04-06' AS Date), N'Thường Tín, Hà Nội', N'924681105 ', N'Agribank  ', N'12305062025         ', N'Nguyễn Diệp Tú                                    ', N'May thân áo khoác', N'PX0204')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00031', N'Trần Nam Anh Bắc', 1, CAST(N'1998-03-05' AS Date), N'Thanh Xuân, Hà Nội', N'924681106 ', N'BIDV      ', N'12305062026         ', N'Trần Nam Anh Bắc                                  ', N'May thân áo khoác', N'PX0204')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00032', N'Hoàng Ngọc Thu', 0, CAST(N'2000-06-02' AS Date), N'Thường Tín, Hà Nội', N'924681107 ', N'MB Bank   ', N'12305062027         ', N'Hoàng Ngọc Thu                                    ', N'May thân áo khoác', N'PX0204')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00033', N'Nguyễn Thị Kim Tuyền', 1, CAST(N'1990-06-04' AS Date), N'Quận 2, HCM', N'924681108 ', N'MB Bank   ', N'12305062028         ', N'Nguyễn Thị Kim Tuyền                              ', N'May cúc áo sơ mi', N'PX0301')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00034', N'Phạm Hồng Hồ', 1, CAST(N'1997-05-11' AS Date), N'Thanh Xuân, Hà Nội', N'924681109 ', N'MB Bank   ', N'12305062029         ', N'Phạm Hồng Hồ                                      ', N'May cúc áo sơ mi', N'PX0301')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00035', N'Vũ Việt Thu', 0, CAST(N'2000-07-06' AS Date), N'Hoàn Kiếm, Hà Nội', N'924681110 ', N'SHB       ', N'12305062030         ', N'Vũ Việt Thu                                       ', N'May cúc áo sơ mi', N'PX0301')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00036', N'Trần Ngọc Bích', 0, CAST(N'2000-11-07' AS Date), N'Hà Đông, Hà Nội', N'924681111 ', N'Agribank  ', N'12305062031         ', N'Trần Ngọc Bích                                    ', N'May cúc áo sơ mi', N'PX0301')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00037', N'Đào Minh Hồ', 1, CAST(N'1988-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681112 ', N'Agribank  ', N'12305062032         ', N'Đào Minh Hồ                                       ', N'May cổ áo sơ mi', N'PX0302')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00038', N'Đỗ Quốc Thái', 0, CAST(N'1997-06-07' AS Date), N'Cầu Giấy, Hà Nội', N'924681113 ', N'BIDV      ', N'12305062033         ', N'Đỗ Quốc Thái                                      ', N'May cổ áo sơ mi', N'PX0302')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00039', N'Lê Phương Linh', 0, CAST(N'1988-06-08' AS Date), N'Thường Tín, Hà Nội', N'924681114 ', N'Sacombank ', N'12305062034         ', N'Lê Phương Linh                                    ', N'May cổ áo sơ mi', N'PX0302')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00040', N'Nguyễn Anh Thư', 1, CAST(N'1988-02-08' AS Date), N'Thường Tín, Hà Nội', N'924681115 ', N'VPBank    ', N'12305062035         ', N'Nguyễn Anh Thư                                    ', N'May cổ áo sơ mi', N'PX0302')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00041', N'Nguyễn Hoàng Đông', 0, CAST(N'1989-08-12' AS Date), N'Cầu Giấy, Hà Nội', N'924681116 ', N'Agribank  ', N'12305062036         ', N'Nguyễn Hoàng Đông                                 ', N'May tay áo sơ mi', N'PX0303')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00042', N'Trịnh Hà Phùng', 1, CAST(N'1996-08-03' AS Date), N'Thanh Xuân, Hà Nội', N'924681117 ', N'Vietinbank', N'12305062037         ', N'Trịnh Hà Phùng                                    ', N'May tay áo sơ mi', N'PX0303')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00043', N'Trần Lê Sơn', 1, CAST(N'1999-04-08' AS Date), N'Đống Đa, Hà Nội', N'924681118 ', N'SHB       ', N'12305062038         ', N'Trần Lê Sơn                                       ', N'May tay áo sơ mi', N'PX0303')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00044', N'Lê Minh Tình', 0, CAST(N'1988-09-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681119 ', N'ACB       ', N'12305062039         ', N'Lê Minh Tình                                      ', N'May tay áo sơ mi', N'PX0303')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00045', N'Trần Diệu Thi', 0, CAST(N'1999-09-06' AS Date), N'Thủ Đức, HCM', N'924681120 ', N'Agribank  ', N'12305062040         ', N'Trần Diệu Thi                                     ', N'May thân áo sơ mi', N'PX0304')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00046', N'Trịnh Minh Phong', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681121 ', N'VPBank    ', N'12305062041         ', N'Trịnh Minh Phong                                  ', N'May thân áo sơ mi', N'PX0304')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00047', N'Lê Minh Duẩn', 1, CAST(N'2000-07-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681122 ', N'Sacombank ', N'12305062042         ', N'Lê Minh Duẩn                                      ', N'May thân áo sơ mi', N'PX0304')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00048', N'Định Quốc Bắc', 1, CAST(N'2000-11-07' AS Date), N'Đống Đa, Hà Nội', N'924681123 ', N'VPBank    ', N'12305062043         ', N'Định Quốc Bắc                                     ', N'May thân áo sơ mi', N'PX0304')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00049', N'Vũ Quang Minh', 1, CAST(N'1988-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681124 ', N'Agribank  ', N'12305062044         ', N'Vũ Quang Minh                                     ', N'May đai quần tây', N'PX0401')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00050', N'Đông Thất Bại', 1, CAST(N'1994-03-10' AS Date), N'Thủ Đức, HCM', N'924681125 ', N'Vietinbank', N'12305062045         ', N'Đông Thất Bại                                     ', N'May đai quần tây', N'PX0401')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00051', N'Bùi Công Thu', 1, CAST(N'1994-03-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681126 ', N'Agribank  ', N'12305062046         ', N'Bùi Công Thu                                      ', N'May đai quần tây', N'PX0401')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00052', N'Nguyễn Thanh Tú', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681127 ', N'Agribank  ', N'12305062047         ', N'Nguyễn Thanh Tú                                   ', N'May đai quần tây', N'PX0401')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00053', N'Trần Thanh Tèo', 1, CAST(N'1999-10-06' AS Date), N'Cầu Giấy, Hà Nội', N'924681128 ', N'Agribank  ', N'12305062048         ', N'Trần Thanh Tèo                                    ', N'May khóa quần tây', N'PX0402')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00054', N'Trần Thị Thanh Nhí', 0, CAST(N'1989-11-09' AS Date), N'Hoàng Mai, Hà Nội', N'924681129 ', N'ACB       ', N'12305062049         ', N'Trần Thị Thanh Nhí                                ', N'May khóa quần tây', N'PX0402')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00055', N'Nguyễn Diệp Em', 0, CAST(N'2001-12-08' AS Date), N'Thường Tín, Hà Nội', N'924681130 ', N'Agribank  ', N'12305062050         ', N'Nguyễn Diệp Em                                    ', N'May khóa quần tây', N'PX0402')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00056', N'Trần Nam Em', 1, CAST(N'1999-04-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681131 ', N'BIDV      ', N'12305062051         ', N'Trần Nam Em                                       ', N'May khóa quần tây', N'PX0402')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00057', N'Hoàng Ngọc Thi', 1, CAST(N'1998-03-05' AS Date), N'Thường Tín, Hà Nội', N'924681132 ', N'MB Bank   ', N'12305062052         ', N'Hoàng Ngọc Thi                                    ', N'May túi quần tây', N'PX0403')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00058', N'Nguyễn Thị Kim Nhung', 0, CAST(N'2000-06-02' AS Date), N'Quận 2, HCM', N'924681133 ', N'MB Bank   ', N'12305062053         ', N'Nguyễn Thị Kim Nhung                              ', N'May túi quần tây', N'PX0403')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00059', N'Phạm Hồng Quang', 1, CAST(N'1990-06-04' AS Date), N'Thanh Xuân, Hà Nội', N'924681134 ', N'MB Bank   ', N'12305062054         ', N'Phạm Hồng Quang                                   ', N'May túi quần tây', N'PX0403')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00060', N'Vũ Việt Hồ', 1, CAST(N'1997-05-11' AS Date), N'Hoàn Kiếm, Hà Nội', N'924681135 ', N'SHB       ', N'12305062055         ', N'Vũ Việt Hồ                                        ', N'May túi quần tây', N'PX0403')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00061', N'Trần Ngọc Hồ', 0, CAST(N'2000-07-06' AS Date), N'Hà Đông, Hà Nội', N'924681136 ', N'Agribank  ', N'12305062056         ', N'Trần Ngọc Hồ                                      ', N'May ống quần tây', N'PX0404')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00062', N'Đào Minh Vân', 0, CAST(N'2000-11-07' AS Date), N'Thanh Xuân, Hà Nội', N'924681137 ', N'Agribank  ', N'12305062057         ', N'Đào Minh Vân                                      ', N'May ống quần tây', N'PX0404')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00063', N'Đỗ Quốc Hiền', 1, CAST(N'1988-04-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681138 ', N'BIDV      ', N'12305062058         ', N'Đỗ Quốc Hiền                                      ', N'May ống quần tây', N'PX0404')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00064', N'Lê Phương Bích', 0, CAST(N'1997-06-07' AS Date), N'Thường Tín, Hà Nội', N'924681139 ', N'Sacombank ', N'12305062059         ', N'Lê Phương Bích                                    ', N'May ống quần tây', N'PX0404')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00065', N'Nguyễn Anh Mãi', 0, CAST(N'1988-06-08' AS Date), N'Thường Tín, Hà Nội', N'924681140 ', N'VPBank    ', N'12305062060         ', N'Nguyễn Anh Mãi                                    ', N'May đai quần jean', N'PX0501')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00066', N'Nguyễn Hoàng Bắc', 1, CAST(N'1988-02-08' AS Date), N'Cầu Giấy, Hà Nội', N'924681141 ', N'Agribank  ', N'12305062061         ', N'Nguyễn Hoàng Bắc                                  ', N'May đai quần jean', N'PX0501')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00067', N'Trịnh Hà Pháp', 0, CAST(N'1989-08-12' AS Date), N'Thanh Xuân, Hà Nội', N'924681142 ', N'Vietinbank', N'12305062062         ', N'Trịnh Hà Pháp                                     ', N'May đai quần jean', N'PX0501')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00068', N'Trần Lê Dúng', 1, CAST(N'1996-08-03' AS Date), N'Đống Đa, Hà Nội', N'924681143 ', N'SHB       ', N'12305062063         ', N'Trần Lê Dúng                                      ', N'May đai quần jean', N'PX0501')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00069', N'Lê Minh Tú', 1, CAST(N'1999-04-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681144 ', N'ACB       ', N'12305062064         ', N'Lê Minh Tú                                        ', N'May khóa quần jean', N'PX0502')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00070', N'Trần Diệu Nga', 0, CAST(N'1988-09-08' AS Date), N'Thủ Đức, HCM', N'924681145 ', N'Agribank  ', N'12305062065         ', N'Trần Diệu Nga                                     ', N'May khóa quần jean', N'PX0502')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00071', N'Trịnh Minh My', 0, CAST(N'1999-09-06' AS Date), N'Thanh Xuân, Hà Nội', N'924681146 ', N'VPBank    ', N'12305062066         ', N'Trịnh Minh My                                     ', N'May khóa quần jean', N'PX0502')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00072', N'Lê Minh Tuệ', 1, CAST(N'1988-08-08' AS Date), N'Thanh Xuân, Hà Nội', N'924681147 ', N'Sacombank ', N'12305062067         ', N'Lê Minh Tuệ                                       ', N'May khóa quần jean', N'PX0502')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00073', N'Định Quốc Tây', 1, CAST(N'2000-07-06' AS Date), N'Đống Đa, Hà Nội', N'924681148 ', N'VPBank    ', N'12305062068         ', N'Định Quốc Tây                                     ', N'May túi quần jean', N'PX0503')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00074', N'Vũ Quang Hệ', 1, CAST(N'2000-01-07' AS Date), N'Thanh Xuân, Hà Nội', N'924681149 ', N'Agribank  ', N'12305062069         ', N'Vũ Quang Hệ                                       ', N'May túi quần jean', N'PX0503')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00075', N'Mai Chiến Đấu', 1, CAST(N'1988-04-08' AS Date), N'Thủ Đức, HCM', N'924681150 ', N'Vietinbank', N'12305062070         ', N'Mai Chiến Đấu                                     ', N'May túi quần jean', N'PX0503')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00076', N'Bùi Công Minh', 1, CAST(N'1995-10-10' AS Date), N'18 Lê Đức Thọ P6 Quận Gò Vấp', N'924681151 ', N'Agribank  ', N'12305062071         ', N'Bùi Công Minh                                     ', N'May túi quần jean', N'PX0503')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00077', N'Nguyễn Thanh Tính', 1, CAST(N'1999-10-06' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'924681152 ', N'Agribank  ', N'12305062072         ', N'Nguyễn Thanh Tính                                 ', N'May ống quần jean', N'PX0504')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00078', N'Trần Thanh Hà', 0, CAST(N'1989-11-09' AS Date), N'Cầu Giấy, Hà Nội', N'924681153 ', N'Agribank  ', N'12305062073         ', N'Trần Thanh Hà                                     ', N'May ống quần jean', N'PX0504')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00079', N'Trần Thị Thanh Vũ', 0, CAST(N'2001-12-08' AS Date), N'Hoàng Mai, Hà Nội', N'924681154 ', N'ACB       ', N'12305062074         ', N'Trần Thị Thanh Vũ                                 ', N'May ống quần jean', N'PX0504')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00080', N'Nguyễn Diệp Tâm', 1, CAST(N'1999-01-06' AS Date), N'Thường Tín, Hà Nội', N'924681155 ', N'Agribank  ', N'12305062075         ', N'Nguyễn Diệp Tâm                                   ', N'May ống quần jean', N'PX0504')
INSERT [dbo].[NhanVienSanXuat] ([MaNhanVien], [TenNhanVien], [GioiTinh], [NgaySinh], [DiaChi], [SDT], [TenNganHang], [SoTaiKhoan], [TenNguoiThuHuong], [ChuyenMon], [MaTo]) VALUES (N'NVSX00081', N'Nguyễn Thanh Tâm', 1, CAST(N'1995-10-10' AS Date), N'29 Lê Văn Thọ P6 Quận Gò Vấp', N'962342550 ', NULL, NULL, NULL, N'May cúc áo thun', N'PX0101')
GO
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (N'1         ', N'KS00704', N'NVSX00004', CAST(N'2022-11-02' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (N'2         ', N'QJ01701', N'NVSX00001', CAST(N'2022-11-02' AS Date))
INSERT [dbo].[PhanCong] ([MaPhanCong], [MaQuyTrinh], [MaNhanVien], [NgayThamGia]) VALUES (N'3         ', N'QJ01701', N'NVSX00001', CAST(N'2022-11-03' AS Date))
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
INSERT [dbo].[PhongBan] ([MaPhongBan], [TenPhongBan], [MaTruongPhong]) VALUES (N'PB07', N'pb', NULL)
GO
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'AN00401', N'May cúc áo thun Anime', 20000, N'AN004', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'AN00402', N'May cổ áo thun Anime', 25000, N'AN004', 2)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'AN00403', N'May tay áo thun Anime', 30000, N'AN004', 3)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'AN00404', N'May thân áo thun Anime', 40000, N'AN004', 4)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CG00301', N'May cúc áo thun co giãn', 20000, N'CG003', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CG00302', N'May cổ áo thun co giãn', 25000, N'CG003', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CG00303', N'May tay áo thun co giãn', 30000, N'CG003', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CG00304', N'May thân áo thun co giãn', 40000, N'CG003', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'CK55105', N'Cắt vải', 1000, N'CK551', 1)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'FS00201', N'May cúc áo thun Fashion', 20000, N'FS002', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'FS00202', N'May cổ áo thun Fashion', 25000, N'FS002', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'FS00203', N'May tay áo thun Fashion', 30000, N'FS002', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'FS00204', N'May thân áo thun Fashion', 40000, N'FS002', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KB00801', N'May cúc áo khoác BomBer', 30000, N'KB008', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KB00802', N'May cổ áo khoác BomBer', 35000, N'KB008', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KB00803', N'May tay áo khoác BomBer', 40000, N'KB008', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KB00804', N'May thân áo khoác BomBer', 45000, N'KB008', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KD00501', N'May cúc áo khoác dù', 30000, N'KD005', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KD00502', N'May cổ áo khoác dù', 35000, N'KD005', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KD00503', N'May tay áo khoác dù', 40000, N'KD005', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KD00504', N'May thân áo khoác dù', 45000, N'KD005', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KJ00601', N'May cúc áo khoác jean', 30000, N'KJ006', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KJ00602', N'May cổ áo khoác jean', 35000, N'KJ006', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KJ00603', N'May tay áo khoác jean', 40000, N'KJ006', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KJ00604', N'May thân áo khoác jean', 45000, N'KJ006', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KS00701', N'May cúc áo khoác sơ mi', 30000, N'KS007', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KS00702', N'May cổ áo khoác sơ mi', 35000, N'KS007', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KS00703', N'May tay áo khoác sơ mi', 40000, N'KS007', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'KS00704', N'May thân áo khoác sơ mi', 45000, N'KS007', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'PL00101', N'May cúc áo thun POLO', 20000, N'PL001', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'PL00102', N'May cổ áo thun POLO', 25000, N'PL001', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'PL00103', N'May tay áo thun POLO', 30000, N'PL001', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'PL00104', N'May thân áo thun POLO', 40000, N'PL001', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QB01901', N'May đai quần jean bo người', 25000, N'QB019', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QB01902', N'May khóa quần jean bo người', 30000, N'QB019', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QB01903', N'May túi quần jean bo người', 35000, N'QB019', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QB01904', N'May ống quần jean bo người', 40000, N'QB019', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QG01401', N'May đai quần tây co giãn', 25000, N'QG014', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QG01402', N'May khóa quần tây co giãn', 30000, N'QG014', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QG01403', N'May túi quần tây co giãn', 35000, N'QG014', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QG01404', N'May ống quần tây co giãn', 40000, N'QG014', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QJ01701', N'May đai quần jean màu', 25000, N'QJ017', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QJ01702', N'May khóa quần jean màu', 30000, N'QJ017', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QJ01703', N'May túi quần jean màu', 35000, N'QJ017', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QJ01704', N'May ống quần jean màu', 40000, N'QJ017', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR01801', N'May đai quần jean rách nghệ thuật', 25000, N'QR018', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR01802', N'May khóa quần jean rách nghệ thuật', 30000, N'QR018', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR01803', N'May túi quần jean rách nghệ thuật', 35000, N'QR018', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR01804', N'May ống quần jean rách nghệ thuật', 40000, N'QR018', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR02001', N'May đai quần jean ống rộng', 25000, N'QR020', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR02002', N'May khóa quần jean ống rộng', 30000, N'QR020', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR02003', N'May túi quần jean ống rộng', 35000, N'QR020', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QR02004', N'May ống quần jean ống rộng', 40000, N'QR020', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01501', N'May đai quần tây công sở', 25000, N'QS015', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01502', N'May khóa quần tây công sở', 30000, N'QS015', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01503', N'May túi quần tây công sở', 35000, N'QS015', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01504', N'May ống quần tây công sở', 40000, N'QS015', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01601', N'May đai quần tây sọc', 25000, N'QS016', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01602', N'May khóa quần tây sọc', 30000, N'QS016', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01603', N'May túi quần tây sọc', 35000, N'QS016', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QS01604', N'May ống quần tây sọc', 40000, N'QS016', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QT01301', N'May đai quần tây màu', 25000, N'QT013', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QT01302', N'May khóa quần tây màu', 30000, N'QT013', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QT01303', N'May túi quần tây màu', 35000, N'QT013', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'QT01304', N'May ống quần tây màu', 40000, N'QT013', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SA01201', N'May cúc áo khoác sơ mi nghệ thuật', 25000, N'SA012', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SA01202', N'May cổ áo khoác sơ mi nghệ thuật', 30000, N'SA012', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SA01203', N'May tay áo khoác sơ mi nghệ thuật', 35000, N'SA012', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SA01204', N'May thân áo khoác sơ mi nghệ thuật', 40000, N'SA012', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SD01101', N'May cúc áo sơ mi tay dài', 25000, N'SD011', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SD01102', N'May cổ áo sơ mi tay dài', 30000, N'SD011', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SD01103', N'May tay áo sơ mi tay dài', 35000, N'SD011', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SD01104', N'May thân áo sơ mi tay dài', 40000, N'SD011', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SJ71741', N'may', 9, N'SJ717', 0)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SM00901', N'May cúc áo khoác sơ mi màu', 25000, N'SM009', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SM00902', N'May cổ áo khoác sơ mi màu', 30000, N'SM009', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SM00903', N'May tay áo khoác sơ mi màu', 35000, N'SM009', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SM00904', N'May thân áo khoác sơ mi màu', 40000, N'SM009', NULL)
INSERT [dbo].[QuyTrinh] ([MaQuyTrinh], [TenQuyTrinh], [GiaQuyTrinh], [MaSanPham], [ThuTuSanXuat]) VALUES (N'SN01001', N'May cúc áo khoác sơ mi tay ngắn', 25000, N'QG014', NULL)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'AN004', N'Áo thun Anime', 5000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'CG003', N'Áo thun co giãn', 2000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'CK551', N'Áo dù', 1000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'FS002', N'Áo thun Fashion', 3500)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'KB008', N'Áo khoác BomBer', 5000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'KD005', N'Áo khoác dù', 4000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'KJ006', N'Áo khoác jean', 3500)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'KS007', N'Áo khoác sơ mi', 4500)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'PL001', N'Áo thun POLO', 3000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QB019', N'Quần jean bo người', 7000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QG014', N'Quần tây co giãn', 9000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QJ017', N'Quần jean màu', 7000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QR018', N'Quần jean rách nghệ thuật', 8000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QR020', N'Quần jean ống rộng', 6000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QS015', N'Quần tây công sở', 6000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QS016', N'Quần tây sọc', 4000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'QT013', N'Quần tây màu', 8000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'SA012', N'Áo sơ mi nghệ thuật', 5500)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'SD011', N'Áo sơ mi tay dài', 7000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'SJ717', N'san pham', 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'SM009', N'Áo sơ mi màu', 7000)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [SoLuongSanXuat]) VALUES (N'SS000', N'May Ao SoMi', 1)
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00001  ', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', N'NVSX00001', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00002  ', N'4iA/WPzJJv2MGY1ThUl0miybtk/QKa9j6BsWSMCnzvQ=', N'oh8hhsfslfhnass8ofnh898dshl4f2', N'NVSX00002', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00003  ', N'FVGyilxcN4PV9c+DKCtpLZYL0jJwNUJf03XUMdkC9NU=', N'hsfd2df4hs8lo9l9898944fsofdhd4', N'NVSX00003', NULL)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00081  ', N'DV+OosVBYIuldtxTZjisQq7dgbW1k/uc+Cgg5VmBv50=', N'9nff49dl9s28sao9hjdl8lflsoo9da', NULL, N'NVHC00081')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00082  ', N'aXgj+pk6+xchGbpaQvPAV6c5j81HwP9qk+rfaESuQQ4=', N'fs98ddssd882sdahdld94fsja9h9so', NULL, N'NVHC00082')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00083  ', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', NULL, N'NVHC00083')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau], [GiaTriSalt], [MaNVSX], [MaNVHC]) VALUES (N'NV00084  ', N'V+FJJVVD6UnIU7+iVlRvA9tvnDrZ8rt8lWgNjbVqWtM=', N'9wlad4hsa9l9fflj99f4s9lndll28s', NULL, N'NVHC00084')
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
ALTER DATABASE [PayrollManagementSystem] SET  READ_WRITE 
GO
