CREATE DATABASE QLCV_2;
USE QLCV_2;
-- Bảng phòng ban
CREATE TABLE PHONGBAN (
	MAPB CHAR(4) PRIMARY KEY,
	TENPB NVARCHAR(40),
)

-- Bảng nhân viên
CREATE TABLE NHANVIEN (
	MANV CHAR(4) PRIMARY KEY,
	MAPB CHAR(4) FOREIGN KEY REFERENCES PHONGBAN,
	HOTEN NVARCHAR(40),
	NGAYSINH DATETIME,
	CHUCVU NVARCHAR(40)
)

-- Bảng công văn
CREATE TABLE CONGVAN (
	MACV CHAR(4) PRIMARY KEY,
	MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN,
	TENCV NVARCHAR(40),
	LOAICV NVARCHAR(40),
	NGAYKY DATETIME,
)
-- Bảng	công văn đến
CREATE TABLE CVDEN (
	MACVDEN CHAR(4)PRIMARY KEY,
	MACV CHAR(4) FOREIGN KEY REFERENCES CONGVAN,
	NGAYNHAN DATETIME,
	TINHTRANG NVARCHAR (40),
)
-- Bảng công văn đi
CREATE TABLE CVDI (
	MACVDI CHAR(4) PRIMARY KEY,
	MACV CHAR(4) FOREIGN KEY REFERENCES CONGVAN,
	NGAYGUI DATETIME,
	NOIGUI NVARCHAR (40),
)


INSERT INTO COQUAN VALUES
('CQ01' ,N'Chính Trị'  , N'Hà Nội'),
('CQ02' ,N'Đào Tạo'    , N'Nghệ An'),
('CQ03' ,N'Trường DHV' , N'Nghệ An'),
('CQ04' ,N'Cục Thuế'   , N'Nghệ An'),
('CQ05' ,N'Bộ Quốc Phòng' , N'TP.HCM'),
('CQ06' ,N'Bộ Tư Pháp'    , N'Hà Nội'),
('CQ07' ,N'Bộ Y Tế'       , N'Huế'),
('CQ08' ,N'Bộ Ngoại Giao' , N'Hà Tĩnh')

INSERT INTO NHANVIEN VALUES
('NV01', 'CQ01' , N'Bùi Thị Chí'     , '2000/11/09' ,N'Nhân Viên'  ),
('NV02', 'CQ03' , N'Hoàng Thị Cường' , '1999/12/09' ,N'Giám Đốc'  ),
('NV03', 'CQ02' , N'Hồ Sỹ Nữ Dũng'   , '2001/10/02' ,N'Chủ Tịch'  ),
('NV04', 'CQ05' , N'Bùi Văn A'       , '2000/10/21' ,N'Nhân Viên'  ),
('NV05', 'CQ02' , N'Trần Văn C'      , '2002/12/09' ,N'Nhân Viên'  ),
('NV06', 'CQ04' , N'Nguyễn Văn L'    , '2003/11/01' ,N'Nhân Viên'  ),
('NV07', 'CQ01' , N'Lê Văn B'        , '2000/11/06' ,N'Nhân Viên'  )

INSERT INTO CONGVAN VALUES
('CV01' , 'CQ01' ,'NV04' , N'Hành Chính'  , '2020/12/01' , N'Khoa Kinh Tế'),
('CV02' , 'CQ02' ,'NV01' , N'Giải Thích'  , '2019/10/10' , N'khoa CNTT'),
('CV03' , 'CQ03' ,'NV05' , N'Thông Báo'   , '2018/12/26' , N'Phòng Ban'),
('CV04' , 'CQ03' ,'NV03' , N'Hành Chính'  , '2020/12/01' , N'Khoa Giáo Dục'),
('CV05' , 'CQ02' ,'NV02' , N'Nhắc Nhở'    , '2016/09/25' , N'Khoa Đào Tạo'),
('CV06' , 'CQ06' ,'NV06' , N'Khen Thuong' , '2018/08/09' , N'Khoa CNTT'),
('CV07' , 'CQ04' ,'NV01' , N'Kỷ Luật'     , '2020/11/17' , N'Khoa Kinh Tế'),
('CV08' , 'CQ05' ,'NV03' , N'Hành Chính'  , '2019/03/01' , N'Khoa Xây Dựng')

