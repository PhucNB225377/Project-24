create database BlueMoonDB
go

use BlueMoonDB
go

--tạo bảng tài khoản truy cập
create table Account
(
	username nvarchar(50) primary key,
	password nvarchar(50) not null
)
go

--tạo bảng căn hộ
create table CanHo
(
	diachi nvarchar(50) primary key, --địa chỉ(3-22: căn hộ số 3 tầng 22)
	dientich float not null, --diện tích
)
go

--tạo bảng chủ sở hữu
create table ChuSoHuu
(
	id int identity primary key,
	ten nvarchar(100) not null,
	diachi nvarchar(50) not null,

	foreign key (diachi) references CanHo(diachi)
)
go

--tạo bảng hộ gia đình
create table HoGiaDinh
(
	hogiadinh_id int identity primary key,
	id int not null,
	ten nvarchar(50) not null,
	ngaysinh date not null,
	gioitinh nvarchar(20) not null,
	quequan nvarchar(50) not null,
	dantoc nvarchar(20) not null, --dân tộc
	tongiao nvarchar(20), --tôn giáo
	nghe nvarchar(50), --nghề nghiệp
	quanhe nvarchar(20) not null, --quan hệ(chủ hộ, vợ, con trai, ...)
	status nvarchar(50) not null, --trạng thái(tạm trú/tạm vắng)

	foreign key (id) references ChuSoHuu(id)
)
go

--tạo bảng các khoản phí
create table KhoanPhi
(
	id int not null,
	thang nvarchar(10) not null, --tháng bao nhiêu(vd: 12/2024)
	dichvu int not null, --Phí dịch vụ chung cư: Thu hàng tháng dựa trên diện tích căn hộ, dao động từ 2.500 đến 16.500 đồng/m²/tháng.
	quanly int not null, --Phí quản lý chung cư: Thu hàng tháng, dao động từ 7.000 đồng/m²
	status tinyint not null default 0, --trạng thái(0-chưa thanh toán, 1-đã thanh toán)

	foreign key (id) references ChuSoHuu(id)
)
go

-- tạo bảng các khoản đóng góp không bắt buộc như quỹ từ thiện, quỹ vì người nghèo, quỹ biển đảo, thu theo từng đợt
create table Quy
(
	id int not null,
	loai nvarchar(50) not null, --loại quỹ(vd: quỹ từ thiện, quỹ vì người nghèo,quỹ biển đảo, ...)
	sotien int not null, --số tiền
	dot int not null, --đợt

	foreign key (id) references ChuSoHuu(id)
)
go

--tạo bảng danh sách phí gửi xe
create table DanhSachPhiGuiXe
(
	xe_id int identity primary key,
	loai nvarchar(100) not null, --loại xe(xe máy/ô tô)
	phi int not null, --phí gửi( xe máy: 70.000 đồng/xe/tháng, ô tô: 1.200.000 đồng/xe/tháng)
)
go

--tạo bảng phí gửi xe
create table PhiGuiXe
(
	id int not null,
	thang nvarchar(10) not null, --tháng bao nhiêu(vd: 12/2024)
	xe_id int not null, 
	soluong int not null, --số lượng xe
	status tinyint not null default 0, --trạng thái(0-chưa thanh toán, 1-đã thanh toán)

	foreign key (id) references ChuSoHuu(id),
	foreign key (xe_id) references DanhSachPhiGuiXe
)
go

--tạo bảng phí tiện ích hàng tháng
create table PhiTienIch
(
	id int not null,
	thang nvarchar(10) not null, --tháng bao nhiêu(vd: 12/2024)
	dien int not null, --tiền điện
	nuoc int not null, --tiền nước
	internet int not null, --tiền internet
	status tinyint not null default 0, --trạng thái(0-chưa thanh toán, 1-đã thanh toán)

	foreign key (id) references ChuSoHuu(id)
)
go

--insert bảng CanHo
insert into CanHo (diachi, dientich) values
('1-5', 45),
('2-5', 50),
('3-5', 60),
('4-5', 65),
('5-5', 70),
('6-5', 80),

