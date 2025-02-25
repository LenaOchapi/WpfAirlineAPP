USE [22-107k-10-airlane]
GO
/****** Object:  Table [dbo].[Aboniment]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aboniment](
	[KodAboniment] [int] NOT NULL,
	[Client] [int] NOT NULL,
	[DataPokupki] [date] NULL,
	[DataOkonhanie] [date] NULL,
	[TipAboniment] [int] NOT NULL,
	[Summa] [int] NULL,
	[SposobOplati] [int] NOT NULL,
 CONSTRAINT [PK_Aboniment] PRIMARY KEY CLUSTERED 
(
	[KodAboniment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[idAdress] [bigint] NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Street] [varchar](max) NOT NULL,
	[house] [varchar](10) NOT NULL,
	[apartment] [varchar](50) NULL,
 CONSTRAINT [PK_EmployeesAdress] PRIMARY KEY CLUSTERED 
(
	[idAdress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircrafts](
	[IDaircraft] [bigint] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [varchar](50) NOT NULL,
	[titleOfPlain] [varchar](50) NOT NULL,
	[TypeOfAirplain] [bigint] NOT NULL,
	[TransitChek] [bit] NULL,
	[DailyChek] [bit] NOT NULL,
	[WeeklyChek] [bit] NOT NULL,
	[AChek] [bit] NOT NULL,
	[BChek] [bit] NOT NULL,
	[CChek] [bit] NOT NULL,
	[DChek] [bit] NOT NULL,
	[SVChek] [bit] NULL,
	[Discription] [varchar](max) NULL,
 CONSTRAINT [PK_Aircrafts] PRIMARY KEY CLUSTERED 
(
	[IDaircraft] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirplaneType]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirplaneType](
	[IDofType] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfPlain] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AirplaneType] PRIMARY KEY CLUSTERED 
(
	[IDofType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[AirportsID] [bigint] IDENTITY(1,1) NOT NULL,
	[AirportName] [varchar](100) NOT NULL,
	[AirportCountry] [varchar](50) NOT NULL,
	[AirportCity] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED 
(
	[AirportsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanniePersonal]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanniePersonal](
	[KodPersonal] [int] IDENTITY(1,1) NOT NULL,
	[ImiPersonal] [nvarchar](100) NOT NULL,
	[FamiliaPersonala] [nvarchar](100) NOT NULL,
	[OthestvoPersonala] [nvarchar](100) NULL,
	[DataRojdenia] [datetime] NULL,
	[NomerTelefona] [int] NULL,
	[Doljnosti] [int] NOT NULL,
	[StajRaboti] [int] NULL,
 CONSTRAINT [PK_DanniePersonal] PRIMARY KEY CLUSTERED 
(
	[KodPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doljnosti]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doljnosti](
	[KodDolj] [int] NOT NULL,
	[NameDolj] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Doljnosti] PRIMARY KEY CLUSTERED 
(
	[KodDolj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[idEmployee] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[idJobTitle] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[hireDate] [date] NOT NULL,
	[comments] [varchar](max) NULL,
	[Salary] [int] NOT NULL,
	[IDuser] [bigint] NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[idEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flightEmpoyees]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flightEmpoyees](
	[EmployeeID] [bigint] NOT NULL,
	[idFlight] [bigint] NOT NULL,
	[comments] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flights]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flights](
	[IDflight] [bigint] IDENTITY(1,1) NOT NULL,
	[flightNumber] [nchar](10) NOT NULL,
	[departureDate] [date] NOT NULL,
	[departureTime] [time](7) NOT NULL,
	[DepartureAirport] [bigint] NOT NULL,
	[ArrivalAirport] [bigint] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[ArrivalTime] [time](7) NOT NULL,
	[idAircraft] [bigint] NOT NULL,
 CONSTRAINT [PK_flights] PRIMARY KEY CLUSTERED 
(
	[IDflight] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flightsClass]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flightsClass](
	[ClassID] [bigint] NOT NULL,
	[typeOfClass] [varchar](50) NOT NULL,
	[Discription] [varchar](max) NULL,
 CONSTRAINT [PK_flightsClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfoZanitia]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoZanitia](
	[KodZanitia] [int] NOT NULL,
	[Zanitia] [int] NOT NULL,
	[VremiZanitia] [time](7) NOT NULL,
	[Trener] [int] NOT NULL,
	[DataZanitia] [date] NULL,
 CONSTRAINT [PK_InfoZanitia] PRIMARY KEY CLUSTERED 
(
	[KodZanitia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternationalPassportInform]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternationalPassportInform](
	[InternationalPassportID] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[DateOfBirth] [date] NOT NULL,
	[DateOfIssue] [date] NOT NULL,
	[VisaInfo] [bigint] NULL,
 CONSTRAINT [PK_InternationalPassportInform] PRIMARY KEY CLUSTERED 
(
	[InternationalPassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[idJobTitle] [int] NOT NULL,
	[NameOfJobTitle] [varchar](50) NOT NULL,
	[Discription] [varchar](max) NULL,
 CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED 
(
	[idJobTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[KodKlienta] [int] IDENTITY(1,1) NOT NULL,
	[Aboniment] [int] NOT NULL,
	[ImiKlient] [nvarchar](100) NOT NULL,
	[FamiliaKlient] [nvarchar](100) NOT NULL,
	[NomerTelefona] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[DataRojdeniaKlient] [datetime] NULL,
	[SeriaPasport] [char](4) NOT NULL,
	[NomerPasport] [char](6) NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[KodKlienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kolichistvo]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kolichistvo](
	[KodKolich] [int] NOT NULL,
	[KodZanitia] [int] NOT NULL,
	[KodClienta] [int] NOT NULL,
 CONSTRAINT [PK_Kolichistvo] PRIMARY KEY CLUSTERED 
(
	[KodKolich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oplata]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oplata](
	[KodOplati] [int] NOT NULL,
	[Client] [int] NOT NULL,
	[Aboniment] [int] NOT NULL,
	[DataOplati] [date] NULL,
	[Summa] [int] NULL,
	[SposobOplati] [int] NOT NULL,
 CONSTRAINT [PK_Oplata] PRIMARY KEY CLUSTERED 
(
	[KodOplati] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[IDFlight] [bigint] NOT NULL,
	[IDPassengerPersonalInfo] [bigint] NOT NULL,
	[Class] [bigint] NOT NULL,
	[baggage] [bit] NULL,
	[HandLuggage] [bit] NULL,
 CONSTRAINT [PK_Passengers] PRIMARY KEY CLUSTERED 
(
	[IDFlight] ASC,
	[IDPassengerPersonalInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassengersPersInfo]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassengersPersInfo](
	[IDPassengerPersonalInfo] [bigint] NOT NULL,
	[PasportDate] [bigint] NULL,
	[InternationalPasportDate] [bigint] NULL,
	[email] [varchar](50) NULL,
	[PersonAdress] [bigint] NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PassengersPersInfo] PRIMARY KEY CLUSTERED 
(
	[IDPassengerPersonalInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassportDate]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassportDate](
	[PassportID] [bigint] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PassportNumber] [varchar](6) NOT NULL,
	[PassportSeries] [varchar](4) NOT NULL,
	[DateOfIssue] [varchar](50) NOT NULL,
	[PlaceOfIssue] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PassportDate] PRIMARY KEY CLUSTERED 
(
	[PassportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polizovateli]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polizovateli](
	[KodPolizovatieli] [int] NOT NULL,
	[LoginPolizovateli] [nvarchar](100) NOT NULL,
	[ParoliPolizovateli] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Polizovateli] PRIMARY KEY CLUSTERED 
(
	[KodPolizovatieli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SposobOplati]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SposobOplati](
	[KodSposOplati] [int] NOT NULL,
	[Sposob] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SposobOplati] PRIMARY KEY CLUSTERED 
(
	[KodSposOplati] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipAbonimenta]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipAbonimenta](
	[KodAboniment] [int] NOT NULL,
	[NameTip] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TipAbonimenta] PRIMARY KEY CLUSTERED 
(
	[KodAboniment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipzanitia]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipzanitia](
	[Kodnipzanitia] [int] NOT NULL,
	[Nametip] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Tipzanitia] PRIMARY KEY CLUSTERED 
(
	[Kodnipzanitia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [bigint] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisaInformation]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisaInformation](
	[VisaID] [bigint] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[gender] [varchar](10) NOT NULL,
	[citizenshi[] [varchar](50) NOT NULL,
	[VisaNumber] [varchar](15) NOT NULL,
	[DateOfIssue] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
 CONSTRAINT [PK_VisaInformation] PRIMARY KEY CLUSTERED 
(
	[VisaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zanitie]    Script Date: 24.04.2024 14:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zanitie](
	[KodZanitia] [int] NOT NULL,
	[NazvanieZanitia] [nvarchar](100) NOT NULL,
	[OpisanieZanitia] [nvarchar](max) NULL,
	[TipZanitia] [int] NOT NULL,
 CONSTRAINT [PK_Zanitie] PRIMARY KEY CLUSTERED 
(
	[KodZanitia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Adress] ([idAdress], [Country], [City], [Street], [house], [apartment]) VALUES (1, N'Россия', N'Новосибирск', N'улица 1905 года', N'30/1', N'16')
GO
SET IDENTITY_INSERT [dbo].[Aircrafts] ON 

INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (1, N'A320-214', N'Airbus 320', 2, 0, 1, 1, 1, 1, 1, 1, 1, N'что-то')
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (2, N'A330-343', N'Airbus 330', 1, 1, 1, 1, 1, 1, 1, 1, 1, N'')
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (3, N'A380-841', N'Airbus A380', 1, 1, 1, 1, 1, 1, 1, 1, 1, N'')
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (4, N'A350-941', N'Airbus 350', 1, 0, 1, 1, 1, 1, 1, 1, 1, N'xnj-nj')
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (5, N'A319-111', N'Airbus', 2, 1, 1, 1, 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (6, N'737-800', N'Boeing 737', 2, 0, 1, 1, 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (7, N'747-400', N'Boeing 747', 1, 1, 1, 1, 1, 1, 1, 1, 0, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (8, N'777-300ER', N'Boeing 777', 1, 0, 1, 1, 1, 1, 1, 1, 0, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (9, N'787-9', N'Boeing 787', 1, 0, 1, 1, 1, 1, 1, 1, 0, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (10, N'767-300ER', N'Boeing 767', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (11, N'JetBlue Airways Airbus A320', N'Jet Blue', 2, 0, 1, 1, 1, 1, 1, 1, 0, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (12, N'Southwest Airlines Boeing 737-800', N'Jet Southwest', 2, 1, 1, 1, 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (13, N' Delta Air Lines Airbus A350-900', N'Jet Delta', 1, 1, 1, 1, 1, 1, 1, 1, 0, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (14, N' United Airlines Boeing 787-9', N'Jet United', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL)
INSERT [dbo].[Aircrafts] ([IDaircraft], [SerialNumber], [titleOfPlain], [TypeOfAirplain], [TransitChek], [DailyChek], [WeeklyChek], [AChek], [BChek], [CChek], [DChek], [SVChek], [Discription]) VALUES (15, N'American Airlines Boeing 767-300ER', N'Jet American Airlines', 1, 1, 1, 1, 1, 1, 1, 1, 1, N'')
SET IDENTITY_INSERT [dbo].[Aircrafts] OFF
GO
SET IDENTITY_INSERT [dbo].[AirplaneType] ON 

INSERT [dbo].[AirplaneType] ([IDofType], [TypeOfPlain]) VALUES (1, N'дальнемагистральный')
INSERT [dbo].[AirplaneType] ([IDofType], [TypeOfPlain]) VALUES (2, N'среднемагистральный')
INSERT [dbo].[AirplaneType] ([IDofType], [TypeOfPlain]) VALUES (3, N'ближнемагистральный')
INSERT [dbo].[AirplaneType] ([IDofType], [TypeOfPlain]) VALUES (4, N'самолёт местных воздушных авиалиний')
SET IDENTITY_INSERT [dbo].[AirplaneType] OFF
GO
SET IDENTITY_INSERT [dbo].[Airports] ON 

INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (1, N'Hartsfield–Jackson Atlanta International Airport', N'США', N'Атланта')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (2, N'Dallas Fort Worth International Airport', N'США', N'Даллас')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (3, N'Denver International Airport', N'США', N'Денвер')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (4, N'O''Hare International Airport', N'США', N'Чикаго')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (5, N'Dubai International Airport', N'ОАЭ', N'Дубай')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (6, N'Los Angeles International Airport', N'США', N'Лос-Анджелес')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (7, N'Istanbul Airport', N'Турция', N'Стамбул')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (8, N'Heathrow Airport', N'Великобритания', N'Лондон')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (9, N'Indira Gandhi International Airport', N'Индия', N'Дели')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (10, N'Charles de Gaulle Airport', N'Франция', N'Париж')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (11, N'Singapore Changi Airport

', N'Сингапур', N'Сингапур')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (12, N'London Gatwick Airport', N'Великобритания', N'Лондон')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (13, N'Suvarnabhumi Airport', N'Таиланд', N'Бангкок')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (14, N'Ninoy Aquino International Airport', N'Филиппины', N'Манила')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (15, N' Sydney Airport', N'Австралия', N'Сидней')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (16, N'Tan Son Nhat International Airport', N'Вьетнам', N'Хошмин')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (17, N'Toronto Pearson International Airport', N'Канада', N'Торонто')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (18, N'Munich Airport', N'Германия', N'Мюнхен')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (19, N'Leonardo da Vinci–Fiumicino Airport', N'Италия', N'Рим')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (20, N'King Abdulaziz International Airport', N'Саудовская Аравия', N'Джедда')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (21, N'King Fahd International', N'Саудовская Аравия', N'Даммам')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (22, N'Orlando International', N'США', N'Орландо')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (23, N' Washington Dulles International', N'Вашингтон', N'США')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (24, N'Beijing Daxing International', N'Китай', N'Пекин')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (25, N'George Bush Intercontinental', N'США', N'Хьюстон')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (26, N'Shanghai Pudong International', N'Китай', N'Шанхай')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (27, N'Cairo International

', N'Египет', N'Каир')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (28, N'Suvarnabhumi International', N'Таиланд', N'Бангкок')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (29, N'Sheremetyevo International Airport', N'Россия', N'Москва')
INSERT [dbo].[Airports] ([AirportsID], [AirportName], [AirportCountry], [AirportCity]) VALUES (30, N'Domodedovo International Airport', N'Россия', N'Москва')
SET IDENTITY_INSERT [dbo].[Airports] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (1, N'Елена', N'Очапова', N'Ювинальевна', 1, CAST(N'2004-02-08' AS Date), N'89137187226', N'ochapovalen@mail.ru', CAST(N'2020-12-12' AS Date), NULL, 5000, 1)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (2, N'Алёна', N'Горшкова', N'Дмитриевна', 2, CAST(N'2003-12-31' AS Date), N'89247741739', N'rubyroid@gmail.com', CAST(N'2020-12-12' AS Date), NULL, 50000, 2)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (3, N'Елена', N'Очапова', N'Ювинальевна', 1, CAST(N'2004-08-02' AS Date), N'89137187226', N'', CAST(N'2020-12-12' AS Date), NULL, 100000, 3)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (5, N'Евгений', N'Чайка', N'', 2, CAST(N'2000-02-02' AS Date), N'88005553535', N'', CAST(N'2020-12-20' AS Date), NULL, 200000, 5)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (6, N'Алёна', N'Горшкова', N'', 2, CAST(N'2003-12-31' AS Date), N'89137773636', N'', CAST(N'2020-12-12' AS Date), NULL, 40000, 6)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (7, N'Имя1', N'Фамилия1', N'Отчество1', 3, CAST(N'2000-02-02' AS Date), N'88005553535', N'', CAST(N'2020-12-12' AS Date), NULL, 20000, 7)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (8, N'Инокентий', N'Иванов', N'Сидорович', 4, CAST(N'2000-12-12' AS Date), N'79137187226', N'', CAST(N'2020-12-12' AS Date), NULL, 60000, 8)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (9, N'Bv', N'edwed', N'dwdwe', 1, CAST(N'2020-12-12' AS Date), N'23332', N'', CAST(N'2020-12-12' AS Date), NULL, 2333, 9)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (13, N'Петр', N'Петров', N'Петрович', 3, CAST(N'1990-03-01' AS Date), N'89567575', N'aboba@gmail.com', CAST(N'2023-10-05' AS Date), NULL, 0, 10)
INSERT [dbo].[employees] ([idEmployee], [Name], [Surname], [Patronymic], [idJobTitle], [DateOfBirth], [phoneNumber], [email], [hireDate], [comments], [Salary], [IDuser]) VALUES (32, N'Александр', N'Пушкин', N'Сергеевич', 1, CAST(N'1980-03-13' AS Date), N'83422323535', N'ffddgdd@gmail.com', CAST(N'1992-12-10' AS Date), NULL, 0, 29)
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
INSERT [dbo].[JobTitles] ([idJobTitle], [NameOfJobTitle], [Discription]) VALUES (1, N'Администратор', N'стюардесса')
INSERT [dbo].[JobTitles] ([idJobTitle], [NameOfJobTitle], [Discription]) VALUES (2, N'пилот гражданской авиации', N'пилот')
INSERT [dbo].[JobTitles] ([idJobTitle], [NameOfJobTitle], [Discription]) VALUES (3, N'Агент по регистрации', N'перед вылетом проверяют документы, принимают и взвешивают багаж, снабжают его бирками, а ручную кладь – стикерами и выдают посадочные талоны пассажирам
')
INSERT [dbo].[JobTitles] ([idJobTitle], [NameOfJobTitle], [Discription]) VALUES (4, N'Авиадиспетчер', N'отслеживает места пребывания самолётов')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (1, N'varChar', N'AB38EADAEB746599F2C1EE90F8267F31F467347462764A24D71AC1843EE77FE3')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (2, N'ruby31', N'AB38EADAEB746599F2C1EE90F8267F31F467347462764A24D71AC1843EE77FE3')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (3, N'LenaO', N'809D9D312EECEB4A49FD12B0B4C6E067CACF7B59C943AA5C61D47A2887954F1C')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (5, N'Chaika', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (6, N'Person1', N'19513FDC9DA4FB72A4A05EB66917548D3C90FF94D5419E1F2363EEA89DFEE1DD')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (7, N'Person2', N'1BE0222750AAF3889AB95B5D593BA12E4FF1046474702D6B4779F4B527305B23')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (8, N'Person3', N'2538F153F36161C45C3C90AFAA3F9CCC5B0FA5554C7C582EFE67193ABB2D5202')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (9, N'login', N'E45D90957EEC7387726C6A1B174DA7B566A24FF4CB060DCBCDFEBB931A93FFE3')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (10, N'agent1', N'8D969EEF6ECAD3C29A3A629280E686CF0C3F5D5A86AFF3CA12020C923ADC6C92')
INSERT [dbo].[Users] ([IDUser], [login], [password]) VALUES (29, N'Pushkin', N'AB38EADAEB746599F2C1EE90F8267F31F467347462764A24D71AC1843EE77FE3')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Aboniment]  WITH CHECK ADD  CONSTRAINT [FK_Aboniment_TipAbonimenta] FOREIGN KEY([TipAboniment])
REFERENCES [dbo].[TipAbonimenta] ([KodAboniment])
GO
ALTER TABLE [dbo].[Aboniment] CHECK CONSTRAINT [FK_Aboniment_TipAbonimenta]
GO
ALTER TABLE [dbo].[Aircrafts]  WITH CHECK ADD  CONSTRAINT [FK_Aircrafts_AirplaneType] FOREIGN KEY([TypeOfAirplain])
REFERENCES [dbo].[AirplaneType] ([IDofType])
GO
ALTER TABLE [dbo].[Aircrafts] CHECK CONSTRAINT [FK_Aircrafts_AirplaneType]
GO
ALTER TABLE [dbo].[DanniePersonal]  WITH CHECK ADD  CONSTRAINT [FK_DanniePersonal_Doljnosti] FOREIGN KEY([Doljnosti])
REFERENCES [dbo].[Doljnosti] ([KodDolj])
GO
ALTER TABLE [dbo].[DanniePersonal] CHECK CONSTRAINT [FK_DanniePersonal_Doljnosti]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_JobTitles] FOREIGN KEY([idJobTitle])
REFERENCES [dbo].[JobTitles] ([idJobTitle])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_JobTitles]
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD  CONSTRAINT [FK_employees_Users] FOREIGN KEY([IDuser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[employees] CHECK CONSTRAINT [FK_employees_Users]
GO
ALTER TABLE [dbo].[flightEmpoyees]  WITH CHECK ADD  CONSTRAINT [FK_flightEmpoyees_employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[employees] ([idEmployee])
GO
ALTER TABLE [dbo].[flightEmpoyees] CHECK CONSTRAINT [FK_flightEmpoyees_employees]
GO
ALTER TABLE [dbo].[flightEmpoyees]  WITH CHECK ADD  CONSTRAINT [FK_flightEmpoyees_flights1] FOREIGN KEY([idFlight])
REFERENCES [dbo].[flights] ([IDflight])
GO
ALTER TABLE [dbo].[flightEmpoyees] CHECK CONSTRAINT [FK_flightEmpoyees_flights1]
GO
ALTER TABLE [dbo].[flights]  WITH CHECK ADD  CONSTRAINT [FK_flights_Aircrafts] FOREIGN KEY([idAircraft])
REFERENCES [dbo].[Aircrafts] ([IDaircraft])
GO
ALTER TABLE [dbo].[flights] CHECK CONSTRAINT [FK_flights_Aircrafts]
GO
ALTER TABLE [dbo].[flights]  WITH CHECK ADD  CONSTRAINT [FK_flights_Airports] FOREIGN KEY([ArrivalAirport])
REFERENCES [dbo].[Airports] ([AirportsID])
GO
ALTER TABLE [dbo].[flights] CHECK CONSTRAINT [FK_flights_Airports]
GO
ALTER TABLE [dbo].[flights]  WITH CHECK ADD  CONSTRAINT [FK_flights_Airports1] FOREIGN KEY([DepartureAirport])
REFERENCES [dbo].[Airports] ([AirportsID])
GO
ALTER TABLE [dbo].[flights] CHECK CONSTRAINT [FK_flights_Airports1]
GO
ALTER TABLE [dbo].[InfoZanitia]  WITH CHECK ADD  CONSTRAINT [FK_InfoZanitia_DanniePersonal] FOREIGN KEY([Trener])
REFERENCES [dbo].[DanniePersonal] ([KodPersonal])
GO
ALTER TABLE [dbo].[InfoZanitia] CHECK CONSTRAINT [FK_InfoZanitia_DanniePersonal]
GO
ALTER TABLE [dbo].[InfoZanitia]  WITH CHECK ADD  CONSTRAINT [FK_InfoZanitia_Zanitie] FOREIGN KEY([Zanitia])
REFERENCES [dbo].[Zanitie] ([KodZanitia])
GO
ALTER TABLE [dbo].[InfoZanitia] CHECK CONSTRAINT [FK_InfoZanitia_Zanitie]
GO
ALTER TABLE [dbo].[InternationalPassportInform]  WITH CHECK ADD  CONSTRAINT [FK_InternationalPassportInform_VisaInformation] FOREIGN KEY([VisaInfo])
REFERENCES [dbo].[VisaInformation] ([VisaID])
GO
ALTER TABLE [dbo].[InternationalPassportInform] CHECK CONSTRAINT [FK_InternationalPassportInform_VisaInformation]
GO
ALTER TABLE [dbo].[Kolichistvo]  WITH CHECK ADD  CONSTRAINT [FK_Kolichistvo_Klient] FOREIGN KEY([KodClienta])
REFERENCES [dbo].[Klient] ([KodKlienta])
GO
ALTER TABLE [dbo].[Kolichistvo] CHECK CONSTRAINT [FK_Kolichistvo_Klient]
GO
ALTER TABLE [dbo].[Kolichistvo]  WITH CHECK ADD  CONSTRAINT [FK_Kolichistvo_Zanitie] FOREIGN KEY([KodZanitia])
REFERENCES [dbo].[Zanitie] ([KodZanitia])
GO
ALTER TABLE [dbo].[Kolichistvo] CHECK CONSTRAINT [FK_Kolichistvo_Zanitie]
GO
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD  CONSTRAINT [FK_Oplata_Aboniment] FOREIGN KEY([Aboniment])
REFERENCES [dbo].[Aboniment] ([KodAboniment])
GO
ALTER TABLE [dbo].[Oplata] CHECK CONSTRAINT [FK_Oplata_Aboniment]
GO
ALTER TABLE [dbo].[Oplata]  WITH CHECK ADD  CONSTRAINT [FK_Oplata_SposobOplati] FOREIGN KEY([SposobOplati])
REFERENCES [dbo].[SposobOplati] ([KodSposOplati])
GO
ALTER TABLE [dbo].[Oplata] CHECK CONSTRAINT [FK_Oplata_SposobOplati]
GO
ALTER TABLE [dbo].[Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Passengers_flights] FOREIGN KEY([IDFlight])
REFERENCES [dbo].[flights] ([IDflight])
GO
ALTER TABLE [dbo].[Passengers] CHECK CONSTRAINT [FK_Passengers_flights]
GO
ALTER TABLE [dbo].[Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Passengers_flightsClass] FOREIGN KEY([Class])
REFERENCES [dbo].[flightsClass] ([ClassID])
GO
ALTER TABLE [dbo].[Passengers] CHECK CONSTRAINT [FK_Passengers_flightsClass]
GO
ALTER TABLE [dbo].[Passengers]  WITH CHECK ADD  CONSTRAINT [FK_Passengers_PassengersPersInfo] FOREIGN KEY([IDPassengerPersonalInfo])
REFERENCES [dbo].[PassengersPersInfo] ([IDPassengerPersonalInfo])
GO
ALTER TABLE [dbo].[Passengers] CHECK CONSTRAINT [FK_Passengers_PassengersPersInfo]
GO
ALTER TABLE [dbo].[PassengersPersInfo]  WITH CHECK ADD  CONSTRAINT [FK_PassengersPersInfo_InternationalPassportInform] FOREIGN KEY([InternationalPasportDate])
REFERENCES [dbo].[InternationalPassportInform] ([InternationalPassportID])
GO
ALTER TABLE [dbo].[PassengersPersInfo] CHECK CONSTRAINT [FK_PassengersPersInfo_InternationalPassportInform]
GO
ALTER TABLE [dbo].[PassengersPersInfo]  WITH CHECK ADD  CONSTRAINT [FK_PassengersPersInfo_PassportDate] FOREIGN KEY([PasportDate])
REFERENCES [dbo].[PassportDate] ([PassportID])
GO
ALTER TABLE [dbo].[PassengersPersInfo] CHECK CONSTRAINT [FK_PassengersPersInfo_PassportDate]
GO
ALTER TABLE [dbo].[Polizovateli]  WITH CHECK ADD  CONSTRAINT [FK_Polizovateli_DanniePersonal] FOREIGN KEY([KodPolizovatieli])
REFERENCES [dbo].[DanniePersonal] ([KodPersonal])
GO
ALTER TABLE [dbo].[Polizovateli] CHECK CONSTRAINT [FK_Polizovateli_DanniePersonal]
GO
ALTER TABLE [dbo].[Zanitie]  WITH CHECK ADD  CONSTRAINT [FK_Zanitie_Tipzanitia] FOREIGN KEY([TipZanitia])
REFERENCES [dbo].[Tipzanitia] ([Kodnipzanitia])
GO
ALTER TABLE [dbo].[Zanitie] CHECK CONSTRAINT [FK_Zanitie_Tipzanitia]
GO
