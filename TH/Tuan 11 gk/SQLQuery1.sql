CREATE DATABASE QLSinhVien2 ;
USE QLSinhVien2;

create table KHOA (
	MaKhoa char(4) primary key,
	TenKhoa nvarchar(30)
)

create table LOP(
	MaLop char(4) primary key,
	TenLop nvarchar(30),
	SiSo int,
	MaKhoa char(4) foreign key references KHOA
)

create table SINHVIEN(
	MaSV char(4),
	HoTen nvarchar(30),
	NgaySinh datetime,
	GioiTinh char(5),
	MaLop char(4) foreign key references LOP
)

insert into KHOA values
('KH01', 'Kinh te'),
('KH02', 'Cong nghe thong tin')

insert into LOP values
('LP01',' 59B1 Ke toan', 70, 'KH01'),
('LP02',' 59K CNTT', 47, 'KH02')

insert into SINHVIEN values
('SV01', 'Bui Dinh Chi','11/09/2000', 'Nam', 'LP01'),
('SV02', 'Nguyen Van A','11/07/1999', 'Nam', 'LP01'),
('SV02', 'Tran Thi B','29/03/1999', 'Nu', 'LP02'),
('SV04', 'Ho Thi C','05/12/1999', 'Nu', 'LP02'),
('SV05', 'Phan Van S','10/10/2000', 'Nam', 'LP01')

--- Cau 2:
create procedure cau2 @tenkhoa nvarchar(30)
as
	select MaSV, HoTen, 2020 - YEAR(NgaySinh) as 'Tuoi' from SINHVIEN SV
	JOIN LOP LP on SV.MaLop = LP.MaLop
	JOIN KHOA  KH on KH.MaKhoa = LP.MaKhoa
	where TenKhoa = @tenkhoa	

exec cau2 @tenkhoa  = 'Kinh te'

-- cau 3
create function filter_age (@tutuoi int, @dentuoi int)
	returns table
	as
	return
		select MaSV, HoTen, NgaySinh, TenLop, TenKhoa , 2020-YEAR(NgaySinh) as 'Tuoi' from SINHVIEN SV
		join LOP LP on SV.MaLop = LP.MaLop
		join KHOA  KH on KH.MaKhoa = LP.MaKhoa
		where  2020-YEAR(NgaySinh) >= @tutuoi  and 2020-YEAR(NgaySinh) <= @dentuoi
-----------------------------------
select * from dbo.filter_age(19,20)


-- cau 4
create trigger cau4 ON SINHVIEN 
for insert as
begin 
	declare @siso INT = (select SiSo from LOP L join inserted on inserted.MaLop = L.MaLop  );
	declare @malop char(4) = (select L.MaLop from LOP L join inserted on inserted.MaLop = L.MaLop  );
	update LOP SET SiSo = @siso + 1 where MaLop = @malop

	if(@siso  >= 80)
		begin 
			update LOP SET SiSo = @siso - 1 where MaLop = @malop
			RAISERROR('Lop cua ban da vuot qua 80 nguoi',16,1)
			ROLLBACK TRAN
		end
	else
		begin 
			print 'THEM THANH CONG'
		end
end

insert into LOP values
('LP03',' 59B1 Luat',90, 'KH01')

select * from LOP

insert into SINHVIEN values
('SV11', 'Nguyen Thi Teo','11/11/2000', 'Nam', 'LP03')

insert into SINHVIEN values
('SV08', 'Nguyen Tran A','11/11/2000', 'Nam', 'LP01')

-- cau 5
declare @hoten  nvarchar(30) = '', @tenlop nvarchar(30)
declare @tenkhoa nvarchar(30)
declare cur_sv cursor
keyset
for 
	select HoTen, TenLop, TenKhoa as 'Tuoi' from SINHVIEN SV
	JOIN LOP LP on SV.MaLop = LP.MaLop
	JOIN KHOA  KH on KH.MaKhoa = LP.MaKhoa
	where SV.MaSV = 'SV15'
open cur_sv

while 	0=0
	begin
	fetch next from cur_sv into @hoten, @tenlop,@tenkhoa
	if @hoten = ''
		begin
			print 'Khong ton tai ma sinh vien';
			break;
		end
	if @@fetch_status<>0 break
	print @hoten+'   '+ @tenlop+ ' ' +@tenkhoa
end
close cur_sv
deallocate cur_sv