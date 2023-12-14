------------------------PHẦN I ------------------------

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
GO
--Câu 26
select MaSV,(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], NoiSinh, HocBong from SinhVien
GO
--câu 27
select HoSV + ' ' + TenSV as [Họ và tên],(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi],HocBong from SinhVien
GO
--câu 28
SELECT HoSV + ' ' + TenSV as [Họ và tên],(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], KH.TenKH
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE YEAR(GETDATE()) -YEAR(NgaySinh) BETWEEN 20 AND 30
GO
------------------------PHẦN II ------------------------
--câu 1
SELECT HoSV + ' ' + TenSV as [Họ và tên],[Phái] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')),(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], MaKH
FROM SinhVien ORDER BY 3
GO
--câu 2
SELECT HoSV + ' ' + TenSV as [Họ và tên],Phai,CAST(DAY(NgaySinh) AS VARCHAR(2)) AS [ngày sinh], MaKH
FROM SinhVien WHERE MONTH(NgaySinh) = 2 and YEAR(NgaySinh) =1994
GO
--câu 3
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien order by NgaySinh desc
GO
--câu 4
select MaSV, Phai, NgaySinh, MaKH, 
	CASE WHEN HocBong >500000 THEN N'Học bổng cao'
	ELSE  N'Học bổng trung bình'
	END
 from SinhVien order by NgaySinh desc
GO
--câu 5
select HoSV + ' ' + TenSV as [Họ và tên], MaKH,  DiemTrungBinh from SinhVien order by 1,MaKH desc
GO
--câu 6
select HoSV + ' ' + TenSV as [Họ và tên],  [Giới tính] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), KH.TenKH
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
WHERE KH.TenKH = N'Anh Văn'
GO
-- câu 7
select  KH.TenKH,HoSV + ' ' + TenSV as [Họ và tên],  [Giới tính] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), MH.TenMH, MH.Sotiet, KQ.Diem
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
INNER JOIN  MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KH.MaKH = N'TH'
GO
-- CÂU 8
select  HoSV + ' ' + TenSV as [Họ và tên], KH.MaKH, MH.TenMH, KQ.Diem , IIF(KQ.Diem>8,N'Giỏi',IIF(KQ.Diem<6,N'Trung bình',N'Khá'))
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
INNER JOIN  MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KH.MaKH = N'TH'
GO
------------------------PHẦN III ------------------------
-- câu 1
select MH.MaMH, MH.TenMH,AVG(KQ.Diem) as [điểm trung bình]
from Ketqua KQ
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH,MH.TenMH
GO
-- câu 2
select   HoSV + ' ' + TenSV as [Họ và tên] , KH.TenKH, COUNT(KQ.MaSV) as [tổng số môn thi]
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
WHERE Diem is not null
GROUP BY HoSV, TenSV,TenKH
GO
-- câu 3
select    TenSV  , TenKH,Phai, SUM(ISNULL(Diem,0)) as [Tổng điểm thi]
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
GROUP BY  TenSV,TenKH,Phai
GO
-- câu 4
select    HoSV + ' ' + TenSV as [Họ và tên] ,COUNT(SV.MaKH)
from Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY  TenKH
GO
-- câu 5
select    TenSV  , MAX(KQ.Diem) as [Điểm]
from SinhVien SV
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
GROUP BY  SV.MaSV, TenSV
GO
-- câu 6
select TOP(1) WITH TIES TenMH  , Sotiet
from  MonHoc MH ORDER BY Sotiet DESC
GO
-- câu 7
SELECT KH.MaKH, KH.TenKH , MAX(HocBong)
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY KH.MaKH, KH.TenKH
GO

-- câu 8
select TenMH  , MAX(KQ.Diem)
from  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH,TenMH
GO
-- câu 9
SELECT MH.MaMH, TenMH  , COUNT(KQ.MaSV) AS [Số sinh viên đang học]
FROM  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, TenMH 
GO
-- câu 10
SELECT  TOP(1) WITH TIES  TenMH, Sotiet, TenSV, Diem
FROM  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
ORDER BY Diem DESC
GO
-- câu 11
SELECT  TOP(1) WITH TIES KH.MaKH, KH.TenKH , COUNT(SV.MaKH) as [Tổng sinh viên]
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY KH.MaKH, KH.TenKH ORDER BY 3 DESC
GO
-- câu 12
SELECT  TOP(1) WITH TIES  KH.TenKH ,sv.TenSV, HocBong
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
ORDER BY 3 DESC
GO

-- câu 13
SELECT  TOP(1) WITH TIES  SV.MaSV ,SV.HoSV +' ' + SV.TenSV AS [Họ và tên],TenKH, HocBong
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
WHERE KH.MaKH ='TH'
ORDER BY HocBong DESC
GO
-- CÂU 14