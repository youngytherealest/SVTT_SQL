USE [master]
GO
/****** Object:  Database [SVTT]    Script Date: 14/01/2024 6:55:26 CH ******/
CREATE DATABASE [SVTT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SVTT', FILENAME = N'/var/opt/mssql/data/SVTT.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SVTT_log', FILENAME = N'/var/opt/mssql/data/SVTT_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SVTT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SVTT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SVTT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SVTT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SVTT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SVTT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SVTT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SVTT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SVTT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SVTT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SVTT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SVTT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SVTT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SVTT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SVTT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SVTT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SVTT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SVTT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SVTT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SVTT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SVTT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SVTT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SVTT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SVTT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SVTT] SET RECOVERY FULL 
GO
ALTER DATABASE [SVTT] SET  MULTI_USER 
GO
ALTER DATABASE [SVTT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SVTT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SVTT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SVTT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SVTT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SVTT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SVTT', N'ON'
GO
ALTER DATABASE [SVTT] SET QUERY_STORE = ON
GO
ALTER DATABASE [SVTT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SVTT]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NhomHuongDanID] [int] NULL,
	[TuNgayTuan_1] [date] NOT NULL,
	[DenNgayTuan_1] [date] NOT NULL,
	[CongViecTuan_1] [nvarchar](max) NULL,
	[NhanXetTuan_1] [nvarchar](max) NULL,
	[TuNgayTuan_2] [date] NOT NULL,
	[DenNgayTuan_2] [date] NOT NULL,
	[CongViecTuan_2] [nvarchar](max) NULL,
	[NhanXetTuan_2] [nvarchar](max) NULL,
	[TuNgayTuan_3] [date] NOT NULL,
	[DenNgayTuan_3] [date] NOT NULL,
	[CongViecTuan_3] [nvarchar](max) NULL,
	[NhanXetTuan_3] [nvarchar](max) NULL,
	[TuNgayTuan_4] [date] NOT NULL,
	[DenNgayTuan_4] [date] NOT NULL,
	[CongViecTuan_4] [nvarchar](max) NULL,
	[NhanXetTuan_4] [nvarchar](max) NULL,
	[TuNgayTuan_5] [date] NOT NULL,
	[DenNgayTuan_5] [date] NOT NULL,
	[CongViecTuan_5] [nvarchar](max) NULL,
	[NhanXetTuan_5] [nvarchar](max) NULL,
	[TuNgayTuan_6] [date] NOT NULL,
	[DenNgayTuan_6] [date] NOT NULL,
	[CongViecTuan_6] [nvarchar](max) NULL,
	[NhanXetTuan_6] [nvarchar](max) NULL,
	[TuNgayTuan_7] [date] NOT NULL,
	[DenNgayTuan_7] [date] NOT NULL,
	[CongViecTuan_7] [nvarchar](max) NULL,
	[NhanXetTuan_7] [nvarchar](max) NULL,
	[TuNgayTuan_8] [date] NOT NULL,
	[DenNgayTuan_8] [date] NOT NULL,
	[CongViecTuan_8] [nvarchar](max) NULL,
	[NhanXetTuan_8] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SinhVienID] [int] NOT NULL,
	[NhomHuongDanID] [int] NOT NULL,
	[YThucKyLuat_number] [float] NOT NULL,
	[YThucKyLuat_text] [nvarchar](max) NULL,
	[TuanThuThoiGian_number] [float] NOT NULL,
	[TuanThuThoiGian_text] [nvarchar](max) NULL,
	[KienThuc_number] [float] NOT NULL,
	[KienThuc_text] [nvarchar](max) NULL,
	[KyNangNghe_number] [float] NOT NULL,
	[KyNangNghe_text] [nvarchar](max) NULL,
	[KhaNangDocLap_number] [float] NOT NULL,
	[KhaNangDocLap_text] [nvarchar](max) NULL,
	[KhaNangNhom_number] [float] NOT NULL,
	[KhaNangNhom_text] [nvarchar](max) NULL,
	[KhaNangGiaiQuyetCongViec_number] [float] NOT NULL,
	[KhaNangGiaiQuyetCongViec_text] [nvarchar](max) NULL,
	[DanhGiaChung_number] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeTai]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeTai](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[MoTa] [ntext] NULL,
	[isDeleted] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KyThucTap]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyThucTap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[isDeleted] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nganh]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nganh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[KyHieu] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiHuongDan]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiHuongDan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[SDT] [varchar](11) NOT NULL,
	[Email] [varchar](128) NULL,
	[ChucDanh] [nvarchar](255) NULL,
	[Phong] [nvarchar](255) NOT NULL,
	[Username] [varchar](24) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Zalo] [varchar](11) NULL,
	[Facebook] [varchar](255) NULL,
	[Github] [varchar](255) NULL,
	[Avatar] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomHuongDan]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomHuongDan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NguoiHuongDanID] [int] NULL,
	[KyThucTapID] [int] NULL,
	[DeTaiID] [int] NULL,
	[isDeleted] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MSSV] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](128) NOT NULL,
	[GioiTinh] [int] NULL,
	[SDT] [varchar](11) NOT NULL,
	[Email] [varchar](128) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[MaLop] [nvarchar](max) NULL,
	[Truong] [nvarchar](128) NOT NULL,
	[Nganh] [nvarchar](128) NOT NULL,
	[Khoa] [int] NOT NULL,
	[NhomHuongDan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Truong]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NOT NULL,
	[KyHieu] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Truong__3214EC271B3DE7CD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XaPhuong]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XaPhuong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CongViec]  WITH CHECK ADD FOREIGN KEY([NhomHuongDanID])
