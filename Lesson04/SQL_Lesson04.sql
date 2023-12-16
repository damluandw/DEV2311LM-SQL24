-- Lesson04 - Truy vấn dữ liệu (SELECT - TSQL)
use master
go
CREATE DATABASE DEV2311LM_SQL24_04
GO
USE DEV2311LM_SQL24_04;
GO
-- Truy vấn dữ liệu từ 1 hay nhiều bảng với các điều kiện, lọc, ...
-- syntax:
/*
-- Syntax for SQL Server and Azure SQL Database  
 
<SELECT statement> ::=    
    [ WITH { [ XMLNAMESPACES ,] [ <common_table_expression> [,...n] ] } ]  
    <query_expression>  
    [ ORDER BY <order_by_expression> ]
    [ <FOR Clause>]  
    [ OPTION ( <query_hint> [ ,...n ] ) ]  
<query_expression> ::=  
    { <query_specification> | ( <query_expression> ) }  
    [  { UNION [ ALL ] | EXCEPT | INTERSECT }  
        <query_specification> | ( <query_expression> ) [...n ] ]  
<query_specification> ::=  
SELECT [ ALL | DISTINCT ]  
    [TOP ( expression ) [PERCENT] [ WITH TIES ] ]  
    < select_list >  
    [ INTO new_table ]  
    [ FROM { <table_source> } [ ,...n ] ]  
    [ WHERE <search_condition> ]  
    [ <GROUP BY> ]  
    [ HAVING < search_condition > ]
*/
-- 1. Truy vấn với select đơn giản (không có from)
SELECT 'Devmaster Academy'
GO
-- 2. Đặt tên cột cho dữ liệu trong tập kết quả
SELECT 'Devmaster Academy' as [Company]
GO
SELECT 'Devmaster Academy' as 'Company'
GO
SELECT 'Devmaster Academy' [Company Name]
GO
SELECT 'Company'= 'Devmaster Academy'
GO
--3. Truy vấn dữ liệu từ một bảng sử dụng dấu *
-- Liệt kê tất cả các dữ liệu trong bảng khoa
-- (*)
SELECT *
FROM KHOA
GO
-- 4. Lựa chọn các cột trong tập kết quả
SELECT MaKH, TenKH
FROM KHOA
GO
-- liệt kê các thông tin masv, hosv, tensv, ngaysinh
SELECT MASV, HOSV, TENSV, NGAYSINH
FROM SINHVIEN
GO
-- 5. Sử dụng biểu thức trong select
-- liệt kê các thông tin masv, hoten, ngaysinh, trong đó cột hoten được gộp từ hosv, tensv
SELECT MASV, HOSV + ' ' + TENSV as [Họ tên], NGAYSINH
FROM SINHVIEN
GO
-- Liệt kê các thông tin diểm thi của sinh viên, thêm cột điểm tăng 10%

SELECT * , [DIEM TANG] = DIEM*110/100
FROM KETQUA
GO
-- 6. Sử dụng mệnh đề where để giới hạn dữ liệu trong tập kết quả (lọc, tìm kiếm)
-- WHERE <Biểu thức điều kiện>
/*
    - Điều kiện sử dụng các phép toán so sánh
        (>; >=; <; <=; =; <>; !=) => thường dùng với cột dữ liệu kiểu số
    - Điều kiện sử dụng phép toán tương đối (áp dụng với dữ liệu kiểu chuỗi)
        + Like / Not Like:
            +++ các ký đại diện:
                ++: dấu %  đại diện cho chuỗi ký tự bất kỳ có thể rỗng
                ++: dấu _ đại diện cho 1 ký tự bất kỳ
                ++: [a-m]: khoảng ký tự từ a đến m

    - Sử dụng toán tử quan hệ (and,or, not ) trong biểu thức điều kiện
    - Điều kiện so sánh tập hợp: IN / NOT IN
*/
/*
    SELECT
    FROM
    WHERE
*/
-- Liệt kê sinh viên có học bổng lớn hơn hoặc bằng 100000
SELECT  *
FROM SINHVIEN
WHERE HOCBONG >=100000
GO
-- Liệt kê sinh viên có học bổng trong khoảng 10.000 đến 100.000
SELECT  *
FROM SINHVIEN
WHERE HOCBONG >=10000 and hocbong<=100000
GO
--
SELECT  *
FROM SINHVIEN
WHERE HOCBONG between 10000 and 100000
GO
--- so sánh tương đối (LIKE / NOT LIKE)
-- Liệt kê sinh viên có tên bắt đầu bằng 'T'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'T%'
GO
-- Liệt kê sinh viên có tên chứa ký tự 'u'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'%u%'
GO
-- Liệt ke sinh viên có tên mà ký tự thứ 2 là 'u'
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'_u%'
GO
-- Liệt kê sinh viên có tên chứa 3 ký tự
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'___'
GO
--
SELECT  *
FROM SINHVIEN
WHERE len(TENSV)=3
GO
-- Liệt kê sinh viên có tên có chứa ký tự đầu tiên trong khoảng a-m
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'[a-m]%'
GO
-- ko
SELECT  *
FROM SINHVIEN
WHERE TENSV not LIKE N'[a-m]%'
GO
--
SELECT  *
FROM SINHVIEN
WHERE TENSV LIKE N'[^a-m]%'
GO

