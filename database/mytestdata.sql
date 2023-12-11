-- SET FOREIGN_KEY_CHECKS=0;
-- DROP DATABASE clinicSystemDB;
-- SET FOREIGN_KEY_CHECKS=1;

--  Add dữ liệu mẫu vào bảng CLINIC
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('1','Phòng khám Bách Khoa CS1','1 Bis, Hùng Vương','CL001@yahoo.com','Tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('2','Phòng khám Bách Khoa CS2','2 Bis, Trưng Trắc','CL002@yahoo.com','Ngoại tổng quát');
-- Add dữ liệu mẫu vào bảng CLINIC_WORKTIME
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 2','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 2','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 3','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 3','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 4','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 4','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 5','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 5','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 6','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('1','Thứ 6','12:00:00','16:00:00');

INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 2','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 2','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 4','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 4','12:00:00','16:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 6','08:00:00','11:30:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('2','Thứ 6','12:00:00','16:00:00');
-- Add dữ liệu mẫu vào bảng CLINIC_HOTLINE
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('1','19001900');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('1','19001929');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('2','19003928');

-- ROOM
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `is_active`, `doctor_id`) VALUES ('1', '1', 'Phòng khám tổng quát', '0', NULL);
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `is_active`, `doctor_id`) VALUES ('2', '1', 'Phòng siêu âm', '0', NULL);
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `is_active`, `doctor_id`) VALUES ('3', '1', 'Phòng chụp X quang', '0', NULL);

INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `is_active`, `doctor_id`) VALUES ('1', '2', 'Phòng khám tổng quát', '0', NULL);
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `is_active`, `doctor_id`) VALUES ('2', '2', 'Phòng siêu âm', '0', NULL);


-- Add dữ liệu vào bảng SERVICE
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('1','Siêu âm','1000000','Phát hiện bệnh từ bên trong cơ thể');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('2','Nội soi Dạ dày','2000000','Phát hiện bệnh từ bên trong dạ dày, có gây mê');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('3','Nội soi Đại tràng','3000000','Phát hiện bệnh từ bên trong đại tràng, có gây mê');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('4','Đo điện tim','4000000','Đo số nhịp tim đập trên một đơn vị thời gian');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('5','X quang Phổi','5000000','Chụp vùng phổi để phát hiện các bệnh liên quan');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('6','Đo huyết áp tứ chi','6000000','Đo huyết áp của các cơ của tứ chi');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('7','Đo cận-viễn-loạn','7000000','Đo mắt và phát hiện các bệnh về mắt');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('8','Đo điện não','8000000','Đo xung điện trên vùng não bộ');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('9','Đo xơ vữa động mạch','9000000','Đo tình trạng mảng xơ vữa trong thành động mạch');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('10','Khám tổng quát','10000000','Khám tất cả các chức năng cơ bản của cơ thể');
--  Add dữ liệu vào bảng MEDICINE
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('1','Aspirin','1000','Trị xơ vữa động mạch');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('2','Clopidogrel','2000','Trợ tim, bổ tim');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('3','Organika Cordyceps','3000','Bổ phổi');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('4','Siro ho Bảo Thanh','4000','Bổ đường hô hấp');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('5','Omega-3','5000','Bổ mắt, nhiều vitaminA');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('6','Hoạt huyết 1-1','6000','Tăng cường máu lên não');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('7','CumaGold','7000','Trị đại tràng');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('8','Rohto Antibacterial','8000','Bổ mắt, kháng viêm mắt');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('9','V.Rohto Vitamin','9000','Bổ mắt, chậm tăng độ');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('10','Digoxin','10000','Tốt cho tim mạch');
-- medicine in clinic
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '1', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '2', '20');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '3', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '4', '30');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '5', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '6', '20');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '7', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '8', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '9', '25');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '10','25');

INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '1', '40');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '3', '30');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '5', '30');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '7', '45');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '9', '20');


-- Add dữ liệu mẫu vào bảng Doctor (5)
CALL insertMedicalStaff('Đỗ','Anh','Mạnh','male','27-07-1983','1 Nguyễn An Ninh','doanhmanh@yahoo.com','0899899899','doanhmanh','doanhmanh1','5','105000', 50000000,'Chuyên khoa','doctor');
CALL insertMedicalStaff('Bùi','Gia','Định','male','02-12-1985','11 Trần Thị Thơm','buigiadinh@yahoo.com','0989939939','buigiadinh','buigiadinh1','3','106000', 20000000,'Đa khoa','doctor');
CALL insertMedicalStaff('Nguyễn','Thị','Hương','female','15-09-1985','28 Lê Lợi','nguyenthihuong@yahoo.com','0978563412','nguyenthihuong','nguyenthihuong1', 6,'103000', 25000000, 'Đa khoa', 'doctor');
CALL insertMedicalStaff('Lê','Văn','Phúc','male','03-12-1990','45 Phan Chu Trinh','levanphuc@yahoo.com','0912345678','levanphuc','levanphuc1', 7,'104000', 23000000, 'Răng hàm mặt', 'doctor');
CALL insertMedicalStaff('Phạm','Thị','Lan','female','25-11-1993','23 Hai Bà Trưng','phamthilan@yahoo.com','0945678901','phamthilan','phamthilan1', 7,'107000', 23000000, 'Ngoại khoa', 'doctor');

