------------------------PHẦN I ------------------------

--CÂU 1
select MaMH, TenMH, Sotiet from [dbo].[MonHoc]
GO
--CÂU 2
select MaSV, HoSV, TenSV, HocBong from [dbo].[SinhVien] order by MaSV
GO
--CÂU 3
select MaSV, TenSV, Phai, NgaySinh from [dbo].[SinhVien] order by TenSV
GO
--CÂU 4
select  HoSV + ' ' + TenSV as [Họ và tên], NgaySinh, HocBong from [dbo].[SinhVien] order by NgaySinh asc, HocBong desc
GO
--CÂU 5
select MaMH, TenMH, Sotiet from  [dbo].[MonHoc] where TenMH like N'T%'
go
--CÂU 6
select  HoSV + ' ' + TenSV as [Họ và tên], NgaySinh, Phai from [dbo].[SinhVien] where TenSV like N'%i'
go

--CÂU 7
select MaKH, TenKH from [dbo].[Khoa] where TenKH like N'_N%'
GO
--CÂU 8

select * from SinhVien where HoSV like N'%Thị%'
GO
--CÂU 9
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên], phai, HocBong from [dbo].[SinhVien] where TenSV like '[a-m]%'
GO
--CÂU 10
select  HoSV + ' ' + TenSV as [Họ và tên],  NgaySinh, NoiSinh,  HocBong from [dbo].[SinhVien]
order by [Họ và tên]
GO

--CÂU 11
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên],MaKH  from [dbo].[SinhVien] where MaKH ='AV'
GO
--select * from [dbo].[Khoa]
--CÂU 12
select  MaSV,HoSV + ' ' + TenSV as [Họ và tên],NgaySinh  from [dbo].[SinhVien] where MaKH ='VL' order by  NgaySinh desc
--CÂU 13
select   MaSV,HoSV + ' ' + TenSV as [Họ và tên],   MaKH,  HocBong from [dbo].[SinhVien] where HocBong >500000
order by MaKH desc 
GO
--CÂU 14
select   HoSV + ' ' + TenSV as [Họ và tên],   MaKH,  HocBong from [dbo].[SinhVien] where NgaySinh = '19871220'
GO
--CÂU 15
select HoSV + ' ' + TenSV as [Họ và tên], CONVERT(varchar(10),ngaysinh,103) as ngay_sinh, noisinh, hocbong from SinhVien order by ngaysinh desc
GO
--CÂU 16
select HoSV + ' ' + TenSV as [Họ và tên], MaKH, noisinh, hocbong from SinhVien where HocBong > 100000
GO
--CÂU 17
select MaSV, MaKH, Phai from SinhVien  where MaKH in ('AV','TR')
GO
--CÂU 18
select MaSV, NgaySinh, NoiSinh, HocBong from SinhVien  where NgaySinh between '19860101'and '19920605'
GO
--CÂU 19
select MaSV, NgaySinh, Phai, MaKH from SinhVien where HocBong between 200000 and 800000
GO
--CÂU 20
select MaMH, TenMH, Sotiet from [dbo].[MonHoc] where Sotiet >40 and Sotiet <60
GO
--CÂU 21
select MaSV, HoSV + ' ' + TenSV as [Họ và tên], Phai from SinhVien where Phai =0
GO
--CÂU 22
select MaSV, HoSV, TenSV, NoiSinh, NgaySinh from SinhVien where NgaySinh >='19900101'
GO

--CÂU 23
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien where phai =1 and TenSV like N'%N%'
GO
--CÂU 24
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien where phai =0 and NgaySinh >='19860530'
GO