REFERENCES [dbo].[NhomHuongDan] ([ID])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_NhomHuongDan1] FOREIGN KEY([NhomHuongDanID])
REFERENCES [dbo].[NhomHuongDan] ([ID])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_NhomHuongDan1]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SinhVien] FOREIGN KEY([SinhVienID])
REFERENCES [dbo].[SinhVien] ([ID])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SinhVien]
GO
ALTER TABLE [dbo].[NhomHuongDan]  WITH CHECK ADD FOREIGN KEY([DeTaiID])
REFERENCES [dbo].[DeTai] ([ID])
GO
ALTER TABLE [dbo].[NhomHuongDan]  WITH CHECK ADD FOREIGN KEY([KyThucTapID])
REFERENCES [dbo].[KyThucTap] ([ID])
GO
ALTER TABLE [dbo].[NhomHuongDan]  WITH CHECK ADD FOREIGN KEY([NguoiHuongDanID])
REFERENCES [dbo].[NguoiHuongDan] ([ID])
GO
ALTER TABLE [dbo].[NhomHuongDan]  WITH CHECK ADD  CONSTRAINT [FK_NhomHuongDan_SinhVien] FOREIGN KEY([NguoiHuongDanID])
REFERENCES [dbo].[SinhVien] ([ID])
GO
ALTER TABLE [dbo].[NhomHuongDan] CHECK CONSTRAINT [FK_NhomHuongDan_SinhVien]
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietDanhGiaSVByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChiTietDanhGiaSVByID]
@ID nvarchar(max)
AS
BEGIN
	SELECT * FROM DanhGia
	INNER JOIN NhomHuongDan
	ON DanhGia.NhomHuongDanID=NhomHuongDan.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID=DeTai.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID=KyThucTap.ID
	WHERE SinhVienID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietDeTaiByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChiTietDeTaiByID]
@ID int
AS
BEGIN
	SELECT * FROM DeTai
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietKyThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChiTietKyThucTapByID]	 
@ID int
AS
BEGIN
	SELECT ID, FORMAT(NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') AS NgayKetThuc, isDeleted
	FROM KyThucTap
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietNhomThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetChiTietNhomThucTapByID]
@ID int
AS
BEGIN
	SELECT NhomHuongDan.*, NguoiHuongDan.HoTen, FORMAT(NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') AS NgayKetThuc, DeTai.Ten, DeTai.MoTa,
		(SELECT COUNT(ID) FROM SinhVien WHERE SinhVien.NhomHuongDan=NhomHuongDan.ID) AS SoLuong, NguoiHuongDan.Username
	FROM NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	WHERE NhomHuongDan.isDeleted!=2 AND NhomHuongDan.ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetCongViecByIDNhom]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCongViecByIDNhom]
@NhomHuongDanID int
AS 
BEGIN
	SELECT  ID,
			FORMAT(TuNgayTuan_1, 'dd/MM/yyyy') AS TuNgayTuan_1, FORMAT(DenNgayTuan_1, 'dd/MM/yyyy') AS DenNgayTuan_1, CongViecTuan_1, NhanXetTuan_1,
			FORMAT(TuNgayTuan_2, 'dd/MM/yyyy') AS TuNgayTuan_2, FORMAT(DenNgayTuan_2, 'dd/MM/yyyy') AS DenNgayTuan_2, CongViecTuan_2, NhanXetTuan_2,
			FORMAT(TuNgayTuan_3, 'dd/MM/yyyy') AS TuNgayTuan_3, FORMAT(DenNgayTuan_3, 'dd/MM/yyyy') AS DenNgayTuan_3, CongViecTuan_3, NhanXetTuan_3,
			FORMAT(TuNgayTuan_4, 'dd/MM/yyyy') AS TuNgayTuan_4, FORMAT(DenNgayTuan_4, 'dd/MM/yyyy') AS DenNgayTuan_4, CongViecTuan_4, NhanXetTuan_4,
			FORMAT(TuNgayTuan_5, 'dd/MM/yyyy') AS TuNgayTuan_5, FORMAT(DenNgayTuan_5, 'dd/MM/yyyy') AS DenNgayTuan_5, CongViecTuan_5, NhanXetTuan_5,
			FORMAT(TuNgayTuan_6, 'dd/MM/yyyy') AS TuNgayTuan_6, FORMAT(DenNgayTuan_6, 'dd/MM/yyyy') AS DenNgayTuan_6, CongViecTuan_6, NhanXetTuan_6,
			FORMAT(TuNgayTuan_7, 'dd/MM/yyyy') AS TuNgayTuan_7, FORMAT(DenNgayTuan_7, 'dd/MM/yyyy') AS DenNgayTuan_7, CongViecTuan_7, NhanXetTuan_7,
			FORMAT(TuNgayTuan_8, 'dd/MM/yyyy') AS TuNgayTuan_8, FORMAT(DenNgayTuan_8, 'dd/MM/yyyy') AS DenNgayTuan_8, CongViecTuan_8, NhanXetTuan_8
	FROM CongViec
	WHERE NhomHuongDanID=@NhomHuongDanID
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSDeTaiTheoThoiHan]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSDeTaiTheoThoiHan]
AS
BEGIN
	SELECT ID, FORMAT(NgayBatDau, 'dd/MM/yyyy') as NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') as NgayKetThuc,
		CASE WHEN NgayKetThuc < GETDATE() THEN 1 ELSE 0 END AS ThoiHan
	FROM KyThucTap 
	WHERE isDeleted!=2
	ORDER BY NgayBatDau DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSNhomChuaCoCongViec]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSNhomChuaCoCongViec]
