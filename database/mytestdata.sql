SET FOREIGN_KEY_CHECKS=0;
DROP DATABASE clinicSystemDB;
SET FOREIGN_KEY_CHECKS=1;

--  Add dữ liệu mẫu vào bảng CLINIC
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('001','Phòng khám Bách Khoa CS1','1 Bis, Hùng Vương','CL001@yahoo.com','Tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('002','Phòng khám Bách Khoa CS2','2 Bis, Trưng Trắc','CL002@yahoo.com','Ngoại tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('003','Phòng khám Bách Khoa CS3','3 Bis, Đinh Bộ Lĩnh','CL003@yahoo.com','Khám nội tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('004','Phòng khám Bách Khoa CS4','4 Bis, Lý Thường Kiệt','CL004@yahoo.com','Tim mạch');
-- Add dữ liệu mẫu vào bảng CLINIC_WORKTIME
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('001','Cả tuần','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('002','Thứ 2, Thứ 4','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('003','Thứ 3, Thứ 5','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('004','Cả tuần','08:00:00','17:00:00');


-- Add dữ liệu mẫu vào bảng User
-- 1
CALL insertPatient('Nguyễn','Văn','An','male','01-12-1988','8 Võ Văn Ngân','nguyenvanan@yahoo.com','0123456789', 'nguyenvanan','nguyenvanan1');
-- 2
CALL insertPatient('Nguyễn','Văn','Ba','male','02-10-1988','9 Nguyễn Văn Nguyễn','nguyenvanba@yahoo.com','0123456788','nguyenvanba','nguyenvanba1');
-- 3
CALL insertPatient('Mai','Chí','Em','male','19-02-1987','52 Nguyễn Xí','maichiem@yahoo.com','0905000500','maichiem','maichiem1');
-- 4
CALL insertPatient('Võ','Hồng','Ca','female','15-10-1980','12 Nguyễn Chí Thanh','vohongca@yahoo.com','0906050392','vohongca','vohongca1');
-- 5
CALL insertPatient('Mai','Hồng','Minh','female','24-01-1988','17 Nguyễn Trãi','maihongminh@yahoo.com','0906050392','maihongminh','maihongminh1');
-- 6
CALL insertPatient('Phạm','Hồng','Ly','female','10-03-1990','14 Nguyễn Hữu Cảnh','phamhongly@yahoo.com','0292829172','phamhongly','phamhongly1');

-- SELECT * 
-- FROM _user;
-- SELECT * 
-- FROM patient;

-- 7
CALL insertMedicalStaff('Đỗ','Anh','Mạnh','male','27-07-1983','1 Nguyễn An Ninh','doanhmanh@yahoo.com','0899899899','doanhmanh','doanhmanh1','5','105000', 50000000,'Chuyên khoa','doctor');
-- 8
CALL insertMedicalStaff('Bùi','Gia','Định','male','02-12-1985','11 Trần Thị Thơm','buigiadinh@yahoo.com','0989939939','buigiadinh','buigiadinh1','3','106000', 20000000,'Đa khoa','doctor');

-- 9
CALL insertMedicalStaff('Trương','Hữu','Trí','male','22-04-1982','54 Nguyễn Bính','truonghuutri@yahoo.com','0988382839','truonghuutri','truonghuutri1', 6,'100000', 1200000, NULL, 'nurse');
-- 10
CALL insertMedicalStaff('Đào','Duy','Ca','male','01-05-1997','14 Nguyễn Lữ','daoduyca@yahoo.com','0928472844','daoduyca','daoduyca1', 5,'101000', 1000000, NULL,'nurse');
-- 11
CALL insertMedicalStaff('Đỗ','Duy','Linh','male','01-06-1992','35 Nguyễn Hợi','doduylinh@yahoo.com','0987492839','doduylinh','doduylinh1', 5,'102000', 1000000, NULL,'nurse');

-- SELECT *
-- FROM medical_staff;
-- SELECT *
-- FROM nurse;
-- SELECT * FROM _user;







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

--  Add dữ liệu vào bảng Appointment
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('1', '12:00:00', '13:00:00', '2023-12-15', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('2', '13:00:00', '15:00:00', '2023-12-15', '20', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('3', '15:00:00', '16:00:00', '2023-12-15', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('4', '16:00:00', '17:00:00', '2023-12-15', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('5', '12:00:00', '13:00:00', '2023-12-01', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('6', '13:00:00', '14:00:00', '2023-12-01', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `max_people`, `is_full`, `clinic_id`) VALUES ('7', '14:00:00', '15:00:00', '2023-12-01', '10', '0', '1');


SELECT *
FROM doctor;
SELECT *
FROM patient;

--  Add dữ liệu vào bảng Examination
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('1', 'Bệnh nan y', 'Cần ăn nhiều ', '7', '1', '1', NULL, '1');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('2', 'Bệnh nan y', 'Cần ăn nhiều', '7', '2', '1', NULL, '5');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('3', 'Bệnh nan y', 'Chụp vùng phổi để phát hiện các bệnh liên quan', '8', '2', '1', NULL, '4');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('4', 'Bệnh nan y', 'Đo xung điện trên vùng não bộ', '8', '3', '2', NULL, '1');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('5', 'Bệnh mà giấu', 'Phát hiện bệnh từ bên trong dạ dày, có gây mê', '8', '3', '2', NULL, '2');

SELECT *
FROM examination;
SELECT *
FROM prescription;
SELECT *
FROM medicine;

-- kê thuốc
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '1', 'Uống 3 viên/ngày', '9');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '3', 'Uống 10 viên/ngày', '9');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('2', '2', 'Uống 2 viên/ngày', '10');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('3', '7', 'Uống 6 viên/ngày', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('4', '6', 'Ngày nào cũng uống', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('5', '6', 'Uống 100 viên/ngày', '3');


CALL insertBill(1);
CALL insertBill(2);
CALL insertBill(3);
SELECT *
FROM bill;





--  Add dữ liệu vào bảng patient_appointment
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('1', '1', 'UNCONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('2', '2', 'UNCONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('3', '5', 'UNCONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('4', '1', 'UNCONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('5', '3', 'UNCONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('6', '5', 'CONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('7', '6', 'CONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('8', '5', 'CONFIRM');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('9', '5', 'CONFIRM');

SELECT *
FROM patient_appointment;

SELECT *
FROM appointment;



