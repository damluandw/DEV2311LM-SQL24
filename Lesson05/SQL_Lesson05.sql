select * from khoa where makh not in (select DISTINCT makh from SinhVien)

--- truy vấn tham chiếu
-- câu lệnh truy vấn con có điều kiện tham chiếu đến truy vấn cha
--liệt kê thông tin: makh, tenkh, tongsv, tongnam, tongnu
select k.makh,tenkh, tongsv = (select count (masv) from SinhVien where MaKH = k.makh)
	, tongnam = (select count (masv) from SinhVien where MaKH = k.makh and Phai =0)
	, tongnu = (select count (masv) from SinhVien where MaKH = k.makh and Phai =1)
from khoa k

select k.makh,tenkh, tongsv = COUNT(S.masv) 
	, tongnam = COUNT(CASE WHEN Phai =0 THEN 1 END)
	, tongnu = COUNT(CASE WHEN Phai =1 THEN 1 END)
from khoa k
full join SinhVien S ON K.MaKH = S.MAKH
GROUP BY k.makh,tenkh

select k.makh,tenkh, tongsv = COUNT(S.masv) 
	, tongnam = SUM(IIF(phai =0 , 1, 0))
	, tongnu =  SUM(IIF(phai =1 , 1, 0))
from khoa k
full join SinhVien S ON K.MaKH = S.MAKH
GROUP BY k.makh,tenkh


--- truy vấn tạo bảng

select * into tmpsinhvien from SinhVien
-- bảng tạm cục bộ
--#table 
select * into #tmpsinhvien from SinhVien
drop table #tmpsinhvien
-- bảng tạm toàn cục
--##table
select * into ##tmpsinhvien from SinhVien
drop table ##tmpsinhvien