CREATE DATABASE IF NOT EXISTS clinicSystemDB;
USE clinicSystemDB;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS clinic
(
	id				INT 				AUTO_INCREMENT,
    _name			VARCHAR(50)			UNIQUE,
    address			VARCHAR(255)		UNIQUE,
    email    		VARCHAR(100)		NOT NULL,
    _desc			VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS room
(
	num				INT,
    clinic_id		INT,
    _name			VARCHAR(50)			NOT NULL,
	_desc			VARCHAR(200),
    is_active		BOOL				NOT NULL DEFAULT 0,
    doctor_id 		INT,
    
    PRIMARY KEY (num, clinic_id),
    
    CONSTRAINT fk_room_clinic_id FOREIGN KEY (clinic_id)
		REFERENCES clinic(id)
        ON DELETE RESTRICT,
    
	CONSTRAINT fk_room_doctor_id FOREIGN KEY (doctor_id)
		REFERENCES doctor(id) 
		ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS appointment
(
	id 				INT 		AUTO_INCREMENT,
    _time			TIME		NOT NULL,
    _end_time		TIME		NOT NULL,
    _date			DATE		NOT NULL,
	cur_people		INT			NOT NULL DEFAULT 0,
    max_people		INT			NOT NULL DEFAULT 5,
    is_full	 		BOOL		NOT NULL DEFAULT 0,
    clinic_id		INT,
    
    PRIMARY KEY (id),
    
    CONSTRAINT appointment_check_1 
		CHECK (cur_people >= 0),
	CONSTRAINT appointment_check_2
		CHECK (max_people > 0),    
    
    CONSTRAINT fk_appointment_clinic_id FOREIGN KEY (clinic_id)
		REFERENCES clinic(id)
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS _user
(
	id 				INT					AUTO_INCREMENT,
    fname			VARCHAR(20)			NOT NULL,
    minit			VARCHAR(20),
    lname 			VARCHAR(20)			NOT NULL,
    gender			VARCHAR(10)			NOT NULL,
	birthdate		DATE				NOT NULL,
    addr			VARCHAR(255)		NOT NULL,
    email 			VARCHAR(50)			NOT NULL 	UNIQUE,
    phone_num		VARCHAR(15)			NOT NULL,
    is_active		BOOL				NOT NULL 	DEFAULT FALSE,
    username		VARCHAR(50)			NOT NULL 	UNIQUE,
    _password		VARCHAR(255) 		NOT NULL,
    is_admin		BOOL   				NOT NULL DEFAULT FALSE,
    type          	VARCHAR(20)			NOT NULL,
    
    CONSTRAINT user_check_1
		CHECK (gender = "male" OR gender = "female" OR gender="other"),
    CHECK (type = "user" OR type = "staff"),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS patient
(
	id 				INT 				PRIMARY KEY,
    CONSTRAINT fk_patient_id FOREIGN KEY (id)
		REFERENCES _user(id) 
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS medical_staff
(
	id 				INT 				PRIMARY KEY,
    start_date 		DATE				DEFAULT (CURDATE()),
    YOE 			INT					NOT NULL,
    license_number 	VARCHAR(50)			NOT NULL,
    salary 			INT					NOT NULL,
    role            VARCHAR(20) 		NOT NULL,   
    CONSTRAINT medical_staff_check_1 
		CHECK (YOE >= 0),
        
	CHECK (role = "doctor" OR role = "nurse"),
	CONSTRAINT medical_staff_check_2
		CHECK (salary > 0),
    CONSTRAINT fk_medical_staff_id 			FOREIGN KEY (id)
		REFERENCES _user(id) 
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS doctor
(
	id 				INT 				PRIMARY KEY,
    specialty		VARCHAR(50)			NOT NULL,
    
    CONSTRAINT fk_doctor_id FOREIGN KEY (id)
		REFERENCES medical_staff(id) 
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS  nurse
(
	id 				INT 				PRIMARY KEY,

    CONSTRAINT fk_nurse_id FOREIGN KEY (id)
		REFERENCES medical_staff(id) 
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS examination
(
	id 				INT 				AUTO_INCREMENT,
    diagnose 		VARCHAR(100)		NOT NULL,
    _desc 			VARCHAR(50),
    image 			VARCHAR(100),
    total_price		INT					NOT NULL DEFAULT 0,
    doctor_id		INT,
    patient_id 		INT,
    app_id 			INT,
    bill_id			INT,
    service_id		INT,
    _timestamp		TIMESTAMP			NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id),
    
	CONSTRAINT fk_examination_doctoc_id 	FOREIGN KEY (doctor_id)
		REFERENCES doctor(id) 					
		ON DELETE SET NULL,
    CONSTRAINT fk_examination_patient_id 	FOREIGN KEY (patient_id)
		REFERENCES patient(id) 					
		ON DELETE SET NULL,
    CONSTRAINT fk_examination_app_id 		FOREIGN KEY (app_id)
		REFERENCES appointment(id) 				
        ON DELETE SET NULL,
    CONSTRAINT fk_examination_bill_id 		FOREIGN KEY (bill_id)
		REFERENCES bill(id) 					
        ON DELETE SET NULL,
    CONSTRAINT fk_examination_service_id 	FOREIGN KEY (service_id)
		REFERENCES service(id) 					
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS bill
(
	id 				INT				AUTO_INCREMENT,
    total_cost		INT				NOT NULL DEFAULT 0,
    is_paid 		BOOL			NOT NULL DEFAULT FALSE,
    _timestamp 		DATE 			NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS medicine
(
	serial_num 		VARCHAR(50) 		PRIMARY KEY,
    _name 			VARCHAR(50)			NOT NULL,
    cost 			INT					NOT NULL,
    _desc 			VARCHAR(50),
    
    CONSTRAINT medicine_check_1	
		CHECK (cost > 0)
);

CREATE TABLE IF NOT EXISTS service
(
	id				INT					PRIMARY KEY,
    _name 			VARCHAR(50)			NOT NULL,
    cost 			INT					NOT NULL,
    _desc 			VARCHAR(50),
    
    CONSTRAINT service_check_1
		CHECK (cost > 0)
);

CREATE TABLE IF NOT EXISTS work_at
(
	ms_id 			INT				PRIMARY KEY,
    room_num 		INT,
    clinic_id 		INT,
    
    CONSTRAINT fk_work_at_ms_id		FOREIGN KEY (ms_id)
		REFERENCES medical_staff(id)				
        ON DELETE CASCADE,
    
    CONSTRAINT fk_work_at_room_num_clinic_id 	FOREIGN KEY (room_num, clinic_id)
		REFERENCES room(num, clinic_id)				
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS work_with
(
	nurse_id 			INT				PRIMARY KEY,
    doctor_id 			INT,
    
    CONSTRAINT fk_work_with_nurse_id 	FOREIGN KEY (nurse_id)
		REFERENCES nurse(id)						
        ON DELETE CASCADE,
        
    CONSTRAINT fk_work_with_doctoc_id 	FOREIGN KEY (doctor_id)
		REFERENCES doctor(id)						
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS patient_appointment
(
	patient_id 			INT,
    app_id 				INT,
    _status 			VARCHAR(50) DEFAULT "unconfirm",
    
    PRIMARY KEY (patient_id, app_id),
    
    CONSTRAINT app_of_patient_check_1
		CHECK (_status ="unconfirm" OR _status ="confirm" or _status="done"),
    
    CONSTRAINT fk_patient_appointment_patient_id 	FOREIGN KEY (patient_id)
		REFERENCES patient(id) 						
        ON DELETE CASCADE,
    
    CONSTRAINT fk_patient_appointment_app_id 		FOREIGN KEY (app_id)
		REFERENCES appointment(id) 					
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS medicine_in_clinic
(
	clinic_id 			INT,
    serial_num 			VARCHAR(50),
    quantity 			INT					NOT NULL DEFAULT 0,
    
    PRIMARY KEY (clinic_id, serial_num),
    
    CONSTRAINT medicine_in_clinic_check_1
		CHECK (quantity >= 0),
    
    CONSTRAINT fk_medicine_in_clinic_clinic_id 		FOREIGN KEY (clinic_id)
		REFERENCES clinic(id) 							
        ON DELETE CASCADE,
    
    CONSTRAINT fk_medicine_in_clinic_serial_num 	FOREIGN KEY (serial_num)
		REFERENCES medicine(serial_num) 				
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS prescription
(
	exam_id 			INT,
    serial_num			VARCHAR(50),
    _desc				VARCHAR(50),
    quantity 			INT					NOT NULL DEFAULT 0,
    
	PRIMARY KEY (exam_id, serial_num),
    
    CONSTRAINT prescription_check_1
		CHECK (quantity > 0),
    
    CONSTRAINT fk_prescription_exam_id		FOREIGN KEY (exam_id)
		REFERENCES examination(id)					
        ON DELETE CASCADE,
    
    CONSTRAINT fk_prescription_serial_num 	FOREIGN KEY (serial_num)
		REFERENCES medicine(serial_num)				
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS clinic_hotline(
	clinic_id 			INT,
    hotline				INT,
    
    PRIMARY KEY (clinic_id, hotline),
    
    CONSTRAINT fk_clinic_hotline_clinic_id 	FOREIGN KEY (clinic_id)
		REFERENCES clinic(id) 						
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS clinic_worktime
(
	clinic_id 			INT,
    weekdays			VARCHAR(15),
    open_time			TIME,
    close_time			TIME,
    
    PRIMARY KEY (clinic_id, weekdays, open_time, close_time),
    
    CONSTRAINT clinic_worktime_check_1 
		CHECK (open_time < close_time),
    
    CONSTRAINT fk_clinic_worktime_clinic_id 	FOREIGN KEY (clinic_id)
		REFERENCES clinic(id) 					
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS examination_allergy(
	exam_id 			INT,
    allergy				INT,
    
    PRIMARY KEY (exam_id, allergy),
    
    CONSTRAINT fk_patient_allergy_exam_id FOREIGN KEY (exam_id)
		REFERENCES examination(id) 						
        ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS=1;


DELIMITER //
CREATE TRIGGER insertDoctor
BEFORE INSERT ON medical_staff
FOR EACH ROW
BEGIN
	IF NEW.role = 'doctor' AND NEW.YOE < 3 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Số năm kinh nghiệm tối thiếu của bác sĩ là 3';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER registerAppointment 
BEFORE INSERT ON patient_appointment
FOR EACH ROW
BEGIN
	DECLARE timesUncomfirm INT;
    DECLARE cur_time TIME;
    DECLARE cur_date DATE;

    SET cur_time = CURRENT_TIME();
    SET cur_date = CURDATE();
    
    SELECT COUNT(*) INTO timesUncomfirm 
    FROM 	(SELECT * 
			FROM patient_appointment AS PA	
			WHERE PA.patient_id = NEW.patient_id 
            AND PA._status = 'unconfirm') AS PA, 
												(SELECT *
												FROM appointment AS A
												WHERE (A._date < cur_date) OR (A._date = cur_date AND A._time <= cur_time)) 
												AS A
    WHERE PA.app_id = A.id;
    
    IF timesUncomfirm >= 5 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Không thể đăng ký cuộc hẹn vì đã lỡ hẹn quá 5 lần';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER checkSalary
BEFORE INSERT ON medical_staff
FOR EACH ROW
BEGIN
	DECLARE min_salary_doctor INT;
    DECLARE max_salary_nurse INT;
    
	SELECT MIN(MS.salary) INTO min_salary_doctor
    FROM doctor AS D, medical_staff AS MS
    WHERE D.id = MS.id;
    
    SELECT MAX(MS.salary) INTO max_salary_nurse
    FROM nurse AS N, medical_staff AS MS
    WHERE N.id = MS.id;
    
    IF min_salary_doctor <= max_salary_nurse THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Lương của bác sĩ không thể thấp hơn hoặc bằng lương của y tá.';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER updateBill
BEFORE UPDATE ON bill
FOR EACH ROW
BEGIN
    IF NEW.is_paid THEN
        IF TIMESTAMPDIFF(DAY, NEW._timestamp, NOW()) > 5 THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Hóa đơn quá hạn thanh toán tối đa là 5 ngày!';
        END IF;
    END IF;
END //
DELIMITER ;


