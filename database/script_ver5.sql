USE [master]
GO
use master 
 alter database [BookZ] set single_user with rollback immediate

 drop database [BookZ]
/****** Object:  Database [BookZ]    Script Date: 7/20/2022 7:49:43 PM ******/
CREATE DATABASE [BookZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BookZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookZ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookZ] SET RECOVERY FULL 
GO
ALTER DATABASE [BookZ] SET  MULTI_USER 
GO
ALTER DATABASE [BookZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookZ', N'ON'
GO
ALTER DATABASE [BookZ] SET QUERY_STORE = OFF
GO
USE [BookZ]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [char](6) NOT NULL,
	[Title] [nvarchar](120) NOT NULL,
	[Author] [nvarchar](120) NULL,
	[Publisher] [nvarchar](120) NULL,
	[Language] [nvarchar](20) NULL,
	[Cover] [varchar](255) NULL,
	[Description] [ntext] NULL,
	[NoDownload] [int] NOT NULL,
	[FilePDF] [varchar](255) NULL,
	[FileEpub] [varchar](255) NULL,
	[IsAccepted] [bit] NOT NULL,
	[DateUpload] [datetime] NOT NULL,
	[LastDateEdit] [datetime] NULL,
	[MemberUpload] [char](5) NOT NULL,
	[MemberLastEdit] [char](5) NULL,
	[CategoryID] [char](3) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK__Book__3DE0C22741475006] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [char](3) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Download]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Download](
	[DateDownload] [datetime] NOT NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [char](5) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Avatar] [varchar](255) NULL,
	[Role] [varchar](10) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Birthday] [date] NOT NULL,
	[NoUploadedBook] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingID] [char](6) NOT NULL,
	[Star] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[DateRating] [datetime] NOT NULL,
	[LastDateEdit] [datetime] NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__Rating__FCCDF85CD9A845F3] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportBook]    Script Date: 7/20/2022 7:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportBook](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[DateReport] [datetime] NOT NULL,
	[ReportType] [nvarchar](50) NOT NULL,
	[Detail] [nvarchar](1000) NULL,
	[ReportState] [varchar](10) NOT NULL,
	[BookID] [char](6) NOT NULL,
	[MemberID] [char](5) NOT NULL,
 CONSTRAINT [PK_ReportBook] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00000', N'Sapiens: Lược Sử Loài Người', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00000.jpg', N'', 522, N'B00000.pdf', N'assets/epubs/B00000.epub', 1, CAST(N'2021-05-05T00:00:00.000' AS DateTime), CAST(N'2022-07-18T00:00:00.000' AS DateTime), N'M0000', N'M0000', N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00001', N'Tư Duy Phản Biện', N'Zoe McKey', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00001.jpg', N'Tư duy phản biện là chìa khóa để bạn thoát khỏi những lối mòn trong suy nghĩ, giúp bạn giải quyết các vấn đề khó khăn một cách sáng tạo và hiệu quả hơn.', 171, N'B00001.pdf', N'B00001.epub', 1, CAST(N'2021-06-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00002', N'Đắc nhân tâm', N'Dale Carnegie', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00002.jpg', N'Đắc nhân tâm, tên tiếng Anh là How to Win Friends and Influence People là một quyển sách nhằm tự giúp bản thân bán chạy nhất từ trước đến nay. Quyển sách này do Dale Carnegie viết và đã được xuất bản lần đầu vào năm 1936, nó đã được bán 15 triệu bản trên khắp thế giới.', 213, N'B00002.pdf', N'B00002.epub', 1, CAST(N'2021-07-12T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00003', N'Lối Sống Tối Giản Của Người Nhật', N'Sasaki Fumio', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00003.jpg', N'Lối sống tối giản à cách sống cắt giảm vật dụng xuống còn mức tối thiểu. Và cùng với cuộc sống ít đồ đạc, ta có thể để tâm nhiều hơn tới hạnh phúc, đó chính là chủ đề của cuốn sách này.', 324, N'B00003.pdf', N'assets/epubs/B00003.epub', 1, CAST(N'2021-08-25T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00004', N'Muôn Kiếp Nhân Sinh', N'Nguyên Phong', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00004.jpg', N'“Muôn kiếp nhân sinh” mang lại cho bạn đọc kho kiến thức đồ sộ và mới mẻ, những câu chuyện kỳ lạ, những kiến giải uyên bác và tiên đoán bất ngờ về hiện tại và tương lai của con người và thế giới. Thông điệp quan trọng nhất của tác phẩm là nguồn gốc và cách thức vận hành của luật nhân quả và luân hồi của vũ trụ.

“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm về tiền kiếp kỳ lạ từ nhiều kiếp sống trước đây của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá về các quy luật về luật Nhân quả và Nhân hồi của vũ trụ giữa lúc thế giới đang đang gặp nhiều cuộc khủng hoảng, trải qua nhiều biến động hằng ngày.', 103, N'B00004.pdf', N'assets/epubs/B00004.epub', 1, CAST(N'2021-09-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00005', N'Mindset - Tâm Lý Học Thành Công', N'Carol S Dweck', N'NXB Thanh Niên', N'Vietnamese', N'assets/images/bookCover/B00005.jpg', N'Nhà tâm lý học nổi tiếng Carol S. Dweck sau nhiều thập niên nghiên cứu về thành công đã khám phá ra một ý tưởng thực sự mang tính đột phá – sức mạnh tư duy của chúng ta.

Cuốn sách sẽ cho bạn thấy không chỉ khả năng và tài trí mới mang lại thành công cho chúng ta, mà phần lớn do cách tiếp cận mục tiêu bằng lối tư duy nào. Việc tán dương trí thông minh và khả năng của con bạn không hề nuôi dưỡng lòng tự trọng và dẫn đến thành tựu, mà thậm chí còn phương hại đến thành công sau này. Với tư duy đứng đắn, chúng ta có thể tạo động lực cho con cái và giúp chúng phát triển trong trường học, cũng như đạt được mục tiêu của bản thân trong cuộc sống và sự nghiệp. Dweck đã giúp tất cả các bậc cha mẹ, giáo viên, CEO và vận động viên thấy một ý tưởng đơn giản về não bộ có thể tạo ra tình yêu học tập và sự kiên trì – cơ sở cho những thành tựu vĩ đại ở mọi lĩnh vực.', 123, N'B00005.pdf', N'assets/epubs/B00005.epub', 1, CAST(N'2021-10-11T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00006', N'Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội', N'Diệp Hồng Vũ', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00006.jpg', N'Tội phạm, nhất là những vụ án mạng, luôn là một chủ đề thu hút sự quan tâm của công chúng, khơi gợi sự hiếu kỳ của bất cứ ai. Một khi đã bắt đầu theo dõi vụ án, hẳn bạn không thể không quan tâm tới kết cục, đặc biệt là cách thức và động cơ của kẻ sát nhân, từ những vụ án phạm vi hẹp cho đến những vụ án làm rúng động cả thế giới.

Lấy 36 vụ án CÓ THẬT kinh điển nhất trong hồ sơ tội phạm của FBI, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” mang đến cái nhìn toàn cảnh của các chuyên gia về chân dung tâm lý tội phạm. Trả lời cho câu hỏi: Làm thế nào phân tích được tâm lý và hành vi tội phạm, từ đó khôi phục sự thật thông qua các manh mối, từ hiện trường vụ án, thời gian, dấu tích,… để tìm ra kẻ sát nhân thực sự. 

Đằng sau máu và nước mắt là các câu chuyện rợn tóc gáy về tội ác, góc khuất xã hội và những màn đấu trí đầy gay cấn giữa điều tra viên và kẻ phạm tội. Trong số đó có những con quỷ ăn thịt người; những cô gái xinh đẹp nhưng xảo quyệt; và cả cách trả thù đầy man rợ của các nhà khoa học,… Một số đã sa vào lưới pháp luật ngay khi chúng vừa ra tay, nhưng cũng có những kẻ cứ vậy ngủ yên hơn hai mươi năm. 

Bằng giọng văn sắc bén, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” hứa hẹn dẫn dắt người đọc đi qua các cung bậc cảm xúc từ tò mò, ngạc nhiên đến sợ hãi, hoang mang tận cùng. Chúng ta sẽ lần tìm về quá khứ để từng bước gỡ những nút thắt chưa được giải, khiến ta "ngạt thở" đọc tới tận trang cuối cùng. 

Hy vọng cuốn sách sẽ giúp bạn có cái nhìn sâu sắc, rõ ràng hơn về bộ môn tâm lý học tội phạm và có thể rèn luyện thêm sự tư duy, nhạy bén.

Mã hàng	8935325001819
Tên Nhà Cung Cấp	AZ Việt Nam
Tác giả	Diệp Hồng Vũ
Người Dịch	Đỗ Ái Nhi
NXB	NXB Thanh Niên
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	300
Kích Thước Bao Bì	24 x 16 cm
Số trang	280
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
AZ Việt Nam
Đồ Chơi Cho Bé - Giá Cực Tốt
PNJ
Tủ Sách Tâm Lý Kỹ Năng
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tâm lý bán chạy của tháng
Tâm Lý Học - Phác Họa Chân Dung Kẻ Phạm Tội

TÂM LÝ HỌC TỘI PHẠM - PHÁC HỌA CHÂN DUNG KẺ PHẠM TỘI

Tội phạm, nhất là những vụ án mạng, luôn là một chủ đề thu hút sự quan tâm của công chúng, khơi gợi sự hiếu kỳ của bất cứ ai. Một khi đã bắt đầu theo dõi vụ án, hẳn bạn không thể không quan tâm tới kết cục, đặc biệt là cách thức và động cơ của kẻ sát nhân, từ những vụ án phạm vi hẹp cho đến những vụ án làm rúng động cả thế giới.

Lấy 36 vụ án CÓ THẬT kinh điển nhất trong hồ sơ tội phạm của FBI, “Tâm lý học tội phạm - phác họa chân dung kẻ phạm tội” mang đến cái nhìn toàn cảnh của các chuyên gia về chân dung tâm lý tội phạm. Trả lời cho câu hỏi: Làm thế nào phân tích được tâm lý và hành vi tội phạm, từ đó khôi phục sự thật thông qua các manh mối, từ hiện trường vụ án, thời gian, dấu tích,… để tìm ra kẻ sát nhân thực sự. ', 225, N'B00006.pdf', NULL, 1, CAST(N'2021-11-15T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00007', N'Sự Trỗi Dậy Và Suy Tàn Của Đế Chế Thứ Ba - Lịch Sử Đức Quốc Xã', N'William L Shirer', N'NXB Thông tin và Truyền thông', N'Vietnamese', N'assets/images/bookCover/B00007.jpg', N'William Lawrence Shirer (1904 – 1993) là một nhà báo, phóng viên người Mỹ. Tác phẩm “Sự trỗi dậy và suy tàn của Đế chế Thứ Ba“ của ông viết về Đức Quốc xã đã được tìm đọc làm trích dẫn trong rất nhiều các công trình học thuật trong suốt 50 năm.

William L.Shirer đã có cơ hội được quan sát, tường thuật cuộc sống của Đức Quốc xã từ năm 1925 khi làm một phóng viên tác nghiệp ở đây, cùng với đó, ông còn được tiếp cận các nhà lãnh đạo Đức Quốc xã hàng đâu. Sau chiến tranh, ông tham dự các phiên tòa xử tội phạm chiến tranh. Ông đã bỏ ra 5 năm rưỡi để rà soát từng đống tài liệu. Từ những nguồn này và cũng từ thông tin tự thu thập ở Đức và châu Âu trong hơn 4 thập kỷ, ông đã tổng hợp nên một thiên sử liệu của một trong những thời kỳ hãi hùng nhất trong lịch sử nhân loại.', 42, N'B00007.pdf', NULL, 1, CAST(N'2021-12-09T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00008', N'Blockchain - Bản Chất Của Blockchain, Bitcoin, Tiền Điện Tử, Hợp Đồng Thông Minh Và Tương Lai Của Tiền Tệ', N'Mark Gates', N'NXB Lao động', N'Vietnamese', N'assets/images/bookCover/B00008.jpg', N'Blockchain - Bản Chất Của Blockchain, Bitcoin, Tiền Điện Tử, Hợp Đồng Thông Minh Và Tương Lai Của Tiền Tệ

Tiền điện tử, với đại diện tiêu biểu nhất là Bitcoin, đang là mối quan tâm hàng đầu của giới tài chính toàn cầu. Khả năng thanh toán bằng tiền ảo mở ra hàng loạt tiềm năng cho thương mại và thay đổi toàn diện thói quen tiêu dùng của con người. Hạt nhân của công nghệ hứa hẹn rung chuyển thế giới này được gọi là Blockchain.

Blockchain được giới công nghệ đánh giá là phát kiến vĩ đại nhất sau khi mạng Internet ra đời. Ứng dụng phổ biến nhất của nó là các loại tiền điện tử nổi tiếng (Bitcoin, Ethereum, Ripple...) đang làm mưa làm gió trên thị trường. Nhưng nghịch lý là, lại rất ít người nắm được bản chất của tiền điện tử và Blockchain. Rốt cuộc, Blockchain là gì? Nó hoạt động như thế nào? Blockchain thật sự là một đột phá trong công nghệ hay chỉ là một trào lưu nhất thời? Blockchain có liên hệ như thế nào với Bitcoin? Liệu Blockchain có nắm giữ tiềm năng thay đổi thế giới?...

Thực chất, những bài viết cung cấp thông tin về Blockchain và tiền điện tử không thiếu trên các website hay mạng xã hội, nhưng lại chưa đủ tính bao quát và còn khó tiếp thu. Đó là lý do cuốn sách “BLOCKCHAIN: Bản chất của Blockchain, Bitcoin, tiền điện tử, hợp đồng thông minh và tương lai của tiền tệ” của Mark Gates ra đời. Gates cung cấp một bản tóm lược dễ hiểu nhất, cung cấp nền tảng thiết yếu cho những người mới bắt đầu và cả những ai muốn nghiên cứu sâu hơn về công nghệ Blockchain và tiền ảo. Đọc cuốn sách này, bạn sẽ hiểu được Blockchain dưới nhiều khía cạnh, trong đó không chỉ có những lời ngợi khen mà còn không thiếu các chỉ trích, bình luận trái chiều.

Mã hàng	8936066684996
Tên Nhà Cung Cấp	1980 Books
Tác giả	Mark Gates
Người Dịch	Thành Dương
NXB	NXB Lao Động
Năm XB	11-2017
Trọng lượng (gr)	300
Kích Thước Bao Bì	13 x 20.5
Số trang	288
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
1980 Books
PNJ
Sách Kinh Tế
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tài Chính - Ngân Hàng bán chạy của tháng
Blockchain - Bản Chất Của Blockchain, Bitcoin, Tiền Điện Tử, Hợp Đồng Thông Minh Và Tương Lai Của Tiền Tệ

Tiền điện tử, với đại diện tiêu biểu nhất là Bitcoin, đang là mối quan tâm hàng đầu của giới tài chính toàn cầu. Khả năng thanh toán bằng tiền ảo mở ra hàng loạt tiềm năng cho thương mại và thay đổi toàn diện thói quen tiêu dùng của con người. Hạt nhân của công nghệ hứa hẹn rung chuyển thế giới này được gọi là Blockchain.

Blockchain được giới công nghệ đánh giá là phát kiến vĩ đại nhất sau khi mạng Internet ra đời. Ứng dụng phổ biến nhất của nó là các loại tiền điện tử nổi tiếng (Bitcoin, Ethereum, Ripple...) đang làm mưa làm gió trên thị trường. Nhưng nghịch lý là, lại rất ít người nắm được bản chất của tiền điện tử và Blockchain. Rốt cuộc, Blockchain là gì? Nó hoạt động như thế nào? Blockchain thật sự là một đột phá trong công nghệ hay chỉ là một trào lưu nhất thời? Blockchain có liên hệ như thế nào với Bitcoin? Liệu Blockchain có nắm giữ tiềm năng thay đổi thế giới?...', 35, N'B00008.pdf', NULL, 1, CAST(N'2022-01-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00009', N'Lolita', N'Vladimir Nabokov', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00009.jpg', N'“Lolita, ánh sáng của đời tôi, ngọn lửa nơi hạ bộ của tôi. Tội lỗi của tôi, tâm hồn của tôi. Lo-lee-ta: đầu lưỡi lướt xuống ba bước nhỏ dọc vòm miệng, khẽ đập vào răng ba tiếng. Lo. Li. Ta.

 Buổi sáng, em là Lo, ngắn gọn là Lo thôi, đứng thẳng cao một mét bốn mươi sáu, chân đi độc một chiếc tất. Mặc quần thụng trong nhà, em là Lola. Ở trường học, em là Dolly. Trên dòng kẻ bằng những dấu chấm, em là Dolores. Nhưng trong vòng tay tôi, bao giờ em cũng là Lolita.”

***

Lolita, hiện tượng bất thường bậc nhất của văn chương thế kỷ 20, được xuất bản lần đầu vào năm 1955 tại Paris, mặc dù viết bằng tiếng Mĩ. Cũng như mọi tác phẩm kỳ vĩ và có độ lệch chuẩn lớn, như tiểu thuyết của D. H. Lawrence hay của Anthony Burgess, khởi đầu của Lolita không hề suôn sẻ.', 78, N'B00009.pdf', N'assets/epubs/B00009.epub', 1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00010', N'Lược sử thời gian', N'Stephen Hawking', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00010.jpg', N'Tò mò là một trong những phẩm chất bẩm sinh vô cùng quan trọng của chúng ta, và những vấn đề như Bản chất của vũ trụ là gì? Vũ trụ từ đâu ra? Chúng ta đến từ đâu và đóng vai trò gì trong vũ trụ? Có giới hạn cho sự nhận thức của con người không?... là những câu hỏi mà biết bao nhiêu thế hệ con người đã đặt ra dưới dạng này hoặc dạng khác từ khi bắt đầu biết nhận thức và suy ngẫm về thế giới này. Tất cả những vấn đề được nên ra trong tác phẩm Lược sử thời gian như Vũ trụ giãn nở, Lỗ đen, Nguồn gốc và số phận của vũ trụ, Mũi tên thời gian… đều là mong muốn của tác giả để phần nào trả lời được những câu hỏi đó, và hướng tới việc giải thích các giai đoạn lịch sử của toàn bộ vũ trụ.
Bằng ngôn ngữ sáng sủa, lập luận chặt chẽ rất thuyết phục, và sự dí dỏm rất riêng, tác giả Stephen Hawking đặt ra cho mình nhiệm vụ diễn tả những điều phức tạp nhất trong vật lý học một cách dễ hiểu đối với mọi người, không dùng bất kỳ công thức toán học nào, trừ phương trình nổi tiếng của Einstein: E = mc2', 61, N'B00010.pdf', N'B00010.epub', 1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00011', N'Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản', N'William B. Irvine', N'Nhà Xuất Bản Công Thương', N'Vietnamese', N'assets/images/bookCover/B00011.jpg', N'Bạn mong muốn điều gì từ cuộc sống này? Có thể câu trả lời của bạn là muốn có một người bạn đời biết quan tâm, một công việc tốt và một ngôi nhà đẹp, nhưng chúng thực ra chỉ là một số thứ bạn muốn có trong cuộc sống. Khi hỏi bạn mong muốn điều gì từ cuộc sống này, tôi đang hỏi theo nghĩa rộng nhất. Tôi không hỏi về những mục tiêu mà bạn đề ra khi thực hiện các hoạt động hằng ngày, mà tôi đang hỏi về mục tiêu lớn lao trong cuộc sống của bạn. Nói cách khác, trong số những thứ bạn có thể theo đuổi trong cuộc sống, thứ nào bạn tin là có giá trị nhất?

Nhiều người sẽ khó lòng nêu ra được mục tiêu này. Họ biết mình muốn gì trong từng phút một hoặc thậm chí từng thập kỷ một trong suốt cuộc đời mình, nhưng họ chưa bao giờ dành thời gian để suy ngẫm về mục tiêu sống lớn lao của bản thân. Chuyện này có lẽ cũng dễ hiểu. Nền văn hóa của chúng ta vốn không khuyến khích mọi người nghĩ về những điều như vậy, mà chỉ tạo ra hết xao lãng này đến xao lãng khác, để chúng ta không bao giờ phải bận tâm đến chúng. Nhưng một mục tiêu lớn lao trong đời là thành phần đầu tiên của một triết lý sống. Nếu bạn không có một mục tiêu lớn lao trong đời, tức là bạn không có một triết lý sống chặt chẽ.

Nhưng tại sao có một triết lý sống lại quan trọng? Vì nếu không có nó, bạn sẽ có nguy cơ sống lầm lạc – bất kể bạn đã làm gì, bất kể mọi niềm vui thú mà bạn đã thụ hưởng lúc sinh thời, chung quy bạn vẫn sẽ sống một cuộc đời tồi tệ. Nói cách khác, có nguy cơ là lúc bạn đang nằm hấp hối trên giường, bạn sẽ nhìn lại và nhận ra rằng mình đã uổng phí một cơ hội sống. Thay vì dành cuộc đời mình để theo đuổi điều gì đó thực sự đáng giá, bạn đã phung phí nó khi mặc cho bản thân bị xao lãng trước vô số thứ phù phiếm mà cuộc đời đưa đến.

Giờ giả sử bạn đã xác định được mục tiêu lớn lao trong đời mình. Và bạn cũng biết rõ tại sao mục tiêu này lại đáng để phấn đấu. Dù thế, bạn vẫn có nguy cơ sống lầm lạc. Bạn có thể sẽ không đạt được mục tiêu này, nhất là nếu không có một chiến lược hiệu quả. Do đó, thành phần thứ hai của một triết lý sống là một chiến lược để đạt được mục tiêu lớn lao của bạn. Chiến lược này sẽ chỉ rõ cho bạn phải làm những gì trong cuộc sống hằng ngày, từ đó tối đa hóa khả năng đạt được điều mà bạn xem là đáng giá nhất trong cuộc đời mình.

Cuốn sách này dành cho những người đang tìm kiếm một triết lý sống. Trong các trang tiếp theo, tôi sẽ tập trung vào một triết lý mà tôi thấy hữu ích và tôi nghĩ rằng nhiều độc giả cũng sẽ thấy như vậy. Đó là triết lý của trường phái Khắc kỷ cổ đại. Tuy triết lý sống này đã lâu đời nhưng ngày nay nó xứng đáng nhận được sự chú ý của bất kỳ cá nhân nào mong muốn có được một cuộc sống vừa ý nghĩa vừa trọn vẹn – những người mong muốn có được một cuộc sống tốt đẹp.

Nói cách khác, cuốn sách này đưa ra lời khuyên mọi người nên sống như thế nào. Đúng hơn, tôi sẽ là cầu nối mang đến cho bạn lời khuyên của các triết gia Khắc kỷ từ hai ngàn năm trước. Đây là điều mà các triết gia đồng nghiệp của tôi thường miễn cưỡng thực hiện, nhưng nói đi cũng phải nói lại, họ chủ yếu quan tâm đến “tính học thuật” của triết học; tức là họ chuyên nghiên cứu về lý thuyết hoặc lịch sử. Ngược lại, tôi quan tâm đến tính thực tiễn của chủ nghĩa Khắc kỷ: mục tiêu của tôi là áp dụng triết lý này vào cuộc sống của mình và khuyến khích người khác áp dụng nó vào cuộc sống của họ. Tôi cho rằng các triết gia Khắc kỷ cổ đại sẽ khuyến khích cả hai đường hướng này, nhưng họ cũng sẽ khẳng định rằng lý do chính để tìm hiểu về chủ nghĩa Khắc kỷ là nhằm áp dụng nó vào thực tiễn.

Điểm nữa cần hiểu rõ là mặc dù chủ nghĩa Khắc kỷ là một triết lý, nhưng nó cũng bao hàm cả yếu tố tâm lý. Các nhà Khắc kỷ nhận ra rằng một cuộc sống đầy rẫy cảm xúc tiêu cực – bao gồm tức giận, lo lắng, sợ hãi, đau buồn và ghen tị – không phải là một cuộc sống tốt đẹp. Do đó, họ trở thành những nhà quan sát nhạy bén về hoạt động của tâm trí con người và kết quả là trở thành một số nhà tâm lý học uyên bác nhất thời cổ đại. Họ tiếp tục phát triển các kỹ thuật để ngăn không cho các cảm xúc tiêu cực xuất hiện và để dập tắt chúng khi những nỗ lực ngăn chặn thất bại. Ngay cả những độc giả không tin tưởng phương pháp suy diễn của triết học cũng nên quan tâm đến các kỹ thuật này. Suy cho cùng, ai lại không muốn giảm bớt số lượng cảm xúc tiêu cực trong cuộc sống hằng ngày cơ chứ?

Mặc dù tôi đã nghiên cứu triết học trong suốt cả quãng đời trưởng thành, nhưng thực ra mãi cho đến thời gian gần đây, vốn kiến thức của tôi về chủ nghĩa Khắc kỷ vẫn còn nghèo nàn vô cùng. Các giảng viên đại học và cao học chưa từng yêu cầu tôi tìm đọc các triết gia Khắc kỷ, và mặc dù cũng ham đọc sách, nhưng tôi lại không có nhu cầu tìm đọc họ. Nhìn chung, tôi không có nhu cầu chiêm nghiệm về một triết lý sống nào cả. Thay vào đó, như hầu hết mọi người, tôi cảm thấy thoải mái với thứ triết lý sống mặc định: theo đuổi tiền tài, địa vị xã hội và lạc thú. Có thể xem triết lý sống của tôi là một dạng chủ nghĩa khoái lạc khai ngộ.

Thế nhưng, ở độ tuổi ngoài 40, dòng đời bắt đầu đưa đẩy tôi tiếp xúc với chủ nghĩa Khắc kỷ. Đầu tiên phải kể đến cuốn tiểu thuyết A Man in Full của Tom Wolfe xuất bản năm 1998. Trong truyện, một nhân vật tình cờ phát hiện ra triết gia Khắc kỷ Epictetus và sau đó luôn nhiệt tình trích dẫn triết lý sống của ông. Tôi thấy điều này vừa hấp dẫn lại vừa khó hiểu.

Hai năm sau, tôi bắt đầu tiến hành nghiên cứu để viết một cuốn sách về chủ đề ham muốn. Trong quá trình này, tôi xem xét những lời khuyên đã được đưa ra suốt hàng thiên niên kỷ qua về việc làm chủ ham muốn. Tôi bắt đầu tìm hiểu quan điểm của các tôn giáo về ham muốn, bao gồm Cơ Đốc giáo, Ấn Độ giáo, Đạo giáo, Sufi giáo và Phật giáo (nhất là Thiền tông). Tôi tiếp tục xem xét lời khuyên về cách làm chủ ham muốn của các triết gia phương Tây nhưng nhận thấy chỉ có một số ít người đề cập đến vấn đề này, nổi bật là các triết gia Hy Lạp cổ đại thuộc trường phái Epicurean, trường phái Hoài nghi và trường phái Khắc kỷ.

Thực ra, tôi có một động cơ sâu xa khi nghiên cứu về chủ đề ham muốn. Từ lâu tôi đã mến mộ Thiền tông và nghĩ rằng nếu chiêm nghiệm kỹ hơn về nó trong quá trình nghiên cứu, tôi có thể trở thành một Thiền sư thực thụ. Thế nhưng, tôi bất ngờ phát hiện ra một số điểm tương đồng giữa chủ nghĩa Khắc kỷ và Thiền tông. Chẳng hạn, cả hai đều nhấn mạnh tầm quan trọng của việc suy ngẫm về bản chất tạm thời của thế giới xung quanh chúng ta và tầm quan trọng của việc làm chủ ham muốn, trong giới hạn khả năng cho phép. Họ cũng khuyên chúng ta theo đuổi sự bình thản và đưa ra chỉ dẫn để đạt đến và duy trì được trạng thái này. Ngoài ra, tôi cũng nhận thấy chủ nghĩa Khắc kỷ phù hợp với bản tính ưa phân tích mọi sự của tôi hơn là Phật giáo. Kết quả là tôi nghĩ đến chuyện trở thành một người thực hành chủ nghĩa Khắc kỷ, thay vì là một người tu tập Thiền tông.

Trước khi bắt đầu nghiên cứu về ham muốn, đối với tôi, chủ nghĩa Khắc kỷ là một triết lý sống không thiết thực, nhưng khi đọc tác phẩm của các triết gia Khắc kỷ, hóa ra hầu hết mọi điều tôi từng biết về họ đều sai bét. Đầu tiên, tôi biết rằng từ điển định nghĩa một người Khắc kỷ là “người dường như lãnh đạm hoặc không bị ảnh hưởng bởi niềm vui, nỗi buồn, khoái lạc hay đau đớn”. Vì vậy, tôi tưởng họ là những người hay kìm nén cảm xúc. Thế nhưng, tôi khám phá ra rằng mục tiêu của chủ nghĩa Khắc kỷ không phải là loại trừ cảm xúc khỏi cuộc sống mà là loại trừ những cảm xúc tiêu cực.

Khi đọc các tác phẩm của chủ nghĩa Khắc kỷ, tôi bắt gặp những cá nhân vui vẻ và lạc quan về cuộc sống (mặc dù họ luôn dành thời gian để suy nghĩ đến tất cả những viễn cảnh tồi tệ có thể xảy ra với họ), những cá nhân có khả năng tận hưởng trọn vẹn những thú vui của cuộc sống (đồng thời cũng thận trọng để không trở thành nô lệ cho những thú vui đó). Ngạc nhiên làm sao, tôi cũng bắt gặp những cá nhân coi trọng niềm vui; quả thực, theo Seneca, điều mà các nhà Khắc kỷ cố gắng khám phá là “cách tâm trí có thể luôn luôn theo đuổi một lộ trình kiên định và thuận lợi, có khuynh hướng tích cực đối với chính nó, và nhìn nhận được các trạng thái của nó bằng niềm vui”. Ông cũng khẳng định rằng người thực hành các nguyên tắc Khắc kỷ “cần phải luôn, dù anh ta có muốn hay không, cảm thấy hân hoan và có một niềm vui sâu sắc phát xuất từ bên trong, bởi lẽ anh ta thích thú với những nguồn vui của riêng mình, và không hề khao khát niềm vui nào lớn hơn những niềm vui nội tại này”. Tương tự, triết gia Khắc kỷ Musonius Rufus nói rằng nếu sống theo những nguyên tắc Khắc kỷ thì chúng ta tất có được “tâm tính vui vẻ và niềm vui bền vững”.

Thay vì sống thụ động, nhẫn nhục cam chịu sự bất công và bạo hành của thế giới, các nhà Khắc kỷ đã nỗ lực trọn đời để biến thế giới thành một nơi tốt đẹp hơn. Chẳng hạn như Cato Trẻ, triết lý sống Khắc kỷ của Cato không hề ngăn cản ông dũng cảm đấu tranh để khôi phục nền Cộng hòa La Mã. (Tuy không đóng góp tác phẩm nào cho chủ nghĩa Khắc kỷ, nhưng Cato là một nhà Khắc kỷ; kỳ thực, Seneca xem ông là một nhà Khắc kỷ hoàn hảo.) Cũng vậy, Seneca dường như luôn tràn đầy nhiệt huyết: không chỉ là một triết gia, ông còn là một nhà soạn kịch thành công, cố vấn chính trị cho hoàng đế, và có thể xem là một chủ ngân hàng đầu tư vào thời đó. Và Marcus Aurelius, ông không chỉ là một triết gia mà còn là một hoàng đế La Mã – kỳ thực, ông được xem là một trong những hoàng đế La Mã vĩ đại nhất. Khi đọc về các nhà Khắc kỷ, tôi cảm thấy vô cùng thán phục họ. Họ dũng cảm, chừng mực, lý trí và kỷ luật – những phẩm chất mà tôi muốn có. Họ cũng cho rằng điều quan trọng đối với chúng ta là làm trọn bổn phận của mình và giúp đỡ đồng loại – những giá trị mà tôi sẽ chia sẻ.

Trong quá trình nghiên cứu về chủ đề ham muốn, tôi khám phá ra rằng những nhà tư tưởng đều nhất trí một điều, đó là nếu không vượt qua được thói tham lam vô độ, không biết thỏa mãn của mình, chúng ta sẽ khó lòng có được một cuộc sống tốt đẹp và ý nghĩa. Họ cũng nhất trí rằng cách thức hữu hiệu giúp chúng ta chế ngự xu hướng lúc nào cũng muốn có nhiều hơn này là thuyết phục bản thân muốn những thứ mình đã có sẵn. Đây dường như là một tri kiến quan trọng, nhưng nó đặt ra một câu hỏi rằng chính xác thì chúng ta cần phải làm gì để đạt được điều đó. Tôi vui mừng khi phát hiện ra rằng các nhà Khắc kỷ đã có lời giải cho câu hỏi này. Họ đã phát triển một kỹ thuật khá đơn giản, nếu được thực hành, có thể giúp chúng ta hân hoan với con người hiện tại của mình, dù chỉ trong một khoảng thời gian, sống cuộc đời mà chúng ta đang sống, bất kể cuộc đời đó có ra sao đi nữa.

Càng nghiên cứu về chủ nghĩa Khắc kỷ, tôi càng bị cuốn vào triết lý của họ. Nhưng khi nổi hứng chia sẻ với người khác về chủ nghĩa Khắc kỷ, tôi sớm nhận ra rằng không chỉ có mỗi tôi hiểu sai về triết lý này. Bạn bè, người thân và ngay cả đồng nghiệp của tôi ở trường đại học dường như đều cho rằng các nhà Khắc kỷ là những người đặt mục tiêu kìm nén mọi cảm xúc và do đó sống một cuộc đời lãnh đạm và tẻ nhạt. Tôi chợt nhận ra rằng các nhà Khắc kỷ là nạn nhân của những định kiến sai lầm.

Chỉ riêng vấn đề này cũng đã đủ thôi thúc tôi viết một cuốn sách về các nhà Khắc kỷ – một cuốn sách sẽ đính chính lại sự thật – nhưng trong quá trình viết, tôi dần có một động lực thứ hai thậm chí còn mạnh mẽ hơn. Sau khi nghiên cứu chủ nghĩa Khắc kỷ, tôi bắt đầu thử sống theo triết lý này một cách có chừng mực. Đến nay, thử nghiệm đã thành công đến mức tôi nóng lòng muốn loan báo cho cả thế giới những gì mà tôi khám phá được, vì tôi tin rằng mọi người đều có thể thu được lợi ích từ việc nghiên cứu các nhà Khắc kỷ và áp dụng triết lý sống của họ.

Vào thời Hy Lạp và La Mã cổ đại, nếu ai đó muốn trở thành người Khắc kỷ, họ có thể gia nhập một trường học của phái Khắc kỷ. Nhưng điều này hiện không còn khả thi, nếu muốn trở thành người Khắc kỷ, bạn chỉ có thể tham khảo tác phẩm của các nhà Khắc kỷ thời cổ đại, nhưng bạn sẽ phát hiện ra rằng nhiều tác phẩm trong số đó đã bị thất lạc, nhất là tác phẩm của các nhà Khắc kỷ Hy Lạp. Hơn nữa, nếu đọc các tác phẩm còn sót lại, bạn sẽ thấy mặc dù chúng trình bày và phân tích chi tiết về chủ nghĩa Khắc kỷ nhưng lại không đưa ra một giáo án dành cho những người mới học về chủ nghĩa Khắc kỷ. Thách thức mà tôi đối mặt trong quá trình viết cuốn sách này là xây dựng một kế hoạch như vậy từ những manh mối rải rác trong các tác phẩm của chủ nghĩa Khắc kỷ.

Mặc dù phần còn lại của cuốn sách sẽ cung cấp các hướng dẫn chi tiết để thực hành chủ nghĩa Khắc kỷ, nhưng tôi xin phép mô tả sơ bộ ở đây một số điều cần phải làm nếu chúng ta lựa chọn chủ nghĩa Khắc kỷ làm triết lý sống.

Chúng ta sẽ xem xét lại các mục tiêu trong cuộc sống. Đặc biệt, chúng ta sẽ thuộc nằm lòng tuyên ngôn của phái Khắc kỷ, rằng nhiều thứ mà chúng ta khao khát vốn dĩ chẳng đáng để theo đuổi, nhất là danh vọng và của cải. Thay vào đó, chúng ta tập trung theo đuổi sự bình thản và cái mà các nhà Khắc kỷ gọi là đức hạnh. Chúng ta sẽ khám phá ra rằng đức hạnh của phái Khắc kỷ không giống với những gì con người thời nay nghĩ về từ này. Chúng ta cũng sẽ khám phá ra rằng sự bình thản mà các nhà Khắc kỷ truy cầu không phải là trạng thái bình thản có thể đạt được bằng cách uống thuốc an thần; nói cách khác, đó không phải là một trạng thái giống như thây ma. Thay vì vậy, nó là một trạng thái không có các cảm xúc tiêu cực, chẳng hạn như tức giận, đau buồn, lo âu và sợ hãi, mà chỉ có những cảm xúc tích cực – đặc biệt là niềm vui.

Chúng ta sẽ nghiên cứu các kỹ thuật tâm lý đã được các nhà Khắc kỷ phát triển nhằm đạt được và duy trì sự bình thản, đồng thời sử dụng các kỹ thuật này vào cuộc sống hằng ngày. Ví dụ, chúng ta sẽ cẩn thận phân biệt giữa những thứ mình có thể kiểm soát và không thể kiểm soát, nhờ đó không còn bận tâm đến những thứ không thể kiểm soát và tập trung vào những thứ có thể kiểm soát. Chúng ta cũng sẽ nhận ra rằng người khác dễ dàng làm xáo trộn sự bình thản của chúng ta như thế nào, và do đó sẽ thực hành các chiến lược của phái Khắc kỷ để ngăn không cho họ quấy nhiễu chúng ta.

Cuối cùng, chúng ta sẽ quan sát chính cuộc sống của mình một cách sâu sắc hơn. Chúng ta sẽ dõi theo bản thân khi thực hiện các công việc hằng ngày, sau đó suy ngẫm về những điều chúng ta thấy, cố gắng xác định những nguồn cơn gây ra đau khổ trong đời mình và tìm cách ngăn ngừa nỗi đau khổ đó.

Thực hành chủ nghĩa Khắc kỷ rõ ràng sẽ đòi hỏi sự nỗ lực, nhưng điều này đúng với tất cả các triết lý sống chân chính. Thật thế, ngay cả chủ nghĩa “khoái lạc khai ngộ” cũng đòi hỏi sự nỗ lực. Mục tiêu lớn lao trong cuộc sống của những người theo chủ nghĩa khoái lạc khai ngộ là tối đa hóa những lạc thú mà anh ta trải nghiệm trong suốt cuộc đời. Để thực hành triết lý sống này, anh ta sẽ phải dành thời gian tìm tòi, khám phá, xếp hạng các loại lạc thú và rà soát mọi tác dụng phụ không mong muốn có thể phát sinh. Sau đó, người theo chủ nghĩa khoái lạc khai ngộ sẽ đưa ra các chiến lược nhằm tối đa hóa những lạc thú mà anh ta trải nghiệm. (Chủ nghĩa khoái lạc mê muội, mà ở đó người thực hành tìm kiếm sự thỏa mãn ngắn hạn một cách thiếu cân nhắc, theo tôi là một triết lý sống không nhất quán.)

Thực hành chủ nghĩa Khắc kỷ có lẽ sẽ đòi hỏi sự nỗ lực lớn hơn so với thực hành chủ nghĩa khoái lạc khai ngộ, nhưng lại dễ dàng hơn so với thực hành Thiền Tông. Một Phật tử Thiền tông sẽ phải thiền, một sự tu tập vừa mất nhiều thời gian vừa khó về mặt thể chất và tinh thần. Ngược lại, thực hành chủ nghĩa Khắc kỷ không đòi hỏi chúng ta dành riêng một khoảng thời gian để “tập Khắc kỷ”. Mặc dù chúng ta cần phải định kỳ suy ngẫm về cuộc đời mình, nhưng nhìn chung là khoảng thời gian suy ngẫm này có thể chèn vào những thời điểm rảnh rỗi trong ngày, chẳng hạn như khi chúng ta bị kẹt xe hoặc – theo lời khuyên của Seneca – khi chúng ta đang nằm trên giường và chuẩn bị ngủ.

Khi đánh giá các “chi phí” gắn liền với việc thực hành chủ nghĩa Khắc kỷ hoặc bất kỳ triết lý sống nào khác, độc giả cần phải nhận thức rằng việc không có một triết lý sống cũng khiến bạn phải trả giá. Tôi đã chỉ ra một cái giá phải trả: nguy cơ bạn sẽ dành những tháng ngày cuộc đời theo đuổi những thứ không có giá trị và dẫn đến lãng phí cuộc đời mình.

Có thể lúc này, một số độc giả sẽ tự hỏi liệu việc thực hành chủ nghĩa Khắc kỷ có phù hợp với đức tin tôn giáo của họ hay không. Đối với phần lớn các tôn giáo, tôi nghĩ là có. Những người theo đạo Cơ Đốc nói riêng sẽ thấy những giáo lý của chủ nghĩa Khắc kỷ cộng hưởng với các quan điểm tôn giáo của họ. Chẳng hạn, họ cũng mong muốn đạt được sự bình thản giống như các nhà Khắc kỷ, mặc dù những người theo đạo Cơ Đốc có thể gọi nó là sự bình an. Họ sẽ đánh giá cao lời huấn thị “yêu thương nhân loại” của Marcus Aurelius. Và khi những người theo đạo Cơ Đốc bắt gặp luận điểm của Epictetus rằng có những thứ nằm trong tầm kiểm soát và có những thứ không nằm trong tầm kiểm soát của chúng ta, và rằng nếu có nhận thức, chúng ta sẽ tập trung năng lượng vào những thứ nằm trong tầm kiểm soát, họ sẽ được gợi nhắc về Lời cầu nguyện Bình an vốn thường được cho là sáng tác của nhà thần học Reinhold Niebuhr.

Tôi cần phải nói thêm rằng ngay cả những người theo thuyết bất khả tri cũng hoàn toàn có thể đồng thời thực hành chủ nghĩa Khắc kỷ Phần còn lại của cuốn sách này được chia làm bốn phần. Trong phần 1, tôi trình bày sự hình thành của triết học. Mặc dù các triết gia hiện đại thường dành cả đời để tranh luận về các chủ đề trừu tượng, nhưng mục tiêu chính của hầu hết các triết gia cổ đại là giúp người bình thường sống tốt hơn. Như chúng ta sẽ thấy, chủ nghĩa Khắc kỷ là một trong những trường phái triết học cổ đại phổ biến và thành công nhất.

Trong phần 2 và 3, tôi giải thích những gì chúng ta cần phải làm để thực hành chủ nghĩa Khắc kỷ. Mở đầu là các kỹ thuật tâm lý đã được chủ nghĩa Khắc kỷ phát triển để đạt đến và sau đó là duy trì sự bình thản. Kế tiếp, tôi sẽ đưa ra lời khuyên của phái Khắc kỷ về cách đối phó hiệu quả nhất với những căng thẳng trong cuộc sống thường ngày: Chẳng hạn, chúng ta nên phản ứng như thế nào khi bị người khác xúc phạm? Mặc dù nhiều thứ đã thay đổi trong hai thiên niên kỷ qua, nhưng tâm lý con người thì không mấy thay đổi. Do đó, những người đang sống ở thế kỷ hai mốt có thể gặt hái được lợi ích từ lời khuyên vốn được các triết gia như Seneca đưa ra cho người La Mã ở thế kỷ thứ nhất.

Cuối cùng, trong phần 4 của cuốn sách, tôi bảo vệ chủ nghĩa Khắc kỷ trước những lời chỉ trích, cũng như đánh giá lại tâm lý học Khắc kỷ dưới ánh sáng của các phát hiện khoa học hiện đại. Tôi kết thúc cuốn sách bằng cách thuật lại những nhận thức mà mình đã đạt được trong quá trình thực hành chủ nghĩa Khắc kỷ.

Các học giả đồng nghiệp của tôi có thể hứng thú với cuốn sách này; chẳng hạn họ tò mò xem tôi diễn giải những phát biểu của chủ nghĩa Khắc kỷ như thế nào. Tuy nhiên, đối tượng độc giả chính mà tôi hướng đến là những cá nhân bình thường, những người băn khoăn không biết bản thân có đang sống lầm lỗi hay không. Đối tượng này gồm những người dần nhận ra rằng họ thiếu một triết lý sống nhất quán và hậu quả là họ đang lúng túng trong các hoạt động thường ngày của mình: những thành quả họ đạt được ngày hôm nay lại phủi sạch những thành quả đã đạt được ngày hôm trước. Đồng thời, tôi cũng hướng đến những người đã có một triết lý sống nhưng lo ngại rằng triết lý đó phần nào khiếm khuyết.

Trong quá trình viết cuốn sách này, tôi luôn đặt ra trong đầu câu hỏi: Nếu các nhà Khắc kỷ cổ đại đảm nhận trọng trách viết một cuốn sách hướng dẫn cho những người sống ở thế kỷ hai mốt – một cuốn sách chỉ cho chúng ta cách có được một cuộc sống tốt đẹp – thì cuốn sách đó sẽ như thế nào. Các trang tiếp theo là câu trả lời của tôi cho câu hỏi này.” Chia sẻ của tác giả William B.Irvine tới bạn đọc!

MỤC LỤC:

Lời cảm ơn

Giới thiệu

PHẦN MỘT: SỰ HÌNH THÀNH CỦA CHỦ NGHĨA KHẮC KỶ

1. TRIẾT HỌC QUAN TÂM ĐẾN CUỘC SỐNG

2. CÁC NHÀ KHẮC KỶ ĐẦU TIÊN

3. CHỦ NGHĨA KHẮC KỶ LA MÃ

PHẦN HAI: CÁC KỸ THUẬT TÂM LÝ CỦA CHỦ NGHĨA KHẮC KỶ

4. TƯỞNG TƯỢNG TIÊU CỰC 

5. SỰ LƯỠNG PHÂN KIỂM SOÁT

6. THUYẾT VẬN MỆNH

7. TỰ TIẾT CHẾ BẢN THÂN

8. SUY NGẪM

PHẦN BA: LỜI KHUYÊN CỦA CÁC NHÀ KHẮC KỶ 

9. BỔN PHẬN

10. QUAN HỆ XÃ HỘI

11. SỰ XÚC PHẠM

12. SỰ ĐAU BUỒN

13. CƠN GIẬN

14. NHỮNG GIÁ TRỊ CÁ NHÂN

15. NHỮNG GIÁ TRỊ CÁ NHÂN

16. TUỔI GIÀ

17. CHẾT

18. TRỞ THÀNH NGƯỜI KHẮC KỶ  

PHẦN BỐN: CHỦ NGHĨA KHẮC KỶ TRONG CUỘC SỐNG HIỆN ĐẠI 

19. SỰ SUY TÀN CỦA CHỦ NGHĨA KHẮC KỶ

20. XÉT LẠI CHỦ NGHĨA KHẮC KỶ

21. THỰC HÀNH CHỦ NGHĨA KHẮC KỶ

Mã hàng	8935280905597
Tên Nhà Cung Cấp	Thái Hà
Tác giả	William B Irvine
Người Dịch	Nhóm Tâm lý học Tội phạm
NXB	NXB Công Thương
Năm XB	2020
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	400
Kích Thước Bao Bì	14.5 x 20.5 cm
Số trang	370
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Flashsale
Mã Giảm Giá
PNJ
Tủ Sách Tâm Lý Kỹ Năng
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng
Chủ Nghĩa Khắc Kỷ - Phong Cách Sống Bản Lĩnh Và Bình Thản

Bạn mong muốn điều gì từ cuộc sống này? Có thể câu trả lời của bạn là muốn có một người bạn đời biết quan tâm, một công việc tốt và một ngôi nhà đẹp, nhưng chúng thực ra chỉ là một số thứ bạn muốn có trong cuộc sống. Khi hỏi bạn mong muốn điều gì từ cuộc sống này, tôi đang hỏi theo nghĩa rộng nhất. Tôi không hỏi về những mục tiêu mà bạn đề ra khi thực hiện các hoạt động hằng ngày, mà tôi đang hỏi về mục tiêu lớn lao trong cuộc sống của bạn. Nói cách khác, trong số những thứ bạn có thể theo đuổi trong cuộc sống, thứ nào bạn tin là có giá trị nhất?', 66, N'B00011.pdf', N'assets/epubs/B00011.epub', 1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00012', N'Đồi Gió Hú', N'Emily Bronte', N'NXB Văn học', N'Vietnamese', N'assets/images/bookCover/B00012.jpg', N'Emily Jane Bronte (30 tháng 7 năm 1818 - 19 tháng 12 1848) là tiểu thuyết giâ và là nhà thơ người Anh . Trong ba chị em nhà Bronte sống sót cho đến khi trưởng thành , Emily là người thứ hai , cô cả là Charlotte và em út là Anne.

Năm 1847 , Emily xuất bản cuốn tiểu thuyết duy nhất của mình , Đồi gió hu , thành 2 tập trong bộ 3 tập (tập cuối cùng là Agnes Grey do em gái Anne viết). Cấu trúc sáng tạo của tác phẩm làm các nhà phê bình bối rối . Mặc dù có nhiều ý kiến phê bình trái ngược khi mới xuất bản , nhưng sau đó Đồi gió hú trở thành một tác phẩm văn học kinh điển trong văn học Anh . ', 47, N'B00012.pdf', N'assets/epubs/B00012.epub', 1, CAST(N'2022-04-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00013', N'Homo Deus: Lược Sử Tương Lai', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00013.jpg', N'Homo sapiens có phải là một dạng sống siêu đẳng, hay chỉ là một tay đầu gấu địa phương? Làm thế nào con người lại tin rằng họ không chỉ đã kiểm soát thế giới, mà còn mang lại ý nghĩa cho nó? Công nghệ sinh học và trí thông minh nhân tạo đe doạ loài người ra sao? Sinh vật nào có thể kế thừa loài người, và tôn giáo mới nào sẽ được sản sinh?

Với giọng kể cuốn hút và mới lạ, Harari sẽ dần gợi mở và trả lời những câu hỏi trê, nhờ phân tích chi tiết những luận điểm gây nhiều tranh cãi: chủ nghĩa nhân đạo là một dạng tôn giáo, thứ tôn giáo tôn thờ con người thay vì thần thánh; sinh vật là thuật toán… ông vẽ ra một viễn cảnh tương lai khi Sapiens thất thế và Dữ liệu giáo trở thành một hình mẫu. HOMO DEUS còn bàn sâu hơn về các năng lực mà con người đã tự trang bị để sinh tồn và tiến hoá thành một giống loài ngự trị trên trái đất, để rồi chính trong tiến trình hoàn thiện và nâng cấp các năng lực ấy chúng ta sẽ bị truất quyền kiểm soát bởi một sinh vật mới, mang tên Homo Deus.', 61, N'B00013.pdf', N'B00013.epub', 1, CAST(N'2022-04-06T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00014', N'21 Bài Học Cho Thế Kỷ 21', N'Yuval Noah Harari', N'Nhà Xuất Bản Tri Thức', N'Vietnamese', N'assets/images/bookCover/B00014.jpg', N'Những triển vọng đầy hứa hẹn của công nghệ sẽ được đưa ra bàn luận bên cạnh những hiểm họa như “đứt gãy” do công nghệ gây ra, việc kiểm soát thế giới bên trong dẫn tới sự sụp đổ của hệ thần kinh hay “tự do trong khuôn khổ”. Chính trị và tôn giáo có còn bắt tay nhau như trong quá khứ hay sẽ thao túng con người theo những cách riêng rẽ, mới mẻ hơn? Và những vấn đề toàn cầu ấy liên quan mật thiết tới hành vi và đạo đức của từng cá nhân riêng lẻ như thế nào? Xét cho cùng, những thách thức lớn nhất và những lựa chọn quan trọng nhất của ngày nay là gì? Ta cần chú ý đến điều gì? Ta nên dạy con cái ta những gì?', 66, N'B00014.pdf', N'assets/epubs/B00014.epub', 1, CAST(N'2022-04-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00015', N'Cuốn theo chiều gió', N'Margaret Mitchell', N'NXB Văn Học', N'Vietnamese', N'assets/images/bookCover/B00015.jpg', N'Cuốn Theo Chiều Gió là cuốn tiểu thuyết duy nhất của nữ tác giả Margaret Mitchell, ngay từ khi mới ra đời, năm 1936, tác phẩm văn học này đã mau chóng chiếm được tình cảm của người dân Mỹ cũng như chinh phục trái tim của hàng triệu độc giả trên khắp thế giới

Lấy bối cảnh từ cuộc nội chiến vô cùng khốc liệt giữa Bắc và Nam Mỹ, Cuốn Theo Chiều Gió với cốt truyện rõ ràng, logic, dễ hiểu, đã khắc họa một cách tài tình tâm trạng, tính cách và thân phận của nhiều lớp người trong chiến tranh và thời hậu chiến. Nhân vật chính của tiểu thuyết là cô gái Scarlett O''hara cùng với Rhett Butler trở thành cặp nhân vật điển hình, thuộc loại thành công nhất trong văn học Hoa Kỳ.', 56, N'B00015.pdf', N'B00015.epub', 1, CAST(N'2022-04-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00016', N'Adolf Hitler - Chân Dung Một Trùm Phát Xít', N'John Toland', N'NXB Khoa học xã hội', N'Vietnamese', N'assets/images/bookCover/B00016.jpg', N'', 51, N'B00016.pdf', N'B00016.epub', 1, CAST(N'2022-05-04T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00017', N'300 bài code thiếu nhi', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00017.jpg', N'MỨC LƯƠNG TRĂM TRIỆU TRONG TẦM TAY - GIẢI NGAY 300 BÀI CODE.
Cơ hội đổi đời cho mọi người theo ngành IT. Việc nhẹ lương cao, thu nhập trăm triệu.', 1004, N'B00017.pdf', NULL, 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'M0000', N'M0002', N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00018', N'5 Centimet Trên Giây', N'Shinkai Makoto', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00018.jpg', N'', 23, N'B00018.pdf', N'B00018.epub', 1, CAST(N'2022-05-05T00:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00019', N'Computer Organization and Architecture Designing for Performance (9th Edition)', N'William Stallings', N'Pearson', N'English', N'assets/images/bookCover/B00019.jpg', N'', 23, N'assets/pdfs/B00019.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00020', N'Foundations of Computer Science', N'Behrouz Forouzan', N'Cengage', N'English', N'assets/images/bookCover/B00020.jpg', N'', 67, N'B00020.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00021', N'Discrete Mathematics and Its Applications', N'Kenneth Rosen', N'McGraw-Hill Higher Education', N'English', N'assets/images/bookCover/B00021.jpeg', N'', 64, N'B00021.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00022', N'Modern Operating Systems', N'Andrew S. Tanenbaum', N'Pearson Prentice Hall', N'English', N'assets/images/bookCover/B00022.jpg', N'', 86, N'B00022.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00023', N'Giáo trình Triết học Mác - Lênin', N'Bộ Giáo dục và Đào tạo', N'Nhà Xuất Bản Chính Trị Quốc Gia Sự Thật', N'Vietnamese', N'assets/images/bookCover/B00023.jpg', N'', 23, N'B00023.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00024', N'Súng, Vi Trùng Và Thép: Định Mệnh Của Các Xã Hội Loài Người', N'Jared Diamond', N'Nhà Xuất Bản Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00024.jpg', N'“Súng, vi trùng và thép: Định mệnh của các xã hội loài người” là cuốn sách khoa học phổ thông thứ hai và nổi tiếng nhất của Jared Diamond, được xuất bản lần đầu trên thế giới vào năm 1997.

Cuốn sách đã trở thành cuốn sách bán chạy nhất trên thế giới thời điểm đó, được dịch ra 33 thứ tiếng và nhận được nhiều giải thưởng, trong đó có một giải Pulitzer, một giải thưởng Sách Khoa học Aventis và giải thưởng Khoa học Phi Beta Kappa năm 1997. Một bộ phim tài liệu truyền hình nhiều tập dựa trên cuốn sách đã được Hiệp hội Địa lý Quốc gia sản xuất vào năm 2005.', 94, N'B00024.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00025', N'Thuyết Tương Đối Cho Mọi Người', N'Martin Gardner', N'Nhà xuất bản Đại học Quốc gia Hà Nội', N'Vietnamese', N'assets/images/bookCover/B00025.jpg', N'Những kĩ năng từ cứng đến mềm mà lập trình viên nào cũng phải biết để thăng tiến và thành công trong sự nghiệp', 87, N'B00024.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00026', N'Nhập Môn Lập Trình Không Code', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00026.png', N'', 78, N'B00026.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00027', N'Code Dạo Ký Sự – Lập Trình Viên Đâu Phải Chỉ Biết Code', N'Phạm Huy Hoàng', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00027.png', N'', 32, N'B00027.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00028', N'Minna no Nihongo Sơ Cấp 1 – Bản dịch tiếng Việt', N'unknown', N'スリーエーネットワーク – 2008', N'Vietnamese', N'assets/images/bookCover/B00028.jpg', N'', 34, N'B00028.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00029', N'Minna no Nihongo Sơ Cấp 1 – Honsatsu (Sách Giáo Khoa)', N'unknown', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00029.jpg', N'', 25, N'B00029.pdf', NULL, 1, CAST(N'2022-06-05T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00030', N'Nghệ Thuật Sống', N'Epictetus', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00030.jpg', N'', 33, NULL, N'assets/epubs/B00030.epub', 1, CAST(N'2022-07-05T00:00:00.000' AS DateTime), NULL, N'M0003', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00031', N'Người Thông Minh Học Tập Như Thế Nào', N'Ronald Gross', N'unknown', N'Vietnamese', N'assets/images/bookCover/B00031.jpg', N'Cuốn sách này được viết nhằm mục đích rất đơn giản: thay đổi những quan niệm về phương pháp học tập nhằm tạo ra một phong cách học tập nhanh, hiệu quả, toàn diện, có năng suất cao, và thú vị hơn nhiều những gì bạn đã biết.

Hệ thống các phương pháp học tập đỉnh cao được miêu tả ở đây là tập hợp cách thức bạn có thể sử dụng để đạt được những kỹ năng học tập rộng, sâu và phù hợp với cá nhân hơn bất cứ phương pháp nào bạn từng thử nghiệm trong quá trình học tập trước đây.

Phương pháp học tập đỉnh cao là cách thức học tập mới mẻ ngày càng được các nhà giáo dục công nhận là cần thiết cho mọi cá nhân. Đây là một chương trình tự định hướng sự phát triển của mỗi cá nhân. Điều đó nghĩa là nắm bắt những kỹ năng mới để hiểu bản thân mình và thế giới - thứ tài sản đích thực mà có thể bạn chưa bao giờ đánh mất.

Những kỹ năng học tập đầy hiệu quả dựa trên khám phá mới về cách thức hoạt động của não bộ và các phương pháp bạn áp dụng khám phá đó cho phong cách học tập của riêng mình.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 0, N'assets/pdfs/B00031.pdf', NULL, 1, CAST(N'2022-07-18T01:00:00.000' AS DateTime), NULL, N'M0005', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00032', N'Biến Động', N'Jared Diamond', N'Nhà Xuất Bản Dân Trí', N'Vietnamese', N'assets/images/bookCover/B00032.jpg', N'Trong tác phẩm mới nhất vừa ra mắt năm 2019 – Biến động, Jared Diamond kể cho chúng ta câu chuyện các quốc gia đã vượt qua những biến cố lớn và hồi phục thành công như thế nào.

Jared Diamond khảo sát các hình mẫu là bảy quốc gia ở khắp các châu lục, phân tích quá trình họ gặp phải, đối mặt và vượt qua biến động lớn trong quá khứ. Theo Diamond, dù ở cấp độ cá nhân hay quốc gia, thậm chí toàn cầu, cơ chế ứng phó phổ biến và hiệu quả nhất vẫn là thay đổi có chọn lọc.
Kết hợp những kiến thức tuyệt vời về lịch sử, địa lý, kinh tế, nhân chủng học và cả tâm lý, Biến động của Jared Diamond là một cuốn sách mang tính sử thi, cấp tiến và đột phá.

Theo tác giả, học hỏi từ lịch sử luôn cần thiết với bất kỳ đối tượng nào. Liệu lần này, chúng ta có thể rút ra bài học gì từ quá khứ để ứng phó với các biến động ở hiện tại và tương lai?', 0, N'assets/pdfs/B00032.pdf', NULL, 1, CAST(N'2022-07-18T02:00:00.000' AS DateTime), NULL, N'M0005', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00033', N'Tâm Lý Học - Nghệ Thuật Giải Mã Hành Vi', N'Trần Lộ', N'Trần Cẩm Ninh', N'Vietnamese', N'assets/images/bookCover/B00033._SY475_.jpg', N'Cuốn sách Tâm lý học – Nghệ thuật giải mã hành vi của tác giả Trần Lộ sẽ cung cấp cho chúng ta những lý luận uy tín và kỳ diệu của tâm lý học để có thể đọc suy nghĩ của người khác, cũng như phá tan phòng tuyến tâm lý con người. Trên thực tế, một số lượng lớn hành vi và cử chỉ của con người được thực hiện một cách vô thức. Do sự vô thức đó tiệm cận với nơi sâu kín nhất trong tâm trí, nên những hành động bản năng này sẽ thể hiện nội tâm con người một cách rõ ràng nhất. Vì vậy, thông qua hành vi, tính cách, ngôn ngữ cơ thể, sở thích… thậm chí là lời nói dối của đối phương để có thể khai thác “Ma pháp”- suy nghĩ thực sự trong lòng người khác.', 0, N'assets/pdfs/B00033.pdf', NULL, 1, CAST(N'2022-07-18T03:00:00.000' AS DateTime), NULL, N'M0005', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00034', N'Khi Hơi Thở Hóa Thinh Không', N'Paul Kalanithi', N'Nhà xuất bản lao động', N'Vietnamese', N'assets/images/bookCover/B00034.jpg', N'Khi Hơi Thở Hóa Thinh Không là tự truyện của một bác sĩ bị mắc bệnh ung thư phổi. Trong cuốn sách này, tác giả đã chia sẻ những trải nghiệm từ khi mới bắt đầu học ngành y, tiếp xúc với bệnh nhân cho tới khi phát hiện ra mình bị ung thư và phải điều trị lâu dài.

Kalanithi rất yêu thích văn chương nên câu chuyện của anh đã được thuật lại theo một phong cách mượt mà, dung dị và đầy cảm xúc. Độc giả cũng được hiểu thêm về triết lý sống, triết lý nghề y của Kalanithi, thông qua ký ức về những ngày anh còn là sinh viên, rồi thực tập, cho đến khi chính thức hành nghề phẫu thuật thần kinh. “Đối với bệnh nhân và gia đình, phẫu thuật não là sự kiện bi thảm nhất mà họ từng phải đối mặt và nó có tác động như bất kỳ một biến cố lớn lao trong đời. Trong những thời điểm nguy cấp đó, câu hỏi không chỉ đơn thuần là sống hay chết mà còn là cuộc sống nào đáng sống.” – Kalanithi luôn biết cách đưa vào câu chuyện những suy nghĩ sâu sắc và đầy sự đồng cảm như thế.

Bạn bè và gia đình đã dành tặng những lời trìu mến nhất cho con người đáng kính trọng cả về tài năng lẫn nhân cách này. Dù không thể vượt qua cơn bệnh nan y, nhưng thông điệp của tác giả sẽ còn khiến người đọc nhớ mãi.', 0, N'assets/pdfs/B00034.pdf', NULL, 1, CAST(N'2022-07-18T03:00:00.000' AS DateTime), NULL, N'M0005', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00035', N'Nhà Giả Kim', N'Paulo Coelho', N'NXB', N'Vietnamese', N'assets/images/bookCover/B00035.jpg', N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.

Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”', 555, NULL, N'assets/epubs/B00035.epub', 1, CAST(N'2021-07-18T03:00:00.000' AS DateTime), NULL, N'M0005', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00036', N'1Q84', N'Haruki Murakami', N'Nhà Xuất Bản Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00036.jpg', N'Cuốn 1Q84 kể về quá trình một tổ chức cánh tả biến đổi thành một giáo phái của những kẻ điên rồ và những tên sát nhân, ám chỉ giáo phái Aum – giáo phái đã gây nên vụ đầu độc kinh hoàng trong hệ thống xe điện ngầm ở Tokyo năm 1995 khiến 12 người thiệt mạng và hàng trăm người chịu những di chứng nặng nề về thể chất và tinh thần. \n
Khi giải thích ý đồ cuốn tiểu thuyết, Haruki Murakami cho biết ông muốn cảnh báo mọi người về nguy cơ của chủ nghĩa chính thống và khuynh hướng xuất hiện các giáo phái trong bối cảnh khủng hoảng toàn cầu của thế giới hiện đại.', 0, N'assets/pdfs/B00036.pdf', N'assets/epubs/B00036.epub', 1, CAST(N'2022-07-19T03:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00037', N'Truyện Kiều', N'Nguyễn Du', N'Nhà xuất bản trẻ', N'Vietnamese', N'assets/images/bookCover/B00037.jpg', N'Truyện Kiều được viết bằng chữ Nôm dựa theo tác phẩm Kim Vân Kiều truyện của Thanh Tâm Tài Nhân, Trung Quốc. Hiện nay, ở Việt Nam lưu truyền một số dị bản của tác phẩm này.

Truyện Kiều là tiểu thuyết viết bằng thơ lục bát. Truyện phản ánh xã hội đương thời thông qua cuộc đời của nhân vật chính Vương Thuý Kiều. Xuyên suốt tác phẩm là chữ “tâm” theo như Nguyễn Du đã tâm niệm “Linh Sơn chỉ tại nhữ tâm đầu” (nghĩa là “Linh Sơn chỉ ở lòng người thôi”).

Truyện Kiều đã từng được in ngược bởi Nhà xuất bản Thanh Niên để có thể đọc mạch truyện ngược chiều thời gian từ “tái hồi Kim Trọng” trở về đoạn mở đầu truyện lúc hai người còn chưa biết nhau.', 0, N'assets/pdfs/B00037.pdf', NULL, 1, CAST(N'2022-07-19T03:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00038', N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'Rosie Nguyễn', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00038.jpg', N'"Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.

Bạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.

Bạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.

Suy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.

Nên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách bạn cho là mình nên sống.

Vì sau tất cả, chẳng ai quan tâm."

Nhận định

"Tôi đã đọc quyển sách này một cách thích thú. Có nhiều kiến thức và kinh nghiệm hữu ích, những điều mới mẻ ngay cả với người gần trung niên như tôi.

Tuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.

Nhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.

Hãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.

Nếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần."', 0, N'assets/pdfs/B00038.pdf', N'assets/epubs/B00038.epub', 1, CAST(N'2022-07-19T04:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00039', N'Những Người Đàn Bà (Tiểu Thuyết Văn Học Hiện Đại)', N'Etaf Rum', N'Nhà Xuất Bản Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00039.png', N'NHỮNG NGƯỜI ĐÀN BÀ là câu chuyện đầy đau đớn, dữ dội về số phận của những người phụ nữ yếm thế trong xã hội Palestine. Họ không có tiếng nói ngay trong gia đình mình, lấy chồng theo sự sắp đặt của cha mẹ và chỉ quẩn quanh bên căn bếp, chăm lo con cái.
Xuyên suốt câu chuyện là sự câm lặng của ba thế hệ phụ nữ. Thế hệ đầu thoát khỏi sự chiếm đóng của Israel trong xung đột Palestine và Israel, chạy trốn đến nước Mỹ với mong muốn tránh khỏi cuộc sống ở trại tị nạn. Thế hệ thứ 2 đồng ý một cuộc hôn nhân sắp đặt với người Mỹ gốc Palestine với hi vọng đất Mỹ tự do thì tiếng nói của nữ giới sẽ được tôn trọng hơn trên đất Palestine. Thế hệ thứ 3, suýt nữa thì rơi vào bánh xe đổ của các thế hệ trước, nếu cô ấy không phát hiện ra bí mật kinh khủng của gia đình mình và số phận của người mẹ đáng thươ Mỗi thế hệ đều có giấc mơ và khát vọng về sự tự do và nữ quyền, nhưng không phải ai cũng có thể đấu tranh đến tận cùng.', 0, N'assets/pdfs/B00039.pdf', N'assets/epubs/B00039.epub', 1, CAST(N'2022-07-19T04:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00040', N'Người Trong Gương', N'Will Eaves', N'Nhà Xuất Bản Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00040.png', N'NGƯỜI TRONG GƯƠNG là cuốn tiểu thuyết viết về Alan Turing, thiên tài khoa học trong Thế chiến thứ Hai, là người giải được mật mã của Hải quân Đức, “cứu được hàng triệu người, kết thúc cuộc chiến tranh sớm hơn 2 năm” (theo đánh giá của các nhà sử học) nhưng lại bị chính quyền đối xử tàn nhẫn trong những năm cuối đời chỉ vì ông là người đồng tính.

NGƯỜI TRONG GƯƠNG, là cuốn tiểu thuyết được viết dựa theo giai đoạn Turing chịu mức án là phải điều trị hormone. Người thân thiết nhất vẫn luôn yêu thương và chia sẻ với Turing lúc này chỉ còn lại cô bạn gái mà anh từng ngỏ lời cầu hôn và về sau, dù hủy hôn nhưng hai người vẫn giữ mối quan hệ bạn bè. Những lá thư từ June, “người bạn trung thành của anh” (nguyên bản nhân vật trong cuộc đời Turing là Joan Clarke, là đồng sự và từng là vị hôn thê của Turing) dành cho Alec (chính là Turing) đầy sẻ chia và sự quan tâm đặc biệt.

Là cuốn tiểu thuyết không viết theo lối hồi ký tự sự theo kiểu thông thường … “Đầy khao khát và táo bạo … NGƯỜI TRONG GƯƠNG mở ra cho bạn một sự mới lạ trong tiểu thuyết, đó là cuộc đối thoại giữa nghệ thuật và khoa học, trong đó đề cao sự kỳ diệu của ý thức con người …” (Theo The Times).', 0, NULL, N'assets/epubs/B00040.epub', 1, CAST(N'2022-07-19T04:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00041', N'Lâu Đài', N'Franz Kafka', N'Nhà Xuất Bản Văn Học', N'Vietnamese', N'assets/images/bookCover/B00041.png', N'Xảy ra vỏn vẹn trong 6 ngày, mà đằng đẵng bằng vạn kiếp con người, câu chuyện của K. tan hẫng, dang dở không kết thúc, dìm toàn bộ cái sân khấu yêu đương, tranh đấu, nỗ lực, bất lực, náo hoạt nhưng dường như câm lặng của lũ rối đang trình diễn vào đầm lầy tư tưởng.

Tiểu thuyết Lâu đài - được Franz Kafka sáng tạo nên rồi phán quyết phải thiêu hủy - là viên ngọc bí ẩn nhất và đẹp nhất trong những tác phẩm lớn còn lại của Kafka. Huyền hoặc như một giấc mơ phi lý nhưng tột cùng chân thực, đó là những dòng sấm truyền mở đầu cho một thế kỷ 20 đầy đại họa mãi lâu sau thế giới mới biết đến, là tác phẩm lạc chân vào thì dễ mà khó lòng nắm bắt. Nhờ người kế thừa Max Brod không nỡ ném vào lửa, cùng với những di sản quý giá khác của Kafka, Lâu đài đã vĩnh viễn đặt ông lên đỉnh cao thiên tài bất tử của nền văn học thế giới.

“Để nêu danh một nhà văn đã đặt dấu ấn sâu đậm lên thời đại của chúng ta không kém gì Dante, Shakespeare hay Goethe, thì với các thế hệ đương thời, đó nhất định là Kafka.”

- W.H.Auden', 0, N'assets/pdfs/B00041.pdf', N'assets/epubs/B00041.epub', 1, CAST(N'2022-07-19T04:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00042', N'Tớ Muốn Ăn Tụy Của Cậu', N'Sumino Yoru', N'Nhã Nam', N'Vietnamese', N'assets/images/bookCover/B00042.png', N'Tớ Muốn Ăn Tụy Của Cậu

“Tôi không biết về ngày mai của tôi - người vẫn còn thời gian, nhưng tôi đã nghĩ ngày mai của cô ấy - người chẳng còn mấy thời gian đã được hẹn trước.

Cái lô-gíc xuẩn ngốc gì thế này.

Tôi đã nghĩ thế giới này sẽ ưu ái trước sinh mệnh của một cô gái mà những ngày sống chẳng còn là bao.

Đương nhiên, làm gì có chuyện như vậy. Đã không như vậy.

Thế giới không phân biệt một ai.

Nó không nương bàn tay tấn công bình đẳng ấy với bất kỳ ai, kể cả tôi - người có một thân thể khỏe mạnh, hay cô ấy - người sắp ra đi vì căn bệnh nan y.”', 0, NULL, N'assets/epubs/B00042.epub', 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00043', N'Tôi Thích Một Cô Gái Nhưng Chẳng Dám Ngỏ Lời', N'Yuruka Morisak', N'Tsuki LightNovel', N'Vietnamese', N'assets/images/bookCover/B00043.png', N'Tôi không ưa Sato.
Cậu nam sinh ngang bướng Yamaguchi được xếp ngồi cạnh Sato - cô gái giản dị, chậm chạp, vụng về và hoàn toàn chẳng xinh đẹp. Trong những ngày tháng rất đỗi bình yên của thời học sinh cấp ba, mặc dù không muốn thừa nhận nhưng Yamaguchi đang dần bị thu hút bởi cô bạn Sato ngồi cạnh. Vào một ngày, chỉ bởi một câu nói của Sato khi cô bị sốt và ngất xỉu, mối quan hệ giữa hai người họ tiến triển một cách nhanh chóng...
Đây là câu chuyện thanh xuân kể về những ngày tháng thường nhật có đủ dư vị chua ngọt, có những rung động bồi hồi giữa Yamaguchi và cô bạn Sato ngồi cạnh.
-------------------
“Một thứ cảm xúc rất kỳ lạ.
Sato đang ở cách xa tôi.
Ở bàn bên cạnh, cô ấy vẫn thường quay sang bắt chuyện với tôi, hỏi han tôi một cách vượt quá mức cần thiết, và thường xuyên cho tôi kẹo.
Ở bàn bên cạnh, tôi vẫn hay nhìn cô ấy bị giáo viên gọi lên và luôn bí câu trả lời.
Ở bàn bên cạnh, tôi vẫn hay nhìn cô ấy vừa cười vừa nói những câu chuyện hết sức nhàm chán, và nhìn cô ấy tết lại mái tóc thành một dải duy nhất.
Thế nhưng, từ giờ trở đi, Sato không còn ngồi cạnh tôi nữa...”', 0, NULL, N'assets/epubs/B00043.epub', 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00044', N'How Psychology Works - Hiểu Hết Về Tâm Lý Học', N'Jo Hemmings', N'Nhà Xuất Bản Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00044.png', N'MỘT TRONG NHỮNG CUỐN SÁCH MỞ KHÓA HỮU ÍCH NHẤT VỀ TƯ DUY, KÝ ỨC VÀ CẢM XÚC CỦA CON NGƯỜI!

Ám sợ là gì, ám sợ có thực sự đáng sợ không? Rối loạn tâm lý là gì, làm thế nào để thoát khỏi tình trạng suy nhược và xáo trộn đó? Trầm cảm là gì, vì sao con người hiện đại thường xuyên gặp và chống chọi với tình trạng u uất, mệt mỏi và tuyệt vọng này?

Tìm hiểu về các vấn đề tâm trí của con người luôn đầy sức hấp dẫn và lôi cuốn, vì vậy mà tâm lý học ra đời, hình thành và phát triển rất nhiều các học thuyết và trường phái. Cuốn sách này dẫn dắt bạn đọc qua hành trình tìm hiểu các học thuyết và trường phái đó, về cách các nhà tâm lý diễn giải hành xử và tâm trí con người. Tại sao chúng ta có những hành vi, suy nghĩ và cảm xúc như vậy, chúng diễn ra và kết thúc như thế nào, chúng ảnh hưởng lâu dài, gián đoạn hay ngắn ngủỉ đến đời sống của chúng ta ra sao, làm thế nào để chúng ta thoát khỏi những tác động tiêu cực của chúng?

Cuốn sách có cấu trúc khoa học, trình bày dễ hiểu, súc tích, thiết kế và minh họa đẹp mắt này sẽ mang đến cho bạn những hiểu biết về các học thuyết tâm lý và các phương pháp trị liệu, từ các vấn đề cá nhân đến những ứng dụng thực tế.', 0, N'assets/pdfs/B00044.pdf', N'assets/epubs/B00044.epub', 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00045', N'Chó sủa nhầm cây - Tại sao những gì ta biết về thành công có khi lại sai', N'Eric Barker', N'Ecoblader', N'Vietnamese', N'assets/images/bookCover/B00045.png', N'Bạn có biết:

- Các thủ khoa hiếm khi trở thành triệu phú, và nhược điểm lớn nhất có khi lại là ưu điểm tuyệt vời nhất mà ai ai cũng khao khát sở hữu.

- Ở công ty, sự chăm chỉ đang bị thổi phồng quá mức, còn những trò nịnh bợ lại thường mang đến kết quả tốt, và liệu đề cao chính nghĩa hay sa vào tà đạo mới là con đường dẫn đến thành công?

- Những người lính Navy SEAL và những nhân viên bán bảo hiểm có một điểm chung quan trọng, và cách sử dụng nguyên tắc WNGF trong thiết kế trò chơi để biến đống bài tập chán ngắt thành những trò chơi hấp dẫn. 

Rất nhiều lời khuyên về thành công rất logic, đầy cảm hứng, và sai bét. Bằng cách nhìn qua lăng kính khoa học để xem những người cực kỳ thành công khác với mình ở những điểm nào, ta học được cách để trở nên giống họ—và nhận ra trong vài trường hợp, không được như họ hóa ra lại tốt hơn.

 

CHÓ SỦA NHẦM CÂY - BARKING UP THE WRONG TREE - là quyển sách gây tiếng vang, liên tục nằm trong danh sách bestseller Amazon của tác giả kiêm chủ trang blog Barking up the wrong tree - Eric Barker. Xuyên suốt nội dung sách, Eric sẽ cùng chúng ta lý giải một cách đầy hóm hỉnh nhưng không kém phần chặt chẽ những quan niệm khác nhau về thành công từ trước đến nay. Và ở cuối con đường đó, mỗi người chúng ta sẽ tự tìm thấy ngưỡng cửa thành công cho riêng mình.', 0, N'assets/pdfs/B00045.pdf', N'assets/epubs/B00045.epub', 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00046', N'Tôi và Ford Motor: Cách tỉ phú Henry Ford điều hành Ford Motor từ thuở sơ khai đến tầm thế giới', N'Henry Ford', N'Ecoblader', N'Vietnamese', N'assets/images/bookCover/B00046.png', N'HENRY FORD, nhà sáng lập Công ty Ford Motor, là một trong những tỉ phú đầu tiên của nước Mĩ. Ford chính là người đã đưa vào ứng dụng các dây chuyền sản xuất trong nhà máy của mình, đưa cả thế giới vào thời đại sản xuất hàng loạt. Nhờ phương pháp bố trí thông minh, cùng chiến lược bán hàng tập trung vào số lượng, Ford đã đặt cả nhân loại lên trên những chiếc xe bốn bánh, thay đổi hoàn toàn cách di chuyển của Thế kỉ XX.

Vừa giúp mọi người có thể mua sản phẩm vốn được xem là xa xỉ, vừa giúp nhân công có lương cao, vừa mang về lợi nhuận lớn cho chính mình và cổ đông, Henry Ford đã thay đổi hoàn toàn cách vận hành doanh nghiệp hiện đại. Để hiểu rõ bí mật đằng sau thành công kì lạ của Ford, không có khởi đầu nào thích hợp hơn quyển sách được viết bởi chính ông: HENRY FORD: Tôi và Ford Motor.

Phiên bản sách chuẩn kinh doanh - với sự phối hợp biên dịch của Ecoblader và NXB Kinh Tế TPHCM - sẽ mang lại cho độc giả những tư tưởng nghệ thuật kinh doanh kinh điển của một trong những tượng đài khai sinh nên nền kinh tế thế giới nói chung và nước Mỹ nói riêng - Henry Ford', 0, NULL, N'assets/epubs/B00046.epub', 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), NULL, N'M0000', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00047', N'Cuộc đời kỳ lạ của Nikola Tesla', N'Nikola Tesla', N'Ecoblader', N'Vietnamese', N'assets/images/bookCover/B00047.png', N'Được mệnh danh là “nhà khoa học điên” của giới vật lý, Tesla là người đi tiên phong đưa kỹ thuật điện, điện từ vào đời sống. Với cách tư duy kỳ lạ của mình, ông đã có đến khoảng 300 bằng phát minh, tiêu biểu như động cơ điện không đồng bộ hay lõi Tesla. Rất nhiều phát minh của Tesla đang được ứng dụng trong các thiết bị điện xung quanh ta ngày nay.

Thật không dễ để hiểu thấu hết những gì đang diễn ra trong đầu Tesla, một thiên tài với trí nhớ hình ảnh, biết tám thứ tiếng và có tầm nhìn vượt thời đại. Những gì ông đã viết trong quyển sách này có thể kỳ lạ và khó tin, nhưng hãy nhớ rằng, người ta đã mất gần một thế kỷ để biết những gì Tesla đề xuất là chính xác và khả thi!

Hy vọng quý bạn đọc có thể nhìn ra được điều gì đó mới mẻ trong những câu chữ của Tesla, bởi đó có thể là những hiểu biết giúp ta thay đổi cả thế giới này.', 0, NULL, N'assets/epubs/B00047.epub', 1, CAST(N'2022-07-19T05:01:00.000' AS DateTime), NULL, N'M0000', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00048', N'100 Kỹ Năng Sinh Tồn', N'Clint Emerson', N'NXB Thanh Niên', N'Vietnamese', N'assets/images/bookCover/B00048.png', N'Bạn sẽ làm gì nếu như một ngày bị mắc kẹt giữa vùng lãnh thổ có dịch bệnh hoành hành, lạc ở nơi hoang dã, bị móc túi khi đi du lịch ở đất nước xa lạ, hay phải thoát ngay khỏi một vụ hỏa hoạn ở nhà cao tầng… ? Clint Emerson – một cựu Đặc vụ SEAL, lực lượng tác chiến đặc biệt của Hải quân Hoa Kỳ – muốn bạn có được sự chuẩn bị tốt nhất trong cuốn sách 100 kỹ năng sinh tồn này.', 0, NULL, N'assets/epubs/B00048.epub', 1, CAST(N'2022-07-19T05:02:00.000' AS DateTime), NULL, N'M0000', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00049', N'Cơ Thể Tự Chữa Lành: Giải Cứu Gan', N'Anthony William', N'NXB Thanh Niên', N'Vietnamese', N'assets/images/bookCover/B00049.png', N'Cơ thể tự chữa lành - Giải cứu gan là cuốn sách tiếp theo trong bộ sách Cơ thể tự chữa lành của tác giả có sách bán chạy số 1 theo New York Times bình chọn: Anthony William. Trong tác phẩm mới này, ông sẽ hé mở bức màn bí mật về đặc điểm, cơ chế hoạt động và những điều bí ẩn xoay quanh lá gan của con người.

Trong thế giới hiện đại, chúng ta không hề biết rằng có bao nhiêu triệu chứng, tình trạng và bệnh lý bắt nguồn từ một lá gan quá tải, trì trệ và ứ đọng. Không chỉ có ung thư gan, xơ gan và viêm gan. Gần như mọi khổ sở về sức khỏe – từ vấn đề sức khỏe tổng thể, vấn đề về tiêu hóa, bất ổn về cảm xúc, tăng cân bất thường, cao huyết áp, vấn đề tim mạch, sương mù não, vấn đề về da, tới các bệnh mạn tính và tự miễn khác – đều có nguồn gốc sâu xa từ một lá gan bị tổn thương.', 0, N'assets/pdfs/B00049.pdf', NULL, 1, CAST(N'2022-07-19T05:00:00.000' AS DateTime), CAST(N'2022-07-19T00:00:00.000' AS DateTime), N'M0000', N'M0000', N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00050', N'Cơ Thể Tự Chữa Lành', N'Anthony William', N'NXB Thanh Niên', N'Vietnamese', N'assets/images/bookCover/B00050.png', N'Cơ thể tự chữa lành tiết lộ nguyên nhân gốc rễ của nhiều căn bệnh mà các cộng đồng y tế còn nhầm lẫn hoặc chưa hiểu hết. Qua cuốn sách, tác giả đưa ra những phương pháp hoàn toàn tự nhiên để chữa lành rất nhiều căn bệnh đang hành hạ vô số người trong chúng ta, như bệnh Lyme, đau xơ cơ, mệt mỏi tuyến thượng thận, mệt mỏi mạn tính, mất cân bằng nội tiết tố, v.v... Hơn thế nữa, tác giả còn cung cấp nhiều giải pháp hồi phục tinh thần và linh hồn mỗi người, sau một thời gian dài phải chịu đựng cơn bệnh quái ác giằng xé.', 0, N'assets/pdfs/B00050.pdf', NULL, 1, CAST(N'2022-07-19T06:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00051', N'Ung Thư - Sự Thật, Hư Cấu Và Gian Lận - Những Phương Pháp Chữa Bệnh Không Độc Hại', N'Ty Bollinger', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00051.png', N'Những gì bạn biết về ung thư đã được tạo dựng cẩn thận và chế tác dưới tay các nghệ sĩ tuyên truyền trong ngành công nghiệp dược phẩm, tất cả nhằm mục đích không cho bạn biết về tính ưu việt to lớn của Mẹ Tự nhiên trong điều trị ung thư.

Tin tốt lành là cuốn sách này, “Ung thư – Sự thật, hư cấu, gian lận và những phương pháp chữa lành không độc hại”, sẽ đem lại sự thật. Nó sẽ cho bạn biết về các liệu pháp điều trị ung thư thay thế thực sự hiệu quả. Hãy xem các số liệu thống kê thực tế:

- Tỷ lệ chữa khỏi bệnh 90% hoặc cao hơn có thể dễ dàng đạt được với các bệnh nhân ung thư không theo y học chính thống mà theo y học thay thế ngay từ đầu và tuân thủ nghiêm ngặt.', 0, N'assets/pdfs/B00051.pdf', NULL, 1, CAST(N'2022-07-19T06:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00052', N'Nhân Tố Enzyme - Phương Thức Sống Lành Mạnh', N'Hiromi Shinya', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00052.png', N'Từ kết quả lâm sàng khi tiến hành kiểm tra dạ dày của hơn 300.000 người, bác sĩ Hiromi Shinya đã rút ra kết luận: “Người có sức khỏe tốt là người có dạ dày đẹp, ngược lại, người có sức khỏe kém là người có dạ dày không đẹp.”

Trong cuốn sách này, Hiromi Shinya sẽ giới thiệu với các bạn về phương pháp sống lâu và khỏe mạnh mà ông đã dày công nghiên cứu cùng với sự trợ giúp của đông đảo các bệnh nhân của ông.

Vậy, làm thế nào để có thể sống lâu và khỏe mạnh? Nếu nói ngắn gọn trong một câu thôi thì đó là sống mà không tiêu tốn hết “enzyme diệu kỳ”.

Có lẽ sẽ có nhiều người thắc mắc về cụm từ “enzyme diệu kỳ”. Nói một cách đơn giản, “enzyme diệu kỳ” là enzyme nguyên mẫu của hơn 5.000 loại enzyme trong cơ thể, đảm nhiệm các hoạt động duy trì sự sống của con người.  Các ezyme cần thiết này hình thành ngay trong tế bào của cơ thể sống và chúng ta còn có thể tự tổng hợp enzyme qua các bữa ăn hàng ngày.', 0, NULL, N'assets/epubs/B00052.epub', 1, CAST(N'2022-07-19T06:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00053', N'Nhân Tố Vi Sinh', N'Hiromi Shinya, MD', N'NXB Thông Tin và Truyền Thông', N'Vietnamese', N'assets/images/bookCover/B00053.png', N'Nhân Tố Vi Sinh (Tái Bản) - Làm thế nào để có 1 sức khoẻ tốt và không bao giờ bị bệnh?

Đó là một câu hỏi lớn mà tất cả những người sống trên Trái đất này đều quan tâm. Từ hàng nghìn năm nay, đã có hàng trăm nghìn nhà khoa học tìm tòi, nghiên cứu các phương pháp, các loại thuốc mới để cứu chữa con người thoát khỏi bệnh tật. Nhưng kỳ lạ thay, khoa học - y học ngày càng phát triển, các loại máy móc hiện đại, các loại thuốc mới được phát minh nhưng cũng không theo kịp sự phát triển của các loại bệnh tật. Hàng ngày chúng ta phải đối mặt với bao nỗi sợ hãi đến từ các loại bệnh: tiểu đường, tai biến, xơ vữa động mạch, gút, mỡ trong máu, tăng cholesterol, xơ gan, thận, viêm loét dạy dày – tá tràng và đặc biệt là bệnh ung thư ngày càng nhiều, người mắc bệnh ngày một trẻ hơn. Các chuyên gia đã cảnh báo, trong 5 năm tới Việt Nam sẽ đối diện với đại dịch ung thư. Tại sao vậy và các bạn đã làm gì để phòng tránh nó?', 0, N'assets/pdfs/B00053.pdf', NULL, 1, CAST(N'2022-07-19T07:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00054', N'Bí Mật Dinh Dưỡng Cho Sức Khỏe Toàn Diện', N'T Collin Campbell, Thomas M Cambpell II', N'NXB Thông Tin và Truyền Thông', N'Vietnamese', N'assets/images/bookCover/B00054.png', N'“Bí mật dinh dưỡng cho sức khoẻ toàn diện” không chỉ là một cuốn sách đơn thuần mà nó còn là một công trình nghiên cứu khoa học lớn nhất, kéo dài trong suốt 20 năm về mối liên hệ giữa dinh dưỡng và bệnh tật của con người từng được thực hiện trên thế giới của hai tác giả đồng thời là hai cha con, tiến sĩ T. Colin Campbell và bác sĩ Thomas M Campbell II.

Cuốn sách đã và đang được đón nhận rộng rãi trên toàn thế giới. Tính đến thời điểm hiện tại, “Bí mật dinh dưỡng cho sức khoẻ toàn diện” đã được dịch ra hơn 50 thứ tiếng với trên 2 triệu bản in được bán ra. Hiểu biết về các phương pháp dinh dưỡng sẽ giúp mọi người chia tay các bệnh mãn tính và nâng cao sức khỏe, có được cuộc sống hạnh phúc hơn.', 0, N'assets/pdfs/B00054.pdf', NULL, 1, CAST(N'2022-07-19T08:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C07', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00055', N'Tính Nữ - Dữ Dội và Dịu Êm', N'Sasha K Shillcutt, MD', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00055.jpg', N'“Phụ nữ có thể vừa nữ tính, vừa dữ dội. Chúng ta có thể vừa dẫn đầu các cuộc cách mạng, vừa quan tâm đến những người đi theo chúng ta. Chúng ta có thể thống trị, cũng có thể hợp tác, nhưng nếu muốn thành công, chúng ta phải biết cách sống giữa hoa hồng và gai nhọn. Cần biết rằng: bạn có thể tử tế và ngầu.”

Trích: Tính nữ | TS. Sasha K. Shillcutt

Phụ nữ rõ ràng có thể đóng rất nhiều vai trò và họ đều sẽ thể hiện rất tốt những vai trò đó nếu được trao cho một cơ hội.

Trên thế giới có rất nhiều những người phụ nữ tài giỏi và nắm giữ những vị trí lãnh đạo quan trọng trong các cơ quan, tổ chức. Có thể kể đến như: Người phụ nữ quyền lực nhất thế giới (Theo tạp chí Forbes) - thủ tướng Đức Angela Merkel, bà Hillary Clinton người tranh cử chức tổng thống và Michelle Obama - cựu đệ nhất phu nhân Hoa Kỳ... Tất nhiên còn có hàng trăm ngàn, hàng triệu, hàng trăm triệu những người phụ nữ tài năng ngoài kia, người vừa có thể mạnh mẽ chinh phục những công việc khó nhằn, lại biết dịu dàng, mềm mỏng xây dựng các mối quan hệ và giữ gìn một gia đình hạnh phúc.

Tuy nhiên, trong ánh hào quang và những lời khen không ngớt dành cho những người phụ nữ tài năng, ta không thể không nhìn thấy ở một góc khuất nào đó vẫn có những người phụ nữ đang ẩn mình, rụt rè và sợ hãi. Những người phụ nữ không dám tự tin bung nở và khoe trọn tài năng hay con người thật của mình. Bởi họ sợ những đánh giá từ dư luận, sợ những tiếng cười chê và thất bại. Vì thế họ chọn để bản thân mình vô hình. Một sự vô hình có chủ ý. Thế nhưng, chúng ta không thể rút lui và “vô hình” mãi mãi...

Nếu bạn cũng đang cảm thấy như vậy, cảm thấy tài năng của mình không được đánh giá đúng, nỗ lực của mình bị người khác ngó lơ, sự khác biệt của mình bị người khác cười chê cho là dị biệt, thì cuốn Tính nữ của tác giả Sasha Shillcutt chính là dành cho bạn.

Cuốn sách này được viết cho một nhóm người mang trong mình những tâm hồn đẹp đẽ bị lu mờ bởi những điều tầm thường và sự bảo thủ. Cuốn sách này là một lời kêu gọi hãy sống chân thực, trở thành chính con người bạn, vì đó là con người mà thế giới muốn được biết. Nó nói về việc giành ưu thế và trở nên đủ can đảm để tự định nghĩa thành công trong đời sống cá nhân và nghề nghiệp của bạn, bất kể có khác biệt với những người xung quanh đến đâu. Nó nói về việc làm chủ dũng khí của mình, nhưng đồng thời cũng thể hiện sự nhân hậu.

Bằng cách kể lại những câu chuyện cá nhân, cùng việc sẵn lòng chia sẻ minh bạch những thành công lẫn thất bại của mình với tư cách một người phụ nữ, người vợ, người mẹ, người bác sĩ và người bạn đã truyền cảm hứng cho nhiều người, cộng thêm khiếu hài hước và trí tuệ của mình, tác giả - bác sĩ Sasha Shillcutt đã đưa ra các kĩ thuật đơn giản, dễ thực hiện nhưng vô cùng hiệu quả để tất cả các quý cô có thể khám phá sự sôi nổi và dũng cảm trong con người mình.

Không kêu gọi phụ nữ đứng lên chiến tranh đòi bình đẳng giới hay phải tranh cãi để đòi quyền lợi và cơ hội. Tính nữ của Sasha Shillcutt chỉ đơn giản là một cuốn sách giúp bạn dám đối mặt với sự thật, đối mặt với nỗi sợ sâu thẳm bên trong bạn và đối mặt với chính tài năng và sự đặc biệt mà bạn đã vô tình hoặc cố tình ẩn giấu nó đi.

Để cho bạn dần dũng cảm bước ra khỏi cái bóng và chia sẻ sự thật, Sasha Shillcutt đã thành thật chia sẻ hết tất những vấn đề của bản thân, từng bước cùng bạn thức tỉnh và viết nên một cuốn sổ tay nữ giới.

“Mình phải chia sẻ những câu chuyện thực tế để tất cả chúng ta thức tỉnh và viết nên một cuốn sổ tay nữ giới mới.” Chúng ta phải bước ra khỏi cái bóng và chia sẻ sự thật. Chúng ta phải dũng cảm nhưng không cần quá phi thường, chỉ cần vừa đủ thôi.

Bằng cách lồng ghép khéo léo những Bài kiểm tra nội tâm, Tính nữ của Sasha Shillcutt giúp bạn dần khám phá ra những bí mật của bản thân, những trở ngại đã kìm hãm sự thành công và tài năng của bạn. Từ đó tổng quan lại và đưa bạn đến thế giới của sự gan góc và nhân từ để giúp bạn vừa can đảm, vừa nhân hậu, để nói với bạn rằng bạn có quyền nắm giữ sức mạnh với tư cách là phụ nữ, bởi vì đó là ý nghĩa của việc sống là chính mình.

Mang đến những lời khuyên thực tế, chân thành dành cho mọi phụ nữ đang khao khát trở nên mạnh mẽ, can trường và hướng về tương lai. Cuốn sách này giống như một đơn thuốc chữa lành những gì vốn luôn khiến chúng ta phiền não.

Bởi Sasha Shillcutt đã từng là bạn - một cô gái nép mình dưới cái bóng của sự thiếu tự tin, vậy nên cô thấu hiểu hết những khó khăn và mặc cảm mà bạn đang phải chịu đựng. Nhưng Shillcutt đã kiên cường, đã dữ dội và mạnh mẽ chiến đấu để vượt qua nó. Vậy nên chắc chắn Tính nữ của Sasha Shillcutt cũng sẽ giúp bạn, bạn cũng sẽ trở thành một cô gái tử tế và ngầu.

Mã hàng	8935325002359
Tên Nhà Cung Cấp	Skybooks
Tác giả	Sasha K Shillcutt, MD
Người Dịch	Minh Nguyệt
NXB	NXB Thế Giới
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	351
Kích Thước Bao Bì	20.5 x 14.5 x 1.4 cm
Số trang	308
Hình thức	Bìa Mềm
Sản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng
Tính Nữ - Dữ Dội và Dịu Êm

“Phụ nữ có thể vừa nữ tính, vừa dữ dội. Chúng ta có thể vừa dẫn đầu các cuộc cách mạng, vừa quan tâm đến những người đi theo chúng ta. Chúng ta có thể thống trị, cũng có thể hợp tác, nhưng nếu muốn thành công, chúng ta phải biết cách sống giữa hoa hồng và gai nhọn. Cần biết rằng: bạn có thể tử tế và ngầu.”

Trích: Tính nữ | TS. Sasha K. Shillcutt

Phụ nữ rõ ràng có thể đóng rất nhiều vai trò và họ đều sẽ thể hiện rất tốt những vai trò đó nếu được trao cho một cơ hội.

Trên thế giới có rất nhiều những người phụ nữ tài giỏi và nắm giữ những vị trí lãnh đạo quan trọng trong các cơ quan, tổ chức. Có thể kể đến như: Người phụ nữ quyền lực nhất thế giới (Theo tạp chí Forbes) - thủ tướng Đức Angela Merkel, bà Hillary Clinton người tranh cử chức tổng thống và Michelle Obama - cựu đệ nhất phu nhân Hoa Kỳ... Tất nhiên còn có hàng trăm ngàn, hàng triệu, hàng trăm triệu những người phụ nữ tài năng ngoài kia, người vừa có thể mạnh mẽ chinh phục những công việc khó nhằn, lại biết dịu dàng, mềm mỏng xây dựng các mối quan hệ và giữ gìn một gia đình hạnh phúc.', 0, NULL, N'assets/epubs/B00055.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00056', N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim', N'John Gray', N'NXB Hồng Đức', N'Vietnamese', N'assets/images/bookCover/B00056.jpg', N'Cuốn sách này thực sự đã giúp đỡ cho hàng triệu độc giả, trong đó có tôi và chắc chắn cũng sẽ có bạn. Nếu không có những ý niệm mới mẻ này thì chưa chắc tôi đã có được cuộc hôn nhân hạnh phúc như hiện nay hay có thể trở thành một người cha giàu đức hy sinh đối với các con của mình như vậy. Những vướng mắc trong mối quan hệ với vợ cách đây hai mươi năm đã từng làm tôi tức điên lên, hiện giờ thi thoảng nó vẫn thường xảy ra. Nhưng điều khác biệt là tôi đã biết khoan dung hơn, chấp nhận và thấu hiểu hơn. Tôi có thể hiểu những lời lẽ và phản ứng của vợ tôi theo cách khách quan hơn, đồng thời tôi biết cách nên đáp lại như thế nào. Có thể tôi là một chuyên gia trong lĩnh vực giao tiếp và sự khác biệt về giới tính, tuy nhiên, đối với Bonnie và các cô con gái của tôi thì việc để hiều được họ vẫn còn là những bí ẩn. Dù vậy, cuốn sách này có thể giúp chúng ta trở nên khoan dung và biết tha thứ khi ai đó không đáp lại theo cách mà ta mong đợi. May mắn thay, để xây dựng những mối quan hệ bền đẹp, tính hoàn hảo không phải là điều kiện bắt buộc.

Với những áp lực công việc ngày càng gia tăng, cùng với những đòi hỏi nhiều hơn về sự lãng mạn trong gia đình, ngày nay những mối quan hệ dường như đang thách thức hầu hết mọi người. Hiểu được người bạn đời của mình tới từ đâu sẽ giúp mối quan hệ của bạn trở nên nhẹ nhàng hơn. Bao dung với những điều khác biệt giữa hai người không có nghĩa là chấp nhận một cách thụ động mối quan hệ đầy vấn đề hoặc thiếu cảm xúc đam mê. Thay vào đó, sự thích nghi lành mạnh này dựa trên nền tảng thấu hiểu thực sự, điều đó sẽ giúp chúng ta cảm thông với người bạn đời hơn, đối đáp với họ bằng nhiều tình yêu hơn và truyền cảm hứng tốt nhất đến với họ. Bạn không thể và cũng không nên cố thay đổi người bạn đời của mình. Thay đổi là việc của họ, còn việc của bạn là thay đổi cách giao tiếp, phản ứng và đối đáp với người bạn đời của mình. Bằng sự thấu hiểu mới mẻ này, bạn sẽ có thêm sức mạnh và sự thông thái để điều chỉnh cách tiếp cận của mình. Từ việc giao tiếp tốt hơn, bạn sẽ biết cách trợ giúp hiệu quả hơn, đồng thời bạn sẽ thành công hơn khi nhận được sự trợ giúp mà bạn muốn.

Có nhiều người áp dụng sai những khái niệm trong cuốn sách này. Họ dùng ví dụ và giải thích này của tôi để bào chữa cho việc không chịu thay đổi những khía cạnh quan trọng giúp mối quan hệ trở nên tốt đẹp hơn. Chẳng hạn, tôi chỉ ra rằng đàn ông cần chui vào chiếc kén của mình thường

xuyên để thư giãn mỗi ngày. Tuy nhiên điều này không thể trở thành lý do biện minh cho việc ở lì trong đó cả ngày. Mặt khác, tôi cũng chỉ ra rằng phụ nữ nói chung thường có nhu cầu chia sẻ cảm xúc nhiều hơn đàn ông, như là một cách để đương đầu với sự căng thẳng của mình. Điều này không có nghĩa là họ có thể nói không ngừng hoặc mong chờ đàn ông phải dừng việc của họ lại để lắng nghe bất kỳ điều gì cô ấy nói hay bất cứ khi nào cô ấy muốn. Thật không may là nhiều khi những ý niệm tốt cũng có thể bị áp dụng sai. Nhưng nếu bạn đang tìm cách dùng những ý niệm này để hiểu thêm về người bạn đời của mình, để tôn trọng người khác theo cách mà họ cho là quan trọng, cũng như để người khác hiểu được những nhu cầu của mình thì cuốn sách này có thể giúp ích cho bạn.

Trên những hành trình của mình, trong lúc đợi máy bay hoặc khi ký tên lên những cuốn sách trong một sự kiện nào đó, tôi luôn gặp những đôi vợ chồng tới tìm tôi với cùng một câu chuyện. Họ đã từng li dị nhưng sau khi đọc “cuốn sách này” họ lại tái hôn và sống hạnh phúc bên nhau. Khi tôi viết cuốn Đàn ông đến từ Sao Hỏa, đàn bà đến từ Sao Kim từ mười hai năm trước, tôi biết cuốn sách này sẽ thặt chặt các mối quan hệ hơn và thậm chí còn có thể cứu vãn nhiều cuộc hôn nhân đang trên bờ vực li hôn. Điều tôi không thể ngờ là lại có nhiều người tái hợp với bạn đời của mình sau một cuộc li hôn hoặc li thân để cùng bắt đầu và dựng xây lại mối quan hệ đó. Chắc chắn sẽ có nhiều người nói rằng cuốn sách này không thể cứu vãn một mối quan hệ vướng phải những vấn đề nghiêm trọng và cho rằng họ sống tốt hơn khi không có bạn đời. Nhiều người nói rằng việc đọc cuốn sách này khi mối quan hệ của họ đã thất bại cũng giúp họ hiểu được nguyên do vì sao mối quan hệ đó không thể lâu bền. Hiểu được điều đó giúp họ có thêm can đảm để tiếp tục yêu và nắm giữ bí quyết để tìm được tình yêu.

Hầu hết những ai đọc cuốn sách này đều có thể cải thiện chất lượng mối quan hệ mà họ đang có. Chắc chắn bạn sẽ khám phá ra những ý niệm mới mẻ để cải thiện việc giao tiếp và đạt được những mục đích của riêng mình. Thậm chí nếu một ý tưởng nào đó có thể giúp bạn thấu hiểu cũng như hỗ trợ cho bạn đời, bạn bè, đồng nghiệp, cha mẹ hoặc con cái, thì điều đó cũng xứng đáng với sự quan tâm và thời gian mà bạn đã đầu tư cho nó rồi. Một thay đổi dù nhỏ nhưng có tầm quan trọng có thể mang lại những ảnh hưởng sâu sắc và lâu dài. Thật bất ngờ, một ý tưởng giúp mối quan hệ trở nên bền vững hơn cũng có thể hỗ trợ các cặp đôi vượt qua những trở ngại đầy thách thức của họ. Cuốn sách này không đề cập trực tiếp tới những thách thức của “một mối quan hệ rối loạn” nhưng nó mang lại hướng tiếp cận mới với người khác giới. Khi thấu hiểu, việc giao tiếp sẽ tự động được cải thiện. Khi sự hợp tác giữa hai người tốt hơn, hy vọng sẽ nhiều hơn và tình yêu sẽ ngự trị. Chỉ cần có tình yêu và cách thức giao tiếp tốt, hầu hết mọi vấn đề, thậm chí cả “những vấn đề lớn” đều có thể giải quyết. Đầu tiên hãy đề cập đến những vấn đề nhỏ, từ đó những vấn đề lớn sẽ dần biến mất hoặc được giải quyết một cách dễ dàng.', 0, NULL, N'assets/epubs/B00056.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00057', N'Lược Sử Triết Học Nga', N'TS Mai K Đa, TS Dương Quốc Quân, TS Lê Thị Tuyết', N'NXB Chính Trị Quốc Gia Sự Thật', N'Vietnamese', N'assets/images/bookCover/B00057.png', N'Nội dung cuốn sách gồm 5 chương, phân tích khái quát và hệ thống hóa những nội dung cơ bản của giai đoạn hình thành triết học Nga trong thế kỷ X đến thế kỷ XVII; sự phát triển của lịch sử triết học Nga trong thế kỷ XVIII – XIX, thế kỷ XX; sự hình thành và phát triển của triết học Xôviết và nhận diện các khuynh hướng nghiên cứu triết học ở nước Nga giai đoạn hậu Xôviết hiện nay.', 0, N'assets/pdfs/B00057.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00058', N'Phán Quyết Điển Hình Của Cơ Quan Tài Phán Quốc Tế - Tóm Tắt Và Bình Luận', N'TS Trần Thăng Long', N'NXB Chính Trị Quốc Gia Sự Thật', N'Vietnamese', N'assets/images/bookCover/B00058.jpg', N'Cuốn sách có cấu trúc gồm 03 chương:

Chương 1: Những vấn đề chung của luật quốc tế;

Chương 2: Nguồn của luật quốc tế;

Chương 3: Một số lĩnh vực điều chỉnh cơ bản của luật quốc tế.

Đây là công trình nghiên cứu có tính chuyên sâu, có hệ thống của nhóm tác giả, trong đó tập hợp một số vụ việc, phán quyết điển hình của các cơ quan tài phán quốc tế, với các bình luận, phân tích và đánh giá về từng vụ việc. Nội dung cuốn sách giúp trang bị thêm kiến thức lý luận về luật quốc tế; góp phần tăng cường khả năng vận dụng, soi chiếu quy định của luật quốc tế trong thực tiễn xét xử cho những người hoạt động trong lĩnh vực đối ngoại, pháp luật quốc tế. Cuốn sách là tài liệu tham khảo quý cho giảng viên, học viên chuyên ngành Luật quốc tế, các luật sư và độc giả quan tâm đến vấn đề này.', 0, N'assets/pdfs/B00058.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C11', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00059', N'TalMud - Tinh Hoa Trí Tuệ Do Thái', N'Từ Quang Á', N'NXB Hồng Đức', N'Vietnamese', N'assets/images/bookCover/B00059.jpg', N'Talmud là một tập hợp các văn bản cổ của các bậc thầy người Do Thái trong suốt hơn 10 thế kỷ. Bộ sách gồm 20 cuốn, hơn 1200 trang, hơn 250 vạn chữ, nội dung gồm ba phần “Missimah”, “Midrash” và “Germara”. Đây là nơi khởi nguồn của trí tuệ và là kim chỉ nam cho lối sống của dân tộc Do Thái.

Sách “Talmud” đã được dịch ra 12 thứ tiếng và được lưu truyền trên thế giới. Sở dĩ sách được sự quan tâm rộng rãi vì thể hiện được một trí tuệ, mà có thể nói người Do Thái chú trọng trí tuệ hơn bất kỳ dân tộc nào trên thế giới. Nếu có người hỏi người Do Thái: “Cái quan trọng nhất của con người là gì?”, họ nhất định sẽ trả lời: “Trí tuệ”.', 0, NULL, N'assets/epubs/B00059.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00060', N'English Vocabulary in Use: Advanced', N'Michael McCarthy, Felicity O''Dell', N'Cambridge University Press', N'English', N'assets/images/bookCover/B00060._SX478_BO1,204,203,200_.jpg', N'The words you need to communicate with confidence. Vocabulary explanations and practice for advanced level (C1 to C2) learners of English. Perfect for both self-study and classroom activities. Quickly expand your vocabulary with over 100 units of easy to understand explanations and practice exercises. Be confident about what you are learning, thanks to Cambridge research into how English is really spoken and written, and remember words more effectively with lots of opportunities for personalised practice.', 0, N'assets/pdfs/B00060.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00061', N'Oxford Dictionary of Idioms', N'Judith Siefring', N'Oxford University Press, USA', N'English', N'assets/images/bookCover/B00061.jpg', N'Did you know that ''flavor of the month'' originated in a marketing campaign in American ice-cream parlors in the 1940s, when a particular flavor would be specially promoted for a month at a time? And did you know that ''off the cuff'' refers to the rather messy practice of writing impromptu notes on one''s shirt cuff before speaking in public? These and many more idioms are explained and put into context in this second edition of the Oxford Dictionary of Idioms. The volume takes a fresh look at the idiomatic phrases and sayings that make English the rich and intriguing language that it is. This major new edition contains entries for over 5000 idioms, including 350 entirely new entries and over 500 new quotations. The text has been updated to include many new idioms using the findings of the Oxford English Reading Program, the biggest language research program in the world. The entries are supported by a wealth of illustrative quotations from a wide range of sources and periods and the text has been entirely redesigned so that it is both elegant and easy to use. Anyone interested in the colorful side of the English language will get hours of fun browsing this fascinating and informative volume.', 0, N'assets/pdfs/B00061.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00062', N'Oxford Advanced Learner''s Dictionary', N'A. S. Hornby', N'Oxford University Press', N'English', N'assets/images/bookCover/B00062.jpg', N'The world''s best-selling advanced learner''s dictionary, now with Oxford iWriter to help students plan, write and review their written work.', 0, N'assets/pdfs/B00062.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00063', N'Oxford Collocations Dictionary for students of English', N'Colin McIntosh, Ben Francis, Richard Poole', N'Oxford University Press', N'English', N'assets/images/bookCover/B00063.jpg', N'The dictionary that helps students write and speak natural-sounding English, now in a new edition with CD-ROM. Which words usually go together? This dictionary shows you the common word combinations (collocations) that are essential for natural-sounding British and American English. Completely revised and extended, the new edition has over 250,000 collocations and over 75,000 examples.', 0, N'assets/pdfs/B00063.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00064', N'Giáo Trình Tiếng Nhật Dekiru Nihongo Sơ Trung Cấp Kotoba Noto (Bài Tập Từ Vựng)', N'unknown', N'unknown', N'Japanese', N'assets/images/bookCover/B00064.jpg', N'Dekiru Nihongo Sơ Trung Cấp Kotoba Noto できる日本語わたしのことばノート　初中級 nằm trong bộ giáo trình tiếng Nhật Dekiru Nihongo sơ trung cấp, cung cấp hàng loạt các từ vựng thuộc các chủ đề trong sách giáo khoa, nhằm giúp người học nâng cao vốn từ thuộc nhiều chủ đề đồng thời vận dụng chúng để phát triển các kĩ năng khác như nghe, nói, đọc và viết.', 0, N'assets/pdfs/B00064.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C10', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00065', N'Người Bán Hàng Vĩ Đại Nhất Thế Giới', N'Og Mandino', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00065.png', N'"Người Bán Hàng Vĩ Đại Nhất Thế Giới" kể về câu chuyện của Hafid, một cậu bé chăn lạc đà nghèo, ở Jerusalem thời cổ đại.  Xuất thân là một cậu nhóc trông lạc đà cho đoàn buôn của Pathros, nhưng với quyết tâm đổi đời, muốn cải thiện vị trí của mình trong cuộc sống, Hafid luôn nuôi ước mơ được trở thành người bán hàng. Cậu tin chỉ như thế mình mới có cơ hội trở nên giàu có và thành công.

Giống như nhiều người theo đuổi đam mê khác, trong suốt hành trình ấy đôi lúc Hafid đã nghĩ đến việc quay trở về với công việc chăn lạc đà, kiếm những đồng xu lẻ sống qua ngày. Biết bao nhiêu mối suy tư nghi ngờ, thương tiếc bản thân đã nảy ra trong tâm trí và bủa vây lấy cậu, nhưng với ý chí và quyết tâm, cuối cùng Hafid cũng trở thành người bán hàng tài năng nhất lúc bấy giờ.

Bí mật nào đã làm nên thành công? Đó chính là những nguyên tắc được một thương nhân giàu có và thành công truyền lại và Hafid đã giữ kỹ trong 10 cuộn giấy da trong suốt hơn ba thập kỉ qua. Với Hafid, những thứ giản dị này còn quý hơn cả kim cương. Nhờ áp dụng những nguyên tắc trong cuộn giấy da đó mà Hafid được mệnh danh là “Người bán hàng vĩ đại nhất thế giới”. Tuy nhiên, sách không chỉ dạy bạn cách “bán hàng”, mà nó còn là một cuốn sách dạy bạn làm người, giúp bạn trở thành người “vĩ đại nhất” trong lĩnh vực mà bạn chọn.

Vậy những nguyên tắc ấy là gì và làm cách nào để đưa chúng vào thực tiễn? Những bí mật này chỉ được tiết lộ khi bạn cầm trên tay cuốn sách Người bán hàng vĩ đại nhất thế giới, đọc thật cẩn thận, tiếp thu và lưu từng chi tiết.

Cho đến nay, cuốn sách này được dịch ra 25 ngôn ngữ và đã bán hơn 50 triệu bản, trở thành cuốn sách gối đầu giường của nhiều doanh nhân và truyền lửa cho hàng triệu người. Khi cảm thấy chán nản hoặc sợ hãi, hãy đọc cuốn sách này thật chậm, rồi bạn sẽ cảm thấy nhẹ nhõm và trở nên thông suốt, nhận ra con đường dẫn đến thành công bằng cách lắng nghe sự khôn ngoan bên trong bản thân của mình.

 Ấn bản Người bán hàng vĩ đại nhất thế giới lần này được tổng hợp và chỉnh sửa nội dung từ bộ sách hai tập Người bán hàng vĩ đại nhất thế giới mà First News - Trí Việt đã xuất bản trước đây.

Mã hàng	8935086851524
Tên Nhà Cung Cấp	FIRST NEWS
Tác giả	Og Mandino
NXB	NXB Tổng Hợp TPHCM
Năm XB	2020
Trọng lượng (gr)	300
Kích Thước Bao Bì	20.5 x 13 cm
Số trang	296
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
FIRST NEWS
PNJ
Sách Kinh Tế
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Marketing - Bán Hàng bán chạy của tháng
"Người Bán Hàng Vĩ Đại Nhất Thế Giới" kể về câu chuyện của Hafid, một cậu bé chăn lạc đà nghèo, ở Jerusalem thời cổ đại.  Xuất thân là một cậu nhóc trông lạc đà cho đoàn buôn của Pathros, nhưng với quyết tâm đổi đời, muốn cải thiện vị trí của mình trong cuộc sống, Hafid luôn nuôi ước mơ được trở thành người bán hàng. Cậu tin chỉ như thế mình mới có cơ hội trở nên giàu có và thành công.

Giống như nhiều người theo đuổi đam mê khác, trong suốt hành trình ấy đôi lúc Hafid đã nghĩ đến việc quay trở về với công việc chăn lạc đà, kiếm những đồng xu lẻ sống qua ngày. Biết bao nhiêu mối suy tư nghi ngờ, thương tiếc bản thân đã nảy ra trong tâm trí và bủa vây lấy cậu, nhưng với ý chí và quyết tâm, cuối cùng Hafid cũng trở thành người bán hàng tài năng nhất lúc bấy giờ.', 0, NULL, N'assets/epubs/B00065.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00066', N'Nhà Lãnh Đạo Không Chức Danh', N'Robin Sharma', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00066.png', N'Suốt hơn 15 năm, Robin Sharma đã thầm lặng chia sẻ với những công ty trong danh sách Fortune 500 và nhiều người siêu giàu khác một công thức thành công đã giúp ông trở thành một trong những nhà cố vấn lãnh đạo được theo đuổi nhiều nhất thế giới. Đây là lần đầu tiên Sharma công bố công thức độc quyền này với bạn, để bạn có thể đạt được những gì tốt nhất, đồng thời giúp tổ chức của bạn có thể có những bước đột phá đến một cấp độ thành công mới trong thời đại thiên biến vạn hóa như hiện nay.', 0, N'assets/pdfs/B00066.pdf', N'assets/epubs/B00066.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00067', N'Lãnh Đạo Theo Giá Trị', N'Harry M Jansen Kraemer Jr', N'NXB Tổng hợp TP.HCM', N'Vietnamese', N'assets/images/bookCover/B00067.jpg', N'“Lãnh đạo theo giá trị” để trở thành công ty tốt nhất. Cuốn sách này cung cấp cho các nhà lãnh đạo cách thức kiến tạo công ty đẳng cấp thế giới với triết lý Lãnh đạo theo giá trị.

Nhu cầu và khao khát trở nên “tốt nhất” thông qua lãnh đạo dựa trên giá trị chưa bao giờ mạnh mẽ và cấp thiết như lúc này. Các tổ chức ngày nay - dù lớn hay nhỏ, công hay tư - đều phải đối mặt với các vấn đề bất ổn xung quanh các ranh giới về pháp lý, đạo đức và lương tâm. Trong bối cảnh phức tạp đó, các nhà lãnh đạo theo giá trị chỉ có một cách để xoay sở, đó là họ phải cam kết làm điều đúng đắn mọi nơi mọi lúc – và làm điều tốt nhất có thể.

Lãnh đạo theo giá trị không chỉ là một cuốn sách hướng dẫn cách phòng thủ, cho bạn cách phản ứng khi một tình huống khó khăn, một vấn đề hay một khủng khoảng nảy sinh. Nó là
một cách suy nghĩ, hành động và vận hành ở mọi cấp bậc trong tổ chức. 

Về mặt khái niệm, Lãnh đạo theo giá trị được hình thành trên bốn nguyên tắc: Tự vấn, Cân bằng, Tự tin và Khiêm nhường. Càng nắm bắt được các nguyên tắc này, các nhà lãnh đạo càng muốn tìm hiểu thêm cách áp dụng chúng trong cuộc sống hàng ngày. Đây hoàn toàn là khả năng ảnh hưởng lên người khác bằng cách gắn kết thực sự với mỗi cá nhân mà họ tiếp xúc. Từ các CEO, đến những người lần đầu làm sếp, cho đến các sinh viên đều muốn biết họ cần làm gì để tạo ra sự khác biệt trong tổ chức của họ và hơn thế nữa. Khi mọi người cam kết trở thành lãnh đạo theo giá trị, họ muốn biết chính xác điều cần làm để xúc tác thay đổi, đẩy mạnh kết quả và hiện thực hóa điều đó.

Ở cấp độ cá nhân, các nguyên tắc này trở thành nền tảng cho các hành động có chủ đích và cam kết thực sự để mỗi người, ở mọi cấp bậc trong tổ chức thể hiện tốt nhất khả năng của mình trong công việc. Tại cấp độ tổ chức, khi áp dụng bốn nguyên tắc này sẽ tạo ra cho chúng ta một tổ chức dựa vào giá trị.

Cuốn sách này vẽ ra một con đường bắt đầu từ việc hiểu rõ bốn nguyên tắc cho đến khi đưa chúng vào thực hành. Trên “con đường” đó, có năm lĩnh vực xác định ý nghĩa của việc trở thành lãnh đạo theo giá trị và xây dựng một tổ chức tầm cỡ thế giới từ Cái tôi tốt nhất đến Nhóm tốt nhất, Đối tác tốt nhất, Khoản đầu tư tốt nhất và Công dân tốt nhất. Những cái nhất này gắn kết với nhau trong một cấu trúc toàn diện thúc đẩy sự phát triển của tổ chức, con người và mục đích của tổ chức đó. Đây vừa là một cuộc cách mạng vừa là một sự tiến bộ và nó bắt đầu với bất kỳ ai khao khát trở thành một nhà lãnh đạo theo giá trị.', 0, NULL, N'assets/epubs/B00067.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00068', N'Lãnh Đạo Tỉnh Thức - The Mindful Leader', N'Michael Bunting', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00068.jpg', N'Cuốn sách này cho thấy rằng chúng ta thực sự có thể vừa là một nhà lãnh đạo doanh nghiệp thành công, vừa là một con người hiểu biết và đầy lòng trắc ẩn. Nếu bạn đang muốn tìm cách để đạt đến hạnh phúc đích thực và lãnh đạo hiệu quả thì đây là một cuốn sách tuyệt vời.
- Gordon Cairns, Chủ tịch, Woolworths Limited và Origin Energy

Mức độ lãnh đạo hiệu quả của bạn phụ thuộc vào khả năng tự nhận thức. Bạn càng tự nhận thức được, bạn càng có nhiều sức mạnh, trí khôn và lòng tốt để truyền được nhiều cảm hứng cho người bạn dẫn dắt. Mindfulness là chìa khoá mở ra sự tự nhận thức, cho phép bạn đạt được toàn bộ tiềm năng của mình và dẫn dắt đội ngũ và tổ chức đến tầm cao mới.', 0, NULL, N'assets/epubs/B00068.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00069', N'Dạy Con Làm Giàu - Tập 1', N'Robert T Kiyosaki', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00069.jpg', N'Người giàu không làm việc vì tiền. Họ bắt tiền làm việc cho họ. Chấp nhận thất bại là bước đầu của thành công? Quyền lực của sự lựa chọn! Những bài học không có trong nhà trường. Hãy bắt đầu từ hôm nay “để không có tiền vẫn tạo ra tiền”….', 0, N'assets/pdfs/B00069.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00070', N'Netflix: Phá Bỏ Nguyên Tắc Để Bứt Phá', N'Reed Hastings, Erin Meyer', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00070.jpg', N'Netflix: Phá Bỏ Nguyên Tắc Để Bứt Phá

Từ trước đến nay chưa từng có công ty nào như Netflix. Họ đã dẫn dắt cuộc cách mạng trong ngành giải trí, thu về hàng tỉ đôla doanh thu hằng năm bằng cách thu hút trí tưởng tượng của hàng trăm triệu khách hàng trên hơn 190 quốc gia.

Ra đời năm 1988 là một dịch vụ cho thuê DVD trực tuyến, nhà sáng lập Reed Hastings của Netflix đã từ bỏ những cách làm truyền thống mà nhiều công ty khác vẫn vận hành. Thay vào đó, ông xây dựng một văn hóa tập trung vào tự do và trách nhiệm, giúp Netflix tự tái tạo hết lần đến lần khác, thích nghi và đổi mới khi nhu cầu của thế giới xung quanh cũng như của các thành viên công ty thay đổi.

Hastings đặt ra những tiêu chuẩn mới, xem trọng con người hơn quy trình, nhấn mạnh đổi mới hơn hiệu quả, và trao cho nhân viên bối cảnh thay vì kiểm soát họ. Netflix không có chính sách ngày phép hay quy định công tác phí. Tại Netflix, người có kết quả làm việc bình thường nhận được gói trợ cấp thôi việc hào phóng, và làm việc chăm chỉ là không cần thiết. Tại Netflix, bạn không cần cố gắng làm hài lòng cấp trên, bạn phải đưa ra phản hồi trung thực.

Lần đầu tiên, trong tác phẩm này, Hastings và Erin Meyer, tác giả cuốn sách "The Culture Map" và là một trong những nhà tư tưởng kinh doanh có tầm ảnh hưởng lớn nhất, cùng đi sâu vào các triết lý gây tranh cãi là tâm điểm của tinh thần Netflix. Dựa trên phỏng vấn nhân viên Netflix từ khắp thế giới và những câu chuyện chưa từng được tiết lộ về sự nghiệp của Hastings, "Netflix: Phá bỏ nguyên tắc để bứt phá" (tựa gốc: No Rules Rules) là câu chuyện thú vị nhưng chưa từng được kể về một trong những công ty đột phá, sáng tạo, và thành công nhất thế giới.

Văn hóa độc đáo “Nguyên tắc là không có nguyên tắc” giải thích sự chuyển mình với tốc độ ánh sáng của một dịch vụ cho thuê DVD qua đường bưu điện thành một trong những doanh nghiệp đột phá và thành công nhất trong lịch sử: thống lĩnh thị trường phát trực tuyến toàn cầu, thách thức những công ty như Disney.

Bất cứ ai làm công việc kiến tạo, lãnh đạo, hay khát khao muốn đột phá đều muốn đọc cuốn sách này!

Mã hàng	8934974176091
Tên Nhà Cung Cấp	NXB Trẻ
Tác giả	Reed Hastings, Erin Meyer
Người Dịch	Trần Thị Ngân Tuyến
NXB	NXB Trẻ
Năm XB	2022
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	420
Kích Thước Bao Bì	23 x 15.5 cm
Số trang	406
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
NXB Trẻ
Sách Kinh Tế
Sản phẩm bán chạy nhất	Top 100 sản phẩm Nhân vật - Bài Học Kinh doanh bán chạy của tháng
Netflix: Phá Bỏ Nguyên Tắc Để Bứt Phá

Từ trước đến nay chưa từng có công ty nào như Netflix. Họ đã dẫn dắt cuộc cách mạng trong ngành giải trí, thu về hàng tỉ đôla doanh thu hằng năm bằng cách thu hút trí tưởng tượng của hàng trăm triệu khách hàng trên hơn 190 quốc gia.

Ra đời năm 1988 là một dịch vụ cho thuê DVD trực tuyến, nhà sáng lập Reed Hastings của Netflix đã từ bỏ những cách làm truyền thống mà nhiều công ty khác vẫn vận hành. Thay vào đó, ông xây dựng một văn hóa tập trung vào tự do và trách nhiệm, giúp Netflix tự tái tạo hết lần đến lần khác, thích nghi và đổi mới khi nhu cầu của thế giới xung quanh cũng như của các thành viên công ty thay đổi.

Hastings đặt ra những tiêu chuẩn mới, xem trọng con người hơn quy trình, nhấn mạnh đổi mới hơn hiệu quả, và trao cho nhân viên bối cảnh thay vì kiểm soát họ. Netflix không có chính sách ngày phép hay quy định công tác phí. Tại Netflix, người có kết quả làm việc bình thường nhận được gói trợ cấp thôi việc hào phóng, và làm việc chăm chỉ là không cần thiết. Tại Netflix, bạn không cần cố gắng làm hài lòng cấp trên, bạn phải đưa ra phản hồi trung thực.', 0, NULL, N'assets/epubs/B00070.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00071', N'Đầu Tư Tài Chính', N'Nhiều Tác Giả', N'NXB Kinh tế TP.Hồ Chí Minh', N'Vietnamese', N'assets/images/bookCover/B00071.png', N'Đầu Tư Tài Chính

Bạn muốn được tự do, bạn muốn thoải mái trong cuộc sống thường nhật và không phải trả lời bất cứ ai!

Bạn khao khát có nhiều thời gian hơn ở bên cạnh những người thân yêu của mình mà vẫn có thu nhập để nuôi sống gia đình!

Đầu tư tài chính giúp bạn hoàn thành giấc mơ tự do tài chính đó, nghĩa là bạn không hề có cấp trên, thoái mái đi du lịch và làm việc khắp nơi trên thế giới!

Đó là cuộc sống của mộtnhà đầu tư tài chính thành công.', 0, N'assets/pdfs/B00071.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00072', N'The Little Book - Định Giá Cổ Phiếu Đầu Tư Giá Trị', N'Aswath Damodaran', N'NXB Dân Trí', N'Vietnamese', N'assets/images/bookCover/B00072.png', N'Định giá là hoạt động trọng tâm của mọi quyết định đầu tư, cho dù bạn đang cân nhắc giữa việc mua, bán hay tiếp tục nắm giữ cổ phiếu. Trong cuốn sách “The little book - Định giá cổ phiếu, đầu tư giá trị”, chuyên gia Aswath Damodaran giải thích các kỹ thuật định giá theo từng bước khoa học và thực tiễn để bất kỳ nhà đầu tư nào cũng có thể thấu hiểu, từ đó chủ động và hiệu quả hơn trong việc nghiên cứu dữ liệu, tự mình định giá và chọn cổ phiếu.

Bạn có biết một cổ phần tại Google hoặc Apple thực sự đáng giá như thế nào không? Giá trị của một căn hộ hoặc ngôi nhà mà bạn vừa mua thì sao? Bạn có nên quan tâm không? Biết được giá trị của một cổ phiếu, trái phiếu, hoặc bất động sản có thể không phải là điều kiện tiên quyết để đầu tư thành công, nhưng nó giúp bạn có nhiều thông tin hơn khi đưa ra quyết định.', 0, NULL, N'assets/epubs/B00072.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C06', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00073', N'Chính Trị Đảng Phái Tại Hoa Kỳ - Parties Politics In America', N'Marjorie Randon Hershey', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00073.png', N'“Chính Trị Đảng Phái Tại Hoa Kỳ” (tên tiếng anh: “Parties Politics in America”) là cuốn giáo trình kinh điển về các đảng chính trị, được sử dụng rộng rãi trong giảng dạy tại các trường đại học của Mỹ.

Cuốn sách này liên tục được cập nhật nhưng mục đích thì không đổi. Hiện nay cuốn sách đã được tái bản 17 lần, phiên bản tiếng Việt này dựa trên ấn bản thứ 16.

Frank J. Sorauf, một người tiên phong trong khoa học chính trị hiện đại, đã khởi xướng tác phẩm vào năm 1968, và Paul Allen Beck đưa cuốn sách tới công chúng vào thập niên 1980, 1990, với sự hiểu biết sâu rộng và góc nhìn mang tính chất so sánh ghi dấu các nghiên cứu của ông về đảng phái và hành vi bầu cử. Marjorie Randon Hershey là người đã cập nhật cho cuốn sách này từ ấn bản thứ 9 – từ năm 2001 đến nay.', 0, NULL, N'assets/epubs/B00073.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C04', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00074', N'Nghệ Thuật Phỏng Vấn Chính Trị', N'Tom Plate', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00074.jpg', N'Nghệ Thuật Phỏng Vấn Chính Trị

Trong nhiều thập kỷ, nhà báo kỳ cựu Tom Plate, và cũng là tác giả của loạt sách "Những người khổng lồ châu Á", đã và đang thực hiện nhiều cuộc phỏng vấn nổi bật với các tổng thống tới thủ tướng cho đến các thành viên băng đảng. Một số người dễ nói chuyện, những người khác là những thách thức phức tạp.

Trong cuốn sách sâu sắc này, Plate đưa ra một cái nhìn thẳng thắn về cách tiến hành một cuộc phỏng vấn VIP. Liệu phương pháp đâm chọc có khôn ngoan không? ‘Câu hỏi Viagra’ là gì? Lễ nghĩa phỏng vấn có tồn tại không? Ông cho ta biết quan điểm của một người trong cuộc về những gì xảy ra khi cánh cửa đóng lại, tập ghi chú được lôi ra, và cuộc trò chuyện chính trị bắt đầu.

Với những mô tả súc tích, những câu chuyện nội bộ và những hiểu biết về các nhà lãnh đạo chính trị như Jimmy Carter, Keizo Obuchi, Lý Quang Diệu, Ngô Tác Đống, Ronald Reagan, Margaret Thatcher, Yitzak Rabin, Kim Dae Jung, và nhiều người khác, đây là một quyển sách quan trọng, không chỉ tiết lộ nhiều điều mà còn mang tính giải trí – nửa giáo khoa, nửa hồi ký… và tất cả đều đúng

Mã hàng	8934974156710
Tên Nhà Cung Cấp	NXB Trẻ
Tác giả	Tom Plate
Người Dịch	Lê Thùy Giang
NXB	NXB Trẻ
Năm XB	2018
Trọng lượng (gr)	280
Kích Thước Bao Bì	15.5 x 23
Số trang	276
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
NXB Trẻ
Sản phẩm bán chạy nhất	Top 100 sản phẩm Triết Học- Lý Luận Chính Trị bán chạy của tháng
Nghệ Thuật Phỏng Vấn Chính Trị

Trong nhiều thập kỷ, nhà báo kỳ cựu Tom Plate, và cũng là tác giả của loạt sách "Những người khổng lồ châu Á", đã và đang thực hiện nhiều cuộc phỏng vấn nổi bật với các tổng thống tới thủ tướng cho đến các thành viên băng đảng. Một số người dễ nói chuyện, những người khác là những thách thức phức tạp.

Trong cuốn sách sâu sắc này, Plate đưa ra một cái nhìn thẳng thắn về cách tiến hành một cuộc phỏng vấn VIP. Liệu phương pháp đâm chọc có khôn ngoan không? ‘Câu hỏi Viagra’ là gì? Lễ nghĩa phỏng vấn có tồn tại không? Ông cho ta biết quan điểm của một người trong cuộc về những gì xảy ra khi cánh cửa đóng lại, tập ghi chú được lôi ra, và cuộc trò chuyện chính trị bắt đầu.

Với những mô tả súc tích, những câu chuyện nội bộ và những hiểu biết về các nhà lãnh đạo chính trị như Jimmy Carter, Keizo Obuchi, Lý Quang Diệu, Ngô Tác Đống, Ronald Reagan, Margaret Thatcher, Yitzak Rabin, Kim Dae Jung, và nhiều người khác, đây là một quyển sách quan trọng, không chỉ tiết lộ nhiều điều mà còn mang tính giải trí – nửa giáo khoa, nửa hồi ký… và tất cả đều đúng', 0, NULL, N'assets/epubs/B00074.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C04', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00075', N'Shinzo Abe & Gia Tộc Tuyệt Đỉnh', N'Kenya Matsuda', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00075.jpg', N'Shinzo Abe & Gia Tộc Tuyệt Đỉnh

Đuổi theo hình bóng nguyên Thủ tướng Nobusuke Kishi để nghiên cứu về gia tộc của Shizo Abe! Gia tộc tuyệt đỉnh duy trì “huyết thống gia tộc” bằng việc nhiều lần tiến hành cho – nhận con nuôi giữa 2 dòng họ quyền quý. Khởi đầu bởi “Quái vật Showa” Nobusuke Kishi, ngày nay cháu ngoại của ông là đương kim Thủ tướng Shinzo Abe vẫn đang mải miết phấn đấu trên chính trường với sự hỗ trợ của “Người mẹ thần thánh” Yoko Abe.', 0, NULL, N'assets/epubs/B00075.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00076', N'Gã Nghiện Giày - Tự Truyện Của Nhà Sáng Lập Nike', N'Phil Knight', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00076.jpg', N'Gã Nghiện Giày - Tự Truyện Của Nhà Sáng Lập Nike

Một câu chuyện cuốn hút, và truyền cảm hứng.... 24 tuổi, lấy bằng MBA ở Đại học Stanford, trăn trở với những câu hỏi lớn của cuộc đời, băn khoăn không biết tiếp tục làm việc cho một tập đoàn lớn hay tạo dựng sư nghiệp riêng cho mình... 24 tuổi, năm 1962, Phil Knight quyết định rằng con đường khác thường mới là lựa chọn duy nhất dành cho ông... Rồi ông khoác ba lô đi đến Tokyo, Hongkong, Bangkok, Việt Nam, Calcutta, Kathmandu, Bombay, Cairo, Jerusalem, Rome, Florence, Milan, Venice, Paris,, Munich, Vienna, London, Hy Lạp... Để rồi khi về lại quê nhà ở bang Oregon, ông quyết định mở công ty nhập khẩu giày chạy từ Nhật. Ban đầu chỉ một đôi để thử, rồi vài chục đôi, bán tại tầng hầm của gia đình bố mẹ Phil. Đam mê, quyết tâm, dám chấp nhận thất bại, vượt qua nhiều chông gai từ chuyện thiếu vốn, đến chuyện cạnh tranh từ đối thủ nhập khẩu khác… Phil Knight đã đưa công ty nhập khẩu giày ra đời với 50 đô-la mượn của bố phát triển đến doanh nghiệp có doanh số hơn 1 triệu đô-la chỉ 10 năm sau đó, năm 1972.', 0, N'assets/pdfs/B00076.pdf', N'assets/epubs/B00076.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C08', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00077', N'Văn Học Trong Nhà Trường: Thơ Xuân Quỳnh', N'Xuân Quỳnh', N'NXB Kim Đồng', N'Vietnamese', N'assets/images/bookCover/B00077.png', N'“Thế giới thơ ca Xuân Quỳnh là sự tương tranh không ngừng giữa khắc nghiệt và yên lành với những biểu hiện sống động và biến hóa khôn cùng của chúng. Ở đó trái tim thơ Xuân Quỳnh là cánh chuồn chuồn báo bão cứ chao đi chao về, mệt nhoài giữa biến động và yên định, bão tố và bình yên, chiến tranh và hòa bình, thác lũ và êm trôi, tình yêu và cách trở, ra đi và trở lại, chảy trôi phiêu bạt và trụ vững kiên gan, tổ ấm và dòng đời, sóng và bờ, thuyền và biển, nhà ga và con tàu, trời xanh và bom đạn, gió Lào và cát trắng, cỏ dại và nắng lửa, thủy chung và trắc trở, xuân sắc và tàn phai, ngọn lửa cô đơn và đại ngàn tối sẫm...” (Nhà phê bình CHU VĂN SƠN)

“Xuân Quỳnh là hiện tượng rất quan trọng của nền thơ của chúng ta. Có lẽ là từ thời Hồ Xuân Hương, qua các chặng phát triển, phải đến Xuân Quỳnh, nền thơ ấy mới thấy lại một nữ thi sĩ đầy tài năng và sự đa dạng của một tâm hồn được thể hiện ở một tầm cỡ đáng kể như vậy, dồi dào phong phú như vậy.” (Nhà phê bình LẠI NGUYÊN ÂN).', 0, NULL, N'assets/epubs/B00077.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0001', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00078', N'Bố Già', N'NXB Dân Trí', N'Mario Puzo', N'Vietnamese', N'assets/images/bookCover/B00078.jpg', N'Bố Già (Đông A)

Thế giới ngầm được phản ánh trong tiểu thuyết Bố già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố già là sự tổng hòa của mọi hiểu biết. Bố già là đáp án cho mọi câu hỏi”.

Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.

Năm 2014, Đông A giới thiệu tới bạn đọc tác phẩm Bố già có bản quyền chính thức tại Việt Nam qua bản dịch lôi cuốn, hấp dẫn của Ngọc Thứ Lang.

Vài nét về tác giả:

Mario Puzo (1920 - 1999) là nhà văn, nhà biên kịch người Mỹ gốc Italy nổi tiếng với nhiều tiểu thuyết về đề tài mafia và tội phạm. Bố già (The Godfather) xuất bản năm 1969 là đỉnh cao của dòng văn chương hư cấu này, đồng thời là tác phẩm đưa Puzo lên tột đỉnh vinh quang. Đây cũng là một trong những tiểu thuyết bán chạy nhất mọi thời đại. Ngoài Bố già, Mario Puzo còn nổi tiếng với các tiểu thuyết khác như Sicilian khúc ca bi tráng, Luật im lặng, Ông trùm quyền lực cuối cùng, Gia đình Giáo hoàng…

Vài nét về dịch giả:

Ngọc Thứ Lang tên thật là Nguyễn Ngọc Tú, biệt danh là công tử Bắc Kỳ, vào Sài Gòn lập nghiệp khoảng năm 1950. Ngọc Thứ Lang là dịch giả của thời kì trước năm 1975, đã chuyển ngữ nhiều tác phẩm nhưng có lẽ Bố già là một dấu son trong sự nghiệp của ông.

Năm 1972, bản dịch Bố già của Ngọc Thứ Lang chuyển ngữ từ nguyên bản tiếng Anh ra mắt và đã thu hút được sự chú ý của rất nhiều độc giả. Nếu như The Godfather của Mario Puzo khi vừa xuất bản đã nằm trong danh sách sách bán chạy nhất suốt 67 tuần thì Bố già của Ngọc Thứ Lang cũng “làm mưa làm gió” trên thị trường văn học dịch của Sài Gòn những năm 70 của thế kỉ trước.

Cái hay, cái khiến người đọc say mê Bố già có lẽ nằm ở chính giọng văn đậm chất giang hồ súng đạn của người dịch. Và bản thân cái tên Bố già cũng là một sáng tạo vô tiền khoáng hậu của Ngọc Thứ Lang. Nhiều độc giả Việt Nam nói rằng nếu đọc The Godfather của Mario Puzo, hãy tìm đúng bản dịch của Ngọc Thứ Lang để thấy chất đàn ông trong đó…

Nhận xét về tác phẩm:

“Bố già là sự tổng hòa của mọi hiểu biết. Bố già là đáp án cho mọi câu hỏi.” - Diễn viên Tom Hanks

“Bạn không thể dừng đọc nó và khó lòng ngừng mơ về nó.” - New York Times Magazine

“Một tác phẩm kinh điển về mafia… Tự bản thân nó đã tạo ra một thứ bùa mê hoặc độc giả.”- The Times

 

Mã hàng	8936071673381
Tên Nhà Cung Cấp	Đông A
Tác giả	Mario Puzo
NXB	NXB Dân Trí
Năm XB	09-2016
Trọng lượng (gr)	620
Kích Thước Bao Bì	21 x 15
Số trang	642
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Đông A
PNJ
Sách Kinh Điển Chuyển Thể Thành Phim
Super Sale Thương Hiệu
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tiểu thuyết bán chạy của tháng
Bố Già (Đông A)

Thế giới ngầm được phản ánh trong tiểu thuyết Bố già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố già là sự tổng hòa của mọi hiểu biết. Bố già là đáp án cho mọi câu hỏi”.

Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.', 0, NULL, N'assets/epubs/B00078.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00079', N'Cho Tôi Xin Một Vé Đi Tuổi Thơ', N'Nguyễn Nhật Ánh', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00079.jpg', N'Trong Cho tôi xin một vé đi tuổi thơ, nhà văn Nguyễn Nhật Ánh mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan hệ với con mình.', 0, NULL, N'assets/epubs/B00079.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00080', N'Cà Phê Cùng Tony', N'Tony Buổi Sáng', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00080.jfif', N'Cà Phê Cùng Tony

Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.

Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.

Tony Buổi Sáng cũng là tác giả của Trên đường băng, tác phẩm hiện đã bán hơn 200.000 bản.

***

Trích đoạn:

... Thật ra Tony hiểu vì sao các bác giáo sư tiến sĩ soạn sách đã phải đưa vào nhiều nội dung như vậy. Rất là tâm huyết và đáng trân trọng. Vì ngày xưa, kiến thức rất khó tìm. Nhiều điều hữu ích chỉ nằm trong sách, trong thư viện các thành phố lớn, các trường các viện đại học lớn và người ta phải nhớ mọi thứ, nên phải cộng điểm cho học sinh nông thôn vì ít cơ hội tiếp cận kiến thức. Nhưng, bây giờ kiến thức nằm hết trên mạng, trong file máy tính, truy cập là ra ngay, nên các nước đã phải thay đổi chương trình học phổ thông sau khi máy tính và internet ra đời. Học sinh chỉ cần nhớ những gì cốt lõi, và PHƯƠNG PHÁP tìm kiếm tài liệu. Vì chữ nghĩa rồi cũng sẽ rụng rơi theo thời gian, kiến thức mới lại bổ sung liên tục, nên phương pháp tìm kiếm thông tin tốt sẽ giúp ích cho các bạn trong cuộc sống sau này. Làm ngành nghề gì cũng phải cập nhật cái mới...

Mã hàng	8934974151579
Tên Nhà Cung Cấp	NXB Trẻ
Tác giả	Tony Buổi Sáng
NXB	NXB Trẻ
Năm XB	2017
Trọng lượng (gr)	240
Kích Thước Bao Bì	13 x 20
Số trang	268
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
NXB Trẻ
PNJ
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Truyện ngắn - Tản Văn bán chạy của tháng
Cà Phê Cùng Tony

Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.

Chúng tôi tin rằng những người trẻ tuổi luôn mang trong mình khát khao vươn lên và tấm lòng hướng thiện, và có nhiều cách để động viên họ biến điều đó thành hành động. Nếu như tập sách nhỏ này có thể khơi gợi trong lòng bạn đọc trẻ một cảm hứng tốt đẹp, như tách cà phê thơm vào đầu ngày nắng mới, thì đó là niềm vui lớn của tác giả Tony Buổi Sáng.', 0, NULL, N'assets/epubs/B00080.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00081', N'Quẳng Gánh Lo Đi Và Vui Sống', N'Dale Carnegie', N'NXB Tổng Hợp TPHCM', N'Vietnamese', N'assets/images/bookCover/B00081.jpg', N'Quẳng Gánh Lo Đi Và Vui Sống là cuốn sách mà cái tên đã nói lên tất cả nội dung chuyển tải trên những trang giấy.

Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,… Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.

Nói thì có vẻ dễ nhưng những vấn đề liên quan đến các trạng thái tinh thần chẳng bao giờ dễ giải quyết. Chấm dứt lo lắng là điều không thể nhưng bớt đi sự lo lắng thì có thể, chỉ cần bạn đủ quyết tâm.

Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn những cách để giảm thiểu lo lắng rất đơn giản như chia sẻ nó với người khác, tìm cách giải quyết vấn đề, quên tất cả những điều lo lắng nằm ngoài tầm tay,... Cố gắng thực tập điều này hàng ngày và trong cuộc sống chắc hẳn bạn sẽ thành công, có thể, không được như bạn muốn, nhưng chỉ cần bớt đi một chút phiền muộn thì cuộc sống của bạn đã có thêm một niềm vui.

Nhờ các phương pháp của Dale Carnegie, hàng triệu người đọc đã xây dựng được thái độ sống tích cực, an tâm cảm nhận hạnh phúc và mãi mãi loại bỏ thói quen lo lắng:

Hãy đóng chặt những cánh cửa sắt dẫn đến quá khứ và tương lai. Chỉ sống trong những vách ngăn của hiện tại.

Nhìn nhận những mặt tích cực của cuộc sống

Khi làm việc đến quên mình, ta cũng quên đi mọi lo lắng

Thử kiểm tra theo luật bình quân, xác suất xảy ra điều bạn đang lo lắng là bao nhiêu phần trăm?

Luôn nỗ lực hết mình

Hãy nghĩ đến những may mắn bạn có được chứ không phải là những rắc rối

Hãy quên đi bản thân bằng cách quan tâm đến người khác. Mỗi ngày làm một điều tốt có thể khiến ai đó mỉm cười.

Qua hơn nửa thế kỷ, những lời khuyên thiết thực và sâu sắc của Dale Carnegie vẫn còn nguyên giá trị cho đến ngày nay. Ngay bây giờ, bạn đã có thể ghi tên mình vào danh sách hàng triệu con người đã học được cách: Quẳng gánh lo đi và vui sống!

BÁO CHÍ NÓI VỀ CUỐN SÁCH

“Đây là cuốn sách kinh điển, được xem là cẩm nang giúp người đọc có thể tự nhìn nhận và vượt qua sự lo lắng, bất an của bản thân”. - Nhịp cầu đầu tư

VỀ TÁC GIẢ

Dale Breckenridge Carnegie (24 tháng 11 năm 1888 – 1 tháng 11 năm 1955) là một nhà văn và nhà thuyết trình Mỹ và là người phát triển các lớp tự giáo dục, nghệ thuật bán hàng, huấn luyện đoàn thể, nói trước công chúng và các kỹ năng giao tiếp giữa mọi người. Ra đời trong cảnh nghèo đói tại một trang trại ở Missouri, ông là tác giả cuốn Đắc Nhân Tâm, được xuất bản lần đầu năm 1936, một cuốn sách thuộc hàng bán chạy nhất và được biết đến nhiều nhất cho đến tận ngày nay. Ông cũng viết một cuốn tiểu sử Abraham Lincoln, với tựa đề Lincoln con người chưa biết, và nhiều cuốn sách khác.

Carnegie là một trong những người đầu tiên đề xuất cái ngày nay được gọi là đảm đương trách nhiệm, dù nó chỉ được đề cập tỉ mỉ trong tác phẩm viết của ông. Một trong những ý tưởng chủ chốt trong những cuốn sách của ông là có thể thay đổi thái độ của người khác khi thay đổi sự đối xử của ta với họ.

Trích đoạn hay

Ngày hôm nay chính là tài sản quý giá nhất của chúng ta. Nó là tài sản duy nhất chúng ta chắc chắn có.

Trên bàn làm việc của nhà văn John Ruskin có một hòn đá đơn sơ, trên đó nổi bậc một từ rõ nét: Ngày hôm nay. Tuy không có hòn đá như thế nhưng tôi đã dán một bài thơ lên tấm gương soi để mình có thể nhìn vào mỗi sáng. Đó là bài thơ của Kalidasa, nhà soạn kịch nổi tiếng người Ấn Độ.

LỜI CHÀO NGÀY MỚI

Hãy sống trọn vẹn ngày hôm nay!

Vì đó chính là cuộc sống, cuộc sống thực sự

Một ngày – Ôi thời gian ngắn ngủi!

Chứa trọn mọi điều sự thật đời ta:

Niềm vui trưởng thàn

Sự hãnh diện khi hành động

Nét rực rỡ của dung nhan.

Quá khứ chỉ là một giấc mơ

Và tương lai là một viễn ảnh.

Sống hết mình trong hiện tại là làm đẹp mỗi ngày qua

Và biến mỗi ngày mai thành ngày chứa chan hy vọng …

Vì thế, để thoát khỏi những lo lắng, phiền muộn, điều đầu tiên bạn cần phải làm là:

“Hãy đóng chặt những cánh cửa nặng nề dẫn đến quá khứ và tương lai. Hãy sống với ngày hôm nay, tận dụng tối đa 24 giờ quý giá của một ngày.”

Sao bạn không tự hỏi bản thân mình và đi tìm câu trả lời cho những câu hỏi sau:

1/ Liệu tôi có đang lảng tránh cuộc sống hiện tại vì cứ mãi lo nghĩ cho tương lai hay mơ tưởng đến “một vườn hồng huyền ảo ở tít tận chân trời”.

2/ Liệu tôi có làm u ám ngày hôm nay của mình bằng những hối tiếc về những điều đã qua?

3/ Liệu mỗi sáng thức dậy, tôi có quyết tâm “sống trọn ngày hôm nay” để sử dụng triệt để 24 giờ mà cuộc sống đem đến cho tôi?

4/ Liệu tôi có thể sống tốt hơn khi chọn cách “sống trong ngăn kín của hiện tai” này không?

Khi nào tôi nên bắt đầu? Tuần sau?…. Ngày mai?…. Hay Hôm nay?

Mã hàng	8935086854747
Tên Nhà Cung Cấp	FIRST NEWS
Tác giả	Dale Carnegie
Người Dịch	Nguyễn Văn Phước
NXB	NXB Tổng Hợp TPHCM
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	350
Kích Thước Bao Bì	20.5 x 14.5 cm
Số trang	312
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Tủ Sách Tâm Lý Kỹ Năng
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng
Quẳng Gánh Lo Đi Và Vui Sống là cuốn sách mà cái tên đã nói lên tất cả nội dung chuyển tải trên những trang giấy.

Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,… Cuộc sống không dễ dàng giải thoát bạn khỏi căng thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.

Nói thì có vẻ dễ nhưng những vấn đề liên quan đến các trạng thái tinh thần chẳng bao giờ dễ giải quyết. Chấm dứt lo lắng là điều không thể nhưng bớt đi sự lo lắng thì có thể, chỉ cần bạn đủ quyết tâm.', 0, NULL, N'assets/epubs/B00081.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00082', N'Bước Chậm Lại Giữa Thế Gian Vội Vã', N'Hae Min', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00082.jpg', N'Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc tan sở, quay cuồng với thi cử và tiến độ công việc, lu bù vướng mắc trong những mối quan hệ cả thân lẫn sơ… bạn có luôn cảm thấy thế gian xung quanh mình đang xoay chuyển quá vội vàng?

Nếu có thể, hãy tạm dừng một bước.

Để tự hỏi, là do thế gian này vội vàng hay do chính tâm trí bạn đang quá bận rộn? Để cầm cuốn sách nhỏ dung dị mà lắng đọng này lên, chậm rãi lật giở từng trang, thong thả khám phá những điều mà chỉ khi bước chậm lại mới có thể thấu rõ: về các mối quan hệ, về chính bản thân mình, về những trăn trở trước cuộc đời và nhân thế, về bao điều lý trí rất hiểu nhưng trái tim chưa cách nào nghe theo…

Ra mắt lần đầu năm 2012, Bước chậm lại giữa thế gian vội vã của Đại đức Hae Min đã liên tục đứng đầu danh sách best-seller của nhiều trang sách trực tuyến uy tín của Hàn Quốc, trở thành cuốn sách chữa lành cho hàng triệu người trẻ luôn tất bật với nhịp sống hiện đại hối hả.

 

Mã hàng	8935235217737
Tên Nhà Cung Cấp	Nhã Nam
Tác giả	Hae Min
Người Dịch	Nguyễn Việt Tú Anh
NXB	NXB Hội Nhà Văn
Năm XB	2018
Trọng lượng (gr)	280
Kích Thước Bao Bì	14 x 20.5
Số trang	254
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Flashsale
Mã Giảm Giá
Nhã Nam
PNJ
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tiểu thuyết bán chạy của tháng
Bước Chậm Lại Giữa Thế Gian Vội Vã (Tái Bản 2018)

Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc tan sở, quay cuồng với thi cử và tiến độ công việc, lu bù vướng mắc trong những mối quan hệ cả thân lẫn sơ… bạn có luôn cảm thấy thế gian xung quanh mình đang xoay chuyển quá vội vàng?

Nếu có thể, hãy tạm dừng một bước.

Để tự hỏi, là do thế gian này vội vàng hay do chính tâm trí bạn đang quá bận rộn? Để cầm cuốn sách nhỏ dung dị mà lắng đọng này lên, chậm rãi lật giở từng trang, thong thả khám phá những điều mà chỉ khi bước chậm lại mới có thể thấu rõ: về các mối quan hệ, về chính bản thân mình, về những trăn trở trước cuộc đời và nhân thế, về bao điều lý trí rất hiểu nhưng trái tim chưa cách nào nghe theo…', 0, NULL, N'assets/epubs/B00082.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00083', N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ', N'Trác Nhã', N'NXB Văn Học', N'Vietnamese', N'assets/images/bookCover/B00083.png', N'Trong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc… không thể không cần đến kĩ năng và khả năng giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở ngại khó khăn.', 0, N'assets/pdfs/B00083.pdf', N'assets/epubs/B00083.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00084', N'Rèn Luyện Tư Duy Phản Biện', N'Albert Rutherford', N'NXB Phụ Nữ Việt Nam', N'Vietnamese', N'assets/images/bookCover/B00084.png', N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!

Những người tư duy phản biện cũng biết rằng họ cần thu thập những ý tưởng và đức tin của mọi người. Tư duy phản biện không thể tự nhiên mà có.

Những người khác có thể đưa ra những góc nhìn khác mà bạn có thể chưa bao giờ nghĩ tới, và họ có thể chỉ ra những lỗ hổng trong logic của bạn mà bạn đã hoàn toàn bỏ qua. Bạn không cần phải hoàn toàn đồng ý với ý kiến của những người khác, bởi vì điều này cũng có thể dẫn tới những vấn đề liên quan đến thiên kiến, nhưng một cuộc thảo luận phản biện là một bài tập tư duy cực kỳ hiệu quả.

Việc lắng nghe những ý kiến của người khác cũng có thể giúp bạn nhận ra rằng phạm vi tri thức của bạn không phải là vô hạn. Không ai có thể biết hết tất cả mọi thứ. Nhưng với việc chia sẻ và đánh giá phê bình kiến thức, chúng ta có thể mở rộng tâm trí. Nếu điều này khiến bạn cảm thấy không thoải mái, không sao cả. Trên thực tế, bước ra ngoài vùng an toàn là một điều quan trọng để mở rộng niềm tin và suy nghĩ của bạn. Tư duy phản biện không phải là chỉ biết vài thứ, và chắc chắn không phải việc xác nhận những điều bạn đã biết. Thay vào đó, nó xoay quanh việc tìm kiếm sự thật – và biến chúng trở thành thứ bạn biết.

Mã hàng	8936066687812
Tên Nhà Cung Cấp	1980 Books
Tác giả	Albert Rutherford
Người Dịch	Nguyễn Ngọc Anh
NXB	NXB Phụ Nữ Việt Nam
Năm XB	2020
Trọng lượng (gr)	300
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
1980 Books
Đồ Chơi Cho Bé - Giá Cực Tốt
Flashsale
Mã Giảm Giá
PNJ
Tủ Sách Tâm Lý Kỹ Năng
VNPAY
Sản phẩm bán chạy nhất	Top 100 sản phẩm Kỹ năng sống bán chạy của tháng
Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!', 0, NULL, N'assets/epubs/B00084.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C01', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00085', N'Rừng Nauy', N'Haruki Murakami', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00085.png', N'Câu chuyện bắt đầu từ một chuyến bay trong ngày mưa ảm đạm, một người đàn ông 37 tuổi chợt nghe thấy bài hát gắn liền với hình ảnh người yêu cũ, thế là quá khứ ùa về xâm chiếm thực tại. Mười tám năm trước, người đàn ông ấy là chàng Toru Wanatabe trẻ trung, mỗi chủ nhật lại cùng nàng Naoko lang thang vô định trên những con phố Tokyo. Họ sánh bước bên nhau để thấy mình còn sống, còn tồn tại, và gắng gượng tiếp tục sống, tiếp tục tồn tại sau cái chết của người bạn cũ Kizuki. Cho đến khi Toru nhận ra rằng mình thực sự yêu và cần có Naoko thì cũng là lúc nàng không thể chạy trốn những ám ảnh quá khứ, không thể hòa nhập với cuộc sống thực tại và trở về dưỡng bệnh trong một khu trị liệu khép kín. Toru, bên cạnh giảng đường vô nghĩa chán ngắt, bên cạnh những đêm chơi bời chuyển từ cảm giác thích thú đến uể oải, ghê tởm...vẫn kiên nhẫn chờ đợi và hy vọng vào sự hồi phục của Naoko. Cuối cùng, những lá thư, những lần thăm hỏi, hồi ức về lần ân ái duy nhất của Toru không thể níu Naoko ở lại, nàng chọn cái chết như một lối đi thanh thản. Từ trong mất mát, Toru nhận ra rằng mình cần tiếp tục sống và bắt đầu tình yêu mới với Midori.

Một cuốn sách ẩn chứa mọi điều khiến bạn phải say mê và đau đớn, tình yêu với muôn vàn màu sắc và cung bậc khác nhau, cảm giác trống rỗng và hẫng hụt của cả một thế hệ thanh niên vô hướng, ý niệm về sự sinh tồn tất yếu của cái chết trong lòng cuộc sống, những gắng gượng âm thầm nhưng quyết liệt của con người để vượt qua mất mát trong đời...Tất cả đã tạo nên vẻ đẹp riêng cho "Rừng Na uy", im lặng, ma thuật và tuyệt vọng như một chấm máu cô độc giữa bạt ngàn tuyết lạnh.

Nhận định

quot;"Rừng Na-uy" là một câu chuyện tình giản dị.

Giản dị như sự thật

Như bốn mùa

Như Sống/Chết

...Cái giản dị của "Rừng Na-uy" là cái giản dị chỉ có được khi người viết đã vượt lên trên hết những làm dáng có bản chất kỹ thuật vốn rất khó tránh trong sáng tác chỉ để bồi hồi kể lại những gì đang tuôn trào từ sâu thẳm cõi lòng mình. "Rừng Na-uy" không lãng mạn. Nó không lý tưởng hóa và do vậy không bị lừa mị bởi chính những lí tưởng ấy của mình. Nó dũng mãnh như mũi tên vừa bay ra khỏi cánh cung. Thẳng từ cõi lòng bộc trực và thân xác của kiếp người"- Trịnh Lữ

"Rừng Na Uy" không có những biểu tượng truyền thống của Nhật Bản, thế nhưng Murakami vẫn thể hiện mình là một nhà văn Nhật Bản từ trong cốt tủy. Hành trình của Toru qua những cánh rừng âm u sâu thẳm dẫn tới khu điều dưỡng gợi nhớ con đường thiên lý của các thi nhân văn sỹ Nhật Bản xưa, gợi nhớ chuyến đi tới xứ tuyết của chàng trai trẻ Shimamura trong tác phẩm "Xứ tuyết" của Kawabata. Mỗi người một thời đại, nhưng họ đều bỏ lại thị thành để tìm đến vùng đất yên tĩnh có phần siêu thoát. Vẻ đẹp mong manh, trong trắng nhưng xa vời của Naoko là hiện thân cho mỹ cảm đặc trưng của Nhật Bản, ta có thể gặp dấu ấn đặc trưng ấy trong những nhân vật nữ của Kawabata (Kyoko trong "Thủy nguyệt", Yoko trong "Xứ tuyết"). Dường như văn hóa phương Tây có thể khiến các nhân vật của Murakami không đủ kiên nhẫn để sống với trà đạo, bonsai, nhưng khát vọng hướng thượng, tìm kiếm cảm giác thanh nhàn và vẻ đẹp trinh khiết là điều không bao giờ mất.- Nhã Nam

"Một lối cấu tứ tinh tế, nhẹ bỗng mà mọi thứ Murakami chọn dựa để mô tả đều run rẩy với những chiều hướng tượng trưng: một cái áo sơ mi trong máy giặt công cộng, một sợi dây bị cắt lìa, một cái xước tóc hình bướm...Trong tất cả vẻ u ám siêu hình của nó, "Rừng Na-uy" vẫn hấp dẫn ta với sự hài hước đáng mến" - The Guardian

"Được chạm chổ tuyệt vời và tràn đầy những điều tuyệt diệu...Nhân vật kể chuyện đọc "Núi Thiêng" và tiểu thuyết ưa thích nhất của chàng ta là Gatsby vĩ đại. Trong "Rừng Na-uy", Murakami đã cập nhật hai tác phẩm kinh điển ấy thành một dạng ca khúc pop tuyệt hảo nhất: lãng mạn, buồn, tưởng như đơn giản, và không thể nào quên" - The Age

"Dịu dàng, quyến rũ như thơ, căng thẳng như bi kịch và gợi dục một cách mê đắm. Một cuốn tiểu thuyết kỳ diệu có âm hưởng hướng đạo và tự truyện...Tuyệt đối nên đọc" -SDM

"Câu chuyện của Murakami là một hồi ức đau buồn về cái đã có và cái đã có thể xảy ra, một kết hợp tài tình giữa trí tuệ của người già và trái tim của người trẻ." -Salon

"Văn xuôi của Murakami hào hoa một cách đáng ngạc nhiên...và mô tả một cách đẹp đẽ sự chơi bời vô độ của cả Watanabe lẫn một Tokyo cuối những năm 60. Cuốn sách cũng chẳng hơn hay kém "Tây" so với "Cuộc săn cừu" hay "Xứ sở kỳ diệu vô tình và chỗ tận cùng thế giới". Điều khiến nó khác chính là bên kia cái vẻ hơi cách biệt thế gian của viện điều dưỡng, "Rừng Na-uy" đặc biệt là một tác phẩm hiện thực" -Review of Contemporary Fiction

"Lặng lẽ lôi cuốn người đọc và cuối cùng lay động tâm can, Murakami đã thử nghiệm rất thành công với chủ nghĩa hiện thực, ông đã cố đè nén những xung lực dồi dào của mình cũng hiệu quả như các nhân vật cảu ông đè nén những sức mạnh lịch sử xung quanh họ" -Times Literary Supplement

“Rừng Na-uy sẽ là cuốn sách thanh xuân bất diệt, bầu bạn với hết thế hệ này qua thế hệ khác.” -Báo Đọc sách Trung Hoa

“Trong mười cuốn sách văn học có ảnh hưởng lớn nhất tới Trung Quốc trong thế kỷ 20, xếp thứ mười chính là Rừng Na-uy.”- Giáo sư Lâm Thiếu Hoa, dịch giả Rừng Na-uy ở Trung Quốc

“Nắm bắt sự đam mê và gấp gáp của ái tình tuổi trẻ… Lặng lẽ lôi cuốn người đọc và cuối cùng lay động tâm can.” - Time Literary Supplement

“Khêu gợi, thú vị, sexy và hài hước, nếu không Murakami đã chẳng là một trong những nhà văn hay nhất.” - Time Out

“Một câu chuyện xúc động đến ngạt thở…. Không nghi ngờ gì, Murakami là một trong những tiểu thuyết gia tinh tế nhất thế giới.” - Glasgow Herald

“Cuốn sách chắc chắn là sành điệu, đầy những trò quậy sinh viên, tình ái cởi mở, rượu và văn hoá pop những năm 1960. Nó chân xác và cảm động, miêu tả mọi cung bậc thăng trầm thời tuổi trẻ.” -Independent on Sunday

“Một cuốn tiểu thuyết bậc thầy về tình yêu kiểu những năm 1960.” - The New York Times Book Review)

"Câu chuyện cổ điển này của Murakami rõ ràng là gợi cảm nhất trong các tiểu thuyết của ông." - Los Angeles Times

" Rừng Na Uy, nơi chúng ta-những độc giả- chạm mặt tuổi hai mươi chính mình, kể cả tuổi hai mươi đã qua và tuổi hai mươi chưa tới...Nơi đó, hơi rượu whisky và khói thuốc nặng nhọc kéo ta chìm xuống đầm lầy cô độc nhưng giấc mơ và tình yêu trong sáng mang chúng ta bay lên" - Báo Người Lao Động

*****

Trích đoạn tác phẩm

Hai người đàn bà thay nhau đánh răng rồi rút lui vào phòng ngủ. Tôi rót cho mình một ít rượu nữa rồi nằm dài trên chiếc giường sô-pha, điểm lại những sự kiện trong ngày từ sáng đến đêm. Một ngày đằng đẵng đến ghê người. Gian phòng tiếp tục trắng lên dưới ánh trăng. Ngoài vài tiếng giường cựa cọt kẹt rất nhẹ, không có một tiếng động nào trong phòng nơi Naoko và Reiko đang nằm ngủ. Những hình thù sơ giản bé tí xíu hình như đang trôi nổi trong bóng tối khi tôi nhắm mắt lại, và trong tai tôi vẫn còn vương vấn tiếng ghi-ta của Reiko, nhưng cả hai cái đó chẳng mấy chốc đều qua đi. Giấc ngủ tới và nhúng tôi vào một khối bùn ấm áp. Tôi mơ thấy những cây liễu. Cả hai bên của một con đường núi đều toàn những liễu. Nhiều liễu không thể tưởng tượng được. Một cơn gió khá mạnh đang thổi, nhưng những cành liễu vẫn im phăng phắc. Sao lại thế được? Tôi thắc mắc, nhưng rồi thấy cành cây nào cũng đầy những con chim nhỏ đang bậu chắc ở đó. Sức nặng của chúng giữ cho cành không lay động trong gió. Tôi vớ lấy một cái gậy và đập mạnh vào một cành ở gần mình, hy vọng chim sẽ bay đi và cành sẽ đu đưa theo gió. Nhưng chúng không chịu bay. Đáng nhẽ bay đi thì chúng lại biến thành những mảnh kim loại hình chim và rơi loảng xoảng xuống đất.

Khi mở mắt, tôi cảm thấy như giấc mơ vẫn hiển hiện tiếp tục ở trước mặt. Vầng trăng ùa vào gian phòng một thứ ánh sáng trắng cũng dịu nhẹ như thế. Như một phản xạ tự nhiên, tôi ngồi dậy và bắt đầu tìm những con chim kim loại kia, tất nhiên là làm gì có ở đó. Nhưng tôi thấy Naoko ở chân giường, ngồi im một mình, nhìn trân trối ra cửa sổ. Nàng đã co hai đầu gối và đang tựa cằm lên chúng, trông như một trẻ mồ côi đang bị đói. Tôi lần tìm chiếc đồng hồ đeo tay để cạnh gối mà không thấy. Nhìn độ chếch của ánh trăng, tôi đoán lúc ấy phải là hai hoặc ba giờ sáng rồi. Một cơn khát dữ dội bỗng đến với tôi, nhưng tôi nhất định ngồi im và tiếp tục ngắm nhìn Naoko. Nàng vẫn mặc bộ áo ngủ màu xanh tôi đã thấy lúc trước, và một bên tóc nàng đã được buộc lại bằng dải buộc đầu hình con bướm, để lộ vẻ đẹp của gương mặt nàng dưới ánh trăng. Lạ thật, tôi nghĩ, nàng đã cởi dải buộc đầu trước khi đi ngủ cơ mà.

Naoko im phăng phắc ở đó, như một con thú ăn đêm nhỏ bé vừa bị ánh trăng nhử ra ngoài tổ. Trăng sáng làm rõ nét đường viền của môi nàng. Có vẻ cực kì mỏng mảnh và rất dễ bị tan vỡ, đường viền ấy rung động hầu như không thể nhận thấy được, theo với nhịp đập của tim nàng hoặc những chuyển động của nội tâm nàng, như thể nàng đang thì thầm với bóng đêm những từ ngữ vô thanh.

Tôi nuốt khan, hy vọng đỡ khát, nhưng trong màn đêm tĩnh mịch tiếng nuốt ấy của tôi có vẻ thật ầm ĩ. Như thể đó là dấu hiệu cho nàng, Naoko đứng lên và lướt về phía đầu giường, áo ngủ sột soạt nhẹ nhàng. Nàng quì xuống sàn nhà ngay cạnh gối tôi, hai mắt gắn chặt vào mắt tôi. Tôi nhìn nàng chăm chú, nhưng mắt nàng không nói gì với tôi hết. Trong vắt lạ lùng, chúng có vẻ là những cửa sổ vào một thế giới khác, nhưng có nhìn mãi vào đó tôi cũng chẳng thấy được gì. Mặt chúng tôi cách nhau chưa đầy một gang, nhưng nàng xa cách tôi cả nhiều năm ánh sáng.

Tôi với ra và cố chạm vào nàng, nhưng Naoko rụt người lại, môi hơi run rẩy. Một lúc sau, nàng đưa tay lên và bắt đầu cởi khuy bộ áo ngủ của mình. Có bảy cái tất cả. Tôi cảm thấy như giấc mơ của mình đang tiếp diễn khi nhìn những ngón tay mảnh dẻ đáng yêu của nàng cởi dần từng chiếc khuy từ trên xuống dưới. Bảy cái khuy trắng nhỏ bé. Khi đã cởi hết chúng, Naoko kéo cho bộ áo trật khỏi vai rồi lôi nó tuột hẳn xuống như một con côn trùng lột xác. Nàng không mặc gì dưới lần áo ngủ ấy. Trên người nàng chỉ còn chiếc dải buộc đầu hình bươm bướm. Trần truồng, và vẫn quì cạnh giường, nàng nhìn tôi. Tắm trong ánh trăng dìu dịu, thân thể của Naoko ánh lên như da thịt sơ sinh khiến tôi thấy tan nát cả cõi lòng. Khi nàng cử động - và nàng cử động nhẹ đến mức hầu như không thấy được - những chỗ sáng tối trên người nàng di động thật tinh tế. Khối tròn trịa căng phồng của cặp vú, hai đầu vú nhỏ xíu, chỗ lõm vào ở phần rốn, cặp xương hông và đám lông mu, tất cả đều tạo nên những bóng đổ li ti lấm chấm mà hình dạng của chúng liên tục biến đổi như những gợn sóng lăn tăn trải dài trên mặt hồ phẳng lặng.

Thật là một tòa thiên nhiên hoàn hảo! tôi thầm nghĩ. Naoko đã có được một thân hình hoàn hảo như vậy từ bao giờ? Chuyện gì đã xảy ra với tấm thân tôi đã từng ôm trong tay đêm xuân năm trước?

Đêm đó, khi tôi nhẹ nhàng cởi quần áo nàng trong khi nàng khóc, thân thể của Naoko đã gợi cho tôi một cảm giác về sự bất toàn. Vú nàng dường như cứng nhắc, với hai đầu vú đâm ra một cách lạ lẫm, cặp hông cũng cứng lạ lùng. Nàng là một cô gái đẹp, tất nhiên rồi, thân thể nàng kì diệu và hấp dẫn. Nó đã kích động tôi đêm đó và lôi tôi vào những đợt sóng với một sức mạnh khổng lồ. Nhưng dù sao, khi ôm nàng, vuốt ve nàng, hôn lên da thịt trần trụi của nàng, tôi vẫn có một cảm thức lạ lùng và mạnh mẽ về sự lệch lạc và vụng về của cơ thể con người. Khi ôm Naoko trong tay, tôi đã muốn nói với nàng rằng “Mình đang làm tình với cậu đây. Mình đang ở trong cậu đây. Nhưng thực tình chẳng có gì đâu. Không có chuyện gì hết. Chỉ là hai tấm thân kết nối với nhau mà thôi. Tất cả những gì mình đang làm đây chỉ là nói cho nhau biết rằng có những điều chỉ có thể nói được bằng cách cọ xát hai khối thịt bất toàn như thế này. Làm như vậy, chúng mình mới chia sẻ được những bất toàn của nhau.” Nhưng tất nhiên tôi không thể hy vọng sẽ có ai hiểu được những lời định nói ấy của mình. Tôi chỉ tiếp tục ôm chặt nàng vào lòng. Và khi làm vậy, tôi có thể cảm thấy bên trong thân thể nàng một cái gì đó như một tố chất ngoại lai chai đá, một cái gì phụ trội mà tôi không thể đến gần được. Và chính cảm giác ấy đã vừa làm cho Naoko tràn ngập cõi lòng tôi vừa cho tôi một cương cứng căng thẳng khủng khiếp.

Nhưng tấm thân mà Naoko đang để lộ trước mắt tôi đây không giống tí gì với tấm thân tôi đã ôm ấp đêm đó. Da thịt này đã phải qua nhiều biến đổi để tái sinh trong tuyệt đỉnh hoàn hảo dưới ánh trăng. Mọi dấu hiệu mũm mĩm trẻ con đã bị tước bỏ hết từ cái chết của Kizuki để được thay thế bằng da thịt của một người đàn bà trưởng thành. Vẻ đẹp thân xác của Naoko lúc bấy giờ hoàn hảo đến nỗi nó không khơi gợi một chút gì là dục tính ở trong tôi. Tôi chỉ có thể kinh ngạc ngắm nhìn đường cong kiều diễm từ thắt lưng xuống hông, vẻ phì nhiêu tròn trịa của đôi vú, những chuyển động nhẹ nhàng theo nhịp thở của làn bụng thon và đám lông mu đen đổ bóng ở bên dưới.

Nàng phô bày vẻ trần trụi của mình cho tôi như thế có lẽ khoảng năm phút, rồi cuối cùng lại phủ mình dưới bộ áo ngủ kia và lần lượt cài lại khuy từ trên xuống dưới. Xong chiếc khuy cuối cùng một cái là nàng trỗi dậy và lướt về phía phòng ngủ, lẳng lặng mở cửa, rồi khuất dạng.

Tôi ở nguyên tại chỗ rất lâu rồi mới chợt ra khỏi giường. Tôi lượm cái đồng hồ đã rơi xuống sàn và đưa nó ra chỗ có ánh trăng. Đã ba giờ bốn mươi phút. Tôi vào bếp uống mấy cốc nước rồi mới trở về giường, nhưng khi giấc ngủ đến với tôi thì nắng sáng đã vào đến mọi ngóc ngách của gian phòng và xua tan mọi dấu vết của vầng trăng nhợt nhạt. Tôi vừa lơ mơ muốn thiếp đi thì Reiko đã đến vỗ vỗ vào má, miệng kêu to, “Sáng rồi! Sáng rồi!”

Mã hàng	8935235231382
Tên Nhà Cung Cấp	Nhã Nam
Tác giả	Haruki Murakami
Người Dịch	Trịnh Lữ
NXB	NXB Hội Nhà Văn
Năm XB	2021
Trọng lượng (gr)	540
Kích Thước Bao Bì	20.5 x 13 cm
Số trang	556
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Flashsale
Haruki Murakami
Mã Giảm Giá
Nhã Nam
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tiểu thuyết bán chạy của tháng
Câu chuyện bắt đầu từ một chuyến bay trong ngày mưa ảm đạm, một người đàn ông 37 tuổi chợt nghe thấy bài hát gắn liền với hình ảnh người yêu cũ, thế là quá khứ ùa về xâm chiếm thực tại. Mười tám năm trước, người đàn ông ấy là chàng Toru Wanatabe trẻ trung, mỗi chủ nhật lại cùng nàng Naoko lang thang vô định trên những con phố Tokyo. Họ sánh bước bên nhau để thấy mình còn sống, còn tồn tại, và gắng gượng tiếp tục sống, tiếp tục tồn tại sau cái chết của người bạn cũ Kizuki. Cho đến khi Toru nhận ra rằng mình thực sự yêu và cần có Naoko thì cũng là lúc nàng không thể chạy trốn những ám ảnh quá khứ, không thể hòa nhập với cuộc sống thực tại và trở về dưỡng bệnh trong một khu trị liệu khép kín. Toru, bên cạnh giảng đường vô nghĩa chán ngắt, bên cạnh những đêm chơi bời chuyển từ cảm giác thích thú đến uể oải, ghê tởm...vẫn kiên nhẫn chờ đợi và hy vọng vào sự hồi phục của Naoko. Cuối cùng, những lá thư, những lần thăm hỏi, hồi ức về lần ân ái duy nhất của Toru không thể níu Naoko ở lại, nàng chọn cái chết như một lối đi thanh thản. Từ trong mất mát, Toru nhận ra rằng mình cần tiếp tục sống và bắt đầu tình yêu mới với Midori.', 0, NULL, N'assets/epubs/B00085.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00086', N'Sự Im Lặng Của Bầy Cừu', N'Thomas Harris', N'NXB Hội Nhà Văn', N'Vietnamese', N'assets/images/bookCover/B00086.png', N'Những cuộc phỏng vấn ở xà lim với kẻ ăn thịt người ham thích trò đùa trí tuệ, những tiết lộ nửa chừng hắn chỉ dành cho kẻ nào thông minh, những cái nhìn xuyên thấu thân phận và suy tư của cô mà đôi khi cô muốn lảng tránh... Clarice Starling đã dấn thân vào cuộc điều tra án giết người lột da hàng loạt như thế, để rồi trong tiếng bức bối của chiếc đồng hồ đếm ngược về cái chết, cô phải vật lộn để chấm dứt tiếng kêu bao lâu nay vẫn đeo đẳng giấc mơ mình: tiếng kêu của bầy cừu sắp bị đem đi giết thịt.', 0, NULL, N'assets/epubs/B00086.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00087', N'Sống Mòn', N'Nam Cao', N'NXB Văn Học', N'Vietnamese', N'assets/images/bookCover/B00087.png', N'Sống mòn hoàn thành vào năm 1944, xuất bản ban đầu với tên gọi ""Chết mòn"" năm 1956. Trong tác phẩm, Nam Cao đã miêu tả sâu sắc tấn bi kịch tinh thần của người trí thức nghèo trong xã hội cũ. Họ là những người có ý thức rất cao về nhân phẩm và danh dự, có khát vọng - hoài bão văn chương lớn lao nhưng lại bị gánh nặng cơm áo gạo tiền bóp nghẹt sự sống. Rộng hơn là vận mệnh mấy con người ấy, ta thấy đặt ra một cách ám ảnh vấn đề vận mệnh chung của cả một xã hội chua xót, đau đớn, buồn thảm, tủi nhục, trong đó, đời sống không còn ý nghĩa, quay về phía nào cũng thấy dựng lên những bức tường bế tắc.""

Cuốn tiểu thuyết chất chứa những suy nghĩ, trăn trở, ưu tư của Nam Cao về cách sống, về lối viết và nhiệm vụ của những người cầm bút. Không có những xung đột gay gắt, mâu thuẫn cao trào, chỉ đơn giản là những giằng xé đấu tranh nội tâm của mỗi phận người. Chỉ với giọng văn điềm đạm, cốt truyện đơn giản, thế nhưng, Sống mòn đã hội tụ đầy đủ tất cả sự điêu luyện, tinh tế của một ngòi bút truyện ngắn bậc thầy.

Mã hàng	8935236424981
Tên Nhà Cung Cấp	Nhà Sách Minh Thắng
Tác giả	Nam Cao
NXB	NXB Văn Học
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	390
Kích Thước Bao Bì	20.5 x 14.5 x 1 cm
Số trang	324
Hình thức	Bìa Cứng
Sản phẩm hiển thị trong	
Nhà Sách Minh Thắng
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tiểu thuyết bán chạy của tháng
Nam Cao - Sống Mòn (Tái Bản) (Bìa Cứng)

Nam Cao có bút danh là Thúy Rư, Xuân Du, Nguyệt, Nhiêu Khê...

Tên khai sinh: Trần Hữu Tri, sinh ngày 29 tháng 10 năm 1917. Quê quán: làng Đại Hoàng, phủ Lý Nhân, tỉnh Hà Nam (nay là xã Hòa Hậu, huyện Lý Nhân, Hà Nam).

Sống mòn hoàn thành vào năm 1944, xuất bản ban đầu với tên gọi ""Chết mòn"" năm 1956. Trong tác phẩm, Nam Cao đã miêu tả sâu sắc tấn bi kịch tinh thần của người trí thức nghèo trong xã hội cũ. Họ là những người có ý thức rất cao về nhân phẩm và danh dự, có khát vọng - hoài bão văn chương lớn lao nhưng lại bị gánh nặng cơm áo gạo tiền bóp nghẹt sự sống. Rộng hơn là vận mệnh mấy con người ấy, ta thấy đặt ra một cách ám ảnh vấn đề vận mệnh chung của cả một xã hội chua xót, đau đớn, buồn thảm, tủi nhục, trong đó, đời sống không còn ý nghĩa, quay về phía nào cũng thấy dựng lên những bức tường bế tắc.""', 0, N'assets/pdfs/B00087.pdf', NULL, 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00088', N'Lược Sử Tôn Giáo', N'Richard Holloway', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00088.png', N'Hơn bảy tỷ người trên thế giới có thể viết một thứ gì đó khác chữ “Không” vào mục Tôn giáo trong hồ sơ của mình. Một số sinh ra đã theo một tôn giáo được chọn sẵn; số khác có thể tự lựa chọn theo sở thích, theo định hướng, theo đám đông... Thế rồi họ thực hành đức tin của mình hằng ngày, tự hào về nó và muốn truyền bá nó cho nhiều người khác nữa. Đó là con đường phát triển hết sức tự nhiên của tôn giáo suốt hàng nghìn năm qua, kết quả là vô số tín ngưỡng với cành nhánh xum xuê mà chúng ta thấy ngày nay. Nhiều tôn giáo ra đời cách đây hàng nghìn năm với số lượng tín đồ hùng hậu, một số khác non trẻ hơn nhưng không kém phần đình đám vì những tín đồ ít ỏi nhưng nổi tiếng của mình.  Thế nhưng, ai trong số họ dám chắc những gì mình đang làm là đúng nguyên bản và không khiến các vị khai sinh ra tôn giáo ấy lắc đầu, thất vọng?', 0, NULL, N'assets/epubs/B00088.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00089', N'Tại Sao Phương Tây Vượt Trội?', N'Ian Morris', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00089.png', N'Bằng nghiên cứu sâu sắc và lập luận một cách xuất sắc, cuốn sách kéo dài năm mươi nghìn năm lịch sử và cung cấp những hiểu biết mới trên gần như mọi trang sách. Cuốn sách tập hợp những phát hiện mới nhất trong các lĩnh vực từ lịch sử cổ đại đến khoa học thần kinh không chỉ giải thích tại sao phương Tây dẫn đầu thế giới mà còn dự đoán tương lai sẽ mang lại điều gì trong một trăm năm tới.

Orville Schell - Giám đốc Trung tâm Quan hệ Mỹ - Trung ở Hội Châu Á đã chia sẽ về cuốn sách trong bài viết: “Cuộc xung đột cuối cùng” đăng trên New York Times rằng:

Đây là một “cuốn sách lớn”, rất lớn nhằm đạt được mục tiêu đầy tham vọng là hiểu thấu quá trình phát triển trong quá khứ của nhân loại và đưa ra dự báo về tương lai của cuộc đua song mã đang tiếp diễn giữa 2 trục Đông – Tây, Ian Morris bắt đầu với mốc thời gian từ khoảng 15 nghìn năm trước. Đó là một lượng lịch sử đồ sộ.', 0, NULL, N'assets/epubs/B00089.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C02', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00090', N'Phật Giáo Là Phật Học Đại Chúng', N'Stephen Batchelor', N'NXB Hồng Đức', N'Vietnamese', N'assets/images/bookCover/B00090.png', N'Người ta có thể đặt câu hỏi: Trong đạo Phật có đức tin hay không? Hay nói cách khác: Đạo Phật có cần đến đức tin không? Nếu có, đức tin trong đạo Phật có khác gì với đức tin trong các tôn giáo khác?  Đặt vấn đề đức tin trong đạo Phật không khác gì đặt lại một câu hỏi kinh điển: "Đạo Phật là một tôn giáo hay là một triết lý?" vì tôn giáo đặt nặng vào đức tin, trong khi triết lý dựa trên lý tính.
Trong tác phẩm giản dị nhưng quan trọng này, Stephen Batchelor lưu ý chúng ta rằng, những điều Đức Phật đã dạy không phải là để tin mà là để hành động – và như ông giải thích rõ ràng, đó là con đường mà chúng ta có thể dấn thân, bất kể hoàn cảnh xuất thân, bởi chúng ta đã và đang sống hàng ngày trên con đường ấy. 
Rõ ràng và dễ hiểu, tác phẩm “Phật giáo là Phật học đại chúng” giải thoát chúng ta khỏi khái niệm Phật giáo là một tôn giáo, cho chúng ta thấy lời pháp của Đức Phật cần thiết ra sao trong thế giới ngày nay.', 0, NULL, N'assets/epubs/B00090.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00091', N'Hành Trình Về Phương Đông', N'Baird T Spalding', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00091.png', N'Hành Trình Về Phương Đông kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. Suốt hai năm trời rong ruổi khắp các đền chùa Ấn Độ, diện kiến nhiều pháp thuật, nhiều cảnh mê tín dị đoan, thậm chí lừa đào… của nhiều pháp sư, đạo sĩ… họ được tiếp xúc với những vị chân tu thông thái sống ẩn dật ở thị trấn hay trên rặng Tuyết Sơn. Nhờ thế, họ được chứng kiến, trải nghiệm, hiểu biết sâu sắc về các khoa học cổ xức và bí truyền của văn hóa Ấn Độ như yoga, thiền định, thuật chiêm tinh, các phép dưỡng sinh và chữa bệnh, những kiến thức về nhân duyên, nghiệp báo, luật nhân quả, cõi sống và cõi chết…

Cuốn sách là một phần trong bộ hồi ký nổi tiếng của giáo sư Blair T. Spalding (1857 - 1953), “Life and Teaching of the Masters of the Far East” (xuất bản năm 1953). Bộ sách có tất cả sáu quyển, ghi nhận đầy đủ về cuộc hành trình gay go nhưng lý thú và tràn đầy sự huyền bí ở Ấn Độ, Tây Tạng, Trung Hoa và Ba Tư. Ba quyển đầu ghi lại những cuộc thám hiểm của phái đoàn gồm các nhà khoa học hàng đầu của Hoàng gia Anh đi từ Anh quốc sang Ấn Độ, các cuộc gặp gỡ giữa phái đoàn và những vị thầy tâm linh sống ở châu Á và dãy Hy Mã Lạp Sơn. Ba quyển sau là những ghi nhận riêng của giáo sư Spalding về các cuộc hành trình, sự trao đổi kiến thức giữa phái đoàn và các vị thầy tâm linh, cùng bản tường trình của phái đoàn đã đưa đến những cuộc tranh luận sôi nổi. Cuối cùng thì ba người trong phái đoàn đã trở lại Ấn Độ sống đời ẩn sĩ.

Xuất bản lần đầu tiên tại NXB Adyar Ấn Độ năm 1924, Hành Trình Về Phương Đông đã gây ra một dư luận tranh cãi không chỉ ở nước Anh mà ở cả châu Âu và Mỹ. Sau đó, vì tự ái và sĩ diện, chính phủ Anh cấm phát hành cuốn sách này ở Anh Quốc, rồi chiến tranh thế giới lần thứ II xảy ra, cuốn sách đã không được tái bản ở bất kỳ NXB nào khác trên thế giới. Mãi đến năm 2009, NXB Booksurge Hoa Kỳ đã tìm mọi cách liên lạc với dịch giả Nguyên Phong để xin phép chuyển ngữ cuốn sách tiếng Việt này.  

Có thể nói, Hành Trình Về Phương Đông là một trong những cuốn sách có số phận khá ly kỳ, một phần vì dịch giả của nó cũng bí ẩn không kém. Không xuất hiện trên truyền thông, mà chỉ sống ẩn danh nên có rất nhiều người không biết về Nguyên Phong. Và đó chính là bút danh của Giáo sư John Vu (tên thật là Vũ Văn Du). Ông là tác giả, dịch giả nổi tiếng của các tác phẩm về văn học, tâm linh phương Đông, về giáo dục, và công nghệ. Ông đã chuyển thể và phóng tác rất thành công nhiều tác phẩm của các học giả phương Tây sau quá trình tìm hiểu và khám phá các giá trị văn hóa phương Đông. Trong số đó tác phẩm phóng tác nổi tiếng nhất là Hành Trình Về Phương Đông; ngoài ra, tại Việt Nam, First News đã xuất bản nhiều tác phẩm phóng tác nổi tiếng của dịch giả Nguyên Phong như: Ngọc sáng trong hoa sen, Bên rặng Tuyết Sơn, Hoa trôi trên sóng nước, Minh triết trong đời sống, Đường mây qua xứ tuyết…

Mã hàng	8935086854495
Tên Nhà Cung Cấp	FIRST NEWS
Tác giả	Baird T Spalding
Người Dịch	Nguyên Phong
NXB	NXB Thế Giới
Năm XB	2021
Ngôn Ngữ	Tiếng Việt
Trọng lượng (gr)	300
Kích Thước Bao Bì	20.5 x 14.5 cm
Số trang	256
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
FIRST NEWS
Sản phẩm bán chạy nhất	Top 100 sản phẩm Tôn Giáo bán chạy của tháng
Hành Trình Về Phương Đông, một trong những tác phẩm đương đại hay và độc đáo nhất về văn hóa phương Đông vừa tái ngộ bạn đọc trong một diện mạo hoàn toàn mới, sang trọng và ấn tượng. Đây là ấn bản có lượng phát hành ấn tượng, hơn 40.000 bản tại Việt Nam chỉ trong vài năm trở lại đây.

Hành Trình Về Phương Đông kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. Suốt hai năm trời rong ruổi khắp các đền chùa Ấn Độ, diện kiến nhiều pháp thuật, nhiều cảnh mê tín dị đoan, thậm chí lừa đào… của nhiều pháp sư, đạo sĩ… họ được tiếp xúc với những vị chân tu thông thái sống ẩn dật ở thị trấn hay trên rặng Tuyết Sơn. Nhờ thế, họ được chứng kiến, trải nghiệm, hiểu biết sâu sắc về các khoa học cổ xức và bí truyền của văn hóa Ấn Độ như yoga, thiền định, thuật chiêm tinh, các phép dưỡng sinh và chữa bệnh, những kiến thức về nhân duyên, nghiệp báo, luật nhân quả, cõi sống và cõi chết…', 0, NULL, N'assets/epubs/B00091.epub', 1, CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'M0002', NULL, N'C00', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00092', N'Tĩnh Lặng - Sức Mạnh Tĩnh Lặng Trong Thế Giới Huyền Ảo', N'Thích Nhất Hạnh', N'NXB Thế Giới', N'Vietnamese', N'assets/images/bookCover/B00092.jpg', N'Tĩnh Lặng - Sức Mạnh Tĩnh Lặng Trong Thế Giới Huyền Ảo

Còn sống và bước đi trên mặt đất này là một phép lạ, nhưng hầu hết chúng ta lại chạy đi tìm hạnh phúc ở một nơi xa xôi nào đó như thể là có một nơi tốt đẹp hơn để đến vậy. Chúng ta mất rất nhiều thời gian để đi tìm hạnh phúc trong khi đó thế giới quanh ta tràn đầy những mầu nhiệm. Những vẻ đẹp của đất trời đang gọi ta từng ngày, từng giờ nhưng hiếm khi ta nghe được. Điều kiện căn bản để chúng ta có thể nghe và đáp lại những tiếng gọi ấy là sự tĩnh lặng. Nếu không có sự tĩnh lặng trong tự thân, nếu thân tâm ta đầy sự ồn ào, náo loạn thì ta không thể nghe được tiếng gọi của vẻ đẹp ấy. Có một đài radio đang hoạt động trong đầu ta, đó là đài NST (Non Stop Thinking) - đài suy nghĩ liên tục không ngừng. Tâm ta đầy tiếng ồn) vì vậy ta không thể nghe được tiếng gọi của sự sống, tiếng gọi của tình thương. Trái tim ta đang gọi ta mà ta không nghe thấy. Ta không có thời gian để lắng nghe trái tim mình.', 0, NULL, N'assets/epubs/B00092.epub', 1, CAST(N'2022-07-19T15:03:00.000' AS DateTime), NULL, N'M0002', NULL, N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00093', N'Hạnh Phúc Cầm Tay', N'Thích Nhất Hạnh', N'NXB Lao Động', N'Vietnamese', N'assets/images/bookCover/B00093.png', N'Cuộc sống quanh ta đầy màu nhiệm, chánh niệm là trái tim của thiền tập, là nguồn năng lượng xuyên suốt không thể thay đổi. Một người sống trong chánh niệm, tâm an, sẽ khiến những người xung quanh vui vẻ, an nhiên và thậm chí thay đổi cả xã hội.

“Tất cả chúng ta đều có hạt giống của niệm và định”

“Định làm phát sinh hỷ lạc” Định nguồn căn, có định con người sẽ cảm thấy đang thực sự sống chứ không phải chỉ tồn tại. Cảm nhận cuộc đời tươi đẹp không qua đôi mắt mà qua hơi thở và tâm hồn.

Thiền sư Lâm Tế đã nói rằng: “Phép lạ là đi trên mặt đất mà không phải đi trên mặt nước hay đi trên than hồng”. Tất cả những gì ta làm đều cốt yếu là để tâm an. Mỗi ngày, ta đì tìm tự do cho hạnh phúc, hay hạnh phúc để được tự do?! Nếu cứ mải mê mắc kẹt trong quá khứ và lo buồn về tương lai, hiện tại sẽ tự nhiên ngả màu héo úa.

Nghỉ ngơi là bước đầu tiên của thiền tập, và con đường ngắn nhất là thả lỏng và không gượng ép. Sống là để không uổng phí một đời, sống trọn vẹn từng giây phút, thanh thản từng hành động.

Bước đi một cách thoải mái, an lạc, đi như không đi sẽ không thấy mệt mỏi. Sự cố gượng là không cần thiết nếu ta hiểu được rằng mỗi bước đi là mỗi bước được tiếp xúc với cuộc đời và sự màu nhiệm vô tận. Chạm vào đất Mẹ là nguồn căn của “Sám Pháp địa xúc”, người thường cũng có thể thực hành khi bế tắc, lo sợ, Người nhẫn nại bảo hộ, che chở và cho ta lối thoát, mọi thứ tự khắc trở nên nhẹ nhàng.

Cuốn sách tiếp tục với Năm uẩn trong một con người: sắc, thọ, tưởng, hành, thức, đều cần ta trị vì, cai quản. Có chánh niệm sẽ nhận diện được tập khí khi chúng đang phát khởi và ngăn ngừa nó hoành hành ta, quấy nhiễu giấc ngủ ta mỗi đêm. Cả những tri giác sai lầm vây bám lấy tâm trí ta, cũng sẽ được loại bỏ.

Khép lại với Năm giới tân tu: Bảo vệ sự sống, Hạnh phúc chân thật, Tình thương đích thực, Lắng nghe và ái ngữ, Nuôi dưỡng và trị liệu là năm phép thực tập chánh niệm, có khả năng xóa bỏ mọi rào cản, kể cả hận thù và tuyệt vọng để ta bước đi trên con đường thanh thản, sống cuộc đời đáng sống của ta.

Cuộc sống quanh ta đầy màu nhiệm, chánh niệm là trái tim của thiền tập, là nguồn năng lượng xuyên suốt không thể thay đổi. Một người sống trong chánh niệm, tâm an, sẽ khiến những người xung quanh vui vẻ, an nhiên và thậm chí thay đổi cả xã hội.

“Tất cả chúng ta đều có hạt giống của niệm và định”

“Định làm phát sinh hỷ lạc” Định nguồn căn, có định con người sẽ cảm thấy đang thực sự sống chứ không phải chỉ tồn tại. Cảm nhận cuộc đời tươi đẹp không qua đôi mắt mà qua hơi thở và tâm hồn.

Thiền sư Lâm Tế đã nói rằng: “Phép lạ là đi trên mặt đất mà không phải đi trên mặt nước hay đi trên than hồng”. Tất cả những gì ta làm đều cốt yếu là để tâm an. Mỗi ngày, ta đì tìm tự do cho hạnh phúc, hay hạnh phúc để được tự do?! Nếu cứ mải mê mắc kẹt trong quá khứ và lo buồn về tương lai, hiện tại sẽ tự nhiên ngả màu héo úa.', 0, NULL, N'assets/epubs/B00093.epub', 1, CAST(N'2022-07-19T15:04:00.000' AS DateTime), CAST(N'2022-07-20T10:05:23.100' AS DateTime), N'M0002', N'M0000', N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00094', N'Osho - Tantra: Con Đường Của Sự Chấp Nhận', N'Lê Xuân Khoa', N'NXB Hà Nội', N'Vietnamese', N'assets/images/bookCover/B00094.png', N'Điều căn bản nhất về Tantra là đây – nó mang tính triệt để, tính cách mạng, tính nổi dậy – nguyên lí cơ bản của Tantra là thế giới không bị phân chia thành thấp hơn và cao hơn, mà nó là một thể. Cái cao hơn cùng cái thấp hơn đang nắm tay nhau. Cái cao hơn bao hàm cái thấp hơn và cái thấp hơn bao hàm cái cao hơn. Cái cao hơn ẩn trong cái thấp hơn – cho nên cái thấp hơn không phải để bị phủ nhận, không phải để bị lên án, không phải để bị phá hủy hay giết chết. Cái thấp hơn phải được chuyển hóa. Cái thấp hơn phải được cho phép dịch chuyển lên trên và theo cách đó cái thấp hơn trở thành cái cao hơn.', 0, NULL, N'assets/epubs/B00094.epub', 1, CAST(N'2022-07-19T15:05:00.000' AS DateTime), NULL, N'M0002', NULL, N'C03', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00095', N'Bất Đẳng Thức Dưới Góc Nhìn Của Các Bổ Đề', N'Nguyễn Tuấn Anh, Cao Minh Quang', N'Thông Tin Và Truyền Thông', N'Vietnamese', N'assets/images/bookCover/B00095.png', N'Mỗi bài toán có một vai trò riêng của nó. Có bài được đề ra để kiểm tra khả năng tư duy, suy luận, có bài sẽ kiểm tra khả năng ghi nhớ công thức, một số bài là để kiểm tra kỹ năng tính toán và cũng có bài thách thức người học để bứt phá bản thân. Vậy nên, để việc học toán trở nên nhẹ nhàng, thú vị hơn, hãy đặt mỗi bài toán vào đúng vị trí, vai trò của nó và sự sáng tạo cũng nảy mầm từ đây. Bất đẳng thức (BĐT) cũng chỉ cần có vậy!', 0, NULL, N'assets/epubs/B00095.epub', 1, CAST(N'2022-07-19T15:06:00.000' AS DateTime), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00096', N'Khoa Học Trong Chạy Bộ - Khám Phá Giới Hạn Để Tối Đa Hóa Hiệu Suất', N'Steve Magness', N'Thể Thao Và Du Lịch', N'Vietnamese', N'assets/images/bookCover/B00096.jpg', N'Đây không phải dạng sách hướng dẫn với mấy bài tập dập khuôn đơn điệu bán trên thị trường. Chẳng có chế độ luyện tập hay công thức nào cả. Thay vào đó, cuốn sách này đưa ra nhiều thách thức cho các vận động viên, huấn luyện viên và cả các Nhà khoa học. Nó được thiết kế không phải cho việc “tốt hơn” chung chung, mà là để tối ưu hóa hiệu suất luyện tập. Nói vậy không có nghĩa là sách chỉ dành cho vận động viên ưu tú, mà nó còn dành cho bạn, cho tôi, những người đã nản lòng với kiểu thông tin vừa thừa vừa thiếu ở mấy cuốn sách nói trên kia. Tôi hy vọng có thể giúp bạn có cái nhìn và định hướng mới mẻ trong thế giới chạy bộ, cũng như nhìn nhận lại các quan điểm truyền thống về luyện tập, huấn luyện và khoa học.', 0, NULL, N'assets/epubs/B00096.epub', 1, CAST(N'2022-07-19T15:07:00.000' AS DateTime), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00097', N'Số Phận Của Vũ Trụ - Big Bang Và Sau Đó', N'Trịnh Xuân Thuận', N'NXB Kim Đồng', N'Vietnamese', N'assets/images/bookCover/B00097.jpg', N'Cách đây gần 14 tỉ năm, một vụ nổ khủng khiếp đã khai sinh vũ trụ, không gian và thời gian. Từ đó, mọi sự không ngừng tiến triển theo hướng phức tạp hơn. Chỉ từ một sự trống rỗng vô cùng nhỏ bé ban đầu đã dệt nên tấm thảm vũ trụ mênh mông, được tạo nên từ hàng trăm tỉ thiên hà mà mỗi thiên hà lại được tạo nên từ hàng trăm tỉ ngôi sao. Tại một trong những thiên hà ấy, trên một hành tinh gần một ngôi sao, xuất hiện con người, biết ngỡ ngàng trước vẻ đẹp và sự hài hòa của vũ trụ. Bằng những từ ngữ đơn giản, nhà thiên văn học Trịnh Xuân Thuận dẫn dắt chúng ta đến với câu chuyện về sự hình thành vũ trụ, tới thăm vườn ươm sao, các tinh vân, sao lùn trắng, pulsar, lỗ đen, sao siêu mới, thiên hà xoắn ốc, thiên hà hình elip hoặc không định hình… dưới ánh sáng radio, sóng vi ba, tia hồng ngoại, ánh sáng nhìn thấy được, tia tử ngoại, tia X hoặc tia gamma…', 0, N'assets/pdfs/B00097.pdf', N'assets/epubs/B00097.epub', 1, CAST(N'2022-07-19T15:08:00.000' AS DateTime), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00098', N'Hỗn Độn Và Hài Hòa', N'Trịnh Xuân Thuận', N'NXB Trẻ', N'Vietnamese', N'assets/images/bookCover/B00098.jpg', N'Cùng với Lý thuyết hỗn độn, tính ngẫu nhiên và phi tất định đã tràn ngập không chỉ trong thế giới hằng ngày của chúng ta mà cả trong thế giới các thiên hà. Và sự phát triển của những ý tưởng dẫn tới quan niệm mới đó về thế giới đã được vạch ra thật rõ ràng trong cuốn sách Hỗn độn và hài hòa, bằng một ngôn ngữ giản dị, thông qua những ví dụ được rút ra từ vật lý thiên văn, vật lý học, sinh học và toán học.

Tác phẩm được viết đơn giản để ngay cả người không có nền tảng kiến thức về kỹ thuật cũng hiểu, và đặc biệt dành cho những ai tò mò muốn biết không chỉ những điều kỳ lạ mới nhất của khoa học ở thế kỷ XX mà cả hệ quả triết học và thần học của chúng.', 0, N'assets/pdfs/B00098.pdf', N'assets/epubs/B00098.epub', 1, CAST(N'2022-07-19T15:09:00.000' AS DateTime), NULL, N'M0002', NULL, N'C05', 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Publisher], [Language], [Cover], [Description], [NoDownload], [FilePDF], [FileEpub], [IsAccepted], [DateUpload], [LastDateEdit], [MemberUpload], [MemberLastEdit], [CategoryID], [isDeleted]) VALUES (N'B00099', N'Giải Mã Siêu Trí Tuệ - The Code Of The Extraordinary Mind', N'Vishen Lakhiani', N'NXB Công Thương', N'Vietnamese', N'assets/images/bookCover/B00099.png', N'Điều gì sẽ sảy ra nếu con người cứ vô thức sống theo những quan niệm, niềm tin đã lỗi thời về tình yêu, công việc hay hạnh phúc được truyền từ đời này sang đời khác? Và nếu có nhận ra chính mình cũng đang sống như vậy, bạn có dũng cảm vượt ra ngoài khuôn khổ ấy không?

Giải mã siêu trí tuệ là một bản thiết kế 10 quy tắc giúp bạn phá bỏ xiềng xích của một cuộc sống bình thường để sống một cuộc đời phi thường. Kết hợp tư duy tính toán, lý thuyết tích hợp, tâm linh hiện đại, sinh học tiến hóa cùng với cách dẫn dắt hài hước, Vishen Lakhiani cung cấp công cụ giúp bạn trở thành một kẻ dám đột phá, thách thức, phát triển cá nhân, bẻ khóa tâm trí và tạo ra các quy tắc mới cho cuộc sống CỦA CHÍNH BẠN.

Cuốn sách gửi tới người đọc một bộ quy tắc “mã hóa bản thân” để hiểu về thế giới theo những cách phi thường; để xây dựng một cuộc sống hạnh phúc; và hơn cả, là để dám mơ về những điều vượt ngoài khuôn khổ truyền thống.

+TÁC GIẢ:

Vishen Lakhiani là kỹ sư máy tính và doanh nhân trong lĩnh vực công nghệ giáo dục. Ông là người sáng lập và CEO của Mindvalley, đồng thời cũng là thành viên của Hội đồng Lãnh đạo Chuyển đổi và là thành viên của Hội đồng Sáng tạo cho Quỹ XPRIZE.

Ông là một diễn giả nổi tiếng về sự phát triển và chuyển đổi cá nhân, hoạt động với sứ mệnh cách mạng hóa hệ thống giáo dục toàn cầu bằng cách đưa ra các mô hình mới nhằm nâng cao tiềm năng của con người ở khắp mọi nơi trên thế giới.

Mã hàng	8935251407587
Tên Nhà Cung Cấp	Alpha Books
Tác giả	Vishen Lakhiani
Người Dịch	Nguyệt Minh
NXB	NXB Công Thương
Năm XB	2020
Trọng lượng (gr)	350
Kích Thước Bao Bì	23 x 15 cm
Số trang	356
Hình thức	Bìa Mềm
Sản phẩm hiển thị trong	
Alpha Books
Sản phẩm bán chạy nhất	Top 100 sản phẩm Khoa học khác bán chạy của tháng
10 quy tắc gia tăng hạnh phúc, khơi nguồn thức tỉnh và nâng tầm ảnh hưởng

Điều gì sẽ sảy ra nếu con người cứ vô thức sống theo những quan niệm, niềm tin đã lỗi thời về tình yêu, công việc hay hạnh phúc được truyền từ đời này sang đời khác? Và nếu có nhận ra chính mình cũng đang sống như vậy, bạn có dũng cảm vượt ra ngoài khuôn khổ ấy không?

Giải mã siêu trí tuệ là một bản thiết kế 10 quy tắc giúp bạn phá bỏ xiềng xích của một cuộc sống bình thường để sống một cuộc đời phi thường. Kết hợp tư duy tính toán, lý thuyết tích hợp, tâm linh hiện đại, sinh học tiến hóa cùng với cách dẫn dắt hài hước, Vishen Lakhiani cung cấp công cụ giúp bạn trở thành một kẻ dám đột phá, thách thức, phát triển cá nhân, bẻ khóa tâm trí và tạo ra các quy tắc mới cho cuộc sống CỦA CHÍNH BẠN.

Cuốn sách gửi tới người đọc một bộ quy tắc “mã hóa bản thân” để hiểu về thế giới theo những cách phi thường; để xây dựng một cuộc sống hạnh phúc; và hơn cả, là để dám mơ về những điều vượt ngoài khuôn khổ truyền thống.', 0, NULL, N'assets/epubs/B00099.epub', 1, CAST(N'2022-07-19T16:20:25.237' AS DateTime), NULL, N'M0002', NULL, N'C05', 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C00', N'Văn học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C01', N'Tâm lý - Kỹ năng sống')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C02', N'Lịch sử - Địa lý')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C03', N'Tôn giáo - Triết học')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C04', N'Chính trị - Pháp luật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C05', N'Khoa học kỹ thuật')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C06', N'Kinh tế')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C07', N'Sức khoẻ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C08', N'Nhân vật - Sự kiện')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C09', N'Thiếu nhi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C10', N'Ngoại ngữ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C11', N'Giáo trình')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (N'C12', N'Khác')
GO
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-13T00:00:00.000' AS DateTime), N'B00000', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-14T00:00:00.000' AS DateTime), N'B00001', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-14T00:00:00.000' AS DateTime), N'B00002', N'M0003')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'B00005', N'M0004')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-11T00:00:00.000' AS DateTime), N'B00006', N'M0004')
INSERT [dbo].[Download] ([DateDownload], [BookID], [MemberID]) VALUES (CAST(N'2022-07-12T00:00:00.000' AS DateTime), N'B00007', N'M0004')
GO
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0000', N'admin0@gmail.com', N'123456789', N'M0000.jpg', N'admin', N'Phú', N'Huỳnh', CAST(N'2002-06-04' AS Date), 19, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0001', N'admin1@gmail.com', N'123456789', N'admin1.jpg', N'admin', N'Bình', N'Nguyễn Thanh', CAST(N'2002-01-01' AS Date), 8, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0002', N'admin2@gmail.com', N'123456789', N'admin2.jpg', N'admin', N'Kiệt', N'Chu Tuấn', CAST(N'2002-01-02' AS Date), 3, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0003', N'user3@gmail.com', N'123456789', NULL, N'user', N'Phương', N'Trần', CAST(N'2000-01-02' AS Date), 1, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0004', N'user4@gmail.com', N'123456789', N'M0004.jpg', N'user', N'Ý', N'Trần Thị Như', CAST(N'2000-01-06' AS Date), 0, N'Other')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0005', N'user5@gmail.com', N'123456789', N'img_M0005.jpg', N'user', N'Hoà', N'Đoàn Nguyễn Thành ', CAST(N'1980-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0006', N'user6@gmail.com', N'123456789', NULL, N'user', N'Khánh', N'Kiều Trọng', CAST(N'1970-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0007', N'user7@gmail.com', N'123456789', NULL, N'user', N'Thanh', N'Pham Cong', CAST(N'2000-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0008', N'user8@gmail.com', N'123456789', NULL, N'user', N'Nhân', N'Nguyễn Thành', CAST(N'2000-01-02' AS Date), 0, N'Other')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0009', N'user9@gmail.com', N'123456789', NULL, N'user', N'Vân', N'Thân Thị Ngọc Vân', CAST(N'1988-01-02' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0010', N'user10@gmail.com', N'123456789', NULL, N'user', N'Sử', N'Thân Văn Sử', CAST(N'1970-01-02' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0011', N'user11@gmail.com', N'123456789', N'M0011.jpg', N'user', N'Trịnh', N'Thanh Bình', CAST(N'2022-06-30' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0012', N'user12@gmail.com', N'123456789', NULL, N'user', N'kid', N'kaito', CAST(N'1998-12-06' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0013', N'user13@gmail.com', N'123456789', NULL, N'user', N'Quang', N'Trần', CAST(N'1999-01-01' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0014', N'user14@gmail.com', N'123456789', NULL, N'user', N'Linh', N'Như', CAST(N'2000-06-02' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0015', N'user15@gmail.com', N'123456789', NULL, N'user', N'Dũng', N'Vũ', CAST(N'2001-03-09' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0016', N'user16@gmail.com', N'123456789', NULL, N'user', N'Giang', N'Trầm', CAST(N'1990-12-09' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0017', N'user17@gmail.com', N'123456789', NULL, N'user', N'Phùng', N'Mạnh', CAST(N'1999-12-30' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0018', N'user18@gmail.com', N'123456789', NULL, N'user', N'Nguyên', N'Lê Phùng', CAST(N'1995-07-12' AS Date), 0, N'Male')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0019', N'user19@gmail.com', N'123456789', NULL, N'user', N'Nhã', N'Nguyễn Thanh', CAST(N'2003-11-10' AS Date), 0, N'Female')
INSERT [dbo].[Member] ([MemberID], [Email], [Password], [Avatar], [Role], [FirstName], [LastName], [Birthday], [NoUploadedBook], [Gender]) VALUES (N'M0020', N'user20@gmail.com', N'123456789', NULL, N'user', N'Tuấn', N'Nguyễn Đông', CAST(N'2004-03-09' AS Date), 0, N'Male')
GO
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00000', 5, N'Cảm ơn bạn, nghe nói cuốn sách này khá hay', CAST(N'2022-06-06T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0003', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00001', 5, N'Sách rất hay', CAST(N'2022-06-06T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0004', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00002', 5, N'hayyyyy lắm mn oi', CAST(N'2022-06-07T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0005', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00003', 4, N'Cx đc', CAST(N'2022-06-08T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0006', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00004', 5, N'Xuất sắc', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0007', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00005', 5, N'không thể thiếu trong tủ sách', CAST(N'2022-06-09T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0007', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00006', 5, N'Tuyệt zời', CAST(N'2022-06-10T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0008', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00007', 5, N'Bà hàng xóm nhà mình đây, trước đi buôn đồng nát, tình cờ có thằng sinh viên khoa cntt nó bán đống sách cũ. Thế nào mà bà ấy mua "300 bài code thiếu nhi" cầm về đọc.
Rồi sáng đi mua đồng nát, tối về đọc sách, cuối tuần ra quán net thực hành. Sáu tháng sau bà ấy khăn gói lên HN đi phỏng vấn, cũng nhờ code trên giấy nhiều mà mấy bài "whiteboard" bà ấy làm ngon ơ.
Cũng 5 năm rồi, giờ đang làm lead ở một công ty khá lớn. Đúng là cái nghề này mang lại cơ hội đổi đời cho nhiều người.', CAST(N'2022-07-12T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0005', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00008', 5, N'very good', CAST(N'2022-07-13T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0000', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00009', 5, N'Quê tôi miền biển, có gia đình cạnh nhà làm nghề chài lưới.
Bữa đi kéo lưới, thấy gì nặng nặng tưởng được mẻ cá to, ai ngờ toàn sách là sách. Nào là "300 bài code thiếu nhi", "Lập trình căn bản", " Machine Learning", "Deep Learning", "AI"...
A định vất đi nhưng nhà mấy đời ko biết mặt chữ là gì nên quyết tâm cầm về gối đầu giường. A đi học bổ túc văn hóa ban đêm phổ cập con chữ.
Ấy thế mà bẵng đi 6 tháng tôi từ thủ đô về thăm A khoe giờ ở nhà làm freelancer cho cty gì ở Mỹ ấy, to lắm, lương xấp xỉ 1 củ Trump/năm.', CAST(N'2022-07-14T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0003', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00010', 5, N'Gần nhà mình có ông tầm gần 30, bảo làm cà phê, tiêu mệt quá.
Thế là khăn gói xuống tp học 1 khóa lập trình pithon dip leaning gì đó, xong rồi làm 300 bài code thiếu nhi luyện tập.
Bữa mới nói chuyện khoe đang làm lương cũng 1-2k gì đó!', CAST(N'2022-07-15T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0004', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00011', 5, N'Bác họ tui 46 rồi, chạy ba gác hoài mệt quá đi học lớp code cấp tốc.
Học hết 2 tháng với làm hết bài trong cuốn 300 bài code thiếu nhi, xong apply vào công ty kia làm mảng data science mỗi tháng lương net hơn 400 triệu.', CAST(N'2022-07-16T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0005', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00012', 5, N'Ông xe ôm xóm mình sinh năm 82, hôm trước chạy xe lớ ngớ thế nào rớt xuống cống, rồi nhặt được cuốn lập trình "code thiếu nhi" gì gì đó.
Về đọc đâu hơn 1 tháng rồi ra HN làm cho công ty trí tuệ nhân tạo to lắm, mới làm 1 năm mua được nhà HN, mua được thêm con mazda 6 rồi.', CAST(N'2022-07-17T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0006', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00013', 5, N'Giống tôi, trước đẩy xe hủ tiếu ngoài đường vô tình bắt gặp nhà nọ mở thời sự về blocktrain, thế là cứ ngày đi bán tối về coi NTN với tranh thủ coi clocktrain 1 xíu.
Về nhà tối nào tôi cũng làm 3 bài trong "300 bài code thiếu nhi", mà sau 3 tháng cũng apply được công ty về tiền ảo.
Giờ tôi đánh sang cả mảng AI nữa, mới viết app di dộng auto deepfake có người trả 300k$ chưa bán.', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0007', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00014', 4, N'Năm ngoái tui đi fuho sml ngoài công trình.
Vô tình tui nhặt dc cuốn sách 300 bài lập trình dành cho thiếu nhi về nhà luyện tập theo.
Sau 3 tháng, tui tự tin apply 1 cty chuyên về AI, ML ở quận 1 lương 3k chưa thưởng hay phụ cấp đây!', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0008', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00015', 5, N'6 tháng trước làm nhà hàng vất vả quá, trong lúc thái thịt đọc lướt được cuốn java căn bản với 300 bài code thiếu nhi.
Bây giờ dev full stack lương 2,2k rồi.', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0009', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00016', 5, N'Ông chú tôi làm sales sim số đẹp cho Viettel, đợt rồi đói ăn quá nên vất cho cuốn lập trình code thiếu nhi gì đấy.
6 tháng sau ổng vào làm dev cứng FPT rồi , nghe bảo lương 2k vì ngành này đang hot.', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0010', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00017', 5, N'Ông già tôi làm công nhân than đuối quá, muốn kiếm việc gì nhẹ hơn.
Tôi giới thiệu ổng khoá học HTML/CSS/PHP trên ucademy với làm bài tập trong cuốn 300 bài code thiếu nhi.
Sau 6 tháng, giờ ổng ở nhà làm freelancer rung đùi hàng tháng tài khoản cứ bắn vào mấy ngàn $.
Đang tính bảo bà già khỏi đi làm nữa ở nhà mà xài tiền.', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00017', N'M0011', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00021', 5, N'ok sách hay nah', CAST(N'2022-06-18T00:00:00.000' AS DateTime), NULL, N'B00003', N'M0007', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00022', 5, N'tuyệt vời lắm', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00003', N'M0008', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00023', 5, N'ko có gì để chê', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00003', N'M0009', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00024', 5, N'hữu ích :) ', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00003', N'M0002', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00025', 5, N'tải bị lỗi :((((((', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00006', N'M0015', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00026', 5, N'lỗi rồi kìa', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00006', N'M0004', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00027', 5, N'admin cập nhật lại link tải nhé', CAST(N'2022-07-18T00:00:00.000' AS DateTime), NULL, N'B00006', N'M0009', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00028', 5, N'
Một trong những tác phẩm kinh điển, bestseller nên đọc. Sách kể về câu chuyện của một cậu bé chăn cừu trên con đường đi tìm kiếm kho báu khổng lồ. Câu chuyện đem đến cho bản thân em nhiều suy nghĩ và liên tưởng về cuộc sống này. Con đường cậu đi, những ngôi làng, những sa mạc, những con người cùng những cuộc gặp gỡ. Cuộc sống chính được tạo nên từ những điều như thế. Trong hành trình tiến về phía trước luôn có những khó khăn, vất vả, những mất mát hay cả những thất bại. Nhưng chúng ta nhất định phải bản lĩnh và kiên cường. Tuyệt đối không bị gục ngã trước nghịch cảnh. Và định nghĩa về những điều quý giá, chúng vẫn luôn hiện hữu xung quanh chúng ta, là tình thân, tình bạn, tình yêu,... Vậy nên đừng tìm kiếm xa xôi, hãy luôn quý trọng tất cả những gì mà mình đang có. Hẳn cuốn sách còn đem lại nhiều hơn những suy nghĩ sâu sắc, đây chỉ là những cảm nhận chung nhất của em. Cuốn sách rất hay, rất đáng mua đọc ạ.', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00035', N'M0002', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00031', 5, N'hay lắm', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00000', N'M0002', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00032', 5, N'
Đi tìm kho báu ở kim tự tháp Ai cập. 1 hành trình dài bắt đầu và có rất nhiều lúc cậu có ý định quay trở về. Sau bao nhiêu khó khăn : bị lừa hết sạch tiền ,lạc lõng ở 1 nơi hoàn toàn xa lạ cậu học được cách hòa nhập và hiểu ra rằng tất cả chỉ là một. Cậu đã hòa nhập học được 1 ngôn ngữ mới và hành trình gian nan chính thức bắt đầu. Cậu đi băng qua sa mạc với nỗi nguy hiểm của gió cát ,rắn độc, bọn cướp... Cậu gặp được 1 Anh chàng có mong ước trở thành nhà giả kim cũng đang theo đuổi sứ mệnh của mình. Họ trốn vào 1 đảo để lẩn tránh cuộc chiến của các bộ tộc. Cậu đã hòa vào làm 1 với tâm linh vũ trụ và cứu sống cư dân trong ốc đảo, nhờ đó cậu gặp được nhà giả kim mà người bạn của cậu rất muốn gặp. Cậu lại tiếp tục hành trình đi tìm kho báu với nhà giả kim nọ và để định mệnh của đời cậu- nàng fatima ở lại ốc đảo chờ đợi. Kết thúc với việc cậu đã tìm thấy kho báu với rất nhiều vàng bạc và thông điệp cuối cùng là:''''cuộc đời rất hào phóng với người nào chịu theo đuổi vận mệnh của mình"', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00035', N'M0001', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00033', 5, N'
Cuối cùng thì tớ đã đọc được cuốn xếp vào hàng kinh điển này sau bao ngày lần lữa. Phải nói rằng, tớ đã đọc qua nhiều quan điểm trái chiều về cuốn này trước khi đọc nó (và tớ hơi hối hận vì đã làm thế). Hầu hết thì cho rằng cuốn này xứng tầm với danh tiếng của mình, số khác cho rằng Nhà giả kim bị đánh giá quá cao, nhiều người bảo "bình thường". Nhưng đọc rồi thì tớ lại có cảm nhận của riêng mình. Nhà giả kim mang hình mẫu của một câu chuyện ngụ ngôn, nhưng lại thể hiện cái tôi nhân vật nhiều. Đó là cách mà Paulo Coelho tạo dựng truyện ngụ ngôn theo kiểu của riêng ông. Bằng cách sử dụng câu chuyện của cậu chăn cừu - một câu chuyện hiện hữu và dễ hình dung, Paulo đã truyền tải những triết lý về cuộc đời, về ước mơ và cả số phận con người. Câu chuyện có lẽ hơi bình dị với một số người, nhưng chính sự giản đơn đó đã dẫn dắt thành công câu chuyện. Hành trình của cậu chăn cừu là một hành trình vừa thực vừa ảo, chân thực mà cũng có những khoảnh khắc xa lạ tưởng như mơ. Đó không chỉ là một chuyến đi thực thụ, đó còn là bước trở mình từ cậu bé chăn cừu chỉ suốt ngày quẩn quanh bên đàn cừu, đến người đàn ông trưởng thành dám ra đi để tìm kho báu đích thực. Một câu chuyện kỳ diệu và nhân văn. Với tớ, đọc sách là một dạng trải nghiệm, và nhận thức về trải nghiệm này thường dựa trên trải nghiệm trong cuộc sống. Nhiều người không đánh giá cao Nhà giả kim bởi vì với trải nghiệm đời thực của họ, câu chuyện về cậu bé chăn cừu không có gì mới lạ. Còn về phần tớ, đó lại là một câu chuyện mang tính truyền cảm cao và không quá triết lý để có thể cảm nhận được. Tóm lại, tớ hoàn toàn hài lòng về cuốn sách này. (Tuy nhiên thì với mấy cái ý kiến thần thánh hoá cuốn này thì tớ không đồng tình rồi).', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00035', N'M0000', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00035', 5, N'
Cuốn sách Nhà giả kim của tác giả Paulo Coelho là một trong những tác phẩm kinh điển, bestseller nên đọc. Sách kể về câu chuyện của một cậu bé chăn cừu trên con đường đi tìm kiếm kho báu khổng lồ. Câu chuyện đem đến cho bản thân em nhiều suy nghĩ và liên tưởng về cuộc sống này. Con đường cậu đi, những ngôi làng, những sa mạc, những con người cùng những cuộc gặp gỡ. Cuộc sống chính được tạo nên từ những điều như thế. Trong hành trình tiến về phía trước luôn có những khó khăn, vất vả, những mất mát hay cả những thất bại. Nhưng chúng ta nhất định phải bản lĩnh và kiên cường. Tuyệt đối không bị gục ngã trước nghịch cảnh. Và định nghĩa về những điều quý giá, chúng vẫn luôn hiện hữu xung quanh chúng ta, là tình thân, tình bạn, tình yêu,... Vậy nên đừng tìm kiếm xa xôi, hãy luôn quý trọng tất cả những gì mà mình đang có. Hẳn cuốn sách còn đem lại nhiều hơn những suy nghĩ sâu sắc, đây chỉ là những cảm nhận chung nhất của em. Cuốn sách rất hay, rất đáng mua đọc ạ.', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00035', N'M0000', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00036', 5, N'lối sống tối giản', CAST(N'2022-07-19T00:00:00.000' AS DateTime), NULL, N'B00003', N'M0000', 0)
INSERT [dbo].[Rating] ([RatingID], [Star], [Comment], [DateRating], [LastDateEdit], [BookID], [MemberID], [Deleted]) VALUES (N'R00037', 5, N'0d PE nha em', CAST(N'2022-07-20T10:37:13.327' AS DateTime), NULL, N'B00005', N'M0005', 0)
GO
SET IDENTITY_INSERT [dbo].[ReportBook] ON 

INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (1, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Wrong book information
', N'Thiếu tên NXB', N'Process', N'B00030', N'M0003')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (2, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Wrong book information
', N'Thiếu file EPUB', N'Process', N'B00017', N'M0003')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (3, CAST(N'2022-07-01T00:00:00.000' AS DateTime), N'Damaged File
', N'Không tải được file ', N'Denied', N'B00027', N'M0004')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (4, CAST(N'2022-06-20T00:00:00.000' AS DateTime), N'Other problem
', N'Sách không hay', N'Approved', N'B00017', N'M0003')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (5, CAST(N'2022-07-10T00:00:00.000' AS DateTime), N'Remove the book (spam, inappropriate file)
', N'Spam', N'Approved', N'B00017', N'M0005')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (6, CAST(N'2022-07-20T16:26:11.350' AS DateTime), N'Remove the book (spam, inappropriate file)', N'dsfdsf', N'Process', N'B00006', N'M0005')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (7, CAST(N'2022-07-20T16:26:22.630' AS DateTime), N'Remove the book (spam, inappropriate file)', N'asd', N'Process', N'B00006', N'M0005')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (8, CAST(N'2022-07-20T16:45:42.117' AS DateTime), N'Other problem', N'', N'Process', N'B00017', N'M0000')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (9, CAST(N'2022-07-20T16:46:17.513' AS DateTime), N'Other problem', N'', N'Process', N'B00024', N'M0000')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (10, CAST(N'2022-07-20T18:13:23.543' AS DateTime), N'Wrong book information', N'wrong', N'Denied', N'B00017', N'M0000')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (11, CAST(N'2022-07-20T18:29:03.887' AS DateTime), N'Damaged File', N'nahf giar kim', N'Denied', N'B00035', N'M0000')
INSERT [dbo].[ReportBook] ([ReportID], [DateReport], [ReportType], [Detail], [ReportState], [BookID], [MemberID]) VALUES (12, CAST(N'2022-07-20T18:29:59.983' AS DateTime), N'Other problem', N'sapien
', N'Approved', N'B00000', N'M0000')
SET IDENTITY_INSERT [dbo].[ReportBook] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Member__A9D10534B71C7858]    Script Date: 7/20/2022 7:49:43 PM ******/
ALTER TABLE [dbo].[Member] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportBook]    Script Date: 7/20/2022 7:49:43 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportBook] ON [dbo].[ReportBook]
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook712907] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook712907]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook935807] FOREIGN KEY([MemberUpload])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook935807]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FKBook950482] FOREIGN KEY([MemberLastEdit])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FKBook950482]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FKDownload32955] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FKDownload32955]
GO
ALTER TABLE [dbo].[Download]  WITH CHECK ADD  CONSTRAINT [FKDownload466591] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Download] CHECK CONSTRAINT [FKDownload466591]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FKRating736872] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FKRating736872]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FKRating762673] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FKRating762673]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook659826] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook659826]
GO
ALTER TABLE [dbo].[ReportBook]  WITH CHECK ADD  CONSTRAINT [FKReportBook812217] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[ReportBook] CHECK CONSTRAINT [FKReportBook812217]
GO
USE [master]
GO
ALTER DATABASE [BookZ] SET  READ_WRITE 
GO