--CÂU 25
select HoSV + ' ' + TenSV as [Họ và tên],
[Phái] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), NgaySinh
from SinhVien
GO
--CÂU 26
select MaSV,(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], NoiSinh, HocBong from SinhVien
GO
--CÂU 27
select HoSV + ' ' + TenSV as [Họ và tên],(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi],HocBong from SinhVien
GO
--CÂU 28
SELECT HoSV + ' ' + TenSV as [Họ và tên],(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], KH.TenKH
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE YEAR(GETDATE()) -YEAR(NgaySinh) BETWEEN 20 AND 30
GO
------------------------PHẦN II ------------------------
--CÂU 1
SELECT HoSV + ' ' + TenSV as [Họ và tên],[Phái] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')),(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi], MaKH
FROM SinhVien ORDER BY 3
GO
--CÂU 2
SELECT HoSV + ' ' + TenSV as [Họ và tên],Phai,CAST(DAY(NgaySinh) AS VARCHAR(2)) AS [ngày sinh], MaKH
FROM SinhVien WHERE MONTH(NgaySinh) = 2 and YEAR(NgaySinh) =1994
GO
--CÂU 3
select MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh from SinhVien order by NgaySinh desc
GO
--CÂU 4
select MaSV, Phai, NgaySinh, MaKH, 
	CASE WHEN HocBong >500000 THEN N'Học bổng cao'
	ELSE  N'Học bổng trung bình'
	END
 from SinhVien order by NgaySinh desc
GO
--CÂU 5
select HoSV + ' ' + TenSV as [Họ và tên], MaKH,  DiemTrungBinh from SinhVien order by 1,MaKH desc
GO
--CÂU 6
select HoSV + ' ' + TenSV as [Họ và tên],  [Giới tính] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), KH.TenKH
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
WHERE KH.TenKH = N'Anh Văn'
GO
--CÂU 7
select  KH.TenKH,HoSV + ' ' + TenSV as [Họ và tên],  [Giới tính] =IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác')), MH.TenMH, MH.Sotiet, KQ.Diem
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
INNER JOIN  MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KH.MaKH = N'TH'
GO
--CÂU 8
select  HoSV + ' ' + TenSV as [Họ và tên], KH.MaKH, MH.TenMH, KQ.Diem , IIF(KQ.Diem>8,N'Giỏi',IIF(KQ.Diem<6,N'Trung bình',N'Khá'))
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
INNER JOIN  MonHoc MH ON MH.MaMH = KQ.MaMH
WHERE KH.MaKH = N'TH'
GO
------------------------PHẦN III ------------------------
--CÂU 1
select MH.MaMH, MH.TenMH,AVG(KQ.Diem) as [điểm trung bình]
from Ketqua KQ
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH,MH.TenMH
GO
--CÂU 2
select   HoSV + ' ' + TenSV as [Họ và tên] , KH.TenKH, COUNT(KQ.MaSV) as [tổng số môn thi]
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
WHERE Diem is not null
GROUP BY HoSV, TenSV,TenKH
GO
--CÂU 3
select    TenSV  , TenKH,Phai, SUM(ISNULL(Diem,0)) as [Tổng điểm thi]
from SinhVien SV
INNER JOIN Khoa KH  ON KH.MaKH = SV.MaKH
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
GROUP BY  TenSV,TenKH,Phai
GO
--CÂU 4
select    HoSV + ' ' + TenSV as [Họ và tên] ,COUNT(SV.MaKH)
from Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY  TenKH
GO
--CÂU 5
select    TenSV  , MAX(KQ.Diem) as [Điểm]
from SinhVien SV
INNER JOIN Ketqua KQ ON Kq.MaSV = SV.MaSV
GROUP BY  SV.MaSV, TenSV
GO
--CÂU 6
select TOP(1) WITH TIES TenMH  , Sotiet
from  MonHoc MH ORDER BY Sotiet DESC
GO
--CÂU 7
SELECT KH.MaKH, KH.TenKH , MAX(HocBong)
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY KH.MaKH, KH.TenKH
GO

--CÂU 8
select TenMH  , MAX(KQ.Diem)
from  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH,TenMH
GO
--CÂU 9
SELECT MH.MaMH, TenMH  , COUNT(KQ.MaSV) AS [Số sinh viên đang học]
FROM  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, TenMH 
GO
--CÂU 10
SELECT  TOP(1) WITH TIES  TenMH, Sotiet, TenSV, Diem
FROM  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
ORDER BY Diem DESC
GO
--CÂU 11
SELECT  TOP(1) WITH TIES KH.MaKH, KH.TenKH , COUNT(SV.MaKH) as [Tổng sinh viên]
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
GROUP BY KH.MaKH, KH.TenKH ORDER BY 3 DESC
GO
--CÂU 12
SELECT  TOP(1) WITH TIES  KH.TenKH ,sv.TenSV, HocBong
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
ORDER BY 3 DESC
GO

