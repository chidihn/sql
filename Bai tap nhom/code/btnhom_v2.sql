CREATE DATABASE QLCV;
USE QLCV;
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

INSERT INTO PHONGBAN VALUES
('PB01' ,N'Chính Trị'  ),
('PB02' ,N'Đào Tạo'    ),
('PB03' ,N'Chính Sách' ),
('PB04' ,N'Phòng Thuế' ),
('PB05' ,N'Quốc Phòng' ),
('PB06' ,N'Tư Pháp'    ),
('PB07' ,N'Y Tế'       ),
('PB08' ,N'Ngoại Giao' ),
('PB09' ,N'Ban Giám đốc' )


INSERT INTO NHANVIEN VALUES
('NV01', 'PB01' , N'Bùi Thị Chí'     , '2000/11/09' ,N'Nhân Viên'  ),
('NV02', 'PB03' , N'Hoàng Thị Cường' , '1999/12/09' ,N'Giám Đốc'  ),
('NV03', 'PB02' , N'Hồ Sỹ Nữ Dũng'   , '2001/10/02' ,N'Chủ Tịch'  ),
('NV04', 'PB05' , N'Bùi Văn A'       , '2000/10/21' ,N'Nhân Viên'  ),
('NV05', 'PB02' , N'Trần Văn C'      , '2002/12/09' ,N'Nhân Viên'  ),
('NV06', 'PB04' , N'Nguyễn Văn L'    , '2003/11/01' ,N'Nhân Viên'  ),
('NV07', 'PB01' , N'Lê Văn B'        , '2000/11/06' ,N'Nhân Viên'  )

INSERT INTO CONGVAN VALUES
('CV01'  ,'NV04' ,N'Văn bản hành chính'  , N'Hành Chính'  , '2020/12/01' ),
('CV02'  ,'NV01' ,N'Văn bản thuyết minh' , N'Giải Thích'  , '2019/10/10' ),
('CV03'  ,'NV05' ,N'Văn bản nghị luận '  , N'Thông Báo'   , '2018/12/26' ),
('CV04'  ,'NV03' ,N'Văn bản hành chính'  , N'Hành Chính'  , '2020/12/01' ),
('CV05'  ,'NV02' ,N'Văn bản miêu tả'     , N'Nhắc Nhở'    , '2016/09/25' ),
('CV06'  ,'NV06' ,N'Văn bản biểu cảm'    , N'Khen Thuong' , '2018/08/09' ),
('CV07'  ,'NV01' ,N'Văn bản hành chính'  , N'Kỷ Luật'     , '2020/11/17' ),
('CV08'  ,'NV03' ,N'Văn bản hành chính'  , N'Hành Chính'  , '2019/03/01' )

INSERT INTO CVDI VALUES
('Di01' , 'CV01'  , '2020/12/01' ,N'Bộ Quốc Phòng'),
('Di02' , 'CV03'  , '2020/10/01' ,N'Thủ Tướng'),
('Di03' , 'CV02'  , '2018/10/05' ,N'Bộ Tư Lệnh'),
('Di04' , 'CV01'  , '2020/11/02' ,N'TRường đại học y'),
('Di05' , 'CV04'  , '2017/07/05' ,N'Bộ Chỉ Huy'),
('Di06' , 'CV05'  , '2019/11/12' ,N'Bệnh Viện A'),
('Di07' , 'CV02'  , '2020/10/03' ,N'TP.Vinh'),
('Di08' , 'CV06'  , '2019/12/01' ,N'TP.Hà Nội')

INSERT INTO CVDEN VALUES
('De01' , 'CV01'  , '2020/12/31' , N'Đã Xử lý'   ),
('De02' , 'CV03'  , '2020/12/31' , N'Đã Xử lý'   ),
('De03' , 'CV02'  , '2018/12/31' , N'Đang Xử lý' ),
('De04' , 'CV01'  , '2020/12/15' ,  N'Đang Xử lý'),
('De05' , 'CV04'  , '2017/02/11' , N'Đã Xử lý'   ),
('De06' , 'CV05'  , '2019/11/30' ,  N'Đang Xử lý'),
('De07' , 'CV02'  , '2020/10/06' , N'Đã Xử lý'   ),
('De08' , 'CV06'  , '2019/12/31' ,  N'Đang Xử lý')

------------------------- Bùi Đình Chí ----------------------------
-- 1.View
-- 1.1 Hiển thị thông tin của tất cả nhân viên
CREATE VIEW INFONV AS
	SELECT * FROM NHANVIEN
-- 1.2 Hiển thị thông tin các công văn đến đã xử lý
CREATE VIEW CVDXL AS
	SELECT C.* FROM CONGVAN C 
	JOIN CVDEN X ON X.MACV = C.MACV
	WHERE X.TINHTRANG = N'Đã Xử lý';
-- 1.3 Hiển thị thông tin các công văn mà văn phòng có mã A đã ký
CREATE VIEW INFOPB AS
	SELECT CV.* FROM PHONGBAN PB
	JOIN NHANVIEN NV ON NV.MAPB = PB.MAPB
	JOIN CONGVAN CV ON CV.MANV = NV.MANV
	WHERE  PB.MAPB = 'PB01'; 