('1-6', 45),
('2-6', 50),
('3-6', 60),
('4-6', 65),
('5-6', 70),
('6-6', 80),

('1-7', 45),
('2-7', 50),
('3-7', 60),
('4-7', 65),
('5-7', 70),
('6-7', 80),

('1-8', 45),
('2-8', 50),
('3-8', 60),
('4-8', 65),
('5-8', 70),
('6-8', 80),

('1-9', 45),
('2-9', 50),
('3-9', 60),
('4-9', 65),
('5-9', 70),
('6-9', 80),

('1-10', 45),
('2-10', 50),
('3-10', 60),
('4-10', 65),
('5-10', 70),
('6-10', 80),

('1-11', 45),
('2-11', 50),
('3-11', 60),
('4-11', 65),
('5-11', 70),
('6-11', 80),

('1-12', 45),
('2-12', 50),
('3-12', 60),
('4-12', 65),
('5-12', 70),
('6-12', 80),

('1-13', 45),
('2-13', 50),
('3-13', 60),
('4-13', 65),
('5-13', 70),
('6-13', 80),

('1-14', 45),
('2-14', 50),
('3-14', 60),
('4-14', 65),
('5-14', 70),
('6-14', 80),

('1-15', 45),
('2-15', 50),
('3-15', 60),
('4-15', 65),
('5-15', 70),
('6-15', 80),

('1-16', 45),
('2-16', 50),
('3-16', 60),
('4-16', 65),
('5-16', 70),
('6-16', 80),

('1-17', 45),
('2-17', 50),
('3-17', 60),
('4-17', 65),
('5-17', 70),
('6-17', 80),

('1-18', 45),
('2-18', 50),
('3-18', 60),
('4-18', 65),
('5-18', 70),
('6-18', 80),

('1-19', 45),
('2-19', 50),
('3-19', 60),
('4-19', 65),
('5-19', 70),
('6-19', 80),

('1-20', 45),
('2-20', 50),
('3-20', 60),
('4-20', 65),
('5-20', 70),
('6-20', 80),

('1-21', 45),
('2-21', 50),
('3-21', 60),
('4-21', 65),
('5-21', 70),
('6-21', 80),

('1-22', 45),
('2-22', 50),
('3-22', 60),
('4-22', 65),
('5-22', 70),
('6-22', 80),

('1-23', 45),
('2-23', 50),
('3-23', 60),
('4-23', 65),
('5-23', 70),
('6-23', 80),

('1-24', 45),
('2-24', 50),
('3-24', 60),
('4-24', 65),
('5-24', 70),
('6-24', 80),

('1-25', 45),
('2-25', 50),
('3-25', 60),
('4-25', 65),
('5-25', 70),
('6-25', 80),

('1-26', 45),
('2-26', 50),
('3-26', 60),
('4-26', 65),
('5-26', 70),
('6-26', 80),

('1-27', 45),
('2-27', 50),
('3-27', 60),
('4-27', 65),
('5-27', 70),
('6-27', 80),

('1-28', 45),
('2-28', 50),
('3-28', 60),
('4-28', 65),
('5-28', 70),
('6-28', 80),

('1-29', 45),
('2-29', 50),
('3-29', 60),
('4-29', 65),
('5-29', 70),
('6-29', 80),

('1-30', 200),
('2-30', 200);

--insert bảng DanhSachPhiGuiXe
insert into DanhSachPhiGuiXe (loai, phi) values
('Xe máy', 70000),
('Ô tô', 1200000);

