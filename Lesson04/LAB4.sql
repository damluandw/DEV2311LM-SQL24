/*
	- Điều kiện sử dụng phép toán tương đối áp dụng với dữ liệu kiểu chuỗi
		+Like/not like
			+++ các ký tự đại diện
				++ dấu % cho chuỗi ký tự bất kỳ có thể rỗng
				++ dấu _ đại diện cho 1 ký tự bất kỳ
				++ [a-m] khoảng ký tự từ a đến m
	- sử dụng toán tử quan hệ and or not trong biểu thức điều kiện
	-- điện kiện so sánh tập hợp in/ not in
*/
-- liệt kê sinh viên có tên mà ký tự thứ 2 là 'u'
select * from SinhVien where TenSV like '_u%'
GO
-- liệt kê sinh viên có tên sv chứa 3 ký tự
select * from SinhVien where TenSV like '___'
select * from SinhVien where LEN(TenSV) =3
GO
-- liệt kê sinh viên có tên có chứa ký tự đầu tiên trong khoảng từ a-m
select * from SinhVien where TenSV like  N'[a-m]%'
GO
select * from SinhVien where TenSV like  N'^[a-m]%' -- ngược lại
GO
-- liệt kê sinh viên có tháng sinh là tháng 2 và tháng 8
select * from SinhVien where MONTH(NgaySinh) = 2 OR MONTH(NgaySinh) = 8 
select * from SinhVien where MONTH(NgaySinh) in (2,8)
GO
--========================
--7 Sắp xếp
-- sắp xếp tăng: ORDER BY <column_name> | <index> | <alise> ASC (mặc định)
-- sắp xếp giảm: ORDER BY <column_name> | <index> | <alise> DESC
-- liệt kê sinh viên , dữ liệu sắp xếp theo tên sinh viên tăng dần

select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien ORDER BY TenSV
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien ORDER BY 3
select MaSV, HoSV, TenSV as [tên sinh viên], Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien ORDER BY [tên sinh viên]

-- liệt kê sinh viên , dữ liệu sắp xếp theo tên sinh viên tăng dần nếu trùng thì sắp theo họ sinh viên giảm dần

select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SinhVien ORDER BY TenSV ASC, HoSV DESC
GO

--câu 1

select MaMH, TenMH, Sotiet from [dbo].[MonHoc]
GO
-- câu 2
select MaSV, HoSV, TenSV, HocBong from [dbo].[SinhVien] order by MaSV
GO
-- câu 3
select MaSV, TenSV, Phai, NgaySinh from [dbo].[SinhVien] order by TenSV
GO
--câu 4
select  HoSV + ' ' + TenSV as [Họ và tên], NgaySinh, HocBong from [dbo].[SinhVien] order by NgaySinh asc, HocBong desc
GO
-- câu 5
select MaMH, TenMH, Sotiet from  [dbo].[MonHoc] where TenMH like N'T%'
go
--câu 6
select  HoSV + ' ' + TenSV as [Họ và tên], NgaySinh, Phai from [dbo].[SinhVien] where TenSV like N'%i'
go

--câu 7
select MaKH, TenKH from [dbo].[Khoa] where TenKH like N'_N%'
GO
-- Câu 8

select * from SinhVien where HoSV like N'%Thị%'
GO
-- câu 9
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên], phai, HocBong from [dbo].[SinhVien] where TenSV like '[a-m]%'
GO
--câu 10
select  HoSV + ' ' + TenSV as [Họ và tên],  NgaySinh, NoiSinh,  HocBong from [dbo].[SinhVien]
order by [Họ và tên]
GO

-- câu 11
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên],MaKH  from [dbo].[SinhVien] where MaKH ='AV'
GO
--select * from [dbo].[Khoa]
-- câu 12
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên],NgaySinh  from [dbo].[SinhVien] where MaKH ='VL' order by  NgaySinh desc
-- câu 13
select   MaSV,HoSV + ' ' + TenSV as [Họ và tên],   MaKH,  HocBong from [dbo].[SinhVien] where HocBong >500000
order by MaKH desc 
GO
-- câu 14
select   HoSV + ' ' + TenSV as [Họ và tên],   MaKH,  HocBong from [dbo].[SinhVien] where NgaySinh = '19871220'
GO
--câu 15
select HoSV + ' ' + TenSV as [Họ và tên], CONVERT(varchar(10),ngaysinh,103) as ngay_sinh, noisinh, hocbong from SinhVien order by ngaysinh desc
GO
-- câu16
select HoSV + ' ' + TenSV as [Họ và tên], MaKH, noisinh, hocbong from SinhVien where HocBong > 100000
GO
-- câu 17
select MaSV, MaKH, Phai from SinhVien  where MaKH in ('AV','TR')
GO
-- câu 18
select MaSV, NgaySinh, NoiSinh, HocBong from SinhVien  where NgaySinh between '19860101'and '19920605'
GO
-- câu 19
select MaSV, NgaySinh, Phai, MaKH from SinhVien where HocBong between 200000 and 800000
GO
-- câu 20
select MaMH, TenMH, Sotiet from [dbo].[MonHoc] where Sotiet >40 and Sotiet <60
GO
-- câu 21
select MaSV, HoSV + ' ' + TenSV as [Họ và tên], Phai from SinhVien where Phai =0
GO
--câu 22
select MaSV, HoSV, TenSV, NoiSinh, NgaySinh from SinhVien where NgaySinh >='19900101'
GO

--câu 23
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien where phai =1 and TenSV like N'%N%'
GO
-- Câu 24
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien where phai =0 and NgaySinh >='19860530'
GO


-- Câu 25
select HoSV + ' ' + TenSV as [Họ và tên],
	[Phái] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), NgaySinh
 from SinhVien



