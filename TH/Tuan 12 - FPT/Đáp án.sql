select * from tblNguoiNeoDon;
use FPT_Thi__2019;

insert into tblNguoiNeoDon values
('NND0007','Nguyen Thi Thuy Ha', N'Nghệ An','099912312',1, 1945)
-- Câu 1: Liệt kê những người già neo đơn có họ tên bắt đầu bằng ký tự N 
--(in hoa) và có độ dài ít nhất là 15 ký tự. (1 điểm).
select * from tblNguoiNeoDon where HoTenNguoiNeoDon like 'N%' and LEN(HoTenNguoiNeoDon) > 15
-- Câu 2: Liệt kê những dòng trong bảng CHITIETCHAMSOC có NgayBatDauCS nằm trong năm 2019 và 
--có quy trình chăm sóc với mã là QTCS03. (1 điểm).
select * from tblChiTietChamSoc where YEAR(NgayBatDauCS) = 2019 and MaQuyTrinhCS = 'QTCS03'
-- Câu 3: Liệt kê MaNguoiNeoDon và MaNVChamSoc của nhân viên đang chăm sóc tương ứng với người neo đơn đó.
--Kết quả hiện thị được sắp xếp tăng dần theo MaNVChamSoc và giảm dần theo MaNguoiNeoDon. (1 điểm).
select * from tblChiTietChamSoc order by MaNVChamSoc asc, MaNguoiNeoDon desc;

-- Câu 4: Liệt kê những nhân viên chưa có số điện thoại và chưa từng chăm sóc 
--cho người già neo đơn có giới tính là nam. (1 điểm).
select nv.* from tblNhanVienChamSoc nv 
join tblChiTietChamSoc cs on nv.MaNVChamSoc = cs.MaNVChamSoc
join tblNguoiNeoDon ng on ng.MaNguoiNeoDon = cs.MaNguoiNeoDon
where SoDienThoai is  null and  not ng.GioiTinh = 'Nam';
-- Câu 5: Liệt kê họ tên những nhân viên chăm sóc đang có trong hệ thống.
--Nếu họ tên trùng nhau thì chỉ hiện thị 1 lần. Học viên cần thực hiện yêu cầu này 
--bằng 2 cách khác nhau (mỗi cách được tính 0,5 điểm). (1 điểm)
select distinct TenNVChamSoc  from tblNhanVienChamSoc
select TenNVChamSoc from tblNhanVienChamSoc group by TenNVChamSoc
--Câu 6: Liệt kê MaNguoiNeoDon, HoTenNguoiNeoDon, QueQuan, SoDienThoaiNguoiThan,
--GioiTinh(của nhân viên chăm sóc), NamSinh, NgayBatDauCS, MaNVChamSoc, MaQuyTrinhCS, MaCheDoBH 
-- của tất cả những nhân viên trong hệ thống (Gợi ý: những nhân viên chăm sóc chưa từng chăm sóc 
-- cho người neo đơn nào cũng phải được liệt kê). (1 điểm).
SELECT  A.MaNguoiNeoDon, HoTenNguoiNeoDon,QueQuan,SoDienThoaiNguoiThan, C.GioiTinh,NamSinh, 
NgayBatDauCS, C.MaNVChamSoc, MaQuyTrinhCS, MaCheDoBH
   FROM tblNguoiNeoDon A JOIN tblChiTietChamSoc B ON A.MaNguoiNeoDon=B.MaNguoiNeoDon
   FULL JOIN tblNhanVienChamSoc C ON B.MaNVChamSoc=C.MaNVChamSoc
--Câu 7: Liệt kê những nhân viên đã từng chăm sóc cho nhiều nhất 10 người và 
-- những người neo đơn không có quê quán là ‘Nghệ An’. (1 điểm).
alter view slngneodon as
select COUNT(ng.MaNguoiNeoDon) as 'SL', nv.MaNVChamSoc from tblNhanVienChamSoc nv
	join tblChiTietChamSoc ct on ct.MaNVChamSoc = nv.MaNVChamSoc
	join tblNguoiNeoDon ng on ng.MaNguoiNeoDon = ct.MaNguoiNeoDon
	where ng.QueQuan not in (N'Nghệ An')
	group by nv.MaNVChamSoc

select distinct(nv.MaNVChamSoc), nv.TenNVChamSoc, nv.SoDienThoai, nv.GioiTinh from tblNhanVienChamSoc nv
	join tblChiTietChamSoc ct on ct.MaNVChamSoc = nv.MaNVChamSoc
	join tblNguoiNeoDon ng on ng.MaNguoiNeoDon = ct.MaNguoiNeoDon
	where nv.MaNVChamSoc in (select s.MaNVChamSoc from slngneodon s where SL < 10)

--Câu 8: Tạo một View có tên là VnguoiNeoDon để có thể nhìn thấy được HoTenNguoiNeoDon, QueQuan của 
-- các người neo đơn sinh sau năm 1953 và đã từng được ít nhất một nhân viên chăm sóc. (1 điểm).
create view  VnguoiNeoDon as
	select distinct(HoTenNguoiNeoDon),   QueQuan from tblNguoiNeoDon ng join tblChiTietChamSoc c
	on ng.MaNguoiNeoDon = c.MaNguoiNeoDon 
	where ng.NamSinh < 1953 
--Câu 9: Tạo một store procedure có tên là SxoaNguoiNeoDon dùng để xóa toàn bộ thông tin có liên quan
-- đến một nhân viên chăm sóc. Yêu cầu (1 điểm):
---	Đầu vào của procedure này là 1 chuỗi chứa MaNguoiNeoDon (0,5 điểm).
---	Phải xóa toàn bộ các bảng có liên quan đến người neo đơn với MaNguoiNeoDon đó (0,5 điểm).
drop procedure SxoaNguoiNeoDon
create procedure SxoaNguoiNeoDon @s_MaNguoiNeoDon char(7)
as
	delete from tblNguoiNeoDon  where MaNguoiNeoDon = @s_MaNguoiNeoDon
--Câu 10: Tạo một trigger có tên là TthemNND dùng để cấm người dùng tạo mới các dòng trong bảng
-- NGUOINEODON khi phát hiện người neo đơn cần thêm vào có năm sinh trước năm 1940. (1 điểm)
create trigger TthemNND on tblNguoiNeoDon
for insert as
begin
	if( select namsinh from inserted) < 1940
		begin
			raiserror('Khong duoc them nguoi dung truoc nam 1940',16,1);
			rollback tran
		end
	else 
		print 'Them thanh cong'
end