--insert bảng ChuSoHuu
insert into ChuSoHuu (ten, diachi) values
(N'Nguyễn Văn An', '5-21'),
(N'Lê Thị Bích', '2-5'),
(N'Trần Văn Cường', '2-11'),
(N'Hoàng Thị Dung', '4-22'),
(N'Phạm Văn Đông', '5-5'),
(N'Đặng Thị Hoa', '6-19'),
(N'Nguyễn Văn Giang', '3-6'),
(N'Lê Thị Hồng', '2-17'),
(N'Trần Văn Khánh', '4-22'),
(N'Hoàng Thị Mai', '4-6'),
(N'Phạm Thị Mai', '1-10'),
(N'Đặng Văn Nam', '3-15'),
(N'Nguyễn Thị Oanh', '3-16'),
(N'Lê Văn Phúc', '2-20'),
(N'Trần Thị Quỳnh', '3-7'),
(N'Hoàng Văn Sơn', '4-9'),
(N'Phạm Thị Thanh', '5-7'),
(N'Đặng Văn Việt', '6-15'),
(N'Nguyễn Thị Xuân', '1-30'),
(N'Lê Văn Yến', '2-8');

--insert bảng HoGiaDinh
insert into HoGiaDinh (id, ten, ngaysinh, gioitinh, quequan, dantoc, tongiao, nghe, quanhe, status) values
(1, N'Nguyễn Văn An', '1980-05-15', N'Nam', N'Hà Nội', N'Kinh', N'Công giáo', N'Kỹ sư', N'Chủ hộ', N'Tạm trú'),
(1, N'Nguyễn Thị Lan', '1985-08-20', N'Nữ', N'Hà Nội', N'Kinh', N'Công giáo', N'Nội trợ', N'Vợ', N'Tạm trú'),
(1, N'Nguyễn Văn Long', '2010-01-10', N'Nam', N'Hà Nội', N'Kinh', NULL, N'Học sinh', N'Con trai', N'Tạm trú'),

(2, N'Lê Thị Bích', '1975-11-12', N'Nữ', N'Hải Phòng', N'Kinh', NULL, N'Giáo viên', N'Chủ hộ', N'Tạm trú'),
(2, N'Lê Văn Dũng', '1970-03-03', N'Nam', N'Hải Phòng', N'Kinh', N'Công giáo', N'Lái xe', N'Chồng', N'Tạm trú'),

(3, N'Trần Văn Cường', '1990-07-08', N'Nam', N'Đà Nẵng', N'Kinh', N'Phật giáo', N'Kinh doanh', N'Chủ hộ', N'Tạm trú'),
(3, N'Trần Thị Hà', '1992-12-24', N'Nữ', N'Đà Nẵng', N'Kinh', N'Phật giáo', N'Nhân viên văn phòng', N'Vợ', N'Tạm trú'),
(3, N'Trần Văn Phúc', '2020-04-18', N'Nam', N'Đà Nẵng', N'Kinh', NULL, N'Trẻ nhỏ', N'Con trai', N'Tạm trú'),

(4, N'Hoàng Thị Dung', '1985-01-25', N'Nữ', N'Hà Nội', N'Kinh', NULL, N'Bác sĩ', N'Chủ hộ', N'Tạm trú'),
(4, N'Hoàng Văn Phong', '1980-09-30', N'Nam', N'Hà Nội', N'Kinh', NULL, N'Công nhân', N'Anh trai', N'Tạm vắng'),

(5, N'Phạm Văn Đông', '1975-06-10', N'Nam', N'Hải Dương', N'Kinh', NULL, N'Nông dân', N'Chủ hộ', N'Tạm trú'),
(5, N'Phạm Thị Hạnh', '1978-10-15', N'Nữ', N'Hải Dương', N'Kinh', N'Phật giáo', N'Nội trợ', N'Vợ', N'Tạm trú'),
(5, N'Phạm Văn Hoàng', '2005-03-27', N'Nam', N'Hải Dương', N'Kinh', NULL, N'Sinh viên', N'Con trai', N'Tạm trú'),

(6, N'Đặng Thị Hoa', '1987-08-10', N'Nữ', N'Hà Nội', N'Kinh', NULL, N'Nhân viên kế toán', N'Chủ hộ', N'Tạm trú'),
(6, N'Đặng Văn Tiến', '1985-04-21', N'Nam', N'Hà Nội', N'Kinh', NULL, N'Lập trình viên', N'Anh trai', N'Tạm trú'),