CALL setRoomManager('1', '1', '1');
CALL setRoomManager('2', '1', '2');
CALL setRoomManager('3', '1', '3');
CALL setRoomManager('1', '2', '4');
CALL setRoomManager('2', '2', '5');


-- Add dữ liệu mẫu vào bảng Nurse (10)
CALL insertMedicalStaff('Trần','Thị','Mai','female','20-03-1988','78 Hoàng Văn Thụ','tranthimai@yahoo.com','0956781234','tranthimai','tranthimai1', 6,'105000', 15000000, NULL, 'nurse');
CALL insertMedicalStaff('Hoàng','Văn','Dũng','male','08-07-1995','56 Cách Mạng Tháng Tám','hoangvandung@yahoo.com','0987654321','hoangvandung','hoangvandung1', 5,'106000', 14000000, NULL, 'nurse');
CALL insertMedicalStaff('Nguyễn','Văn','Hùng','male','10-04-1980','12 Trần Hưng Đạo','nguyenvanhung@yahoo.com','0965432109','nguyenvanhung','nguyenvanhung1', 5,'108000', 13500000, NULL, 'nurse');
CALL insertMedicalStaff('Đặng','Thị','Hà','female','02-01-1998','36 Phùng Hưng','dangthiha@yahoo.com','0932108765','dangthiha','dangthiha1', 6,'109000', 13000000, NULL, 'nurse');
CALL insertMedicalStaff('Trần','Văn','Tuấn','male','18-06-1983','89 Ngô Quyền','tranvantuan@yahoo.com','0918765432','tranvantuan','tranvantuan1', 5,'110000', 11500000, NULL, 'nurse');
CALL insertMedicalStaff('Nguyễn','Thị','Nga','female','05-09-1991','47 Lý Thường Kiệt','nguyenthinga@yahoo.com','0987654321','nguyenthinga','nguyenthinga1', 7,'111000', 11500000, NULL, 'nurse');
CALL insertMedicalStaff('Lê','Văn','Hậu','male','14-02-1987','64 Nguyễn Huệ','levanhau@yahoo.com','0923456789','levanhau','levanhau1', 6,'112000', 12000000, NULL, 'nurse');
CALL insertMedicalStaff('Trương','Hữu','Trí','male','22-04-1982','54 Nguyễn Bính','truonghuutri@yahoo.com','0988382839','truonghuutri','truonghuutri1', 6,'100000', 10000000, NULL, 'nurse');
CALL insertMedicalStaff('Đào','Duy','Ca','male','01-05-1997','14 Nguyễn Lữ','daoduyca@yahoo.com','0928472844','daoduyca','daoduyca1', 5,'101000', 10000000, NULL,'nurse');
CALL insertMedicalStaff('Đỗ','Duy','Linh','male','01-06-1992','35 Nguyễn Hợi','doduylinh@yahoo.com','0987492839','doduylinh','doduylinh1', 5,'102000', 11000000, NULL,'nurse');


-- Add dữ liệu mẫu vào bảng Patient (6)
CALL insertPatient('Nguyễn','Văn','An','male','01-12-1988','8 Võ Văn Ngân','nguyenvanan@yahoo.com','0123456789', 'nguyenvanan','nguyenvanan1');
CALL insertPatient('Nguyễn','Văn','Ba','male','02-10-1988','9 Nguyễn Văn Nguyễn','nguyenvanba@yahoo.com','0123456788','nguyenvanba','nguyenvanba1');
CALL insertPatient('Mai','Chí','Em','male','19-02-1987','52 Nguyễn Xí','maichiem@yahoo.com','0905000500','maichiem','maichiem1');
CALL insertPatient('Võ','Hồng','Ca','female','15-10-1980','12 Nguyễn Chí Thanh','vohongca@yahoo.com','0906050392','vohongca','vohongca1');
CALL insertPatient('Mai','Hồng','Minh','female','24-01-1988','17 Nguyễn Trãi','maihongminh@yahoo.com','0906050392','maihongminh','maihongminh1');
CALL insertPatient('Phạm','Hồng','Ly','female','10-03-1990','14 Nguyễn Hữu Cảnh','phamhongly@yahoo.com','0292829172','phamhongly','phamhongly1');