-- 2 Stored Procedure
-- 2.1 Viết hàm tham số vào là mã nhân viên trả về là tên các công văn đã ký của nhân viên này.
CREATE PROCEDURE FIND_NV @manv char(4) 
AS
	SELECT CV.TENCV FROM NHANVIEN NV
	JOIN CONGVAN CV ON CV.MANV = NV.MANV
	WHERE NV.MANV = @manv
EXEC FIND_NV @manv = 'NV03'
-- 2.2 Viết hàm tham số vào là mã công văn trả về tên phòng ban ký công văn này
CREATE PROCEDURE FIND_PB @macv char(4)
AS
	SELECT PB.TENPB FROM PHONGBAN PB
	JOIN NHANVIEN NV ON NV.MAPB = PB.MAPB
	JOIN CONGVAN CV ON CV.MANV = NV.MANV
	WHERE MACV = @macv;
EXEC FIND_PB @macv = 'CV01'
-- 2.3 Viết hàm tham số vào là mã phòng ban  trả về các thông tin các công văn phòng ban mã A đã ky
CREATE PROCEDURE LIST_CV @mapb char(4)
AS
	SELECT CV.* FROM PHONGBAN PB
	JOIN NHANVIEN NV ON NV.MAPB = PB.MAPB
	JOIN CONGVAN CV ON CV.MANV = NV.MANV
	WHERE PB.MAPB = @mapb;
EXEC LIST_CV @mapb = 'PB01'

-- 3 Function
-- 3.1 Viết hàm tham số vào là mã nhân viên trả về là tên phòng ban của mã nhân viên này.
CREATE FUNCTION NAME_PB (@manv CHAR(4))
	RETURNS NVARCHAR(30)
	AS
		BEGIN
		DECLARE @name_cq NVARCHAR(30);
			SELECT @name_cq = TENPB FROM NHANVIEN NV 
			JOIN PHONGBAN PB ON NV.MAPB = PB.MAPB
			WHERE MANV = @manv
		RETURN @name_cq;
		END
SELECT dbo.NAME_PB('NV01')

-- 3.2 Viết hàm tham số vào là mã công văn trả về là tên cơ phòng ban công văn này
CREATE FUNCTION NAME_PBKCV (@mcv CHAR(4))
	RETURNS NVARCHAR(30)
	AS
		BEGIN
		DECLARE @name_pb NVARCHAR(30)
			SELECT @name_pb = TENPB FROM PHONGBAN PB
				JOIN NHANVIEN NV ON NV.MAPB = PB.MAPB
				JOIN CONGVAN CV ON CV.MANV = NV.MANV
			WHERE MACV = @mcv
		RETURN @name_pb 
		END;
SELECT dbo.NAME_PBKCV ('CV01')
-- 3.3 Viết hàm tham số vào là mã công văn đến trả về là tình trạng hiện tại của công văn này
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
-- Nếu nhỏ hơn 18 tuổi không cho phép thêm vào
CREATE TRIGGER bai4_1 ON NHANVIEN 
FOR INSERT AS
BEGIN 
	
	DECLARE @tuoinv INT = (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(NGAYSINH) FROM inserted);
	
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
('NV14', 'PB01' , N'Hồ Thị Cường', '2020/11/09' ,N'Nhân Viên'  )


-- 4.2 Xây dựng trigger trong CVDI  để kiểm tra khi người dùng thêm công văn thì 
-- ngày tạo công văn phải trước thời điểm hiện tại
CREATE TRIGGER bai4_2 ON CVDI
FOR INSERT AS 
BEGIN 
	DECLARE @YEAR_SEND datetime =  (select NGAYGUI  from inserted);

	IF(@YEAR_SEND >= CURRENT_TIMESTAMP )
		BEGIN
			RAISERROR('Thoi diem tao cong van khong hop le',16,1);
			ROLLBACK TRAN;
		END
	ELSE
		BEGIN
			PRINT 'Cong van duoc gui truoc ngay ' + CONVERT(char(30),CURRENT_TIMESTAMP, 101);
		END
END

select * from CVDI
INSERT INTO CVDI VALUES
('Di17' , 'CV01'  , '2019/12/01' ,N'Bộ Quốc Phòng')
-- 4.3 Xây dựng trigger kiểm tra nếu là phòng giám đốc đã tồn tại thì không được thêm vào phòng ban này. 
ALTER TRIGGER bai4_3  ON PHONGBAN
FOR INSERT AS
BEGIN
	IF  EXISTS (SELECT * FROM inserted WHERE TENPB = N'Ban Giám đốc' )
		RAISERROR ( N'Bạn không thêm phòng giám đốc nữa, phòng đã tồn tại', 16,1)
		ROLLBACK TRAN
END
INSERT INTO PHONGBAN VALUES
('PB13' ,N'Ban Giám đốc' )