AS 
BEGIN
	SELECT NhomHuongDan.ID, NhomHuongDan.isDeleted, NguoiHuongDan.HoTen, FORMAT(NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') AS NgayKetThuc, DeTai.Ten, DeTai.MoTa, CongViec.ID AS IDCongViec
	FROM NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	LEFT JOIN CongViec
	ON NhomHuongDan.ID = CongViec.NhomHuongDanID
	WHERE NhomHuongDan.isDeleted!=2
	ORDER BY NgayBatDau DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSNhomDaCoCongViec]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSNhomDaCoCongViec]
AS 
BEGIN
	SELECT NhomHuongDan.ID, NhomHuongDan.isDeleted, NguoiHuongDan.HoTen, FORMAT(NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') AS NgayKetThuc, DeTai.Ten, DeTai.MoTa, CongViec.ID AS IDCongViec
	FROM NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	LEFT JOIN CongViec
	ON NhomHuongDan.ID = CongViec.NhomHuongDanID
	WHERE NhomHuongDan.isDeleted!=2	AND CongViec.ID IS NOT NULL
	ORDER BY NgayBatDau DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSNhomThucTap]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSNhomThucTap]
AS
BEGIN
	SELECT NhomHuongDan.ID, NhomHuongDan.isDeleted, NguoiHuongDan.HoTen, FORMAT(NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, FORMAT(NgayKetThuc, 'dd/MM/yyyy') AS NgayKetThuc, DeTai.Ten, DeTai.MoTa
	FROM NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	WHERE NhomHuongDan.isDeleted!=2
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSSVByNguoiHuongDanID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSSVByNguoiHuongDanID]
@USERNAME varchar(max)
AS 
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.Nganh, Truong.Ten,
	CASE
		WHEN SinhVien.NhomHuongDan IS NULL THEN 0
		ELSE
			CASE
				WHEN SinhVien.ID IN (SELECT DanhGia.SinhVienID FROM DanhGia) THEN 2
				ELSE 1
			END
	END AS TRANGTHAI
	FROM SinhVien
	INNER JOIN NhomHuongDan
	ON SinhVien.NhomHuongDan=NhomHuongDan.ID
	INNER JOIN Truong
	ON SinhVien.Truong=Truong.KyHieu
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	WHERE NguoiHuongDan.Username = @USERNAME
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSSVDanhGiaByNguoiHuongDanUsername]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetDSSVDanhGiaByNguoiHuongDanUsername]
@Username varchar(max),
@KyThucTap int
AS
BEGIN
	SELECT DanhGia.*, SinhVien.HoTen AS SinhVien, SinhVien.MaLop, NguoiHuongDan.HoTen AS NguoiHuongDan,SinhVien.MSSV
	FROM DanhGia
	JOIN SinhVien
	ON DanhGia.SinhVienID=SinhVien.ID
	JOIN NhomHuongDan
	ON SinhVien.NhomHuongDan=NhomHuongDan.ID
	JOIN NguoiHuongDan
	ON NguoiHuongDan.ID=NhomHuongDan.NguoiHuongDanID
	JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID=KyThucTap.ID
	WHERE NguoiHuongDan.Username = @Username AND KyThucTap.ID = @KyThucTap
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSSVDashboard]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSSVDashboard]
AS
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.Nganh, Truong.Ten,
	CASE
		WHEN SinhVien.NhomHuongDan IS NULL THEN 0
		ELSE
			CASE
				WHEN SinhVien.ID IN (SELECT DanhGia.SinhVienID FROM DanhGia) THEN 2
				ELSE 1
			END
	END AS TRANGTHAI
	FROM SinhVien
	LEFT JOIN Truong
	ON SinhVien.Truong = Truong.KyHieu
