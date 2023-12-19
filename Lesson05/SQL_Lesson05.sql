-- Lesson05 - Truy vấn dữ liệu (SELECT - TSQL) - nâng cao
use master
go
CREATE DATABASE DEV2311LM_SQL24_04
GO
USE DEV2311LM_SQL24_04;
GO

--- Luyện tập với lab04.
-- Nghiên cứu truy vấn gộp nhóm / điều kiện gộp nhóm
-- truy vấn con
-- truy vấn tham chiếu
---------------------- LESSON05
--12. Truy vấn gộp nhóm
-- GROUP BY <Ds cột không nằm trong biểu thức thống kê>
SELECT * FROM SINHVIEN  order by makh
GO
-- thực hiện tính toán, gộp các nhóm theo tiêu chí nào đó, thông thường có sử dụng các hàm thống kê
-- SUM, COUNT, MAX, MIN, AVG
-- Liệt kê các thông tin: makh, tong hoc bong cua tung khoa
-- sinhvien
SELECT MAKH, ISNULl(SUM(hocbong),0) as [Tổng học bổng]
FROM SINHVIEN
GROUP BY MaKH
GO
-- tính tổng học bổng theo từng khoa, thông tin gồm có: makh, tenkh, tổng học bổng
SELECT K.MAKH, TenKH, ISNULl(SUM(hocbong),0) as [Tổng học bổng]
FROM SINHVIEN as S
    RIGHT JOIN KHOA as K On s.MaKH = k.MaKH
GROUP BY K.MaKH, TenKH
GO
-- Tính điểm trung bình của từng sinh viên, thông tin gồm: MaSV, hosv, tensv, phai, diemtb
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    LEFT JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
GO
-- Thống kê điểm thi cao nhất theo từng môn học, thông tin gồm: MaMH, TenMH, Sotiet, Diem cao nhất
-- MAX,
-- Min - thấp nhất
SELECT M.MaMH, TENMH, SOTIET, MAX(DIEM) as MAXDIEM , MIN(DIEM) as MINDIEM
FROM MONHOC AS M
    FULL JOIN KETQUA AS K ON M.MaMH = K.MaMH
GROUP BY M.MaMH, TENMH, SOTIET
GO
-- 13. Truy vấn gộp nhóm có điều kiện
-- having: là biểu điều kiện có chứa hàm thống kê
-- Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5)
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
HAVING AVG(DIEM)>=5
GO
-- Thống kê những sinh viên có điểm trung bình >=5 (avg(diem)>=5) và không có môn nào dưới 5
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
HAVING AVG(DIEM)>=5 AND MIN(DIEM) >=5
GO
-- Thống kê những sinh viên có điểm trung bình <5
SELECT S.MASV, HOSV, TENSV, PHAI, ROUND(ISNULL(AVG(DIEM),0),2) as [Điểm TB]
FROM SINHVIEN AS S
    LEFT JOIN KETQUA AS K ON S.MaSV = K.MaSV
GROUP BY S.MASV, HOSV, TENSV, PHAI
--HAVING ISNULL(AVG(DIEM),0)<5
HAVING AVG(DIEM)<5 Or AVG(DIEM) is Null
GO
-- 14. Truy vấn con
-- là loại truy vấn có chứa một câu lệnh truy vấn khác (đặt trong: select, from, where , having, )
-- Liệt kê các khoa chưa có sinh viên học
SELECT *
FROM KHOA
WHERE MAKH NOT IN (SELECT DISTINCT MAKH FROM SINHVIEN WHERE MAKH IS NOT NULL)
GO
-- Liệt kê các sinh viên chưa thi môn Trí tuệ nhân tạo
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA WHERE MAMH = '02')
go
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA AS K, MONHOC AS M WHERE k.mamh=m.mamh and TenMH = N'Trí tuệ nhân tạo')
GO
--
SELECT *
FROM SINHVIEN AS S
WHERE S.MaSV NOT IN (SELECT MASV FROM KETQUA AS K, MONHOC AS M WHERE k.mamh=m.mamh and TenMH LIKE N'%Trí tuệ nhân tạo%')
GO
-- =================================
--15. Truy vấn tham chiếu
-- Câu lệnh truy vấn con, có điều kiện tham chiếu đến truy vấn cha
-- Liệt kê thông tin: makh, tenkh, tongsv, tongnam, tongnu
SELECT MakH, TenKH, TongNam = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH)
    ,TongNam = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH and Phai = 1)
    ,TongNu = (Select Count(MaSV) from SinhVien where MaKH = K.MaKH and Phai = 0)
FROM KHOA as K
-- Cách khác
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
--16. Truy vấn tạo bảng (Make table query)
-- into: sử dụng trong truy vấn
SELECT *
INTO SINHVIEN_temp
FROM SINHVIEN
GO
-- bảng tạm
-- #table
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
INTO #THONGKEKHOA
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
SELECT * FROM #THONGKEKHOA
-- ##table
SELECT k.MAKH, TENKH, TONGSV = COUNT(MASV), SUM(IIF(PHAI=1,1,0)) as TONGNAM,SUM(IIF(PHAI=1,0,1)) as TONGNu
INTO ##THONGKEKHOA
FROM KHOA as K
    LEFT JOIN SINHVIEN as S On K.MAKH = S.MAKH
GROUP BY k.MAKH, TENKH
GO
SELECT * FROM ##THONGKEKHOA
GO

--- THAM SỐ
DECLARE @name nvarchar(100)
SET @name = 'AV'
SELECT * From KHOA where MaKH = @name
GO

--Thống kê số sinh viên học của từng môn, thông tin có: Mã môn, Tên môn, Số
--sinh viên đang học