--CÂU 13
SELECT  TOP(1) WITH TIES  SV.MaSV ,SV.HoSV +' ' + SV.TenSV AS [Họ và tên],TenKH, HocBong
FROM Khoa KH 
INNER JOIN SinhVien SV ON KH.MaKH = SV.MaKH
WHERE KH.MaKH ='TH'
ORDER BY HocBong DESC
GO
--CÂU 14
SELECT  TOP(1) WITH TIES   HoSV + ' ' + TenSV as [Họ và tên], TenMH, Diem
FROM  MonHoc MH
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
INNER JOIN SinhVien SV ON KQ.MaSV = SV.MaSV
WHERE TenMH = N'Cơ Sở Dữ Liệu'
ORDER BY Diem DESC
GO
--CÂU 15
SELECT  TOP(3) HoSV + ' ' + TenSV as [Họ và tên], TenKH, TenMH, Diem
FROM   SinhVien SV 
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
WHERE MH.MaMH = '04'
ORDER BY Diem
GO
--CÂU 16
SELECT  TOP(1) WITH TIES KH. MaKH, TenKH 
FROM   SinhVien SV 
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
WHERE Phai =1
GROUP BY KH.MaKH,TenKH
ORDER BY COUNT(Phai)
GO
--CÂU 17
SELECT KH. MaKH, TenKH ,COUNT(SV.MaSV) as [Tổng số sinh viên] ,COUNT(CASE WHEN Phai = 1 THEN 1 END) as [Tổng số sinh viên nữ]
FROM   SinhVien SV  
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
GROUP BY KH.MaKH,TenKH
GO
--CÂU 18
SELECT  HoSV + ' ' + TenSV as [Họ và tên], TenKH, CASE WHEN MIN(Diem) >=4 THEN N'Đậu' ELSE N'Trượt' END as [Kết quả]
FROM   SinhVien SV  
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY HoSV,TenSV,TenKH
GO
--CÂU 19
SELECT  HoSV + ' ' + TenSV as [Họ và tên], TenKH,Phai
FROM   SinhVien SV  
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY HoSV,TenSV,TenKH,Phai
HAVING MIN(Diem) >=4
GO
--CÂU 20
SELECT MH.MaMH, MH.TenMH
FROM   MonHoc MH  
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, MH.TenMH
HAVING MIN(Diem) >=4
GO
--CÂU 21
SELECT KH.MaKH, TenKH
FROM Khoa KH
INNER JOIN SinhVien SV ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY KH.MaKH, TenKH
HAVING MIN(Diem) >=5
GO
--CÂU 22
SELECT MH.MaMH, TenMH, COUNT(CASE WHEN KQ.DIEM >=5 THEN 1 END) as N'Số sinh viên đậu',COUNT(CASE WHEN KQ.DIEM <5 THEN 1 END) as N'Số sinh viên rớt'
FROM MonHoc MH 
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
INNER JOIN SinhVien SV ON KQ.MaSV =SV.MaSV
GROUP BY MH.MaMH, TenMH
GO
--CÂU 23
SELECT MH.MaMH, TenMH
FROM MonHoc MH 
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
INNER JOIN SinhVien SV ON KQ.MaSV =SV.MaSV
GROUP BY MH.MaMH, TenMH
HAVING MIN(Diem) >=5
GO
--CÂU 24
SELECT SV.MASV, HoSV + ' ' + TenSV as [Họ và tên], KH.MaKH
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY SV.MASV, HoSV , TenSV,KH.MaKH
HAVING MIN(Diem) >=5
GO
--CÂU 25
SELECT SV.MASV, HoSV, TenSV, KH.MaKH
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY SV.MASV, HoSV , TenSV,KH.MaKH
HAVING COUNT(CASE WHEN KQ.DIEM <5 THEN 1 END) >2
GO
--CÂU 26
SELECT KH.MaKH,TenKH, COUNT(sv.MaSV) AS [Tổng số sinh viên của khoa]
FROM Khoa KH
INNER JOIN SinhVien SV ON KH.MaKH =SV.MaKH
GROUP BY KH.MaKH,TenKH
GO
--CÂU 27
SELECT SV.MASV, HoSV + ' ' + TenSV as [Họ và tên], COUNT(KQ.MaMH) AS [Số môn thi]
FROM SinhVien SV
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY SV.MASV, HoSV , TenSV
GO
--CÂU 28
SELECT KH.MaKH,TenKH, COUNT(CASE WHEN Phai=0 THEN 1 END) AS [Tổng số sinh viên nam]
FROM Khoa KH
INNER JOIN SinhVien SV ON KH.MaKH =SV.MaKH
GROUP BY KH.MaKH,TenKH
GO
--CÂU 29
SELECT HoSV + ' ' + TenSV as [Họ và tên], KH.TenKH, Phai, AVG(Diem) AS [Diểm trung bình các môn]
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
GROUP BY HoSV,TenSV , KH.TenKH, Phai
HAVING AVG(Diem) >= 4
--CÂU 30
SELECT MH.MaMH, TenMH, AVG(Diem)
FROM MonHoc MH 
INNER JOIN Ketqua KQ ON KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, TenMH
HAVING AVG(Diem) >=6
GO
------------------------PHẦN IV ------------------------
--CÂU 1
DECLARE @MAKHOA nvarchar(2)
SET @MAKHOA = N'TH'
SELECT SV.MaSV, HoSV + ' ' + TenSV as [Họ và tên],  Phai, TenKH
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MaKH =SV.MaKH
WHERE KH.MaKH = @MAKHOA
GO
--CÂU 2
DECLARE @DIEM FLOAT
SET @DIEM = 6
SELECT SV.MASV, HoSV + ' ' + TenSV as [Họ và tên], TenMH, Diem
FROM SinhVien SV
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
WHERE Diem > @DIEM
GO
--CÂU 3
DECLARE @TENMON NVARCHAR(100)
SET @TENMON = N'ĐỒ HỌA'
SELECT SV.MaSV, TenKH, TenMH, Diem
FROM SinhVien SV
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
INNER JOIN Khoa KH ON KH.MaKH = SV.MaKH
WHERE TenMH LIKE ('%'+ @TENMON+'%')
GO
------------------------PHẦN V ------------------------
--CÂU 1
SELECT MaSV, MAKH, Phai FROM SinhVien WHERE MaSV NOT IN (SELECT DISTINCT MASV FROM Ketqua)
GO
--CÂU 2
SELECT MaSV,HoSV + ' ' + TenSV as [Họ và tên], MAKH FROM SinhVien WHERE MaSV NOT IN (SELECT DISTINCT MASV FROM Ketqua WHERE MaMH IN (SELECT DISTINCT MaMH FROM MonHoc WHERE TenMH = N'cơ sở dữ liệu'))
GO
--CÂU 3
SELECT MAMH, TENMH, SOTIET FROM MonHoc WHERE MaMH NOT IN (SELECT DISTINCT MAMH FROM Ketqua)
GO
--CÂU 4
SELECT  MaKH, TenKH FROM Khoa WHERE MaKH NOT IN (SELECT DISTINCT MAKH FROM SinhVien) 
GO
--CÂU 5
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh 
	FROM SinhVien 
	WHERE MaKH IN (SELECT  DISTINCT MAKH FROM Khoa WHERE TenKH =N'Anh Văn') 
		AND MaSV NOT IN (SELECT  DISTINCT MaSV FROM Ketqua WHERE MaMH IN (SELECT DISTINCT MaMH FROM MonHoc WHERE TenMH = N'cơ sở dữ liệu'))
GO
--CÂU 6
SELECT MaMH, TenMH, Sotiet FROM MonHoc WHERE MaMH NOT IN (SELECT MAMH  FROM Ketqua WHERE MASV IN (SELECT MASV FROM SinhVien WHERE MAKH IN (SELECT MAKH FROM Khoa WHERE TenKH =N'LÝ')))
GO
--CÂU 7
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh FROM [dbo].[SinhVien] 
	WHERE MaSV IN (SELECT MaSV FROM Ketqua WHERE Diem  <(SELECT MIN(DIEM) FROM Ketqua WHERE MaSV IN ( SELECT MASV FROM SinhVien WHERE MAKH IN (SELECT MAKH FROM Khoa WHERE TenKH =N'Tin học'))
															AND MaMH IN (SELECT MAMH FROM MonHoc WHERE TenMH = N'Đồ họa ứng dụng'))
												AND MaMH IN (SELECT MAMH FROM MonHoc WHERE TenMH = N'Đồ họa ứng dụng'))
GO
--CÂU 8
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh,(YEAR(GETDATE()) -YEAR(NgaySinh)) AS [Tuổi] FROM [dbo].[SinhVien] 
		WHERE MaKH IN (SELECT  DISTINCT MAKH FROM Khoa WHERE TenKH =N'Anh Văn') 
			 ORDER BY [Tuổi]