-- sử dụng tập hợp
-- Liệt kê sinh viên có tháng sinh là tháng 2 và tháng 8
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) = 2 OR MONTH(NGAYSINH) =8
GO
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) IN (2,8)
GO
-- not in
SELECT  MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
WHERE MONTH(NGAYSINH) NOT IN (2,8)
GO
--==================================================
--7. Sắp xếp dữ liệu trong tập kết quả
-- sắp tăng: ORDER BY <Column_Name> | <index> | <alise name>  ASC (Mặc định)
-- Sắp giảm: ORDER BY DESC
-- Liệt kế sinh viên, dữ liệu sắp theo tên sinh viên tăng dần
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV ASC
--
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY 3 ASC
--
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY [Tên sinh viên] ASC
-- DESC
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV DESC
---
--- LIỆT KÊ SINH VIÊN, DỮ LIỆU SẮP THEO TÊN TĂNG DẦN, NẾU TRÙNG THÌ SẮP THEO HOSV GIẢM DẦN
SELECT MaSV, HoSV as [Họ sinh viên] , TenSV as [Tên sinh viên]
FROM SINHVIEN
ORDER BY TenSV ASC, HOSV DESC
GO
-- LUYỆN TẬP:
/*
15. Cho biết các sinh viên sinh sau ngày 20/12/1977, gồm các thông tin: Họ tên sinh
viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự
ngày sinh giảm dần.
*/
 SELECT   HoSV, TenSV,  CONVERT(VARCHAR(10),NgaySinh,103) as 'Ngày sinh', NoiSinh, HocBong
 FROM SINHVIEN
 WHERE NgaySinh > '1988/12/20'
 ORDER BY NgaySinh DESC
 --
 set dateformat dmy
 go
 SELECT   HoSV, TenSV,  CONVERT(VARCHAR(10),NgaySinh,103) as 'Ngày sinh', NoiSinh, HocBong
 FROM SINHVIEN
 WHERE NgaySinh > '20/12/1988'
 ORDER BY NgaySinh DESC

--==================================================
--7. sử dụng từ khóa TOP trong select
-- TOP: trích ra số bản ghi đầu tiên trong tập kết quả
SELECT *
FROM SINHVIEN
GO
SELECT TOP 1 *
FROM SINHVIEN
GO
SELECT TOP 5 *
FROM SINHVIEN
GO
-- TOP 50%
SELECT TOP 50 PERCENT *
FROM SINHVIEN
GO
-- LẤY RA SINH VIÊN CÓ HỌC BỔNG CAO NHẤT
SELECT TOP 1 *
FROM SINHVIEN
ORDER BY HOCBONG DESC
GO
-- LẤY RA NHỮNG SINH VIÊN CÓ HỌC BỔNG CAO NHẤT
SELECT TOP 1 WITH TIES *
FROM SINHVIEN
ORDER BY HOCBONG DESC
GO
--==================================================
--8. sử dụng từ khóa DISTINCT trong select
-- distinct: loại bỏ dòng trùng lặp (giữ lại 1)

SELECT *
FROM SINHVIEN
GO -- các bản ghi là duy nhất (PK)

SELECT makh
FROM SINHVIEN
GO -- lặp -> 15 bản ghi

