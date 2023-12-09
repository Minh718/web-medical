-- Add dữ liệu mẫu vào bảng CLINIC
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('001','Đa khoa','1 Bis, Hùng Vương','CL001@yahoo.com','Tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('002','Khoa Ngoại tổng quát','2 Bis, Trưng Trắc','CL002@yahoo.com','Ngoại tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('003','Khoa nội tổng quát','3 Bis, Đinh Bộ Lĩnh','CL003@yahoo.com','Khám nội tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('004','Khoa tim mạch','4 Bis, Lý Thường Kiệt','CL004@yahoo.com','Tim mạch');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('005','Khoa nhi','5 Bis, Trần Hưng Đạo','CL005@yahoo.com','Khám nhi');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('006','Khoa hô hấp','6 Bis, Trần Nguyễn Hãn','CL006@yahoo.com','Các bệnh về đường hô hấp');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('007','Khoa ung bứu','7 Bis, Nguyễn An Ninh','CL007@yahoo.com','Các bệnh liên quan về bứu');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('008','Khoa Y học cổ truyền','8 Bis, Lê Lợi','CL008@yahoo.com','Vật lý trị liệu, y học cổ truyền');

--Add dữ liệu mẫu vào bảng CLINIC_HOTLINE
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('001','1111');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('002','2222');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('003','3333');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('004','4444');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('005','5555');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('006','6666');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('007','7777');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('008','8888');

--Add dữ liệu mẫu vào bảng CLINIC_WORKTIME
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('001','Cả tuần','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('002','Thứ 2, Thứ 4','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('003','Thứ 3, Thứ 5','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('004','Cả tuần','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('005','Thứ 2, Thứ 3','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('006','Cả tuần','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('007','Trừ Chủ nhật','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('008','Thứ 2, Thứ 6','08:00:00','11:30:00');

--Add dữ liệu vào bảng USER
-----TYPE = STAFF:
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('100','Nguyễn','Văn','A','male','1988-12-01','8 Võ Văn Ngân','nguyenvanA@yahoo.com','123123',TRUE,'nguyenvanA','nguyenvanA123','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('101','Nguyễn','Văn','B','male','1988-10-02','9 Nguyễn Văn Nguyễn','nguyenvanB@yahoo.com','124124',TRUE,'nguyenvanB','nguyenvanB124','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('102','Mai','Chí','E','male','1987-02-19','52 Nguyễn Xí','maichiE@yahoo.com','128128',TRUE,'maichiE','maichiE128','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('103','Võ','Hồng','C','female','1980-10-15','12 Nguyễn Chí Thanh','vohongC@yahoo.com','125125',TRUE,'vohongC','vohongC125','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('104','Mai','Hồng','D','female','1981-02-18','17 Nguyễn Trãi','maihongD@yahoo.com','126126',TRUE,'maihongD','maihongD126','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('105','Mai','Hồng','F','female','1988-01-24','17 Nguyễn Trãi','maihongF@yahoo.com','127127',TRUE,'maihongF','maihongF127','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('106','Phạm','Hồng','G','female','1990-03-10','14 Nguyễn Hữu Cảnh','phamhongG@yahoo.com','129129',TRUE,'phamhongG','phamhongG129','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('107','Trương','Hữu','H','male','1982-04-22','54 Nguyễn Bính','truonghuuH@yahoo.com','130130',TRUE,'truonghuuH','truonghuuH130','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('108','Đào','Duy','K','male','1997-05-01','14 Nguyễn Lữ','daoduyK@yahoo.com','131131',TRUE,'daoduyK','daoduyK131','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('109','Đỗ','Duy','L','male','1992-06-01','35 Nguyễn Hợi','doduyL@yahoo.com','132132',TRUE,'doduyL','doduyL132','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('110','Đỗ','Anh','M','male','1983-07-27','1 Nguyễn An Ninh','doanhM@yahoo.com','133133',TRUE,'doanhM','doanhM133','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('111','Bùi','Gia','D','male','1985-12-02','11 Trần Thị Thơm','buigiaD@yahoo.com','134134',TRUE,'buigiaD','buigiaD134','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('112','Bùi','Gia','N','female','1986-12-03','15 Trần Thị Thơm','buigiaN@yahoo.com','135135',TRUE,'buigiaN','buigiaN135','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('113','Nguyễn','Phương','Đ','male','1987-12-05','24 Mai Chí Thọ','nguyenphuongĐ@yahoo.com','136136',TRUE,'nguyenphuongĐ','nguyenphuongĐ136','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('114','Nguyễn','Phương','Q','female','1988-11-06','28 Nguyễn Văn Linh','nguyenphuongQ@yahoo.com','137137',TRUE,'nguyenphuongQ','nguyenphuongQ137','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('115','Nguyễn','Hữu','T','male','1988-10-07','29 Nguyễn Văn Trỗi','nguyenhuuT@yahoo.com','138138',TRUE,'nguyenhuuT','nguyenhuuT138','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('116','Nguyễn','Lê','U','female','1989-09-02','29 Nguyễn Nhạc','nguyenleU@yahoo.com','139139',TRUE,'nguyenleU','nguyenleU139','staff');
-----TYPE = user: