﻿
CREATE DATABASE bai2;
USE bai2;

CREATE TABLE KHACHHANG
(
	MAKH CHAR(4) NOT NULL PRIMARY KEY,
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY
)
CREATE TABLE NHANVIEN
(
	MANV CHAR(4) NOT NULL PRIMARY KEY,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL SMALLDATETIME
)
CREATE TABLE SANPHAM 
(
	MASP CHAR(4) NOT NULL PRIMARY KEY,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY
)
CREATE TABLE HOADON
(
	SOHD INT NOT NULL PRIMARY KEY,
	NGHD SMALLDATETIME,
	MAKH CHAR(4) FOREIGN KEY REFERENCES KHACHHANG,
	MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN,
	TRIGIA MONEY,
)
CREATE TABLE CTHD
(
	SOHD INT FOREIGN KEY REFERENCES HOADON,
	MASP CHAR(4) FOREIGN KEY REFERENCES SANPHAM,
	SL INT,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
)
set dateformat dmy
---Khach Hang---
INSERT INTO KHACHHANG VALUES
('KH01','Nguyen Van A','731 Tran Hung Dao, Q5,TpHCM','8823451','22/10/1960','22/07/2006',13060000),
('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5,TpHCM','908256478','03/04/1974','30/07/2006',280000),
('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1 ,TpHCM','938776266','12/06/1980','08/05/2006',3860000),
('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10,TpHCM','917325476','09/03/1965','10/02/2006',250000),
('KH05','Le Nhat Minh', '34 Truong Chinh, Q3, TpHCM','8346108','10/03/1950','28/10/2006',21000),
('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',91500),
('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500),
('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000),
('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000),
('KH10','Ha Huy Lap','34/34B Nguyen Trai, Q5, TpHCM','8768904','02/05/1983','16/01/2007',67500)
INSERT INTO NHANVIEN VALUES 
('NV01','Nguyen Nhu Nhut','927345678','12/04/2006'),
('NV02','Le Thi Phi Yen','987567309','21/04/2006'),
('NV03','Nguyen Van B','997048382','27/04/2006'),
('NV04','Ngo Thanh Tuan','913758498','24/06/2006'),
('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')


INSERT INTO SANPHAM VALUES
('BC01','But Chi','Cay','Singapore',3000),
('BC02','But chi','cay','Singapore',5000),
('BC03','But chi','cay','Viet Nam',3500),
('BC04','But chi','hop','Viet Nam',30000),
('BB01','But bi','cay','Viet Nam',5000),
('BB02','But bi','cay','Trung Quoc',7000),
('BB03','But bi','hop','Thai Lan',100000),
('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500),
('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500),
('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),
('TV04','Tap 200 giay tot','quyen','Viet Nam',5500),
('TV05','Tap 100 trang','chuc','Viet Nam',23000),
('TV06','Tap 200 trang','chuc','Viet Nam',53000),
('TV07','Tap 100 trang','chuc','Trung Quoc',34000),
('ST01','So tay 500 trang','quyen','Trung Quoc',40000),
('ST02','So tay loai 1','quyen','Viet Nam',55000),
('ST03','So tay loai 2','quyen','Viet Nam',51000),
('ST04','So tay','quyen','Thai Lan',55000),
('ST05','So tay mong','quyen','Thai Lan',20000),
('ST06','Phan Viet Bang','hop','Viet Nam',5000),
('ST07','Phan Khong Bui','hop','Viet Nam',7000),
('ST08','Bong Bang','hop','Viet Nam',10000),
('ST09','But long','cay','Viet Nam',5000),
('ST10','But long','cay','Trung Quoc',7000)

INSERT INTO HOADON VALUES
(1001,'23/07/2006','KH01','NV01',320000),
(1002,'12/08/2006','KH01','NV02',840000),
(1003,'23/08/2006','KH02','NV01',100000),
(1004,'01/09/2006','KH02','NV01',180000),
(1005,'20/10/2006','KH01','NV02',3800000),
(1006,'16/10/2006','KH01','NV03',2430000),
(1007,'28/10/2006','KH03','NV03',510000),
(1008,'28/10/2006','KH01','NV03',440000),
(1009,'28/10/2006','KH03','NV04',200000),
(1010,'01/11/2006','KH01','NV01',5200000),
(1011,'04/11/2006','KH04','NV03',250000),
(1012,'30/11/2006','KH05','NV03',21000),
(1013,'12/12/2006','KH06','NV01',5000),
(1014,'31/12/2006','KH03','NV02',3150000),
(1015,'01/01/2007','KH06','NV01',910000),
(1016,'01/01/2007','KH07','NV02',12500),
(1017,'02/01/2007','KH08','NV03',35000),
(1018,'13/01/2007','KH08','NV03',330000),
(1019,'13/01/2007','KH01','NV03',30000),
(1020,'14/01/2007','KH09','NV04',70000),
(1021,'16/01/2007','KH10','NV03',67500),
(1022,'16/01/2007',Null,'NV03',7000),
(1023,'17/01/2007',Null,'NV01',330000)

INSERT INTO CTHD VALUES 
(1001,'TV02',10),
(1001,'ST01',5),
(1001,'BC01',5),
(1001,'BC02',10),
(1001,'ST08',10),
(1002,'BC04',20),
(1002,'BB01',20),
(1002,'BB02',20),
(1003,'BB03',10),
(1004,'TV01',20),
(1004,'TV02',10),
(1004,'TV03',10),
(1004,'TV04',10),
(1005,'TV05',50),
(1005,'TV06',50),
(1006,'TV07',20),
(1006,'ST01',30),
(1006,'ST02',10),
(1007,'ST03',10),
(1008,'ST04',8),
(1009,'ST05',10),
(1010,'TV07',50),
(1010,'ST07',50),
(1010,'ST08',100),
(1010,'ST04',50),
(1010,'TV03',100),
(1011,'ST06',50),
(1012,'ST07',3),
(1013,'ST08',5),
(1014,'BC02',80),
(1014,'BB02',100),
(1014,'BC04',60),
(1014,'BB01',50),
(1015,'BB02',30),
(1015,'BB03',7),
(1016,'TV01',5),
(1017,'TV02',1),
(1017,'TV03',1),
(1017,'TV04',5),
(1018,'ST04',6),
(1019,'ST05',1),
(1019,'ST06',2),
(1020,'ST07',10),
(1021,'ST08',5),
(1021,'TV01',7),
(1021,'TV02',10),
(1022,'ST07',1),
(1023,'ST04',6)

-- Cau 1. In ra danh sách các sản phẩm chỉ lấy (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX ='Trung Quoc';
-- Cau 2. In ra danh sách các sản phẩm chỉ lấy (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”
SELECT MASP,TENSP FROM SANPHAM WHERE DVT IN ('cay','quyen') ;
-- Cau 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP,TENSP FROM SANPHAM WHERE MASP LIKE 'B%01';
-- Cau 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX ='Trung Quoc' AND (GIA BETWEEN 30000 AND 40000);
-- Cau 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Viet Nam” sản xuất có giá từ 30.000 đến 40.000
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX in ('Trung Quoc','Viet Nam') AND (GIA BETWEEN 30000 AND 40000);
-- Cau 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007
SELECT SOHD, TRIGIA FROM HOADON WHERE NGHD IN ('1/1/2007','2/1/2007');
-- Cau 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần)
SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007 ORDER BY NGHD ASC, TRIGIA DESC;
-- Cau 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007
SELECT KH.MAKH, KH.HOTEN  FROM HOADON HD JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH WHERE HD.NGHD = '1/1/2007' ;
-- Cau 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006
SELECT HD.SOHD, HD.TRIGIA FROM HOADON HD JOIN NHANVIEN NV ON HD.MANV = NV.MANV WHERE NV.HOTEN = 'Nguyen Van B' AND HD.NGHD ='28/10/2006' ;
-- Cau 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006
SELECT SP.MASP, SP.TENSP FROM HOADON HD JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH JOIN CTHD CT ON CT.SOHD = HD.SOHD JOIN SANPHAM SP ON SP.MASP =CT.MASP
WHERE KH.HOTEN ='Nguyen Van A' AND MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006;
