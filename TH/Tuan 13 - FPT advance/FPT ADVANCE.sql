CREATE DATABASE QLDANGKY
USE QLDANGKY
CREATE TABLE NHACUNGCAP
(
    MaNhaCC CHAR(15) PRIMARY KEY,
    TenNhaCC CHAR(30),
    DiaChi CHAR(20),
    SoDT CHAR(11),
    MaSoThue INT
);

CREATE TABLE LOAIDICHVU
(
    MaLoaiDV CHAR(10) PRIMARY KEY,
    TenLoaiDV CHAR(50)
);

CREATE TABLE MUCPHI
(
    MaMP CHAR(10) PRIMARY KEY,
    DonGia SMALLMONEY,
    MoTa CHAR(50)
);
CREATE TABLE DONGXE
(
    DongXe CHAR(20) PRIMARY KEY,
    HangXe CHAR(20),
    SoChoNgoi INT
);

CREATE TABLE DANGKYCUNGCAP
(
    MaDKCC CHAR(10) PRIMARY KEY,
    MaNhaCC CHAR(15) FOREIGN KEY REFERENCES NHACUNGCAP,
    MaLoaiDV CHAR(10) FOREIGN KEY REFERENCES LOAIDICHVU,
    DongXe CHAR(20) FOREIGN KEY REFERENCES DONGXE,
    MaMP CHAR(10) FOREIGN KEY REFERENCES MUCPHI,
    NgayBatDauCungCap DATE,
    NgayKetThucCungCap DATE,
    SoLuongXeDangKy INT
);

INSERT INTO NHACUNGCAP
VALUES
    ('NCC001', 'Cty TNHH Toan Phap', 'Hai Chau', 05113999888, 568941),
    ('NCC002', 'Cty Co phan Dong Du', 'Lien Chieu', 05113999889, 456789),
    ('NCC003', 'Ong Nguyen Van A', 'Hoa Thuan', 05113999890, 321456),
    ('NCC004', 'Cty Co phan Toan Cau Xanh', 'Hai Chau', 05113658945, 513364),
    ('NCC005', 'Cty TNHH AMA', 'Thanh Khe', 05113875466, 546546),
    ('NCC006', 'Ba Tran Thi Bich Van', 'Lien Chieu', 05113587469, 524545),
    ('NCC007', 'Cty TNHH Phan Thanh', 'Thanh Khe', 05113987456, 113021),
    ('NCC008', 'Ong Phan Dinh Nam', 'Hoa Thuan', 05113532456, 121230),
    ('NCC009', 'Tap doan Dong Nam A', 'Lien Chieu', 05113987121, 533654),
    ('NCC0010', 'Cty Co phan Rang dong', 'Lien Chieu', 05113569654, 187864);

INSERT INTO LOAIDICHVU
VALUES
    ('DV01', 'Dich vu xe taxi'),
    ('DV02', 'Dich vu xe buyt cong cong theo tuyen co dinh'),
    ('DV03', 'Dich vu xe cho thue theo hop dong');

INSERT INTO MUCPHI
VALUES
    ('MP01', 10000, 'Ap dung tu 1/2015' ),
    ('MP02', 15000, 'Ap dung tu 2/2015' ),
    ('MP03', 20000, 'Ap dung tu 1/2010' ),
    ('MP04', 25000, 'Ap dung tu 2/2011' );

INSERT INTO DONGXE
VALUES
    ('Hiace', 'Toyota', 16),
    ('Vios', 'Toyota', 5),
    ('Escape', 'Ford', 5),
    ('Cerato', 'KIA', 7),
    ('Forte', 'KIA', 5),
    ('Starex', 'Huyndai', 7),
    ('Grand-i10', 'Huyndai', 7);

