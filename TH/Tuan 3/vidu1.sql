CREATE DATABASE QLBanHang
on primary(
	size = 50,
	filegrowth = 10%,
	maxsize = 200, 
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QUANLYBANHANG.mdf',
	name = QUANLYBANHANG
)log on(
	size =10,
	filegrowth = 5,
	maxsize = unlimited,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QUANLYBANHANG_log.ldf',
	name = QUANLYBANHANG_log
)
use QLBanhang;

create table VATTU(
	MaVtu char(4) primary key,
	TenVtu nvarchar(30),
	DVTinh nvarchar(10),
	Dongia int
)
create table tblNHACC(
	Manhacc char(4) primary key,
	Tennhacc nvarchar(30),
	Diachi nvarchar(30),
	Dienthoai char(15),
)
create table tblDONDH(
	SoDH int primary key,
	NgayDH datetime,
	Manhacc char(4) foreign key references tblNHACC
)

create table tblCTDONDH(
	SoDH int foreign key references tblDONDH ,
	MaVTu char(4) foreign key references VATTU,
	SLDat int,
	primary key (SoDH, MaVTu)
)

create table tblPNHAP(
	SoPN char(4) primary key foreign key references tblPNHAP,
	MaVTu char (4),
	NgayNhap datetime,
)
create table tblCTPNHAP(
	SoPN char(4),
	MaVTu char(4) foreign key references VATTU,
	SLnhap int,
	primary key (SoPN, MaVtu)
)
create table tblPXUAT(
	SoPX char(4) primary key,
	Ngayxuat datetime
)
create table tblCTPXUAT(
	SoPX char(4),
	MaVTu char(4),
	SLXuat int,
	primary key(SoPX, MaVTu)
)
create table tblTONKHO(
NAMTHANG char(7),
	MaVTu char(4),
	TONGNHAP int,
	TONGXUAT int,
	SLTonKho int
)
set dateformat ymd

insert into VATTU values
('DD01','Dau DVD', 'gnhg',1417),
('DD02','Dau DVD', 'hgg',45),
('DD03','FGFG', 'BN',4),
('LO01','Loa Thung', 'vhb',123),
('LO02','Loa Thung', 'tan',44),
('LO03','Loa Thung', 'kg',20),
('TV01','Tivi Sony', 'tan',10),
('VT02','Gach', 'vien',200),
('VT03','Ngoi', 'vien',9),
('VT04','Xi mang', 'kg',13),
('VT05','Sat', 'kg',90),
('VT06','Voi', 'tan',9)

insert into tblDONDH values
(1,'2012/05/01','CC02'),
(2,'2012/07/15','CC02'),
(3,'2012/07/15','CC02'),
(4,'2012/04/06','CC02'),
(5,'2012/08/07','CC02'),
(6,'2012/03/03','CC02'),
(7,'2012/03/03','CC02'),
(15,'2012/01/01','CC02');

insert into tblCTDONDH values
(1,'VT01',100),
(1,'VT02',400),
(1,'VT03',700),
(1,'VT06',100),
(2,'VT01',80),
(2,'VT02',3),
(2,'VT05',2),
(2,'VT01',49),
(3,'VT05',50),
(3,'VT03',500),
(3,'VT01',100),
(4,'VT02',50),
(5,'VT04', 500),
(6,'VT01',80),
(6,'VT01',80),
(6,'VT03',70),
(7,'VT04',500),
(8,'VT02',2)

INSERT INTO tblCTPNHAP values
('PN01','VT01',20),
('PN01','VT02',50),
('PN01','VT03',30),
('pn01','vt06',100),
('PN02','VT01',30),
('PN02','VT03',50),
('pn02','vt04',345),
('pn03','vt02',35),
('pn05','vt01',50),
('pn05','vt03',1500),
('pn06','vt05',100),
('pn07','vt04',120),
('PN06','VT02',500),
('PN06','VT03',50),
('PN07','VT01',100),
('PN07','VT02',50),
('PN07','VT03',50),
('PN08','VT03',120),
('PN09','VT03',150),
('PN10','VT01',50),
('PN10','VT02',190),
('pn10','vt05',67)

insert into tblCTPXUAT values
('PX01', 'VT01',300),
('PX01', 'VT03',500),
('PX02', 'VT01',100),
('PX02', 'VT02',40),
('px02','vt05',35),
('PX03','VT01',100),
('PX03','VT02',60),	
('PX03','VT03',200),
('PX03','VT04',50),
('px04','vt01',60),
('px05','vt01',55),
('px05','vt02',6666),
('px06','vt03',20),
('px06','vt23',30)

insert into tblNhaCC values
('cc01','Nguyen Van An', null , null),
('cc02','Le B', null , null),
('cc03','Pham C', null , null),
('cc03','Nguyen the', null , null),
('cc04','Pham nghi', null , null),
('cc05','Hoang Anh', null , null),
('cc06','Nguyen Cuong', null , null),
('cc07','NKK', 'gfhf' , 0964312),
('cc52','NKK', 'gfhf' , 0964312),
('cc79','NKK', 'gfhf' , 0964312);
insert into tblPNHAP values
('PN01',1,'2012/07/08'),
('PN02',1,'2012/08/12'),
('PN03',1,'2012/07/12'),
('PN04',2,'2012/10/02'),
('PN05',2,'2012/07/15'),
('PN06',3,'2012/09/01'),
('PN07',4,'2012/03/05'),
('PN08',5,'2012/09/02'),
('PN09',5,'2012/10/02'),
('PN10',6,'2013/01/31'),
('pn11',19,'2014/03/03'),
('pn12',5,'2014/03/03'),
('PN13',15,'2017/04/20'),
('PN14',15,'2017/04/20'),
('PN16',15,'2017/04/20'),
('PN17',1,'2017/04/20'),
('PN18',1,'2017/04/20'),
('PN19',1,'2017/04/20'),
('PN20',15,'2017/04/03'),
('pn24',15,'2015/02/02'),
('PN26',3,'2017/12/03'),
('pn34',12,'2017/12/03');
insert into  tblPXUAT values
('PX01','2012/07/02', 53200),
('PX02','2013/04/06',19192),
('PX03','2013/04/06',19192),
('PX04','2011/01/01',19192),
('PX05','2015/03/03',19192),
('PX06','2015/03/03',19192);
alter table tblPXUAT add TongTien int;

insert into  tblTONKHO values 
('02/2010','VT02',680,100,580),
('02/2010','VT03',490,250,240),
('02/2010','VT04',150,50,100),
('02/2010','vt05',67,NULL,NULL),
('02/2010','vt06',100,null,null),
('2010/02','VT01',330,230,100),
('2010/02','VT02',680,100,580),
('2010/02','VT03',490,250,240),
('2010/02','VT04',150,50,100),
('2010/02','vt05',67,null,null),
('2010/02','vt06',100,null,null),
('2012/07','VT01',330,230,100),
('2012/07','VT02',680,100,580),
('2012/07','VT03',490,250,240),
('2012/07','VT04',150,50,100);