GO
--CÂU 9
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh 
	FROM SinhVien WHERE HocBong >(SELECT SUM(HocBong) FROM [dbo].[SinhVien] WHERE MAKH IN (SELECT MAKH FROM Khoa WHERE TenKH = N'TRIẾT'))
GO
--CÂU 10
SELECT MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh 
	FROM SinhVien WHERE NoiSinh  IN (SELECT TOP 1 NoiSinh FROM [dbo].[SinhVien] WHERE MAKH IN (SELECT MAKH FROM Khoa WHERE TenKH = N'LÝ') ORDER BY HocBong DESC)
GO
--CÂU 11
SELECT SV.MASV, HoSV + ' ' + TenSV as [Họ và tên], A.TenMH, A.Diem
FROM SinhVien SV
INNER JOIN Ketqua KQ ON KQ.MaSV = SV.MaSV
INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
INNER JOIN (SELECT
				MH.MAMH,TenMH, MAX(Diem) AS DIEM
			FROM Ketqua KQ 
			INNER JOIN MonHoc MH ON KQ.MaMH = MH.MaMH
			GROUP BY MH.MAMH,TenMH) A ON A.MAMH = KQ.MaMH AND A.DIEM = KQ.DIEM
GO

--CÂU 12
SELECT MaSV, KH.TenKH, A.HocBong
	FROM SinhVien SV
	INNER JOIN (SELECT MaKH, MAX(HocBong) AS HocBong FROM SinhVien GROUP BY MaKH) AS A ON A.MaKH = SV.MaKH AND A.HocBong = SV.HocBong
	INNER JOIN Khoa KH ON KH.MaKH = SV.MaKH