SET DATEFORMAT DMY; 
INSERT INTO dbo.DANGKYCUNGCAP
VALUES
    ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '20/11/2015', '20/11/2016', 4),
    ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '20/11/2015', '20/11/2017', 3),
    ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '20/11/2017', '20/11/2018', 5),
    ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '20/11/2015', '20/11/2019', 7),
    ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '20/11/2019', '21/11/2020', 1),
    ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '10/11/2016', '21/11/2021', 2),
    ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '30/11/2015', '25/01/2016', 8),
    ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '28/02/2016', '15/08/2016', 9),
    ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '27/04/2016', '30/04/2017', 10),
    ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '21/11/2015', '22/02/2016', 4),
    ('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '25/12/2016', '20/02/2017', 5),
    ('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '14/04/2016', '20/11/2017', 6),
    ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '21/12/2015', '21/12/2016', 8),
    ('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '20/05/2016', '30/12/2016', 1),
    ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '24/04/2018', '20/11/2019', 6),
    ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '22/06/2016', '21/12/2016', 8),
    ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '30/09/2016', '30/09/2019', 4),
    ('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '13/12/2017', '30/09/2018', 2),
    ('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '24/01/2016', '30/12/2016', 8),
    ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '03/05/2016', '21/10/2017', 7),
    ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '30/01/2015', '30/12/2016', 9),
    ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '25/07/2016', '30/12/2017', 6),
    ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '30/11/2017', '20/05/2018', 5),
    ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '23/12/2017', '30/11/2019', 8),
    ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '24/08/2016', '25/10/2017', 1);
-- Câu 1:	Thực hiện yêu cầu sau:						
-- a)	Tạo một khung nhìn có tên là V_XeChoThue để thấy được thông tin của tất cả các dòng xe thuộc hãng Toyota						
--	và đã từng được đăng ký cho thuê với ngày bắt đầu cung cấp trước 31/12/2016. (1 điểm)	
set dateformat dmy
CREATE VIEW V_XeChoThue AS
	SELECT DX.* FROM DONGXE DX
	JOIN DANGKYCUNGCAP DK ON DK.DongXe = DX.DongXe
	WHERE HangXe = 'Toyota' and NgayBatDauCungCap < '31/12/2016'

select * from V_XeChoThue
--b)	Thông qua khung nhìn V_XeChoThue thực hiện việc cập nhật số chỗ ngồi thành 12 chỗ đối với 						
--	tất cả những dòng xe được nhìn thấy bởi khung nhìn này. (1 điểm)						

Update V_XeChoThue set SoChoNgoi = 12
select * from NHACUNGCAP
-- Câu 2:	Tạo 2 Stored Procedure:						
-- a)	Stored Procedure Sp_1: Dùng để xóa thông tin của những nhà cung cấp có mã nhà cung cấp 						
--	được truyền vào như một tham số của Stored Procedure. (1 điểm)	
create procedure sp_11 @mncc char(8)
as
	delete from DANGKYCUNGCAP where MaNhaCC = @mncc
	delete from NHACUNGCAP where MaNhaCC = @mncc
exec sp_11 @mncc = 'NCC009'
-- b)	Stored Procedure Sp_2: Dùng để bổ sung thêm bản ghi mới vào bảng DANGKYCUNGCAP (Sp_2 						
--	phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung là không trùng khóa chính và đảm 						
--	bảo toàn vẹn tham chiếu đến các bảng có liên quan). (1 điểm)						

-- Câu 3:	Viết 2 Trigger cho bảng DANGKYCUNGCAP theo yêu cầu sau:						
--a)	Trigger_1: Khi thực hiện tạo mới một bản ghi trong bảng DANGKYCUNGCAP thì hiển 
-- thị tổng số lượng xe mak nhà cung cấp (đang thực hiện đăng ký cung cấp) đã đăng ký trước đó. (1 điểm)					
create or alter trigger Trigger_11 on DANGKYCUNGCAP
FOR INSERT AS
	begin
		declare @tsl int =(select SUM(SoLuongXeDangKy) from inserted group by MaNhaCC);
		print 'So luong ma nha xe da cung cap truoc do ' +  CAST(@tsl  as varchar(15)) 
	end

insert into DANGKYCUNGCAP values
    ('DK026', 'NCC002', 'DV01', 'Hiace', 'MP01', '20/11/2015', '20/11/2016', 4)
-- b)	Trigger_2: Khi cập nhập lại ngày bắt đầu cung cấp phương tiện, kiểm tra xem thời gian cập nhật 						
--	có phù hợp  hay không (thời gian bắt đầu cung cấp phải nhỏ hơn ngày 10 hàng tháng và nhỏ hơn ngày 						
--	hiện tại). Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không sẽ hiển thị thông báo "Thời gian đăng 						
--	ký cung cấp phương tiện phải nhỏ hơn ngày 10 hàng tháng và nhỏ hơn ngày hiện tại". (1 điểm)						
							
