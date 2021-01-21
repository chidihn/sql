﻿
CREATE DATABASE QLBH2
ON Primary
( 
NAME = QLBH_Data,
FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QLBH2.mdf',
SIZE = 50MB,
MAXSIZE = 100MB,
FILEGROWTH = 10%
)
LOG ON
(
NAME=QLBH_Log,
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\QLBH2_Log.ldf',
SIZE=10MB,
MAXSIZE = UNLIMITED,
FILEGROWTH = 5MB
);
USE QLBH2;
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
	SoPX char(4) foreign key references PXUAT,
	MaVTu char(4)foreign key references VATTU,
	SLXuat int,
	primary key(SoPX,MaVTu)
)
CREATE TABLE TONKHO
(
	NAMTHANG char(7),
	MaVTu char(4) foreign key references VATTU,
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
(1,'VT03',700),
(1,'VT04',100),
(1,'VT06',100),
(2,'VT01',80),
(2,'VT02',3),
(2,'VT03',90),
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
(6,'VT05',100),
(7,'VT01',80),
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
('PN11',19,'2014/03/03'),
('PN12',5,'2014/03/03'),
('PN13',15,'2017/04/20'),
('PN14',15,'2017/04/20'),
('PN16',15,'2017/04/20'),
('PN17',1,'2017/04/20'),
('PN18',1,'2017/04/20'),
('PN19',1,'2017/04/20'),
('PN20',15,'2017/04/03'),
('PN24',15,'2015/02/02'),
('PN26',3,'2017/12/03'),
('PN34',12,'2017/12/03')
insert into CTPNHAP values
('PN01','VT01',20),
('PN01','VT02',50),
('PN01','VT03',30),
('PN01','VT06',100),
('PN02','VT01',30),
('PN02','VT03',50),
('PN02','VT04',345),
('PN02','VT05',35),
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
('PN10','VT05',67)
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
('PX02','VT05',35),
('PX03','VT01',100),
('PX03','VT02',60),	
('PX03','VT03',200),
('PX03','VT04',50),
('PX04','VT01',60),
('PX05','VT01',55),
('PX05','VT02',6666),
('PX06','VT03',20),
('PX06','VT02',30)
insert into TONKHO values
('02/2010','VT02',680,100,580),
('02/2010','VT03',490,250,240),
('02/2010','VT04',150,50,100),
('02/2010','VT05',67,NULL,NULL),
('02/2010','VT06',100,null,null),
('2010/02','VT01',330,230,100),
('2010/02','VT02',680,100,580),
('2010/02','VT03',490,250,240),
('2010/02','VT04',150,50,100),
('2010/02','VT05',67,null,null),
('2010/02','VT06',100,null,null),
('2012/07','VT01',330,230,100),
('2012/07','VT02',680,100,580),
('2012/07','VT03',490,250,240),
('2012/07','VT04',150,50,100)

-- 2.1. Hiển thị thông tin SoDH, MaVTu, SLDat, NgayDH, Manhacc của 2 bảng tblCTDonDH và tblDonDH.
select C.SoDH, MaVTu, SLDat, NgayDH, Manhacc
from CTDONDH C join DONDH D on C.SoDH = D.SoDH; 
-- 2.2. Hiển thị thông tin trong bảng DONDH và 2 cột địa chỉ, Tên nhà cung cấp trong bảng NHACC
select C.*, Tennhacc, Diachi
from DONDH C join NHACC N on C.Manhacc = N.Manhacc
-- 2.3. Hiện thông tin các đơn đặt hàng trong bảng DONDH và Họ tên nhà cung cấp trong bảng NHACC
-- với yêu cầu sắp xếp theo mã nhà cung cấp tăng dần.
select D.*, Tennhacc
from DONDH D join NHACC N on D.Manhacc = N.Manhacc
order by D.Manhacc ASC
-- 2.4. Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng.
select N.*, D.SoDH, TenVTu, SLDat
from VATTU V join CTDONDH C on V.MaVTu = C.MaVTu
join DONDH D on D.SoDH = C.SoDH
join NHACC N on N.Manhacc = D.Manhacc
-- 2.5. Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng
-- có số lượng đặt hàng >=A.
select N.*, D.SoDH, TenVTu, SLDat
from VATTU V join CTDONDH C on V.MaVTu = C.MaVTu
join DONDH D on D.SoDH = C.SoDH
join NHACC N on N.Manhacc = D.Manhacc 
where SLDat >= 500
-- 2.6. Hiện các phiếu nhập, tên vật tư, số lượng nhập theo ngày nhập hàng tăng dần.
select P.* , TenVTu, Slnhap
from PNHAP P join CTPNHAP C on C.SoPN = P.SoPN
join VATTU V on V.MaVTu = C.MaVTu
order by Ngaynhap
-- 2.7. Hiện số lượng đặt hàng của các vật tư có đơn đặt hàng là N.
select SLDat
from CTDONDH C join VATTU V on C.MaVTu = V.MaVTu
where SoDH = 1
-- 2.8. Hiện số lượng đặt hàng của các vật tư có số lượng đặt hàng >=N
select SLDat
from CTDONDH C join VATTU V on C.MaVTu = V.MaVTu
where SLDat > 100
-- 2.9. Hiện số lượng xuất hàng của các vật tư có phiếu xuất là N.
select SLXuat
from CTPXUAT
where SoPX = 'PX01'
-- 2.10. Hiện số lượng xuất hàng của các vật tư có số lượng xuất hàng >=N
create view  cauB210 as 
select SLXuat
from CTPXUAT
where SLXuat >= 20
-- 2.11. Hiện số lượng nhập hàng của các vật tư có đơn đặt hàng là N.
create view  cauB211 as 
select Slnhap
from CTPNHAP C join PNHAP P on P.SoPN = C.SoPN
where SoDH = 1
-- 2.12. Hiện số lượng nhập hàng của các vật tư có số lượng đặt hàng >=N
create view  cauB212 as 
select  Slnhap
from CTPNHAP N join CTDONDH D on N.MaVTu = D.MaVTu 
where SLDat = 100
-- 2.13. Hiện tổng số lượng đặt hàng của các vật tư.
select SUM(SLDat), MaVTu
from CTDONDH
group by MaVTu
-- 2.14. Hiện các vật tư có tổng lượng đặt hàng >=N.
select SUM(SLDat), MaVTu
from CTDONDH
group by MaVTu
having SUM(SLDat) >= 1000
-- 2.15. Hiện tổng số lượng bán hàng của các vật tư.
select SUM(SLXuat), MaVTu
from CTPXUAT
group by MaVTu
-- 2.16. Thống kê số lượng đặt hàng của các vật tư theo Nhà cung cấp.
create view  cauB216 as 
select SLDat
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
join NHACC N on D.Manhacc = N.Manhacc
-- 2.17. Thống kê số lượng nhập hàng của các vật tư theo Nhà cung cấp.
select Slnhap
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
join NHACC N on D.Manhacc = N.Manhacc
join CTPNHAP CN on  CN.MaVTu = C.MaVTu
-- 2.18. Thống kê tổng số đơn đặt hàng mà công ty đã đặt hàng theo từng nhà
--cung cấp và sắp xếp dữ liệu theo tổng số đơn đặt hàng tăng dần. 
select SUM(C.SoDH), D.Manhacc
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
group by D.Manhacc
-- 2.19. Bảng câu trên nhưng lọc những bản ghi có mã nhà cung cấp bắt đầu = ‘C’ 
-- và tổng số đơn đặt hàng >1
select SUM(C.SoDH) 
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
join NHACC N  on D.Manhacc = N.Manhacc
where Tennhacc LIKE 'CC01'
group by D.Manhacc
-- 2.20. Tính tổng số lượng đặt hàng của các vật tư
select SUM(SLDat), MaVTu 
from CTDONDH
group by MaVTu
-- 2.21. Tính tổng số lượng đặt hàng của các vật tư của nhà cung cấp A 
select SUM(SLDat) , Tennhacc
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
join NHACC N  on D.Manhacc = N.Manhacc
where Tennhacc  = 'Lê B'
group by MaVTu, Tennhacc
-- 2.22. Tính tổng số lượng nhập hàng của vật tư V của nhà cung cấp A 
select SUM(SLDat) , Tennhacc, MaVTu
from CTDONDH C join DONDH D on C.SoDH = D.SoDH
join NHACC N  on D.Manhacc = N.Manhacc
where Tennhacc  = 'Lê B' AND MaVTu = 'VT01'
group by MaVTu, Tennhacc

--3.1. Hiện các đơn đặt hàng trong ngày gần đây nhất
select SoDH, NgayDH
from DONDH
where NgayDH = ( select MAX(NgayDH) from DONDH)
--3.2. Hiện SoDH, MaVTu có SLDat lớn nhất.
select TOP 1 MAX(SLDat), MaVTu
from CTDONDH C 
group by MaVTu
order by MAX(SLDat) DESC
--3.3. Hiện SoDH, Tên vật tư có SLĐặt lớn nhất.
select TOP 1 MAX(SLDat), C.MaVTu, TenVTu
from CTDONDH C join VATTU V on C.MaVTu = V.MaVTu 
group by C.MaVTu , TenVTu
order by MAX(SLDat) DESC
--3.4. Hiện SoDH, Tên nhà cung cấp, Tên Vật tư có số lượng đặt lớn nhất.
select TOP 1 MAX(SLDat), Tennhacc, TenVTu 
from CTDONDH C join VATTU V on C.MaVTu = V.MaVTu 
join DONDH D on D.SoDH = C.SoDH
join NHACC N on N.Manhacc = D.Manhacc
group by Tennhacc , TenVTu
order by MAX(SLDat) DESC
--3.5. Hiện Tên vật tư có tổng sldat lớn nhất.
select top 1 TenVTu
from CTDONDH CT join VATTU V on V.MaVTu = CT.MaVTu
group by TenVTu
order by SUM(SLDat) desc
--3.6. Hiện Tên nhà cung cấp có tổng số lượng đặt Tên Vật tư A lớn nhất.
select top 1 Tennhacc 
from VATTU A
join CTDONDH B on A.MaVTu = B.MaVTu
join DONDH C on C.SoDH = B.SoDH
join NHACC D on D.Manhacc = C.Manhacc
where A.TenVTu = N'Xi măng'
group by Tennhacc
order by SUM(SLDat) DESC
--3.7. Hiện Tên vật tư có tổng số lượng nhập hàng lớn nhất.
select TenVTu
from CTPNHAP C join VATTU V
on V.MaVTu = C.MaVTu 
where Slnhap = (select MAX(Slnhap) from CTPNHAP)
--3.8. Hiện Tên vật tư có tổng số lượng bán hàng lớn nhất.
select TenVTu
from VATTU V join CTPXUAT X on V.MaVTu = X.MaVTu
where SLXuat = (select MAX(SLXuat) from CTPXUAT)
--3.9. Hiện họ tên nhà cung cấp, Điện thoại của bảng NHACC mà công ty đã có đơn đặt hàng trong tháng 01-2002
select Tennhacc , DienThoai
from NHACC N join DONDH D on N.Manhacc = D.Manhacc
where (CONVERT(char(7), NgayDH,121) = '2012-05')
--3.10. Hiện danh sách các nhà cung cấp mà công ty chưa bao giờ đặt hàng.
select distinct NHACC.*
from NHACC
where Manhacc not in (select distinct Manhacc from DONDH)
--3.11. Hiện danh sách vật tư mà công ty chưa bao giờ đặt hàng. 
select distinct *
from VATTU
where MaVTu not in (select MaVTu from CTDONDH)
--3.12. Hiện danh sách các nhà cung cấp chưa nhập hàng mà ta đã đặt hàng
select distinct *
from NHACC where Manhacc  in (select distinct Manhacc from DONDH)
--3.13. Hiện danh sách các nhà cung cấp và số đặt hàng chưa nhập hàng mà ta đã đặt hàng
select N.Manhacc, Tennhacc, SoDH
from NHACC N join DONDH D on N.Manhacc= D.NgayDH
where ( EXISTS(SELECT MANHACC FROM DONDH WHERE   N.Manhacc= D.Manhacc))
 AND (NOT EXISTS(SELECT DONDH.SODH FROM  DONDH,PNHAP WHERE    D.SoDH = PNHAP.SoDH and N.Manhacc= D.Manhacc))

--3.14. Hiện danh sách các nhà cung cấp, số đặt hàng, tên vật tư chưa nhập hàng đủ so với đơn đặt hàng
select TenVTu, D.SoDH
from VATTU V join CTDONDH C on C.MaVTu = V.MaVTu
join CTPNHAP N on C.MaVTu = N.MaVTu
join DONDH D on C.SoDH =D.SoDH
where C.MaVTu in (select N.MaVTu from CTPNHAP N join 
CTDONDH C on  C.MaVTu = N.MaVTu  where SLDat > Slnhap  )

----------------- CURSOR ------------------------------
2.1.	Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng.
2.2.	Hiện thông tin Nhà cung cấp, số đặt hàng, tên vật tư, số lượng đặt hàng có số lượng đặt hàng >=A.
2.3.	Hiện các phiếu nhập, tên vật tư, số lượng nhập theo ngày nhập hàng tăng dần.
2.4.	Hiện số lượng đặt hàng của các vật tư có đơn đặt hàng là N.
2.5.	Hiện số lượng đặt hàng của các vật tư có số lượng đặt hàng >=N
2.6.	Hiện số lượng xuất hàng của các vật tư có phiếu xuất là N.
2.7.	Hiện số lượng xuất hàng của các vật tư có số lượng xuất hàng >=N
2.8.	Hiện tổng số lượng đặt hàng của các vật tư.
2.9.	Hiện các vật tư có tổng lượng đặt hàng >=N.
2.10.	Hiện tổng số lượng bán hàng của các vật tư.
2.11.	Thống kê số lượng đặt hàng của các vật tư theo Nhà cung cấp.
2.12.	Thống kê số lượng nhập hàng của các vật tư theo Nhà cung cấp.