(7, N'Nguyễn Văn Giang', '1992-02-12', N'Nam', N'Hà Nam', N'Kinh', NULL, N'Kỹ thuật viên', N'Chủ hộ', N'Tạm trú'),
(7, N'Nguyễn Thị Ngọc', '1995-07-19', N'Nữ', N'Hà Nam', N'Kinh', NULL, N'Giáo viên mầm non', N'Em gái', N'Tạm trú'),

(8, N'Lê Thị Hồng', '1980-12-25', N'Nữ', N'Thanh Hóa', N'Kinh', N'Thiên chúa', N'Nông dân', N'Chủ hộ', N'Tạm trú'),
(8, N'Lê Văn Khánh', '1982-01-15', N'Nam', N'Thanh Hóa', N'Kinh', NULL, N'Thợ xây', N'Chồng', N'Tạm trú'),

(9, N'Trần Văn Khánh', '1990-03-10', N'Nam', N'Hải Phòng', N'Kinh', NULL, N'Nhân viên văn phòng', N'Chủ hộ', N'Tạm trú'),
(9, N'Trần Thị Mai', '1995-11-02', N'Nữ', N'Hải Phòng', N'Kinh', NULL, N'Hướng dẫn viên', N'Vợ', N'Tạm trú'),

(10, N'Hoàng Thị Mai', '1988-04-18', N'Nữ', N'Hà Tĩnh', N'Kinh', NULL, N'Nội trợ', N'Chủ hộ', N'Tạm trú'),
(10, N'Hoàng Văn Nam', '1983-02-12', N'Nam', N'Hà Tĩnh', N'Kinh', N'Thiên chúa', N'Lái xe', N'Anh trai', N'Tạm trú'),

(11, N'Phạm Thị Mai', '1980-05-10', N'Nữ', N'Hà Nội', N'Kinh', N'Phật giáo', N'Kinh doanh', N'Chủ hộ', N'Tạm trú'),
(12, N'Đặng Văn Nam', '1975-03-22', N'Nam', N'Hà Nội', N'Kinh', NULL, N'Kinh doanh', N'Chủ hộ', N'Tạm trú'),
(13, N'Nguyễn Thị Oanh', '1985-02-12', N'Nữ', N'Bắc Ninh', N'Kinh', N'Công giáo', N'Giáo viên', N'Chủ hộ', N'Tạm trú'),
(14, N'Lê Văn Phúc', '1978-06-30', N'Nam', N'Hải Phòng', N'Kinh', NULL, N'Kỹ sư', N'Chủ hộ', N'Tạm trú'),
(15, N'Trần Thị Quỳnh', '1990-01-25', N'Nữ', N'Thái Bình', N'Kinh', NULL, N'Bác sĩ', N'Chủ hộ', N'Tạm trú'),
(16, N'Hoàng Văn Sơn', '1980-07-15', N'Nam', N'Nam Định', N'Kinh', NULL, N'Nhà nước', N'Chủ hộ', N'Tạm trú'),
(17, N'Phạm Thị Thanh', '1992-03-10', N'Nữ', N'Vĩnh Phúc', N'Kinh', N'Công giáo', N'Sinh viên', N'Chủ hộ', N'Tạm trú'),
(18, N'Đặng Văn Việt', '1985-09-30', N'Nam', N'Thái Bình', N'Kinh', NULL, N'Tiếp viên hàng không', N'Chủ hộ', N'Tạm trú'),
(19, N'Nguyễn Thị Xuân', '1975-12-12', N'Nữ', N'Quảng Ninh', N'Kinh', NULL, N'Giảng viên', N'Chủ hộ', N'Tạm trú'),
(20, N'Lê Văn Yến', '1987-11-05', N'Nam', N'Hà Nội', N'Kinh', NULL, N'Chuyên viên', N'Chủ hộ', N'Tạm trú');

