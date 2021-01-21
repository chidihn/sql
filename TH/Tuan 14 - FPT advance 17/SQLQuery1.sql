use FPT_He_2017;

-- Câu 1: Thực hiện yêu cầu sau:
--a.	Tạo một khung nhìn có tên là V_KhachHang để thấy được thông tin của tất cả các đơn hàng 
--có ngày đặt hàng nhỏ hơn  ngày 06/15/2015 của những khách hàng có địa chỉ là "Da Nang". (1 điểm)
alter view V_KhachHang as
	select D.* from tblDonhang D join tblKhanghang K 
	on  D.MaKH = K.MaKH
	where NgayDat < '06/15/2015' and DiaChi='Da Nang'
--b.	Thông qua khung nhìn V_KhachHang thực hiện việc cập nhật ngày đặt hàng thành 06/15/2015 
-- đối với những khách hang đặt hàng vào ngày 06/15/2014.  (1 điểm)
update V_KhachHang
set NgayDat = '06/15/2015'
where NgayDat = '06/15/2014'
select * from tblSanpham
--Câu 2: Tạo 2 thủ tục:
--a.	Thủ tục Sp_1: Dùng để xóa thông tin của những sản phẩm có mã sản 
-- phẩm được truyền vào như một tham số của thủ tục. (1 điểm)
create procedure Sp_1 @msp char(5)
as
	delete from tblSanpham where MaSP = @msp;
exec dbo.Sp_1 @msp = 'SP003'
--b.	Thủ tục Sp_2: Dùng để bổ sung thêm bản ghi mới vào 
--bảng CHITIETDONHANG (Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu được bổ sung
--là không trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng có liên quan). (1 điểm)

create or alter proc Sp_2 @mdh char(5), @msp char(5), @sl int, @tongtien float
as
	if exists (select * from tblChitietDonhang where MaSP= @msp and MaDH = @mdh )
		begin 
			print 'Trung khoa chinh';
		end
	else 
		insert into tblChitietDonhang values(@mdh, @msp, @sl, @tongtien)
		begin 
			print 'Them thanh cong vao bang tblChitietDonhang';
		end

exec dbo.Sp_2 @mdh ='DH001', @msp ='SP001',@sl = 4, @tongtien = 555
--Câu 3: Viết 2 bẫy sự kiện (trigger) cho bảng CHITIETDONHANG theo yêu cầu sau:
--a.	Trigger_1: Khi thực hiện đăng ký mới một đơn đặt hàng cho khách hàng thì
-- cập nhật lại số lượng sản phẩm trong bảng sản phẩm (tức là số lượng sản phẩm còn lại sau khi đã bán).
-- Bẫy sự kiện chỉ xử lý 1 bản ghi. (1 điểm)
create or alter trigger Trigger_1 on tblChitietDonhang
FOR INSERT AS
BEGIN
	declare @sldh int =  (SELECT SoLuong FROM inserted)
	declare @mspu char(5) = (SELECT MaSP FROM inserted)
	declare @slsp int = (select SoLuong  from tblSanpham )
	update tblSanpham set SoLuong = @slsp - @sldh where MaSP = @mspu
END


--b.	Trigger_2: Khi cập nhập lại số lượng sản phẩm mà khách hàng đã đặt hàng, 
--kiểm tra xem số lượng cập nhật có phù hợp hay không (số lượng phải lớn hơn 1 và nhỏ hơn 100). 
--Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu không thì hiển thị thông báo "số lượng sản phẩm 
-- được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100" và thực hiện quay lui giao tác. (1 điểm)
create trigger Trigger_2 on tblChitietDonhang
for update
as
	declare @a int
	select @a = SoLuong from inserted
	if((@a <1) or (@a >100))
	begin 
	print N'số lượng sản phẩm được đặt hàng phải nằm trong khoảng giá trị từ 1 đến 100'
end



--Câu 4: Tạo hàm do người dùng định nghĩa (user-defined function) để tính
-- phần trăm giảm giá cho các đơn hàng khi thực hiện các lần mua hàng trong năm 2017 khách hàng
--của tất cả các lần đặt hàng trong năm 2014, mã khách hàng sẽ được truyền vào thông qua tham 
-- số đầu vào của hàm. Cụ thể như sau:
---	Nếu tổng số tiền khách hàng đã trả cho tất cả đơn hàng hàng dưới 10.000.000, thì trả về kết quả là
	--khách hàng được giảm 20% trên mỗi đơn hàng tiếp theo sẽ mua vào năm 2017. (1 điểm)

---	Nếu tổng số tiền khách hàng đã trả cho tất cả đơn hàng hàng từ 20.000.000 trở đi,
	--thì trả về kết quả là khách hàng được giảm 30% trên mỗi đơn hàng tiếp theo sẽ mua vào năm 2017. (1 điểm)
--Function phải hiển thị thông tin MaKH, số lượng các đơn hàng đã mua, Tổng tiền 
	--tương ứng từng đơn hàng, Phần trăm được giảm giá.

--Câu 5: Tạo thủ tục Sp_SanPham tìm những sản phẩm đã từng được khách hàng đặt mua từ 2 lần trở lên 
--để xóa thông tin về những sản phẩm đó trong bảng SANPHAM và xóa thông tin những đơn hàng có liên quan đến
--những sản phẩm đó (tức là phải xóa những bản ghi trong bảng DONHANG và CHITIETDONHANG có liên quan đến các 
--sản phẩm đó). (2 điểm) 
