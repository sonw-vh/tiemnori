
CREATE TABLE `dathang` (
  `id_dathang` int(11) NOT NULL,
  `madathang` varchar(50) NOT NULL,
  `makh` varchar(100) NOT NULL,
  `trangthai` varchar(100) DEFAULT NULL,
  `tongtien` int(11) NOT NULL,
  `ngaydathang` datetime DEFAULT current_timestamp(),
  `giaohang` varchar(10),
  `id_kh` int(11) NOT NULL,
   PRIMARY KEY (`id_dathang`,`madathang`,`makh`,`id_kh`)
);

CREATE TABLE `chitiet_donhang` (
  `id_ctdonhang` int(11) NOT NULL,
  `madathang` varchar(50) NOT NULL,
  `makh` varchar(100) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `tensp` varchar(100) NOT NULL,
  `soluong` tinyint(4) DEFAULT NULL,
  `giamgia` int(11) DEFAULT NULL,
  `giatien` int(11) DEFAULT NULL,
  `tongtien` int(11) DEFAULT NULL,
  `trangthai` varchar(100) NOT NULL,
  `ngaydat` datetime DEFAULT current_timestamp(),
  `id_dathang` int(11) NOT NULL,
  `id_kh` int(11) NOT NULL,
   PRIMARY KEY (`id_ctdonhang`,`madathang`,`makh`,`id_sanpham`,`id_dathang`,`id_kh`)
);

CREATE TABLE `dangki` (
  `id_dangki` int(11) NOT NULL AUTO_INCREMENT,
  `hoten` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `matkhau` varchar(100) DEFAULT NULL,
  `id_phanquyen` int(11) NOT NULL,
  PRIMARY KEY (`id_dangki`)
);

CREATE TABLE `sanpham` (
  `id_sanpham` int(11) PRIMARY KEY,
  `tensp` varchar(100) DEFAULT NULL,
  `anhsp` varchar(255) DEFAULT NULL,
  `giasp` int(11) DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `discount` decimal(2,1) DEFAULT 0,
  `id_danhmuc` int(11) NOT NULL
);

CREATE TABLE `danhmuc` (
  `id_danhmuc` int(11) PRIMARY KEY,
  `ten_danhmuc` varchar(100) DEFAULT NULL
);