--insert bảng KhoanPhi
insert into KhoanPhi (id, thang, dichvu, quanly, status) values
(1, N'11/2024', 2500, 7000, 1),
(2, N'11/2024', 3000, 7500, 1),
(3, N'11/2024', 3500, 7000, 1),
(4, N'11/2024', 4000, 7000, 1),
(5, N'11/2024', 4500, 7500, 1),
(6, N'11/2024', 5000, 8000, 1),
(7, N'11/2024', 12500, 10000, 0),
(8, N'11/2024', 13000, 7000, 1),
(9, N'11/2024', 13500, 7000, 0),
(10, N'11/2024', 14000, 9500, 0),
(11, N'11/2024', 14500, 7000, 0),
(12, N'11/2024', 15000, 7000, 1),
(13, N'11/2024', 16500, 7000, 1),
(14, N'11/2024', 11000, 7000, 1),
(15, N'11/2024', 3500, 10500, 1),
(16, N'11/2024', 8000, 7000, 0),
(17, N'11/2024', 9500, 7000, 0),
(18, N'11/2024', 15500, 11000, 1),
(19, N'11/2024', 2500, 7000, 0),
(20, N'11/2024', 6000, 7000, 0),

(1, N'12/2024', 2500, 7000, 0),
(2, N'12/2024', 3000, 7500, 0),
(3, N'12/2024', 3500, 7000, 0),
(4, N'12/2024', 4000, 7000, 1),
(5, N'12/2024', 4500, 7500, 0),
(6, N'12/2024', 5000, 8000, 0),
(7, N'12/2024', 12500, 10000, 0),
(8, N'12/2024', 13000, 7000, 0),
(9, N'12/2024', 13500, 7000, 1),
(10, N'12/2024', 14000, 9500, 0),
(11, N'12/2024', 14500, 7000, 0),
(12, N'12/2024', 15000, 7000, 0),
(13, N'12/2024', 16500, 7000, 1),
(14, N'12/2024', 11000, 7000, 1),
(15, N'12/2024', 3500, 10500, 1),
(16, N'12/2024', 8000, 7000, 0),
(17, N'12/2024', 9500, 7000, 0),
(18, N'12/2024', 15500, 11000, 0),
(19, N'12/2024', 2500, 7000, 1),
(20, N'12/2024', 6000, 7000, 0);

--insert bảng Quy
insert into Quy (id, loai, sotien, dot) values
(1, N'Quỹ từ thiện', 500000, 1),
(2, N'Quỹ vì người nghèo', 300000, 2),
(3, N'Quỹ biển đảo', 400000, 1),
(4, N'Quỹ từ thiện', 450000, 3),
(5, N'Quỹ vì người nghèo', 350000, 2),
(6, N'Quỹ biển đảo', 600000, 1),
(7, N'Quỹ từ thiện', 500000, 1),
(8, N'Quỹ vì người nghèo', 250000, 3),
(9, N'Quỹ biển đảo', 550000, 2),
(10, N'Quỹ từ thiện', 700000, 2),
(11, N'Quỹ vì người nghèo', 400000, 1),
(12, N'Quỹ biển đảo', 450000, 3),
(13, N'Quỹ từ thiện', 350000, 1),
(14, N'Quỹ vì người nghèo', 300000, 2),
(15, N'Quỹ biển đảo', 500000, 3),
(6, N'Quỹ từ thiện', 650000, 2),
(5, N'Quỹ vì người nghèo', 550000, 1),
(8, N'Quỹ biển đảo', 600000, 2),
(9, N'Quỹ từ thiện', 400000, 3),
(2, N'Quỹ vì người nghèo', 700000, 1);

--insert bảng PhiGuiXe
insert into PhiGuiXe (id, thang, xe_id, soluong, status) values
(1, N'11/2024', 1, 1, 1),
(1, N'11/2024', 2, 2, 1),
(3, N'11/2024', 1, 1, 1),
(3, N'11/2024', 2, 1, 1),
(5, N'11/2024', 1, 1, 0),
(6, N'11/2024', 2, 1, 1),
(7, N'11/2024', 1, 2, 0),
(8, N'11/2024', 2, 1, 1),
(9, N'11/2024', 1, 1, 1),
(10, N'11/2024', 2, 1, 1),
(11, N'11/2024', 1, 1, 0),
(11, N'11/2024', 2, 2, 1),
(13, N'11/2024', 1, 1, 1),
(14, N'11/2024', 2, 1, 1),
(15, N'11/2024', 1, 2, 0),
(16, N'11/2024', 2, 1, 1),
(17, N'11/2024', 1, 1, 1),
(17, N'11/2024', 2, 1, 1),
(19, N'11/2024', 1, 1, 1),
(20, N'11/2024', 2, 2, 1),