END
GO
/****** Object:  StoredProcedure [dbo].[GetDSSVSapToiHanBaoCao]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDSSVSapToiHanBaoCao]
AS
BEGIN
	SELECT COUNT(SinhVien.ID) AS SLSV
	FROM SinhVien
	INNER JOIN NhomHuongDan nhd
	ON SinhVien.NhomHuongDan=nhd.ID
	INNER JOIN KyThucTap ktt
	ON nhd.KyThucTapID=ktt.ID
	WHERE DATEDIFF(DAY,  ktt.NgayKetThuc, GETDATE()) < 7;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIDNhomBySVID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIDNhomBySVID]
@ID nvarchar(max)
AS
BEGIN
	SELECT SinhVien.NhomHuongDan
	FROM SinhVien
	WHERE SinhVien.ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetNhomThucTapByUserID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNhomThucTapByUserID]
@ID nvarchar(50)
AS
BEGIN
	SELECT FORMAT(KyThucTap.NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, DeTai.*
	FROM NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NguoiHuongDan.ID = NhomHuongDan.NguoiHuongDanID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	WHERE NguoiHuongDan.Username = @ID
	ORDER BY CAST(KyThucTap.NgayBatDau AS DATE) DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetSoLuongSinhVienDaDanhGia]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSoLuongSinhVienDaDanhGia]
AS
BEGIN
	SELECT COUNT(DanhGia.ID) AS DG
	FROM SinhVien
	LEFT JOIN DanhGia
	ON SinhVien.ID = DanhGia.SinhVienID
END
GO
/****** Object:  StoredProcedure [dbo].[GetSoLuongSinhVienDatKetQua]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSoLuongSinhVienDatKetQua]
AS
BEGIN
	SELECT 
		SUM(CASE WHEN DanhGia.DanhGiaChung_number >= 50 THEN 1 ELSE 0 END) AS DAT,
		SUM(CASE WHEN DanhGia.DanhGiaChung_number < 50 THEN 1 ELSE 0 END) AS KDAT
	FROM SinhVien
	LEFT JOIN DanhGia
	ON SinhVien.ID = DanhGia.SinhVienID
END
GO
/****** Object:  StoredProcedure [dbo].[GetSoLuongSinhVienTheoNganh]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSoLuongSinhVienTheoNganh]
AS
BEGIN
	SELECT Nganh.Ten AS NGANH, COUNT(Nganh.Ten) AS SL
	FROM SinhVien
	LEFT JOIN Nganh
	ON SinhVien.Nganh = Nganh.Ten
	GROUP BY Nganh.Ten
END
GO
/****** Object:  StoredProcedure [dbo].[GetSoLuongSinhVienTheoTruong]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSoLuongSinhVienTheoTruong] AS
BEGIN
    SELECT truong.Ten, COUNT(*) AS SLSV
    FROM sinhvien
    INNER JOIN truong ON sinhvien.truong = truong.KyHieu
    GROUP BY truong.Ten;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetThongTinChiTietSVByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThongTinChiTietSVByID]
@ID int
AS
BEGIN
	SELECT SinhVien.*, DeTai.Ten, KyThucTap.NgayBatDau, NguoiHuongDan.HoTen
	FROM NhomHuongDan
	INNER JOIN SinhVien
	ON NhomHuongDan.ID = SinhVien.NhomHuongDan
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID=KyThucTap.ID
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	WHERE SinhVien.ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetThongTinChiTietSVChuaCoNhomByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThongTinChiTietSVChuaCoNhomByID]
@ID int
AS
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.SDT, SinhVien.Email, SinhVien.DiaChi, SinhVien.MaLop, SinhVien.Khoa, SinhVien.Nganh, Truong.Ten
	FROM SinhVien
	INNER JOIN Truong
	ON SinhVien.Truong = Truong.KyHieu
	
	WHERE SinhVien.ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetThongTinChiTietSVDaCoNhomByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThongTinChiTietSVDaCoNhomByID]
@ID int
AS
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.SDT, SinhVien.Email, SinhVien.DiaChi, SinhVien.MaLop, SinhVien.Khoa, SinhVien.Nganh, Truong.Ten, NguoiHuongDan.HoTen, FORMAT(KyThucTap.NgayBatDau, 'dd/MM/yyyy') AS NgayBatDau, DeTai.Ten
	FROM SinhVien
	INNER JOIN Truong
	ON SinhVien.Truong = Truong.KyHieu
	INNER JOIN NhomHuongDan
	ON NhomHuongDan.ID = SinhVien.NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	WHERE SinhVien.ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetThongTinChiTietSVDaDanhGiaByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetThongTinChiTietSVDaDanhGiaByID]
@ID int
AS
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.SDT, SinhVien.Email, SinhVien.DiaChi, SinhVien.MaLop, SinhVien.Khoa, SinhVien.Nganh, Truong.Ten, NguoiHuongDan.HoTen, FORMAT(KyThucTap.NgayBatDau, 'dd/MM/yyyy'), DeTai.Ten, DanhGia.*
	FROM SinhVien
	INNER JOIN Truong
	ON SinhVien.Truong = Truong.KyHieu
	INNER JOIN NhomHuongDan
	ON NhomHuongDan.ID = SinhVien.NhomHuongDan
	INNER JOIN NguoiHuongDan
	ON NhomHuongDan.NguoiHuongDanID = NguoiHuongDan.ID
	INNER JOIN KyThucTap
	ON NhomHuongDan.KyThucTapID = KyThucTap.ID
	INNER JOIN DeTai
	ON NhomHuongDan.DeTaiID = DeTai.ID
	INNER JOIN DanhGia
	ON SinhVien.ID = DanhGia.SinhVienID
	WHERE SinhVien.ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetTrangThaiSinhVienByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrangThaiSinhVienByID]
@ID int
AS
BEGIN
	SELECT SinhVien.ID, SinhVien.MSSV, SinhVien.HoTen, SinhVien.GioiTinh, SinhVien.Nganh, Truong.Ten,
	CASE
		WHEN SinhVien.NhomHuongDan IS NULL THEN 0
		ELSE
			CASE
				WHEN SinhVien.ID IN (SELECT DanhGia.SinhVienID FROM DanhGia) THEN 2
				ELSE 1
			END
	END AS TRANGTHAI
	FROM SinhVien
	LEFT JOIN Truong
	ON SinhVien.Truong = Truong.KyHieu
	WHERE SinhVien.ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInfo]
	@username varchar(24)
AS
BEGIN
    SELECT HoTen, SDT, Email, ChucDanh, Phong, Zalo, Facebook, Github, Avatar
    FROM NguoiHuongDan
    WHERE Username = @username
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertCongViec]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCongViec]
@NhomHuongDanID int,
@TuNgayTuan_1 date,
@DenNgayTuan_1 date,
@CongViecTuan_1 nvarchar(max),
@TuNgayTuan_2 date,
@DenNgayTuan_2 date,
@CongViecTuan_2 nvarchar(max),
@TuNgayTuan_3 date,
@DenNgayTuan_3 date,
@CongViecTuan_3 nvarchar(max),
@TuNgayTuan_4 date,
@DenNgayTuan_4 date,
@CongViecTuan_4 nvarchar(max),
@TuNgayTuan_5 date,
@DenNgayTuan_5 date,
@CongViecTuan_5 nvarchar(max),
@TuNgayTuan_6 date,
@DenNgayTuan_6 date,
@CongViecTuan_6 nvarchar(max),
@TuNgayTuan_7 date,
@DenNgayTuan_7 date,
@CongViecTuan_7 nvarchar(max),
@TuNgayTuan_8 date,
@DenNgayTuan_8 date,
@CongViecTuan_8 nvarchar(max)
AS 
BEGIN
	INSERT INTO CongViec(NhomHuongDanID, 
						 TuNgayTuan_1, DenNgayTuan_1, CongViecTuan_1,
						 TuNgayTuan_2, DenNgayTuan_2, CongViecTuan_2,
						 TuNgayTuan_3, DenNgayTuan_3, CongViecTuan_3,
						 TuNgayTuan_4, DenNgayTuan_4, CongViecTuan_4,
						 TuNgayTuan_5, DenNgayTuan_5, CongViecTuan_5,
						 TuNgayTuan_6, DenNgayTuan_6, CongViecTuan_6,
						 TuNgayTuan_7, DenNgayTuan_7, CongViecTuan_7,
						 TuNgayTuan_8, DenNgayTuan_8, CongViecTuan_8)
	VALUES (@NhomHuongDanID,
			@TuNgayTuan_1, @DenNgayTuan_1, @CongViecTuan_1, 
			@TuNgayTuan_2, @DenNgayTuan_2, @CongViecTuan_2, 
			@TuNgayTuan_3, @DenNgayTuan_3, @CongViecTuan_3, 
			@TuNgayTuan_4, @DenNgayTuan_4, @CongViecTuan_4, 
			@TuNgayTuan_5, @DenNgayTuan_5, @CongViecTuan_5, 
			@TuNgayTuan_6, @DenNgayTuan_6, @CongViecTuan_6, 
			@TuNgayTuan_7, @DenNgayTuan_7, @CongViecTuan_7, 
			@TuNgayTuan_8, @DenNgayTuan_8, @CongViecTuan_8)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertDeTai]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDeTai]
@Ten nvarchar(max),
@MoTa ntext,
@isDeleted int
AS
BEGIN
	INSERT INTO DeTai(Ten, MoTa, isDeleted)
	VALUES (@Ten, @MoTa, @isDeleted)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertKyThucTap]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertKyThucTap]
@NgayBatDau date,
@NgayKetThuc date,
@isDeleted int
AS
BEGIN
	INSERT INTO KyThucTap(NgayBatDau, NgayKetThuc, isDeleted)
	VALUES (@NgayBatDau, @NgayKetThuc, @isDeleted)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertNhomThucTap]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNhomThucTap]
@NHD int,
@KTT int,
@DT int,
@isDeleted int
AS
BEGIN
	INSERT INTO NhomHuongDan(NguoiHuongDanID, KyThucTapID, DeTaiID, isDeleted)
	VALUES (@NHD, @KTT, @DT, @isDeleted)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSinhVien]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSinhVien]
    @MSSV varchar(10),
    @HoTen nvarchar(128),
    @GioiTinh int,
    @SDT varchar(11),
    @Email varchar(128),
    @DiaChi nvarchar(255),
    @MaLop varchar(10),
    @Truong nvarchar(128),
    @Nganh nvarchar(128),
    @Khoa int
AS
BEGIN
    INSERT INTO SinhVien (MSSV, HoTen, GioiTinh, SDT, Email, DiaChi, MaLop, Truong, Nganh, Khoa)
	OUTPUT INSERTED.ID
    VALUES (@MSSV, @HoTen, @GioiTinh, @SDT, @Email, @DiaChi, @MaLop, @Truong, @Nganh, @Khoa);
END;
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUser]
@username nvarchar(max),
@password nvarchar(max)
AS
BEGIN
	DECLARE @IsValidUser BIT

    SELECT @IsValidUser = CASE
        WHEN EXISTS (
            SELECT 1 FROM NguoiHuongDan
            WHERE Username = @username AND Password = @password
        ) THEN 1
        ELSE 0
    END

    SELECT @IsValidUser AS IsValidUser
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateChiTietDeTaiByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChiTietDeTaiByID]
@ID int,
@Ten nvarchar(max),
@Mota ntext,
@isDeleted int
AS
BEGIN
	UPDATE DeTai
	SET Ten=@Ten, Mota=@Mota, isDeleted=@isDeleted
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateChiTietKyThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChiTietKyThucTapByID]
@ID int,
@NgayBatDau date,
@NgayKetThuc date,
@isDeleted int
AS
BEGIN
	UPDATE KyThucTap
	SET NgayBatDau=@NgayBatDau, NgayKetThuc=@NgayKetThuc, isDeleted=@isDeleted
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateChiTietNhomThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChiTietNhomThucTapByID]
@ID int,
@Ky int,
@Nhd int,
@Detai int,
@isDeleted int
AS
BEGIN
	UPDATE NhomHuongDan
	SET KyThucTapID=@Ky, NguoiHuongDanID=@Nhd, DeTaiID=@Detai, isDeleted=@isDeleted
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCongViec]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCongViec]
@ID int,
@TuNgayTuan_1 date,
@DenNgayTuan_1 date,
@CongViecTuan_1 nvarchar(max),
@NhanXetTuan_1 nvarchar(max),
@TuNgayTuan_2 date,
@DenNgayTuan_2 date,
@CongViecTuan_2 nvarchar(max),
@NhanXetTuan_2 nvarchar(max),
@TuNgayTuan_3 date,
@DenNgayTuan_3 date,
@CongViecTuan_3 nvarchar(max),
@NhanXetTuan_3 nvarchar(max),
@TuNgayTuan_4 date,
@DenNgayTuan_4 date,
@CongViecTuan_4 nvarchar(max),
@NhanXetTuan_4 nvarchar(max),
@TuNgayTuan_5 date,
@DenNgayTuan_5 date,
@CongViecTuan_5 nvarchar(max),
@NhanXetTuan_5 nvarchar(max),
@TuNgayTuan_6 date,
@DenNgayTuan_6 date,
@CongViecTuan_6 nvarchar(max),
@NhanXetTuan_6 nvarchar(max),
@TuNgayTuan_7 date,
@DenNgayTuan_7 date,
@CongViecTuan_7 nvarchar(max),
@NhanXetTuan_7 nvarchar(max),
@TuNgayTuan_8 date,
@DenNgayTuan_8 date,
@CongViecTuan_8 nvarchar(max),
@NhanXetTuan_8 nvarchar(max)
AS 
BEGIN
	UPDATE CongViec
	SET 
			TuNgayTuan_1=@TuNgayTuan_1, DenNgayTuan_1=@DenNgayTuan_1, CongViecTuan_1=@CongViecTuan_1, NhanXetTuan_1=@NhanXetTuan_1,
			TuNgayTuan_2=@TuNgayTuan_2, DenNgayTuan_2=@DenNgayTuan_2, CongViecTuan_2=@CongViecTuan_2, NhanXetTuan_2=@NhanXetTuan_2,
			TuNgayTuan_3=@TuNgayTuan_3, DenNgayTuan_3=@DenNgayTuan_3, CongViecTuan_3=@CongViecTuan_3, NhanXetTuan_3=@NhanXetTuan_3,
			TuNgayTuan_4=@TuNgayTuan_4, DenNgayTuan_4=@DenNgayTuan_4, CongViecTuan_4=@CongViecTuan_4, NhanXetTuan_4=@NhanXetTuan_4,
			TuNgayTuan_5=@TuNgayTuan_5, DenNgayTuan_5=@DenNgayTuan_5, CongViecTuan_5=@CongViecTuan_5, NhanXetTuan_5=@NhanXetTuan_5,
			TuNgayTuan_6=@TuNgayTuan_6, DenNgayTuan_6=@DenNgayTuan_6, CongViecTuan_6=@CongViecTuan_6, NhanXetTuan_6=@NhanXetTuan_6,
			TuNgayTuan_7=@TuNgayTuan_7, DenNgayTuan_7=@DenNgayTuan_7, CongViecTuan_7=@CongViecTuan_7, NhanXetTuan_7=@NhanXetTuan_7,
			TuNgayTuan_8=@TuNgayTuan_8, DenNgayTuan_8=@DenNgayTuan_8, CongViecTuan_8=@CongViecTuan_8, NhanXetTuan_8=@NhanXetTuan_8
			
	WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDanhGiaSVByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDanhGiaSVByID]
@SinhVienID nvarchar(10),
@NhomHuongDanID int,
@YThucKyLuat_number float,
@YThucKyLuat_text nvarchar(max),
@TuanThuThoiGian_number float,
@TuanThuThoiGian_text nvarchar(max),
@KienThuc_number float,
@KienThuc_text nvarchar(max),
@KyNangNghe_number float,
@KyNangNghe_text nvarchar(max),
@KhaNangDocLap_number float,
@KhaNangDocLap_text nvarchar(max),
@KhaNangNhom_number float,
@KhaNangNhom_text nvarchar(max),
@KhaNangGiaiQuyetCongViec_number float,
@KhaNangGiaiQuyetCongViec_text nvarchar(max),
@DanhGiaChung_number float
AS
BEGIN
	SET NOCOUNT ON;

	MERGE INTO DanhGia AS target
	USING (
		SELECT 
			@SinhVienID AS SinhVienID,
			@NhomHuongDanID AS NhomHuongDanID,
			@YThucKyLuat_number AS YThucKyLuat_number,
			@YThucKyLuat_text AS YThucKyLuat_text,
			@TuanThuThoiGian_number AS TuanThuThoiGian_number,
			@TuanThuThoiGian_text AS TuanThuThoiGian_text,
			@KienThuc_number AS KienThuc_number,
			@KienThuc_text AS KienThuc_text,
			@KyNangNghe_number AS KyNangNghe_number,
			@KyNangNghe_text AS KyNangNghe_text,
			@KhaNangDocLap_number AS KhaNangDocLap_number,
			@KhaNangDocLap_text AS KhaNangDocLap_text,
			@KhaNangNhom_number AS KhaNangNhom_number,
			@KhaNangNhom_text AS KhaNangNhom_text,
			@KhaNangGiaiQuyetCongViec_number AS KhaNangGiaiQuyetCongViec_number,
			@KhaNangGiaiQuyetCongViec_text AS KhaNangGiaiQuyetCongViec_text,
			@DanhGiaChung_number AS DanhGiaChung_number
		) AS source
	ON target.SinhVienID = source.SinhVienID AND target.NhomHuongDanID = source.NhomHuongDanID
	WHEN MATCHED THEN
		UPDATE SET  target.SinhVienID=source.SinhVienID,
					target.NhomHuongDanID=source.NhomHuongDanID,
					target.YThucKyLuat_number=source.YThucKyLuat_Number, 
					target.YThucKyLuat_text=source.YThucKyLuat_Text,
					target.TuanThuThoiGian_number=source.TuanThuThoiGian_Number,
					target.TuanThuThoiGian_text=source.TuanThuThoiGian_Text,
					target.KienThuc_number=source.KienThuc_Number,
					target.KienThuc_text=source.KienThuc_Text,
					target.KyNangNghe_number=source.KyNangNghe_Number,
					target.KyNangNghe_text=source.KyNangNghe_Text,
					target.KhaNangDocLap_number=source.KhaNangDocLap_Number,
					target.KhaNangDocLap_text=source.KhaNangDocLap_Text,
					target.KhaNangNhom_number=source.KhaNangNhom_Number,
					target.KhaNangNhom_text=source.KhaNangNhom_Text,
					target.KhaNangGiaiQuyetCongViec_number=source.KhaNangGiaiQuyetCongViec_Number,
					target.KhaNangGiaiQuyetCongViec_text=source.KhaNangGiaiQuyetCongViec_Text,
					target.DanhGiaChung_number=source.DanhGiaChung_Number
	WHEN NOT MATCHED THEN
		INSERT (
			SinhVienID,
			NhomHuongDanID,
			YThucKyLuat_number,
			YThucKyLuat_text,
			TuanThuThoiGian_number,
			TuanThuThoiGian_text,
			KienThuc_number,
			KienThuc_text,
			KyNangNghe_number,
			KyNangNghe_text,
			KhaNangDocLap_number,
			KhaNangDocLap_text,
			KhaNangNhom_number,
			KhaNangNhom_text,
			KhaNangGiaiQuyetCongViec_number,
			KhaNangGiaiQuyetCongViec_text,
			DanhGiaChung_number
		)
		VALUES (
			source.SinhVienID,
			source.NhomHuongDanID,
			source.YThucKyLuat_number,
			source.YThucKyLuat_text,
			source.TuanThuThoiGian_number,
			source.TuanThuThoiGian_text,
			source.KienThuc_number,
			source.KienThuc_text,
			source.KyNangNghe_number,
			source.KyNangNghe_text,
			source.KhaNangDocLap_number,
			source.KhaNangDocLap_text,
			source.KhaNangNhom_number,
			source.KhaNangNhom_text,
			source.KhaNangGiaiQuyetCongViec_number,
			source.KhaNangGiaiQuyetCongViec_text,
			source.DanhGiaChung_number
		);
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDanhGiaSVByMSSV]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDanhGiaSVByMSSV]
@MSSV nvarchar(max),
@YThucKyLuat_number float,
@YThucKyLuat_text nvarchar(max),
@TuanThuThoiGian_number float,
@TuanThuThoiGian_text nvarchar(max),
@KienThuc_number float,
@KienThuc_text nvarchar(max),
@KyNangNghe_number float,
@KyNangNghe_text nvarchar(max),
@KhaNangDocLap_number float,
@KhaNangDocLap_text nvarchar(max),
@KhaNangNhom_number float,
@KhaNangNhom_text nvarchar(max),
@KhaNangGiaiQuyetCongViec_number float,
@KhaNangGiaiQuyetCongViec_text nvarchar(max),
@DanhGiaChung_number float
AS
BEGIN
	 DECLARE @SVID INT = (SELECT ID FROM SinhVien WHERE MSSV=@MSSV)
	 DECLARE @NhomID INT = (SELECT NhomHuongDan FROM SinhVien WHERE MSSV=@MSSV)
	 -- Kiểm tra xem có tồn tại hay không
	 IF EXISTS (SELECT 1 FROM DanhGia WHERE SinhVienID = @SVID)
	 BEGIN
		UPDATE DanhGia
		SET SinhVienID=@SVID,
			NhomHuongDanID=@NhomID,
			YThucKyLuat_number=@YThucKyLuat_number,
			YThucKyLuat_text=@YThucKyLuat_text,
			TuanThuThoiGian_number=@TuanThuThoiGian_number,
			TuanThuThoiGian_text=@TuanThuThoiGian_text,
			KienThuc_number=@KienThuc_number,
			KienThuc_text=@KienThuc_text,
			KyNangNghe_number=@KyNangNghe_number,
			KyNangNghe_text=@KyNangNghe_text,
			KhaNangDocLap_number=@KhaNangDocLap_number,
			KhaNangDocLap_text=@KhaNangDocLap_text,
			KhaNangNhom_number=@KhaNangNhom_number,
			KhaNangNhom_text=@KhaNangNhom_text,
			KhaNangGiaiQuyetCongViec_number=@KhaNangGiaiQuyetCongViec_number,
			KhaNangGiaiQuyetCongViec_text=@KhaNangGiaiQuyetCongViec_text,
			DanhGiaChung_number=@DanhGiaChung_number
		WHERE SinhVienID = @SVID
	 END
	 ELSE
	 BEGIN
		INSERT INTO DanhGia(
			SinhVienID,
			NhomHuongDanID,
			YThucKyLuat_number,
			YThucKyLuat_text,
			TuanThuThoiGian_number,
			TuanThuThoiGian_text,
			KienThuc_number,
			KienThuc_text,
			KyNangNghe_number,
			KyNangNghe_text,
			KhaNangDocLap_number,
			KhaNangDocLap_text,
			KhaNangNhom_number,
			KhaNangNhom_text,
			KhaNangGiaiQuyetCongViec_number,
			KhaNangGiaiQuyetCongViec_text,
			DanhGiaChung_number
		)
		VALUES (
			@SVID,
			@NhomID,
			@YThucKyLuat_number,
			@YThucKyLuat_text,
			@TuanThuThoiGian_number,
			@TuanThuThoiGian_text,
			@KienThuc_number,
			@KienThuc_text,
			@KyNangNghe_number,
			@KyNangNghe_text,
			@KhaNangDocLap_number,
			@KhaNangDocLap_text,
			@KhaNangNhom_number,
			@KhaNangNhom_text,
			@KhaNangGiaiQuyetCongViec_number,
			@KhaNangGiaiQuyetCongViec_text,
			@DanhGiaChung_number
		)
	 END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateNhomThucTapBySinhVienID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNhomThucTapBySinhVienID]
@ID_SinhVien int,
@ID_Nhom int
AS
BEGIN
	UPDATE SinhVien
	SET NhomHuongDan=@ID_Nhom
	OUTPUT INSERTED.NhomHuongDan
	WHERE SinhVien.ID=@ID_SinhVien
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateXoaDeTaiByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateXoaDeTaiByID]
@ID int
AS
BEGIN
	UPDATE DeTai
	SET isDeleted=2
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateXoaKyThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateXoaKyThucTapByID]
@ID int
AS
BEGIN
	UPDATE KyThucTap
	SET isDeleted=2
	WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateXoaNhomThucTapByID]    Script Date: 14/01/2024 6:55:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateXoaNhomThucTapByID]
@ID int
AS
BEGIN
	UPDATE NhomHuongDan
	SET isDeleted=2
	WHERE ID = @ID;
END
GO
USE [master]
GO
ALTER DATABASE [SVTT] SET  READ_WRITE 
GO
