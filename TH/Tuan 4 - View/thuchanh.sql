CREATE DATABASE QLBH
ON Primary
( 
NAME = QLBH_Data,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QLBH.mdf',
SIZE = 50MB,
MAXSIZE = 100MB,
FILEGROWTH = 10%
)
LOG ON
(
NAME=QLBH_Log,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QLBH_Log.ldf',
SIZE=10MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5MB
);

 USE QLBH;
CREATE TABLE VATTU
(
	MaVTu char(4) primary key,
	TenVTu nvarchar(30),
	DVTinh nvarchar(10),
	Dongia int
)
CREATE TABLE NHACC 
(
	Manhacc char(4) primary key,
	Tennhacc nvarchar(30),
	Diachi nvarchar(30),
	DienThoai char(15)
)
CREATE TABLE DONDH
(
	SoDH int primary key,
	NgayDH datetime,
	Manhacc char(4) foreign key references NHACC
)
CREATE TABLE CTDONDH 
(
	SoDH int foreign key references DONDH,
	MaVTu char(4) foreign key references VATTU,
	SLDat int,
	primary key(SoDH,MaVTu)
)
CREATE TABLE PNHAP
( 
	SoPN char(4) primary key,
	SoDH int ,
	Ngaynhap datetime
)
CREATE TABLE CTPNHAP
(
	SoPN char(4) foreign key references PNHAP,
	MaVTu char(4) foreign key references VATTU,
	Slnhap int,
	primary key(SoPN,MaVTu)
)
CREATE TABLE PXUAT
(
	SoPX char(4) primary key,
	Ngayxuat datetime
)
CREATE TABLE CTPXUAT 
(
	SoPX char(4),
	MaVTu char(4),
	SLXuat int,
	primary key(SoPX,MaVTu)
)
CREATE TABLE TONKHO
(
	NAMTHANG char(7),
	MaVTu char(4),
	TONGNHAP int,
	TONGXUAT int,
	SLTonKho int
)

set dateformat ymd
insert into VATTU values 
('DD01',N'ĐẦU DVD','gnhg',145),
('DD02',N'ĐẦU DVD','hgg',78),
('DD03',N'FGFG','BN',4),
('LO01',N'Loa Thùng','vhb',123),
('LO02',N'Loa Thùng','tan',44),
('LO03',N'Loa Thùng','kg',20),
('TV01',N'Tivi Sony','tan',10),
('TV02',N'Tivi Sanyo','dt',45),
('VT01',N'Gạch',N'Viên',200),
('VT02',N'Ngói',N'Viên',9),
('VT03',N'Xi măng','kg',13),
('VT04',N'Sắt','kg',80),
('VT05',N'Vôi','tấn',9),
('VT06',N'Sơn','thùng',45)
insert into NHACC values
('CC01',N'Nguyễn Văn An',null,null),
('CC02',N'Lê B',null,null),
('CC03',N'Phạm C',null,null),
('CC04',N'Nguyễn Thế',null,null),
('CC06',N'Phạm Nghị',null,null),
('CC07',N'Hồng Ánh',null,null),
('CC08',N'Nguyễn Cường',null,null),
('CC66',N'XNK ggh','gfhf','096432'),
('CC72',N'XNK ggh','gfhf','096432'),
('CC79',N'XNK ggh','gfhf','096432')
insert into DONDH values
(1,'2012/05/01','CC02'),
(2,'2012/07/15','CC02'),
(3,'2012/07/15','CC01'),
(4,'2012/04/06','CC03'),
(5,'2012/08/07','CC04'),
(6,'2014/03/03','CC01'),
(7,'2014/03/03','CC01'),
(15,'2014/01/01','CC01')
insert into CTDONDH values
(1,'VT01',100),
(1,'VT02',400),
(1,'vt03',700),
(1,'vt04',100),
(1,'vt06',100),
(2,'VT01',80),
(2,'VT02',3),
(2,'vt03',90),
(3,'VT01',250),
(3,'VT02',500),
(3,'VT03',50),
(3,'VT04',49),
(3,'VT05',2),
(4,'VT01',100),
(4,'VT02',70),
(4,'VT03',50),
(5,'VT01',100),
(5,'VT03',300),
(6,'VT01',50),
(6,'VT02',100),
(6,'VT03',50),
(6,'VT04',500),
(6,'vt05',100),
(7,'vt01',80),
(15,'VT01',80),
(15,'VT02',15),
(15,'VT03',17)
insert into PNHAP values
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
('pn34',12,'2017/12/03')
insert into CTPNHAP values
('PN01','VT01',20),
('PN01','VT02',50),
('PN01','VT03',30),
('pn01','vt06',100),
('PN02','VT01',30),
('PN02','VT03',50),
('pn02','vt04',345),
('pn02','vt05',35),
('PN03','VT01',20),
('PN03','VT02',80),
('PN03','VT03',40),
('PN04','VT01',80),
('PN05','VT04',150),
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
ALTER TABLE PXUAT ADD TongTien int
insert into PXUAT values
('PX01','2012/07/02',53200),
('PX02','2013/04/06',19192),
('PX03','2013/04/06',24426),
('PX04','2017/01/01',10800),
('PX05','2015/03/03',56795),
('PX06','2015/03/03',260)
insert into CTPXUAT values
('PX01','VT01',300),
('PX01','VT03',500),
('PX02','VT01',100),
('PX02','VT02',40),
('PX02','VT03',50),
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
insert into TONKHO values
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
('2012/07','VT04',150,50,100)


