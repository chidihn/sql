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


--  Ví dụ: Xây dựng trigger trong tblpnhap để kiểm tra khi người dùng thêm mới mẫu tin.
-- 	Khóa ngoại: sodh phải tồn tại trong tbldondh, manhacc phải tồn tại trong tblnhacc.
--	Miền giá trị: ngày nhập phải sau ngaydh trong bảng tbldondh

ALTER TRIGGER INSERT_PNHAP ON PNHAP
FOR INSERT AS
BEGIN
	IF NOT EXISTS (SELECT * FROM DONDH, inserted WHERE DONDH.SoDH = inserted.SoDH)
		BEGIN
			PRINT N'KHONG TON TAI SODH NAY'
			ROLLBACK TRAN
		END 
	DECLARE @NDH DATE
	DECLARE @SODH INT = (SELECT SODH FROM inserted) 
	SELECT @NDH = NgayDH FROM DONDH WHERE SoDH = @SODH
	IF (SELECT NGAYNHAP FROM inserted) < @NDH
		BEGIN
			PRINT N'NGAY NHAP TRUOC NGAY DAT HANG'
			ROLLBACK TRAN
		END

END

INSERT INTO PNHAP VALUES
('PC03',1,'2012/07/08')

-- Bài tập 1: Xây dựng trigger trong tblctdondh để kiểm tra khi người dùng thêm mới mẫu tin.
-- −	Khóa ngoại: sodh phải tồn tại trong tbldondh, mavtu phải tồn tại trong tblvattu.
-- −	Miền giá trị: sldat >=A và <=B.


ALTER TRIGGER INSERT_CTDONDH ON CTDONDH
instead of insert AS 
BEGIN
	IF NOT EXISTS (SELECT * FROM CTDONDH, INSERTED WHERE CTDONDH.SoDH = inserted.SoDH AND CTDONDH.MaVTu = inserted.MaVTu ) 
		BEGIN 
			PRINT 'KHONG TON TAI CAU LENH NAY';
			ROLLBACK TRAN
		END
		DECLARE @SLD INT
		DECLARE @A INT
		DECLARE @B INT
		SET @A = 5
		SET @B = 100
		SELECT @SLD = SLDat FROM inserted
		IF((@SLD >= @A) AND (@SLD <= @B))
			BEGIN
				PRINT N'Da them vao bang'
			END
		ELSE
			BEGIN
				ROLLBACK TRAN
				PRINT N'SLDat khong thuoc mien tu ' + @A + ' den ' + @B
			END
	SELECT SLDat FROM inserted i; 
END

SELECT * FROM CTDONDH

insert into dbo.CTDONDH values 
(1,'VT01',99)