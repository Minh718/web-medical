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
