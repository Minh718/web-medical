DELIMITER //
CREATE TRIGGER insertPatientAppointment
BEFORE INSERT ON patient_appointment
FOR EACH ROW
BEGIN
    DECLARE appointment_time TIME;
    DECLARE cur_time TIME;
    DECLARE appointment_date DATE;
    DECLARE cur_date DATE;

    DECLARE max_people INT;
    DECLARE cur_people INT;

    SET cur_time = CURRENT_TIME();
    SET cur_date = CURDATE();

    SELECT _date, _time, appointment.max_people, appointment.cur_people
    INTO appointment_date, appointment_time, max_people, cur_people
    FROM appointment
    WHERE appointment.id = NEW.app_id;

    -- Check if the appointment date is in the past
    IF appointment_date < cur_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lịch hẹn đã quá hạn';
    END IF;
    
    IF appointment_date = cur_date THEN
		IF appointment_time < cur_time THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lịch hẹn đã quá hạn.';
		END IF;
    
		-- Check if the appointment time is less than 30 minutes from the current time
		IF TIMEDIFF(appointment_time, cur_time) < '00:30:00' THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Không thể đặt lịch hẹn ít hơn 30 phút trước thời gian khám.';
		END IF;
	END IF;

    -- Check if the appointment time is less than 30 minutes from the current time
    IF TIMEDIFF(appointment_time, cur_time) < '00:30:00' AND appointment_date = cur_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể đặt lịch hẹn ít hơn 30 phút trước thời gian khám.';
    END IF;

    -- Check if the maximum number of people for the appointment is reached
    IF cur_people >= max_people THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số người khám tại một khung giờ đã tối đa.';
    END IF;

    -- Update the appointment status if the current number of people is one less than the maximum
    IF cur_people + 1 = max_people THEN
        UPDATE appointment SET is_full = 1 WHERE id = NEW.app_id;
    END IF;

    -- Update the current number of people
    UPDATE appointment 
    SET cur_people = cur_people + 1 
    WHERE id = NEW.app_id;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER cancelPatientAppointment
BEFORE DELETE ON patient_appointment
FOR EACH ROW
BEGIN
    DECLARE appointment_time TIME;
    DECLARE cur_time TIME;
    DECLARE appointment_date DATE;
    DECLARE cur_date DATE;

    SET cur_time = CURRENT_TIME();
    SET cur_date = CURDATE();

    SELECT _date, _time
    INTO appointment_date, appointment_time
    FROM appointment
    WHERE appointment.id = OLD.app_id;

    -- Check if the appointment date is in the past
    IF appointment_date < cur_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lịch hẹn đã qua và không thể hủy';
    END IF;
    
	IF appointment_date = cur_date THEN
		IF appointment_time < cur_time THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Lịch hẹn đã quá hạn.';
		END IF;
    
		-- Check if the appointment time is less than 30 minutes from the current time
		IF TIMEDIFF(appointment_time, cur_time) < '00:30:00' THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Chỉ có thể hủy lịch hẹn trước giờ hẹn 30 phút.';
		END IF;
	END IF;

    -- Check if the appointment time is less than 30 minutes from the current time
    IF TIMEDIFF(appointment_time, cur_time) < '00:30:00' AND appointment_date = cur_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Chỉ có thể hủy lịch hẹn trước giờ hẹn 30 phút';
    END IF;
    
    -- Update the current number of people
    UPDATE appointment 
    SET cur_people = cur_people - 1 
    WHERE id = OLD.app_id;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER insertExamination
BEFORE INSERT ON examination
FOR EACH ROW
BEGIN
    DECLARE total_price INT;
    DECLARE temp INT;
    
    -- Checking
	IF NOT EXISTS (SELECT * FROM service WHERE NEW.service_id = service.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Service không tồn tại';
    END IF;
    
    IF NOT EXISTS (SELECT * FROM patient WHERE NEW.patient_id = patient.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Patient không tồn tại';
    END IF;
    
    IF NOT EXISTS (SELECT * FROM doctor WHERE NEW.doctor_id = doctor.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Doctor không tồn tại';
    END IF;
    
    IF NOT EXISTS (SELECT * FROM appointment WHERE NEW.app_id = appointment.id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cuộc hẹn không tồn tại';
    END IF;
    -- End checking
    
    
    SELECT SUM(S.cost) INTO temp
    FROM service AS S
    WHERE NEW.service_id = S.id;
    SET total_price = temp;
    
    SELECT SUM(M.cost * P.quantity) INTO temp
    FROM medicine AS M,	(SELECT P.exam_id
						FROM prescription AS P
						WHERE NEW.id = P.exam_id) AS P
    WHERE M.serial_num = P.serial_num;
    
	SET total_price = total_price + temp;
    SET NEW.total_price = total_price;
END;
//

CREATE TRIGGER insertPrescription
AFTER INSERT ON prescription
FOR EACH ROW
BEGIN
	DECLARE total_cost INT;
	SELECT SUM(M.cost * P.quantity) INTO total_cost
    FROM medicine AS M,	(SELECT P.exam_id
						FROM prescription AS P
						WHERE NEW.id = P.exam_id) AS P
    WHERE M.serial_num = P.serial_num;
    
    UPDATE examination AS E
    SET E.total_price = E.total_price + total_cost
    WHERE NEW.exam_id = E.id;
END;
//

CREATE PROCEDURE insertBill(
	IN patient_id 	VARCHAR(255)
)
BEGIN
    DECLARE total_cost INT;
	IF NOT EXISTS(SELECT * FROM examination AS E WHERE E.patient_id = patient_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bệnh nhân không có nợ';
	END IF;
    
    SELECT SUM(E.total_price) INTO total_cost
    FROM examination AS E 
    WHERE E.patient_id = patient_id;
    
    INSERT INTO bill(total_cost) VALUES (total_cost);
    SET bill_id = LAST_INSERT_ID();
	
    UPDATE examination AS E
    SET E.bill_id = bill_id
    WHERE E.patient_id = patient_id;
END //
DELIMITER ;