CREATE TABLE `khachhang` (
  `makh` varchar(100) NOT NULL,
  `tenkh` varchar(100) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sdt` int(11) DEFAULT NULL,
  `id_kh` int(11) NOT NULL,
   PRIMARY KEY (`makh`,`id_kh`)
);

CREATE TABLE `phanquyen` (
  `id_phanquyen` int(11) PRIMARY KEY,
  `tenquyen` char(20) DEFAULT NULL
);

-- --------------------------------------------------------

ALTER TABLE `sanpham`
ADD CONSTRAINT fk_customer FOREIGN KEY (`id_danhmuc`)  
  REFERENCES `danhmuc`(`id_danhmuc`);  

ALTER TABLE `dangki`
ADD CONSTRAINT fk_dk FOREIGN KEY (`id_phanquyen`)  
  REFERENCES `phanquyen`(`id_phanquyen`); 

ALTER TABLE `chitiet_donhang`
ADD CONSTRAINT fk_ctiddh FOREIGN KEY (`id_dathang`)  
  REFERENCES `dathang`(`id_dathang`);  

-- --------------------------------------------------------

INSERT INTO `phanquyen` (`id_phanquyen`, `tenquyen`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'staff');

INSERT INTO `dangki` (`id_dangki`, `hoten`, `email`, `matkhau`, `id_phanquyen`) VALUES
(1, 'admin', '', 'e10adc3949ba59abbe56e057f20f883e', 1),
(2, 'exe201', 'exe201@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(3, 'staff', 'staff', 'e10adc3949ba59abbe56e057f20f883e', 3);

INSERT INTO `danhmuc` (`id_danhmuc`, `ten_danhmuc`) VALUES
(1, 'vị cơm nắm'),
(3, 'tất cả sản phẩm'),
(5, 'nổi bật');

INSERT INTO `khachhang` (`makh`, `tenkh`, `diachi`, `email`, `sdt`, `id_kh`) VALUES
('MAKH1', 'exe201', 'Trường ĐH FPT Đà Nẵng ', 'exe201@gmail.com', 1234567890, 1);

INSERT INTO `sanpham` (`id_sanpham`, `tensp`, `anhsp`, `giasp`, `mota`, `id_danhmuc`) VALUES
(1, 'Thịt gà sốt BBQ - BBQ Chicken', './upload/Bbq_Chicken.jpg', 18000, 'Nhà nhà người người vị nướng BBQ 😋 thì 𝐁𝐁𝐐 𝐂𝐡𝐢𝐜𝐤𝐞𝐧 cũng vậy đó, thịt gà cùng xốt cay cay vị đậm đà ăn cùng cơm trắng nóng hổi nữa thì khỏi bànnn !! 10 cục mới đủ hihi 😝', 1),
(2, 'Trứng ngâm tương - Egg', './upload/Egg.jpg', 18000, '10 người ăn, 9 ngừoi khen là có thật nha. Ai mê cơm 𝐄𝐠𝐠 nhà Nori cũng biết trứng thì to, lòng đào béo ngậy kèm nước tương mặn ngọt nữa. “Cắn” 1 miếng cơm mà ngập nhân 😋😋', 1),
(3, 'Spam trứng và mayonnaise - Spam Egg Mayo', './upload/Spam_Egg_Mayo.jpg', 22000, 'Vị mới !!! Thử ngay 𝐒𝐩𝐚𝐦 𝐄𝐠𝐠 𝐌𝐚𝐲𝐨 😋 Nghe tên là biết nắm cơm này “Hoành tráng” cỡ nào. Mix từ Spam, trứng chiên  kèm mayonnaise nữaaa 😗 Triển thôi không chờ đợi nữa nè 😚', 1),
(4, 'Thịt bò sốt cay - Spicy Beef', './upload/Spicy_Beef.jpg', 18000, 'Thịt bò được xào cũng tương ớt Hàn Quốc cay cay mặn mặn hoà quyện tạo nên 𝐒𝐩𝐢𝐜𝐲 𝐁𝐞𝐞𝐟 😝 Ai mà mê vị cơm này thì không đổi luôn ó. Mê Hàn Quốc thì phải mê Nori là chuẩn rồi 😋😋', 1),
(5, 'Thịt gà sốt teriyaki - Teriyaki Chicken', './upload/Teriyaki_Chicken.jpg', 18000, 'Ai mà không muốn ăn quá cay thì măm măm ngay 𝐓𝐞𝐫𝐢𝐲𝐚𝐤𝐢 𝐂𝐡𝐢𝐜𝐤𝐞𝐧 - Xốt teriyaki mặn mặn ngọt ngọt xào cùng với thịt gà 😋😋 Cắn một miếng mà muốn thêm miếng nữa hehe 😝', 1),
(6, 'Cá ngừ mayonnaise - Tuna Mayo', './upload/Tuna_Mayo.jpg', 18000, 'Nhắc đến vị bán chạy nhất tại Tiệm cơm Nori thì phải có 𝐓𝐮𝐧𝐚 𝐌𝐚𝐲𝐨 - là sự kết hợp giữa cá ngừ và xốt mayonnaise béo ngậy, ăn cùng cơm nóng cùng miếng rong biển giòn tan 😋😋', 1),
(7, 'Cá ngừ sốt ớt - Tuna Chili', './upload/Tuna_Chili.jpg', 18000, 'Thử ngay cá ngừ xốt ớt để có thể biết được cá ngừ thơm thơm mix cùng xốt ớt thì quá đỉnh 😚 Một sự kết hợp vừa vị mà măm măm vài miếng là hết 1 cục cơm rồiii 🤤 Đặt cơm thôi nè', 1),
(8, 'Kimchi sốt cay - Spicy Kimchi', './upload/Spicy_Kimchi.jpg', 18000, 'Nếu bạn đã yêu mến hương vị của Hàn Quốc, thì 𝐒𝐩𝐢𝐜𝐲 𝐊𝐢𝐦𝐜𝐡𝐢 chắc chắn sẽ làm bạn thêm mê mẩn 😋 Sự kết hợp giữa kimchi chua cay với tương ớt thì chỉ có "bùng nổ" vị giác à nhaaa 😍', 1);


INSERT INTO `dathang` (`id_dathang`, `madathang`, `makh`, `trangthai`, `tongtien`, `ngaydathang`, `giaohang`, `id_kh`) VALUES
(1, 'MDH1', 'MAKH1', 'giao thành công', 18000, '2024-01-17 16:26:42','COD', 1);

INSERT INTO `chitiet_donhang` (`id_ctdonhang`, `madathang`, `makh`, `id_sanpham`, `tensp`, `soluong`, `giamgia`, `giatien`, `tongtien`, `trangthai`, `ngaydat`, `id_dathang`, `id_kh`) VALUES
(1, 'MDH1', 'MAKH1', 1, 'Thịt gà sốt BBQ – BBQ Chicken', 1, NULL, 18000, 18000, 'giao thành công', '2024-01-17 16:26:42', 1, 0);