--  Add dữ liệu mẫu vào bảng CLINIC
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('001','Phòng khám Bách Khoa CS1','1 Bis, Hùng Vương','CL001@yahoo.com','Tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('002','Phòng khám Bách Khoa CS2','2 Bis, Trưng Trắc','CL002@yahoo.com','Ngoại tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('003','Phòng khám Bách Khoa CS3','3 Bis, Đinh Bộ Lĩnh','CL003@yahoo.com','Khám nội tổng quát');
INSERT INTO `clinic`(`id`, `_name`, `address`, `email`, `_desc`) VALUES ('004','Phòng khám Bách Khoa CS4','4 Bis, Lý Thường Kiệt','CL004@yahoo.com','Tim mạch');

-- Add dữ liệu mẫu vào bảng CLINIC_HOTLINE
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('001','1111');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('002','2222');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('003','3333');
INSERT INTO `clinic_hotline`(`clinic_id`, `hotline`) VALUES ('004','4444');
-- Add dữ liệu mẫu vào bảng CLINIC_WORKTIME
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('001','Cả tuần','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('002','Thứ 2, Thứ 4','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('003','Thứ 3, Thứ 5','08:00:00','17:00:00');
INSERT INTO `clinic_worktime`(`clinic_id`, `weekdays`, `open_time`, `close_time`) VALUES ('004','Cả tuần','08:00:00','17:00:00');


-- Add dữ liệu vào bảng USER
-- -- -TYPE = STAFF:

INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('100','Nguyễn','Văn','An','male','1988-12-01','8 Võ Văn Ngân','nguyenvanA@yahoo.com','123123',TRUE,'nguyenvanA','nguyenvanA123','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('101','Nguyễn','Văn','B','male','1988-10-02','9 Nguyễn Văn Nguyễn','nguyenvanB@yahoo.com','124124',TRUE,'nguyenvanB','nguyenvanB124','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('102','Mai','Chí','E','male','1987-02-19','52 Nguyễn Xí','maichiE@yahoo.com','128128',TRUE,'maichiE','maichiE128','staff');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('103','Võ','Hồng','C','female','1980-10-15','12 Nguyễn Chí Thanh','vohongC@yahoo.com','125125',TRUE,'vohongC','vohongC125','staff');
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
-- -- -TYPE = user:
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('117','Đỗ','Anh','B','male','2000-02-28','17 Mai Hắc Đế','doanhB@yahoo.com','140140',TRUE,'doanhB','doanhB140','user');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('118','Đỗ','Hải','D','male','2001-03-01','18 Mai An Tiêm','dohaiD@yahoo.com','141141',TRUE,'dohaiD','dohaiD141','user');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('119','Đỗ','Thủ','K','male','2001-04-02','19 Mai An Tiêm','dothuK@yahoo.com','142142',TRUE,'dothuK','dothuK142','user');
INSERT INTO `_user`(`id`, `fname`, `minit`, `lname`, `gender`, `birthdate`, `addr`, `email`, `phone_num`, `is_active`, `username`, `_password`, `type`) 
                    VALUES ('120','Nguyễn','Hồng','L','female','2002-08-30','22 Ngô Quyền','nguyenhongL@yahoo.com','143143',TRUE,'nguyenhongL','nguyenhongL143','user');

-- Add dữ liệu vào bảng PATIENT
INSERT INTO `patient`(`id`) VALUES ('117');
INSERT INTO `patient`(`id`) VALUES ('118');
INSERT INTO `patient`(`id`) VALUES ('119');
INSERT INTO `patient`(`id`) VALUES ('120');

--  Add dữ liệu vào bảng MEDICAL_STAFF
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('100','2018-12-20','6','100000','12000000','doctor');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('101','2018-12-20','5','101000','10000000','doctor');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('102','2018-11-20','5','102000','10000000','doctor');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('103','2018-10-21','4','103000','12000000','doctor');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('105','2018-08-24','5','105000','5000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('106','2018-08-13','2','106000','2000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('107','2018-09-25','5','107000','9000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('108','2017-09-26','7','108000','1000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('109','2018-08-27','5','109000','1000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('110','2018-07-28','6','110000','1000000','nurse');
INSERT INTO `medical_staff`(`id`, `start_date`, `YOE`, `license_number`, `salary`, `role`) VALUES ('111','2018-08-29','5','111000','1000000','nurse');

--  Add dữ liệu vào bảng Docter
INSERT INTO `clinicsystemdb`.`doctor` (`id`, `specialty`) VALUES ('100', 'Sản phụ');
INSERT INTO `clinicsystemdb`.`doctor` (`id`, `specialty`) VALUES ('101', 'Ngoại khoa');
INSERT INTO `clinicsystemdb`.`doctor` (`id`, `specialty`) VALUES ('102', 'Chuyên khoa');
INSERT INTO `clinicsystemdb`.`doctor` (`id`, `specialty`) VALUES ('103', 'Đa khoa');

--  Add dữ liệu vào bảng Nurse
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('105');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('106');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('107');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('108');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('109');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('110');
INSERT INTO `clinicsystemdb`.`nurse` (`id`) VALUES ('111');

-- Add dữ liệu vào bảng SERVICE
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('1','Siêu âm','100000','Phát hiện bệnh từ bên trong cơ thể');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('2','Nội soi Dạ dày','2000000','Phát hiện bệnh từ bên trong dạ dày, có gây mê');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('3','Nội soi Đại tràng','2300000','Phát hiện bệnh từ bên trong đại tràng, có gây mê');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('4','Đo điện tim','150000','Đo số nhịp tim đập trên một đơn vị thời gian');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('5','X quang Phổi','200000','Chụp vùng phổi để phát hiện các bệnh liên quan');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('6','Đo huyết áp tứ chi','250000','Đo huyết áp của các cơ của tứ chi');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('7','Đo cận-viễn-loạn','100000','Đo mắt và phát hiện các bệnh về mắt');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('8','Đo điện não','400000','Đo xung điện trên vùng não bộ');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('9','Đo xơ vữa động mạch','350000','Đo tình trạng mảng xơ vữa trong thành động mạch');
INSERT INTO `service`(`id`, `_name`, `cost`, `_desc`) VALUES ('10','Khám tổng quát','210000','Khám tất cả các chức năng cơ bản của cơ thể');

--  Add dữ liệu vào bảng MEDICINE
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('1','Aspirin','36000','Trị xơ vữa động mạch');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('2','Clopidogrel','91000','Trợ tim, bổ tim');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('3','Organika Cordyceps','650000','Bổ phổi');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('4','Siro ho Bảo Thanh','44000','Bổ đường hô hấp');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('5','Omega-3','200000','Bổ mắt, nhiều vitaminA');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('6','Hoạt huyết 1-1','100000','Tăng cường máu lên não');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('7','CumaGold','135000','Trị đại tràng');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('8','Rohto Antibacterial','54000','Bổ mắt, kháng viêm mắt');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) VALUES ('9','V.Rohto Vitamin','53000','Bổ mắt, chậm tăng độ');
INSERT INTO `medicine`(`serial_num`, `_name`, `cost`, `_desc`) -VALUES ('10','Digoxin','300000','Tốt cho tim mạch');


--  Add dữ liệu vào bảng Appointment
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('1', '12:00:00', '13:00:00', '2023-12-15', '0', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('2', '13:00:00', '15:00:00', '2023-12-15', '1', '20', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('3', '15:00:00', '16:00:00', '2023-12-15', '1', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('4', '16:00:00', '17:00:00', '2023-12-15', '0', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('5', '12:00:00', '13:00:00', '2023-12-01', '4', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('6', '13:00:00', '14:00:00', '2023-12-01', '1', '10', '0', '1');
INSERT INTO `clinicsystemdb`.`appointment` (`id`, `_time`, `_end_time`, `_date`, `cur_people`, `max_people`, `_status`, `clinic_id`) VALUES ('7', '14:00:00', '15:00:00', '2023-12-01', '2', '10', '0', '1');



--  Add dữ liệu vào bảng patient_appointment
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('117', '1', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('117', '2', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('117', '5', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('118', '1', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('118', '3', 'unconfirm');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('118', '5', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('118', '6', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('119', '5', 'done');
INSERT INTO `clinicsystemdb`.`patient_appointment` (`patient_id`, `app_id`, `_status`) VALUES ('120', '5', 'done');



-- Bill
INSERT INTO `clinicsystemdb`.`bill` (`id`, `total_cost`, `_status`, `_timestamp`, `due_date`) VALUES ('1', '100000', '0', '2023-12-01', '2023-12-06');
INSERT INTO `clinicsystemdb`.`bill` (`id`, `total_cost`, `_status`, `_timestamp`, `due_date`) VALUES ('2', '2000000', '0', '2023-12-01', '2023-12-06');
INSERT INTO `clinicsystemdb`.`bill` (`id`, `total_cost`, `_status`, `_timestamp`, `due_date`) VALUES ('3', '2800000', '0', '2023-12-01', '2023-12-06');
INSERT INTO `clinicsystemdb`.`bill` (`id`, `total_cost`, `_status`, `_timestamp`, `due_date`) VALUES ('4', '220000', '0', '2023-12-01', '2023-12-06');
INSERT INTO `clinicsystemdb`.`bill` (`id`, `total_cost`, `_status`, `_timestamp`, `due_date`) VALUES ('5', '200000', '0', '2023-12-01', '2023-12-06');



--  Add dữ liệu vào bảng Examination
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('1', 'Bệnh nan y', 'Cần ăn nhiều ', '100', '117', '5', '1', '1');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('5', 'Bệnh nan y', 'Cần ăn nhiều', '100', '118', '5', '3', '5');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('3', 'Bệnh nan y', 'Chụp vùng phổi để phát hiện các bệnh liên quan', '100', '119', '5', '4', '4');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('4', 'Bệnh nan y', 'Đo xung điện trên vùng não bộ', '100', '120', '5', '5', '1');
INSERT INTO `clinicsystemdb`.`examination` (`id`, `diagnose`, `_desc`, `doctor_id`, `patient_id`, `app_id`, `bill_id`, `service_id`) VALUES ('2', 'Bệnh mà giấu', 'Phát hiện bệnh từ bên trong dạ dày, có gây mê', '100', '118', '6', '2', '2');




-- Room

INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `_status`, `doctor_id`) VALUES ('100', '1', 'Tầng 1', 'HOẠT ĐỘNG', '100');
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `_status`, `doctor_id`) VALUES ('101', '1', 'Tầng 2', 'HOẠT ĐỘNG', '101');
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `_status`, `doctor_id`) VALUES ('102', '1', 'Tầng 3', 'HOẠT ĐỘNG', '102');
INSERT INTO `clinicsystemdb`.`room` (`num`, `clinic_id`, `_name`, `_status`, `doctor_id`) VALUES ('103', '1', 'Tầng 4', 'HOẠT ĐỘNG', '103');

-- work_at

INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('100', '100', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('105', '100', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('106', '100', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('101', '101', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('107', '101', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('108', '101', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('102', '102', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('109', '102', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('110', '102', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('103', '103', '1');
INSERT INTO `clinicsystemdb`.`work_at` (`ms_id`, `room_num`, `clinic_id`) VALUES ('111', '103', '1');


-- medician in clinic
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '1', '500');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '2', '400');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '1', '300');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '3', '200');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('2', '4', '300');
INSERT INTO `clinicsystemdb`.`medicine_in_clinic` (`clinic_id`, `serial_num`, `quantity`) VALUES ('1', '5', '100');



-- kê thuốc
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '1', 'Uống 3 viên/ngày', '9');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('1', '2', 'Uống 2 viên/ngày', '10');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('2', '7', 'Uống 6 viên/ngày', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('3', '6', 'Ngày nào cũng uống', '3');
INSERT INTO `clinicsystemdb`.`prescription` (`exam_id`, `serial_num`, `_desc`, `quantity`) VALUES ('2', '6', 'Uống 100 viên/ngày', '3');




-- work-with
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('105', '100');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('106', '100');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('107', '101');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('108', '101');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('109', '102');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('110', '102');
INSERT INTO `clinicsystemdb`.`work_with` (`nurse_id`, `doctor_id`) VALUES ('111', '103');