--Câu 4:	Tạo 2 user function để thực hiện yêu cầu sau:						
--a)	Function func1: đếm tổng số dòng xe đã từng được đăng ký cho thuê với loại dịch vụ có tên là "Dịch vụ xe taxi". (1 điểm)		


--b)	Functon func2: tính đơn giá (lấy từ cột DonGia trong bảng MUCPHI) cao nhất mà một dòng xe nào đó đã từng						
--	được đăng ký cho thuê. Tên dòng xe được truyền vào như một tham số đầu vào của function này. (1 điểm)						
							
--Câu 5:	Tạo Stored Procedure Sp_Xe tìm những dòng xe đã được các nhà cung cấp (bất kỳ) đăng ký cho thuê với						
--	loại hình dịch vụ là "Dịch vụ xe taxi" trong tháng 10/2015 để xóa thông tin về những dòng xe đó						
--	(tức là phải xóa những bản ghi trong bảng DONGXE có liên quan)						

--	và xóa những lần đăng ký cung cấp cho thuê xe liên quan đến dòng xe đó						
--	(tức là phải xóa những bản ghi trong bảng DANGKYCUNGCAP có liên quan). (2 điểm) 						

--2a
CREATE PROCEDURE Sp_1a @mncc char(15)
	as
		DELETE FROM DANGKYCUNGCAP
		WHERE MaNhaCC = @mncc 
		DELETE FROM NHACUNGCAP 
		WHERE MaNhaCC = @mncc 
EXEC Sp_1a @mncc='NCC001'

CREATE PROCEDURE Sp_2 @madkcc char(5), @manhacc char(6), @maloaidv char(4), @dongxe varchar(15), @mamp char(4), @ngaybatdaucc date, @ngayketthuccc date, @soluongxedk int
AS
BEGIN
	--kiem tra trung khoa chinh
	IF EXISTS (SELECT * FROM DANGKYCUNGCAP WHERE MaDKCC = @madkcc)
	BEGIN
		PRINT N'Trùng khóa chính'
		RETURN
	END
	--kiem tra su ton tai nha cung cap
	IF NOT EXISTS (SELECT * FROM NHACUNGCAP WHERE MaNhaCC = @manhacc)
	BEGIN
		PRINT @manhacc + N' chưa tồn tại trong bảng NHACUNGCAP'
		RETURN
	END
	--kiem tra su ton tai ma loai dich vu
	IF NOT EXISTS (SELECT * FROM LOAIDICHVU WHERE MaLoaiDV = @maloaidv)
	BEGIN
		PRINT @maloaidv + N' chưa tồn tại trong bảng LOAIDICHVU'
		RETURN
	END	
	--kiem tra su ton tai dong xe
	IF NOT EXISTS (SELECT * FROM DONGXE WHERE DongXe = @dongxe)
	BEGIN
		PRINT @dongxe + N' chưa tồn tại trong bảng DONGXE'
		RETURN
	END	
	
	--kiem tra su ton tai muc phi
	IF NOT EXISTS (SELECT * FROM MUCPHI WHERE MaMP = @mamp)
	BEGIN
		PRINT @mamp + N' chưa tồn tại trong bảng MUCPHI'
		RETURN
	END	
	
	INSERT INTO DANGKYCUNGCAP VALUES
	(@madkcc,@manhacc,@maloaidv,@dongxe,@mamp,@ngaybatdaucc,@ngayketthuccc,@soluongxedk)
END
GO
--3 a
CREATE TRIGGER Trigger_1 on DANGKYCUNGCAP
FOR INSERT AS
BEGIN
	declare @slhientai int =  (SELECT COUNT(MaDKCC) FROM DANGKYCUNGCAP) 
	PRINT 'So luong xe da dang ky ' + CAST(@slhientai  as varchar(15))
END
insert into DANGKYCUNGCAP values
    ('DK050', 'NCC002', 'DV01', 'Hiace', 'MP01', '20/11/2015', '20/11/2016', 4)

--4a
create function func1 ()
returns int
as 
begin
	declare @tongdxe int =  (select COUNT(D.DongXe) AS DongXe from DONGXE D join DANGKYCUNGCAP DK 
							on D.DongXe= DK.DongXe join LOAIDICHVU L on L.MaLoaiDV =  DK.MaLoaiDV
							where TenLoaiDV ='Dich vu xe taxi '
							group by  D.DongXe)
	return  @tongdxe
end