select * from tblNguoiNeoDon;
use FPT_Thi__2019;

insert into tblNguoiNeoDon values
('NND0007','Nguyen Thi Thuy Ha', N'Nghệ An','099912312',1, 1945)

-- Câu 1: Liệt kê những người già neo đơn có họ tên bắt đầu bằng ký tự N 
--(in hoa) và có độ dài ít nhất là 15 ký tự. (1 điểm).
select * from tblNguoiNeoDon where HoTenNguoiNeoDon LIKE 'N%'

-- Câu 2: Liệt kê những dòng trong bảng CHITIETCHAMSOC có NgayBatDauCS nằm trong năm 2019 và 
--có quy trình chăm sóc với mã là QTCS03. (1 điểm).
select * from tblChiTietChamSoc where YEAR(NgayBatDauCS) = 2017 and MaQuyTrinhCS = 'QTCS03';
-- Câu 3: Liệt kê MaNguoiNeoDon và MaNVChamSoc của nhân viên đang chăm sóc tương ứng với người neo đơn đó.
--Kết quả hiện thị được sắp xếp tăng dần theo MaNVChamSoc và giảm dần theo MaNguoiNeoDon. (1 điểm).
select  MaNguoiNeoDon, MaNVChamSoc from tblChiTietChamSoc 
order by MaNVChamSoc asc , MaNguoiNeoDon desc 

-- Câu 4: Liệt kê những nhân viên chưa có số điện thoại và chưa từng chăm sóc 
--cho người già neo đơn có giới tính là nam. (1 điểm).
select * from tblNhanVienChamSoc nv
join tblChiTietChamSoc ct on ct.MaNVChamSoc = nv.MaNVChamSoc
join tblNguoiNeoDon n on n.MaNguoiNeoDon = ct.MaNguoiNeoDon
where nv.GioiTinh ='Nam' and  n.GioiTinh = 'Nam'
-- Câu 5: Liệt kê họ tên những nhân viên chăm sóc đang có trong hệ thống.
--Nếu họ tên trùng nhau thì chỉ hiện thị 1 lần. Học viên cần thực hiện yêu cầu này 
--bằng 2 cách khác nhau (mỗi cách được tính 0,5 điểm). (1 điểm)
Select distinct TenNVChamSoc from tblNhanVienChamSoc;
select TenNVChamSoc from tblNhanVienChamSoc group by TenNVChamSoc;
--Câu 6: Liệt kê MaNguoiNeoDon, HoTenNguoiNeoDon, QueQuan, SoDienThoaiNguoiThan,
--GioiTinh(của nhân viên chăm sóc), NamSinh, NgayBatDauCS, MaNVChamSoc, MaQuyTrinhCS, MaCheDoBH 
-- của tất cả những nhân viên trong hệ thống (Gợi ý: những nhân viên chăm sóc chưa từng chăm sóc 
-- cho người neo đơn nào cũng phải được liệt kê). (1 điểm).
select n.MaNguoiNeoDon, HoTenNguoiNeoDon, QueQuan, SoDienThoaiNguoiThan,
nv.GioiTinh, NamSinh, NgayBatDauCS, nv.MaNVChamSoc, MaQuyTrinhCS, MaCheDoBH 
from   tblNhanVienChamSoc nv
full outer join tblChiTietChamSoc ct on ct.MaNVChamSoc = nv.MaNVChamSoc
full outer join tblNguoiNeoDon n on n.MaNguoiNeoDon = ct.MaNguoiNeoDon
--Câu 7: Liệt kê những nhân viên đã từng chăm sóc cho nhiều nhất 10 người và 
-- những người neo đơn không có quê quán là ‘Quảng Trị’. (1 điểm).
select  nv.MaNVChamSoc, nv.GioiTinh, nv.TenNVChamSoc, nv.SoDienThoai from tblChiTietChamSoc ct
join tblNguoiNeoDon n on ct.MaNguoiNeoDon = n.MaNguoiNeoDon
join tblNhanVienChamSoc nv on nv.MaNVChamSoc = ct.MaNVChamSoc
where n.QueQuan <> N'Quảng Trị'
group by nv.MaNVChamSoc, nv.GioiTinh, nv.TenNVChamSoc, nv.SoDienThoai
having  COUNT(ct.MaNguoiNeoDon) < 10

--Câu 8: Tạo một View có tên là VnguoiNeoDon để có thể nhìn thấy được HoTenNguoiNeoDon, QueQuan của 
-- các người neo đơn sinh sau năm 1953 và đã từng được ít nhất một nhân viên chăm sóc. (1 điểm).
create view VnguoiNeoDon2 as
select HoTenNguoiNeoDon, QueQuan from tblNguoiNeoDon n 
join tblChiTietChamSoc c on n.MaNguoiNeoDon = c.MaNguoiNeoDon
where NamSinh > 1932

select * from VnguoiNeoDon
select * from tblNhanVienChamSoc nv
join tblChiTietChamSoc ct on ct.MaNVChamSoc = nv.MaNVChamSoc
join tblNguoiNeoDon n on n.MaNguoiNeoDon = ct.MaNguoiNeoDon
--Câu 9: Tạo một store procedure có tên là SxoaNguoiNeoDon dùng để xóa toàn bộ thông tin có liên quan
-- đến một nhân viên chăm sóc. Yêu cầu (1 điểm):
---	Đầu vào của procedure này là 1 chuỗi chứa MaNguoiNeoDon (0,5 điểm).
---	Phải xóa toàn bộ các bảng có liên quan đến người neo đơn với MaNguoiNeoDon đó (0,5 điểm).
create or alter proc SxoaNguoiNeoDon2 @manuoineodon char(8)
as
	delete c from tblChiTietChamSoc c where c.MaNguoiNeoDon = @manuoineodon
	delete n from tblNguoiNeoDon n where n.MaNguoiNeoDon = @manuoineodon

select * from tblNguoiNeoDon
execute dbo.SxoaNguoiNeoDon2  @manuoineodon ='NND0007'

insert into tblNguoiNeoDon values
('NND0007','Nguyen Thi Thuy Ha', N'Nghệ An','099912312',1, 1945)
insert into tblChiTietChamSoc values 
('NND0007','2016-07-04', 'NV002', 'QTCS02', 'CDBH03')
--Câu 10: Tạo một trigger có tên là TthemNND dùng để cấm người dùng tạo mới các dòng trong bảng
-- NGUOINEODON khi phát hiện người neo đơn cần thêm vào có năm sinh trước năm 1940. (1 điểm)

create or alter trigger TthemNND2 on tblNguoiNeoDon
for insert as
begin
	declare @namsinh int = (select NamSinh from inserted);
	if(@namsinh < 1940)
		begin
			RAISERROR('Khong them them nguoi truoc nam 1940',16,1);
			Rollback tran;
		end
end
insert into tblNguoiNeoDon values
('NND0008','Nguyen Thi Thuy Ha', N'Nghệ An','099912312',1, 1935)