GO
------------------------PHẦN VI ------------------------
--CÂU 1
INSERT INTO [dbo].[SinhVien]
(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
VALUES
('C01',N'Lê Thành', N'Nguyên',0,'19801020','Thành phố Hồ Chí Minh','TH',850000)
GO
--CÂU 2
INSERT INTO [dbo].[MonHoc]
(MaMH, TenMH, Sotiet)
VALUES
('06',N'Xử lý ảnh',45)
GO
--CÂU 3
INSERT INTO [dbo].[Khoa]
(MaKH, TenKH)
VALUES
('CT',N'Công trình')
GO
--CÂU 4
INSERT INTO [dbo].[SinhVien]
(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong)
VALUES
('C02',N'Nguyễn Trần', N'Quân',0,GETDATE(),'Huế','CT',950000)
GO
--CÂU 5
INSERT INTO [dbo].[Ketqua]
(MaSV, MaMH, Diem)
SELECT MASV,'06',7 FROM SinhVien WHERE MAKH IN (SELECT MAKH FROM Khoa WHERE TenKH = N'Tin học')
--CÂU 6
INSERT INTO [dbo].[Ketqua]
(MaSV, MaMH, Diem)
SELECT 'CO2', MaMH, 8 FROM MonHoc

------------------------PHẦN VII ------------------------
--CÂU 1
--C1
CREATE TABLE DELETETABLE
(
	[MaSV] [nvarchar](3) NOT NULL,
	[HoTenSV] [nvarchar](23) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[HocBong] [float] NULL,
	CONSTRAINT [Prk_DELETETABLE_MaSV] PRIMARY KEY (MaSV)
)
INSERT INTO DELETETABLE
SELECT MaSV, HoSV+' '+ TenSV, Phai, NgaySinh, NoiSinh, TenKH, HocBong 
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MAKH = SV.MAKH
--C2
SELECT MaSV, HoSV+' '+ TenSV AS HOVATEN, Phai, NgaySinh, NoiSinh, TenKH, HocBong 
INTO #DELETETABLE
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MAKH = SV.MAKH

--C3
DECLARE @DELETETABLE TABLE
(
	[MaSV] [nvarchar](3) NOT NULL,
	[HoTenSV] [nvarchar](23) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [smalldatetime] NOT NULL,
	[NoiSinh] [nvarchar](100) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[HocBong] [float] NULL,
	CONSTRAINT [Prk_DELETETABLE_MaSV] PRIMARY KEY (MaSV)
)

INSERT INTO @DELETETABLE
SELECT MaSV, HoSV+' '+ TenSV, Phai, NgaySinh, NoiSinh, TenKH, HocBong 
FROM SinhVien SV
INNER JOIN Khoa KH ON KH.MAKH = SV.MAKH
GO
--CÂU 2
DELETE DELETETABLE WHERE HocBong IS NULL OR HocBong = 0
GO
--CÂU 3
DELETE DELETETABLE WHERE NgaySinh ='19871220'
GO
--CÂU 4
DELETE DELETETABLE WHERE YEAR(NgaySinh) < 1987 AND MONTH(NgaySinh) <3
GO
--CÂU 5
DELETE DELETETABLE WHERE Phai =0  AND TenKH = N'Tin học'
GO
------------------------PHẦN VIII ------------------------
--CÂU 1
UPDATE MonHoc SET Sotiet =45 WHERE TenMH = N'Văn'
GO
--CÂU 2
UPDATE SinhVien SET HoSV = N'Trần Thanh',TenSV =N'Kỳ' WHERE TenSV = N'Mai' AND HoSV = N'Trần Thanh'
GO
--CÂU 3
UPDATE SinhVien SET Phai = 0 WHERE TenSV = N'Kỳ' AND HoSV = N'Trần Thanh'
GO
--CÂU 4
UPDATE SinhVien SET NgaySinh = '19900705' WHERE TenSV = N'Thủy' AND HoSV = N'Trần Thị Thu'
GO
--CÂU 5
UPDATE SinhVien SET HocBong += 100000 WHERE MaKH IN (SELECT MAKH FROM Khoa WHERE TenKH = N'Anh Văn')
GO
--CÂU 6
UPDATE Ketqua SET Diem = IIF(Diem+5<=10,Diem+5,10)
WHERE MaSV IN (SELECT MaSV FROM SinhVien WHERE MaKH IN (SELECT MAKH FROM Khoa WHERE TenKH = N'Anh Văn'))
		AND MaMH IN (SELECT MaMH FROM MonHoc WHERE TenMH =N'Trí Tuệ Nhân Tạo')
GO
--CÂU 7
UPDATE SinhVien SET HocBong = IIF(TenKH =N'Anh Văn',HocBong+100000,IIF(TenKH =N'Tin học',HocBong+150000,50000))
FROM SinhVien SV
INNER JOIN Khoa KH ON SV.MAKH = KH.MAKH
--CÂU 8

UPDATE Ketqua SET Diem = IIF(TenKH = N'Anh Văn', IIF(Diem+2<=10,Diem+2,10),IIF(TenKH = N'Tin Học', IIF(Diem-1>0,Diem-1,0),Diem))
FROM SinhVien SV
INNER JOIN Khoa KH ON SV.MAKH = KH.MAKH