(1, N'12/2024', 1, 1, 0),
(1, N'12/2024', 2, 2, 1),
(3, N'12/2024', 1, 1, 0),
(3, N'12/2024', 2, 1, 0),
(5, N'12/2024', 1, 1, 0),
(6, N'12/2024', 2, 1, 1),
(7, N'12/2024', 1, 2, 0),
(8, N'12/2024', 2, 1, 1),
(9, N'12/2024', 1, 1, 0),
(10, N'12/2024', 2, 1, 1),
(11, N'12/2024', 1, 1, 0),
(11, N'12/2024', 2, 2, 0),
(13, N'12/2024', 1, 1, 0),
(14, N'12/2024', 2, 1, 0),
(15, N'12/2024', 1, 2, 1),
(16, N'12/2024', 2, 1, 0),
(17, N'12/2024', 1, 1, 0),
(17, N'12/2024', 2, 1, 0),
(19, N'12/2024', 1, 1, 0),
(20, N'12/2024', 2, 2, 0);

--insert bảng PhiTienIch
insert into PhiTienIch (id, thang, dien, nuoc, internet, status) values
(1, N'11/2024', 200000, 150000, 300000, 1),
(2, N'11/2024', 220000, 140000, 320000, 1),
(3, N'11/2024', 250000, 160000, 310000, 1),
(4, N'11/2024', 230000, 180000, 330000, 1),
(5, N'11/2024', 210000, 170000, 300000, 1),
(6, N'11/2024', 220000, 160000, 340000, 0),
(7, N'11/2024', 240000, 150000, 310000, 1),
(8, N'11/2024', 250000, 180000, 300000, 1),
(9, N'11/2024', 200000, 140000, 330000, 1),
(10, N'11/2024', 210000, 150000, 320000, 1),
(11, N'11/2024', 230000, 160000, 310000, 1),
(12, N'11/2024', 220000, 170000, 300000, 0),
(13, N'11/2024', 250000, 180000, 350000, 1),
(14, N'11/2024', 240000, 160000, 330000, 1),
(15, N'11/2024', 220000, 150000, 320000, 1),
(16, N'11/2024', 210000, 170000, 300000, 1),
(17, N'11/2024', 230000, 140000, 310000, 1),
(18, N'11/2024', 250000, 150000, 320000, 0),
(19, N'11/2024', 220000, 160000, 330000, 1),
(20, N'11/2024', 240000, 170000, 310000, 1),

(1, N'12/2024', 200000, 150000, 300000, 0),
(2, N'12/2024', 220000, 140000, 320000, 1),
(3, N'12/2024', 250000, 160000, 310000, 0),
(4, N'12/2024', 230000, 180000, 330000, 0),
(5, N'12/2024', 210000, 170000, 300000, 1),
(6, N'12/2024', 220000, 160000, 340000, 0),
(7, N'12/2024', 240000, 150000, 310000, 1),
(8, N'12/2024', 250000, 180000, 300000, 0),
(9, N'12/2024', 200000, 140000, 330000, 1),
(10, N'12/2024', 210000, 150000, 320000, 0),
(11, N'12/2024', 230000, 160000, 310000, 1),
(12, N'12/2024', 220000, 170000, 300000, 0),
(13, N'12/2024', 250000, 180000, 350000, 1),
(14, N'12/2024', 240000, 160000, 330000, 0),
(15, N'12/2024', 220000, 150000, 320000, 0),
(16, N'12/2024', 210000, 170000, 300000, 1),
(17, N'12/2024', 230000, 140000, 310000, 1),
(18, N'12/2024', 250000, 150000, 320000, 0),
(19, N'12/2024', 220000, 160000, 330000, 0),
(20, N'12/2024', 240000, 170000, 310000, 1);