INSERT INTO CVDI VALUES
('Di01' , 'CV01'  , 'CQ01' , '2020/12/01' ),
('Di02' , 'CV03'  , 'CQ04' , '2020/10/01' ),
('Di03' , 'CV02'  , 'CQ05' , '2018/10/05' ),
('Di04' , 'CV01'  , 'CQ03' , '2020/11/02' ),
('Di05' , 'CV04'  , 'CQ02' , '2017/07/05' ),
('Di06' , 'CV05'  , 'CQ06' , '2019/11/12' ),
('Di07' , 'CV02'  , 'CQ03' , '2020/10/03' ),
('Di08' , 'CV06'  , 'CQ02' , '2019/12/01' )

INSERT INTO CVDEN VALUES
('De01' , 'CV01'  , 'CQ01' ,'NV04' , '2020/12/31' , N'Đã Xử lý' ),
('De02' , 'CV03'  , 'CQ03' ,'NV05' , '2020/12/31'  , N'Đã Xử lý'),
('De03' , 'CV02'  , 'CQ02' ,'NV01' , '2018/12/31' , N'Đang Xử lý'),
('De04' , 'CV01'  , 'CQ01' ,'NV04' , '2020/12/15' ,  N'Đang Xử lý'),
('De05' , 'CV04'  , 'CQ03' ,'NV03' , '2017/02/11'  , N'Đã Xử lý'),
('De06' , 'CV05'  , 'CQ02' ,'NV02' , '2019/11/30' ,  N'Đang Xử lý'),
('De07' , 'CV02'  , 'CQ02' ,'NV01' , '2020/10/06'  , N'Đã Xử lý'),
('De08' , 'CV06'  , 'CQ01' ,'NV06' , '2019/12/31' ,  N'Đang Xử lý')


------------------------- Bùi Đình Chí ----------------------------
-- 1.View
-- 1.1 Hiển thị thông tin của tất cả nhân viên
CREATE VIEW INFONV AS
	SELECT * FROM NHANVIEN
-- 1.2 Hiển thị thông tin các công văn đã xử lý
CREATE VIEW CVDXL AS
	SELECT C.* FROM CONGVAN C 
	JOIN CVDEN X ON X.MACV = C.MACV
	WHERE X.TINHTRANG = N'Đã Xử lý';
-- 1.3 Hiển thị thông tin các công văn, tên cơ quan mà công công ty có mã A đã ký
CREATE VIEW INFOCTY AS
	SELECT CV.*, TENCQ FROM COQUAN CQ
	JOIN CONGVAN CV ON CV.MACQ = CQ.MACQ
	WHERE CQ.MACQ = 'CQ06'; 
-- 2 Stored Procedure
-- 2.1 Viết hàm tham số vào là mã nhân viên trả về là tên cơ quan, mã các công văn đã ký của nhân viên này.
CREATE PROCEDURE FIND_NV @manv char(4) 
AS
	SELECT NV.MACQ , MACV FROM NHANVIEN NV
	JOIN CONGVAN CV ON CV.MANV = NV.MANV
	WHERE NV.MANV = @manv
EXEC FIND_NV @manv = 'NV03'
-- 2.2 Viết hàm tham số vào là mã công văn trả về là các thông tin cơ quan ký công văn này
CREATE PROCEDURE FIND_CP @macv char(4)
AS
	SELECT CQ.* FROM COQUAN CQ
	JOIN CONGVAN CV ON CV.MACQ = CQ.MACQ
	WHERE MACV = @macv;
EXEC FIND_CP @macv = 'CV01'
-- 2.3 Viết hàm tham số vào là  mã công văn đi trả về là tên công ty ký công văn này
CREATE PROCEDURE FIND_CP_2 @macvdi char(4)
AS 
	SELECT CQ.* FROM COQUAN CQ
	JOIN CONGVAN CV ON CV.MACQ = CQ.MACQ
	JOIN CVDI CI ON CI.MACV = CV.MACV
	WHERE MACVDI = @macvdi;
EXEC FIND_CP_2 @macvdi = 'Di04'