-- work_at
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('1', '1', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('2', '2', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('3', '3', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('4', '1', '2');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('5', '2', '2');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('6', '1', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('7', '2', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('8', '3', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('9', '1', '2');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('10', '2', '2');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('11', '1', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('12', '3', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('13', '1', '2');

-- work-with
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('6', '1');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('7', '2');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('8', '3');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('9', '4');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('10', '5');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('11', '1');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('12', '3');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('13', '4');


--  Add dữ liệu vào bảng Appointment
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('1', '08:00:00', '11:30:00', '2023-12-05', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('2', '12:00:00', '16:00:00', '2023-12-05', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('3', '08:00:00', '11:30:00', '2023-12-06', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('4', '12:00:00', '16:00:00', '2023-12-06', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('5', '08:00:00', '11:30:00', '2023-12-07', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('6', '12:00:00', '16:00:00', '2023-12-07', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('7', '08:00:00', '11:30:00', '2023-12-08', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('8', '12:00:00', '16:00:00', '2023-12-08', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('9', '08:00:00', '11:30:00', '2023-12-09', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('10', '12:00:00', '16:00:00', '2023-12-09', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('11', '08:00:00', '11:30:00', '2023-12-10', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('12', '12:00:00', '16:00:00', '2023-12-10', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('13', '08:00:00', '11:30:00', '2023-12-11', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('14', '12:00:00', '16:00:00', '2023-12-11', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('15', '08:00:00', '11:30:00', '2023-12-12', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('16', '12:00:00', '16:00:00', '2023-12-12', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('17', '08:00:00', '11:30:00', '2023-12-13', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('18', '12:00:00', '16:00:00', '2023-12-13', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('19', '08:00:00', '11:30:00', '2023-12-14', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('20', '12:00:00', '16:00:00', '2023-12-14', '10', '0', '1');

INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('21', '08:00:00', '11:30:00', '2023-12-07', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('22', '12:00:00', '16:00:00', '2023-12-07', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('23', '08:00:00', '11:30:00', '2023-12-08', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('24', '12:00:00', '16:00:00', '2023-12-08', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('25', '08:00:00', '11:30:00', '2023-12-09', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('26', '12:00:00', '16:00:00', '2023-12-09', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('27', '08:00:00', '11:30:00', '2023-12-10', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('28', '12:00:00', '16:00:00', '2023-12-10', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('29', '08:00:00', '11:30:00', '2023-12-11', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('30', '12:00:00', '16:00:00', '2023-12-11', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('31', '08:00:00', '11:30:00', '2023-12-12', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('32', '12:00:00', '16:00:00', '2023-12-12', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('33', '08:00:00', '11:30:00', '2023-12-13', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('34', '12:00:00', '16:00:00', '2023-12-13', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('35', '08:00:00', '11:30:00', '2023-12-14', '10', '0', '2');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('36', '12:00:00', '16:00:00', '2023-12-14', '10', '0', '2');


--  Add dữ liệu vào bảng patient_appointment
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '2', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '3', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '4', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '5', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '6', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '35', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('16', '36', 'unconfirm');

INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '5', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '6', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '21', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '22', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '33', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '34', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '35', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('17', '36', 'unconfirm');



--  Add dữ liệu vào nhóm bảng Examination, Prescription, Bill
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('1', 'Bệnh nan y', 'Chụp vùng phổi để phát hiện các bệnh liên quan', '1', '16', '2', NULL, '10');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '1', 'Uống 3 viên/ngày', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '3', 'Uống 10 viên/ngày', '6');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('2', 'Bệnh nan y', 'Đo xung điện trên vùng não bộ', '1', '16', '2', NULL, '9');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('2', '2', 'Uống 2 viên/ngày', '5');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('2', '7', 'Uống 6 viên/ngày', '3');
CALL insertBill(16);


INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('3', 'Bệnh mà giấu', 'Phát hiện bệnh từ bên trong dạ dày, có gây mê', '1', '16', '3', NULL, '8');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('3', '7', 'Uống 6 viên/ngày', '6');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('3', '6', 'Ngày nào cũng uống', '4');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('4', 'Bệnh tim mạch', 'Kiểm tra huyết áp và thực hiện EKG', '1', '16', '3', NULL, '7');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('4', '3', 'Uống 5 viên/ngày', '10');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('4', '2', 'Uống 2 viên/ngày', '4');
CALL insertBill(16);


INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('5', 'Bệnh đường huyết', 'Đo đường huyết và tư vấn dinh dưỡng', '4', '17', '21', NULL, '6');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('5', '1', 'Uống 3 viên/ngày', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('5', '3', 'Uống 2 viên/ngày', '4');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('6', 'Bệnh đau lưng', 'Thăm khám và đề xuất phương pháp điều trị', '4', '17', '21', NULL, '5');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('6', '7', 'Uống 3 viên/ngày', '6');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('6', '6', 'Ngày nào cũng uống', '3');
CALL insertBill(17);


INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('7', 'Bệnh dạ dày', 'Thực hiện siêu âm dạ dày và kê đơn thuốc', '4', '17', '22', NULL, '4');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('7', '6', 'Ngày nào cũng uống', '5');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('7', '2', 'Uống 2 viên/ngày', '3');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('8', 'Bệnh mắt', 'Kiểm tra thị lực và tư vấn kính áp tròng', '4', '17', '22', NULL, '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('8', '1', 'Uống 3 viên/ngày', '4');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('8', '3', 'Uống 1 viên/ngày', '2');
CALL insertBill(17);







