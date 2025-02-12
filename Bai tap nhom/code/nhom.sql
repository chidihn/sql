CREATE DATABASE QLCV2;
USE QLCV2;
use sinhvien
drop database QLCV;
-- Bảng nhân viên
CREATE TABLE NHANVIEN (
	MANV CHAR(4) PRIMARY KEY,
	HOTEN NVARCHAR(40),
	NGAYSINH DATETIME,
	CHUCVU NVARCHAR(40)
)
-- Bảng cơ quan
CREATE TABLE COQUAN (
	MACQ CHAR(4) PRIMARY KEY,
	TENCQ NVARCHAR(30),
	DIACHICQ NVARCHAR(50)
)
-- Bảng công văn
CREATE TABLE CONGVAN (
	MACV CHAR(4) PRIMARY KEY,
	MACQ CHAR(4) FOREIGN KEY REFERENCES COQUAN,
	MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN,
	LOAICV NVARCHAR(40),
	NGAYKY DATETIME,
	NOINHAN NVARCHAR (40),
)
-- Bảng	công văn đến
CREATE TABLE CVDEN (
	MACVDEN CHAR(4)PRIMARY KEY,
	MACV CHAR(4) FOREIGN KEY REFERENCES CONGVAN,
	MACQ CHAR(4) FOREIGN KEY REFERENCES COQUAN, -- MA CO QUAN NHAN
	MANV CHAR(4) FOREIGN KEY REFERENCES NHANVIEN, -- MA NGUOI NHAN
	NGAYNHAN DATETIME
)
-- Bảng công văn đi
CREATE TABLE CVDI (
	MACVDI CHAR(4) PRIMARY KEY,
	MACV CHAR(4) FOREIGN KEY REFERENCES CONGVAN,
	MACQ CHAR(4) FOREIGN KEY REFERENCES COQUAN, -- MA CO QUAN NHAN
	NGAYGUI DATETIME
)
-- Bảng xử lý công văn
CREATE TABLE XLCV (
	MACVDEN CHAR(4) FOREIGN KEY REFERENCES CVDEN,
	MACV CHAR(4) FOREIGN KEY REFERENCES CONGVAN,
	TINHTRANG CHAR (30)
	PRIMARY KEY (MACVDEN, MACV)
)

INSERT INTO CONGVAN VALUES
('CV01' , 'CQ01' ,'NV04' , N'Hành Chính'  , '2020/12/01' , N'Khoa Kinh Tế'),
('CV02' , 'CQ02' ,'NV01' , N'Giải Thích'  , '2019/10/10' , N'khoa CNTT'),
('CV03' , 'CQ03' ,'NV05' , N'Thông Báo'   , '2018/12/26' , N'Phòng Ban'),
('CV04' , 'CQ03' ,'NV03' , N'Hành Chính'  , '2020/12/01' , N'Khoa Giáo Dục'),
('CV05' , 'CQ02' ,'NV02' , N'Nhắc Nhở'    , '2016/09/25' , N'Khoa Đào Tạo'),
('CV06' , 'CQ01' ,'NV06' , N'Khen Thưởng' , '2018/08/09' , N'Khoa CNTT'),
('CV07' , 'CQ04' ,'NV01' , N'Kỷ Luật'     , '2020/11/17' , N'Khoa Kinh Tế'),
('CV08' , 'CQ05' ,'NV03' , N'Hành Chính'  , '2019/03/01' , N'Khoa Xây Dựng')

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
('NV01' , N'Bùi Thị Chí'     , '2000/11/09' ,N'Nhân Viên'  ),
('NV02' , N'Hoàng Thị Cường' , '1999/12/09' ,N'Giám Đốc'  ),
('NV03' , N'Hồ Sỹ Nữ Dũng'   , '2001/10/02' ,N'Chủ Tịch'  ),
('NV04' , N'Bùi Văn A'       , '2000/10/21' ,N'Nhân Viên'  ),
('NV05' , N'Trần Văn C'      , '2002/12/09' ,N'Nhân Viên'  ),
('NV06' , N'Nguyễn Văn L'    , '2003/11/01' ,N'Nhân Viên'  ),
('NV07' , N'Lê Văn B'        , '2000/11/06' ,N'Nhân Viên'  )

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
('De01' , 'CV01'  , 'CQ01' ,'NV04' , '2020/12/31' ),
('De02' , 'CV03'  , 'CQ03' ,'NV05' , '2020/12/31' ),
('De03' , 'CV02'  , 'CQ02' ,'NV01' , '2018/12/31' ),
('De04' , 'CV01'  , 'CQ01' ,'NV04' , '2020/12/15' ),
('De05' , 'CV04'  , 'CQ03' ,'NV03' , '2017/02/11' ),
('De06' , 'CV05'  , 'CQ02' ,'NV02' , '2019/11/30' ),
('De07' , 'CV02'  , 'CQ02' ,'NV01' , '2020/10/06' ),
('De08' , 'CV06'  , 'CQ01' ,'NV06' , '2019/12/31' )

INSERT INTO XLCV VALUES
('De01' , 'CV01'  , N'Đã Xử lý'),
('De02' , 'CV03'  , N'Đang Xử lý'),
('De03' , 'CV02'  , N'Đang Xử lý'),
('De04' , 'CV01'  , N'Chưa Xử lý'),
('De05' , 'CV04'  , N'Đã Xử lý'),
('De06' , 'CV05'  , N'Chưa Xử lý'),
('De07' , 'CV02'  , N'Đang Xử lý'),
('De08' , 'CV06'  , N'Đã Xử lý')


------------------------- Bùi Đình Chí ----------------------------
-- 1.View
-- 1.1 Hiển thị thông tin của tất cả nhân viên

-- 1.2 Hiển thị thông tin các công văn đã xử lý
-- 1.3 Hiển thị thông tin các công văn mà công công ty đã ký
-- 2 Stored Procedure
-- 2.1 Xây dựng thủ tục tính tính tổng số công văn gửi đi của 1 cơ quan
-- 2.2 Xây dựng thủ tục tính độ tuổi của nhân viên của một cơ quan
-- 2.3 Xây dựng thủ tục tính số công văn chưa được xử lý của cơ quan