-- 3 Function
-- 3.1 Viết hàm tham số vào là mã nhân viên trả về là tên cơ quan của mã nhân viên này.
CREATE FUNCTION name_cqnv (@manv CHAR(4))
	RETURNS NVARCHAR(30)
	AS
		BEGIN
		DECLARE @name_cq NVARCHAR(30);
			SELECT @name_cq = TENCQ FROM NHANVIEN NV 
			JOIN COQUAN CQ ON NV.MACQ = CQ.MACQ 
			WHERE MANV = @manv
		RETURN @name_cq;
		END
SELECT dbo.name_cqnv('NV01')
-- 3.2 Viết hàm tham số vào là mã công văn trả về là tên cơ quan ký công văn này
CREATE FUNCTION name_cqkcv (@mcv CHAR(4))
	RETURNS NVARCHAR(30)
	AS
		BEGIN
		DECLARE @name_cq NVARCHAR(30)
			SELECT @name_cq = TENCQ FROM COQUAN CQ
			JOIN CONGVAN CV ON CV.MACQ = CQ.MACQ
			WHERE MACV = @mcv
		RETURN @name_cq 
		END;
SELECT dbo.name_cqkcv ('CV01')
-- 3.3 Viết hàm tham số vào là mã công văn đi trả về là tình trạng hiện tại của công văn này
CREATE FUNCTION status_cvden (@mcv CHAR(4))
	RETURNS NVARCHAR(30)
	AS
		BEGIN 
			DECLARE @st NVARCHAR(30)
				SELECT @st = TINHTRANG FROM CVDEN 
				WHERE MACVDEN = @mcv;
			RETURN @st
		END;
SELECT dbo.status_cvden('De01')

-- 4 Trigger
-- 4.1 Xây dựng trigger kiểm tra  nhân viên khi người dùng thêm mới thông tin thì nhân viên có lớn hơn 18 tuổi không
-- và mã cty là mã phải tồn tại.  
ALTER TRIGGER cau4_1 ON NHANVIEN 
FOR INSERT AS
BEGIN 
	
	DECLARE @tuoinv INT = (SELECT 2020 - YEAR(NGAYSINH) FROM inserted);
	
	IF(@tuoinv < 18)
		BEGIN 
			RAISERROR('Khong the them nhan vien < 18',16,1)
			ROLLBACK TRAN
		END
	ELSE
		BEGIN 
			PRINT 'THEM THANH CONG'
		END
END
INSERT INTO NHANVIEN values 
('NV08', 'CQ01' , N'Hồ thị cường', '2010/11/09' ,N'Nhân Viên'  )

select * from NHANVIEN
-- 4.2 Xây dựng trigger kiểm tra  nhân viên khi người dùng thêm mới thông tin thì 
-- cơ quan của nhân viên được có ở nghệ an không không.
ALTER TRIGGER cau4_2  ON NHANVIEN
FOR INSERT AS
BEGIN
	DECLARE @dci_cty nvarchar(50) = (SELECT DIACHICQ FROM inserted join COQUAN ON COQUAN.MACQ = inserted.MACQ);
	IF (@dci_cty  = N'Nghệ An')
		PRINT 'Cong ty cua nhan vien co tru so tai nghe an'
	ELSE
		PRINT 'THEME THANH CONG'
END
INSERT INTO NHANVIEN values 
('NV31', 'CQ02' , N'Hồ thị cường', '2000/11/09' ,N'Nhân Viên'  )

-- 4.3 Xây dựng trigger trong CVDI  để kiểm tra khi  khi người dùng thêm mới thông tin. ngày gửi công văn  truoc thang 12/2020
ALTER TRIGGER KTCVDI ON CVDI
FOR INSERT AS 
BEGIN 
	DECLARE @YEAR_SEND int =  (select YEAR(NGAYGUI)  from inserted);
	DECLARE @MONTH_SEND int =  (select MONTH(NGAYGUI)  from inserted)
	IF(@YEAR_SEND < 2020 )
		BEGIN
			PRINT 'Cong van duoc gui truoc ngay 12/12/2020'
		END
	IF(@YEAR_SEND = 2020 )
		IF (@MONTH_SEND < 12)
			BEGIN
			PRINT 'Cong van duoc gui truoc ngay 12/12/2020'
		END
END


INSERT INTO CVDI VALUES
('Di17' , 'CV02'  , 'CQ02' , '2021/11/12' )