-- 2.1. Hiển thị thông tin SoDH, MaVTu, SLDat, NgayDH, Manhacc của 2 bảng tblCTDonDH và tblDonDH.
create view  Cau1 as
select DD.SoDH , MaVTu, SLDat, NgayDH, Manhacc  
from DONDH DD join CTDONDH CT on CT.SoDH = DD.SoDH;
-- 2.2. Hiển thị thông tin trong bảng DONDH và 2 cột địa chỉ, Tên nhà cung cấp trong bảng NHACC
create view  Cau2 as
select Diachi, Tennhacc 
from NHACC;
-- 2.3. Hiện thông tin các đơn đặt hàng trong bảng DONDH và Họ tên nhà cung cấp trong bảng NHACC với yêu cầu sắp xếp theo mã nhà cung cấp tăng dần.
select DH.* , CC.Tennhacc  
from DONDH DH join  NHACC CC on DH.Manhacc =  CC.Manhacc 
order by DH.Manhacc ASC;
-- 2.4. Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng.
create view  Cau4 as
select N.Tennhacc, C.SLDat, D.SoDH, V.TenVTu
from  DONDH D join CTDONDH C on D.SoDH = C.SoDH join NHACC N on N.Manhacc = D.Manhacc join VATTU V on V.MaVTu = C.MaVTu;
-- 2.5. Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng có số lượng đặt hàng >=A.
create view  Cau5 as
select N.Tennhacc, C.SLDat, D.SoDH, V.TenVTu
from  DONDH D join CTDONDH C on D.SoDH = C.SoDH join NHACC N on N.Manhacc = D.Manhacc join VATTU V on V.MaVTu = C.MaVTu 
where C.SLDat > 100;
-- 2.6. Hiện các phiếu nhập, tên vật tư, số lượng nhập theo ngày nhập hàng tăng dần.
select P.SoPN , V.TenVTu, Slnhap
from CTPNHAP C join VATTU V on C.MaVTu = V.MaVTu join PNHAP P on C.SoPN = P.SoPN
 order by P.Ngaynhap ASC; 
-- 2.7. Hiện số lượng đặt hàng của các vật tư có đơn đặt hàng là N.
create view  cau7 as
select SLDat
from CTDONDH
where SoDH = 1;
-- 2.8. Hiện số lượng đặt hàng của các vật tư có số lượng đặt hàng >=N
create view cau8 as
select SLDat
from CTDONDH
where SoDH >= 2;
-- 2.9. Hiện số lượng xuất hàng của các vật tư có phiếu xuất là N.
create view cau9 as
select SLXuat
from CTPXUAT
where SoPX = 'PX01'
-- 2.10. Hiện số lượng xuất hàng của các vật tư có số lượng xuất hàng >=N
create view cau10 as
select SLXuat
from CTPXUAT
where SLXuat >= 100
-- 2.11. Hiện số lượng nhập hàng của các vật tư có đơn đặt hàng là N.

-- 2.12. Hiện số lượng nhập hàng của các vật tư có số lượng đặt hàng >=N

-- 2.13. Hiện tổng số lượng đặt hàng của các vật tư.

-- 2.14. Hiện các vật tư có tổng lượng đặt hàng >=N.

-- 2.15. Hiện tổng số lượng bán hàng của các vật tư.

-- 2.16. Thống kê số lượng đặt hàng của các vật tư theo Nhà cung cấp.

-- 2.17. Thống kê số lượng nhập hàng của các vật tư theo Nhà cung cấp.

-- 2.18. Thống kê tổng số đơn đặt hàng mà công ty đã đặt hàng theo từng nhà cung cấp và sắp xếp dữ liệu theo tổng số đơn đặt hàng tăng dần.

-- 2.19. Bảng câu trên nhưng lọc những bản ghi có mã nhà cung cấp bắt đầu = ‘C’ và tổng số đơn đặt hàng >1

-- 2.20. Tính tổng số lượng đặt hàng của các vật tư

-- 2.21. Tính tổng số lượng đặt hàng của các vật tư của nhà cung cấp A

-- 2.22. Tính tổng số lượng nhập hàng của vật tư V của nhà cung cấp A