SELECT distinct makh
FROM SINHVIEN
GO
--==================================================
--9. case ... when ... then trong select
--: Liệt kê sinh viên, trong phai hiển thị là: 1 ~ Nam ; 0 ~ Nữ; null ~ Khác
SELECT   MaSV, HoSV, TenSV, Phai = CASE Phai
                                        WHEN 1 THEN N'Nam'
                                        WHEN 0 THEN N'Nữ'
                                        ELSE N'Khác'
                                    END
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
SELECT   MaSV, HoSV, TenSV, Phai = CASE
                                        WHEN Phai=1 THEN N'Nam'
                                        WHEN Phai=0 THEN N'Nữ'
                                        ELSE N'Khác'
                                    END
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
---
--==================================================
--10. sử dụng hàm IIF => IIF( boolean_expression, true_value, false_value )
SELECT   MaSV, HoSV, TenSV, [Phái] = IIF(Phai=1,N'Nam',IIF(Phai=0,N'Nữ',N'Khác'))
     ,NgaySinh, NoiSinh, MaKH, HocBong, DiemTrungBinh
FROM SINHVIEN
GO
--==================================================
--11. Truy vấn kết hợp 2 hay nhiều bảng (JOIN)
/*
    INNER JOIN
    LEFT JOIN / LEFT OUTER JOIN
    RIGHT JOIN / RIGHT OUTER JOIN
    FULL JOIN / FULL OUTER JOIN
*/
-- INNER JOIN:
SELECT  *
FROM KHOA AS K
    JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
SELECT  *
FROM KHOA AS K, SINHVIEN AS S
WHERE K.MAKH = S.MAKH
GO -- SO SÁNH
-- LEFT JOIN / LEFT OUTER JOIN

SELECT  *
FROM KHOA AS K
    LEFT JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
-- RIGHT JOIN
SELECT  *
FROM KHOA AS K
    RIGHT JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO
-- FULL NOIN
SELECT  *
FROM KHOA AS K
    FULL JOIN SINHVIEN S ON K.MAKH = S.MAKH
GO

-- LIỆT KÊ CÁC THÔNG : MAKH, TENKH, HOTEN, NGAYSINH, PHAI, HOCBONG
SELECT MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO--Ambiguous column name 'MAKH'.
SELECT KHOA.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO--The multi-part identifier "KHOA.MAKH" could not be bound.
SELECT K.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO
SELECT S.MAKH, TENKH, HOTEN=HOSV + ' ' + TENSV, NGAYSINH, PHAI, HOCBONG
FROM KHOA as K
    JOIN SINHVIEN as S ON K.MAKH=S.MAKH
GO

-- Liệt kê các thông tin: MAKH, TENKH, MASV, HOSV, TENSV, PHAI, DIEM
-- KHOA, SINHVIEN, KETQUA
SELECT K.MAKH, S.MASV, TENKH, HOSV, TENSV, PHAI, DIEM
FROM KHOA AS K
    JOIN SINHVIEN AS S ON K.MAKH=S.MAKH
    JOIN KETQUA AS Q ON S.MASV = Q.MASV
GO
---DESIGNER
SELECT   Khoa.MaKH, Khoa.TenKH, SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai, Ketqua.Diem
FROM         Khoa INNER JOIN
                         SinhVien ON Khoa.MaKH = SinhVien.MaKH INNER JOIN
                         Ketqua ON SinhVien.MaSV = Ketqua.MaSV

GO
SELECT   Khoa.MaKH AS [Mã khoa], Khoa.TenKH AS [Tên khoa], SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai
FROM         Khoa LEFT OUTER JOIN
                         SinhVien ON Khoa.MaKH = SinhVien.MaKH
go
SELECT   Khoa.MaKH, Khoa.TenKH, SinhVien.MaSV, SinhVien.HoSV, SinhVien.TenSV, SinhVien.Phai, SinhVien.NgaySinh, SinhVien.NoiSinh, SinhVien.HocBong, SinhVien.DiemTrungBinh,
                         Ketqua.Diem, MonHoc.MaMH, MonHoc.TenMH, MonHoc.Sotiet
FROM         Ketqua INNER JOIN
                         MonHoc ON Ketqua.MaMH = MonHoc.MaMH INNER JOIN
                         SinhVien ON Ketqua.MaSV = SinhVien.MaSV INNER JOIN
                         Khoa ON SinhVien.MaKH = Khoa.MaKH
--- Luyện tập với lab04.
-- Nghiên cứu truy vấn gộp nhóm / điều kiện gộp nhóm
-- truy vấn con
-- truy vấn tham chiếu