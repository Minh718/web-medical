DELIMITER //

CREATE FUNCTION findClinicByExamId
(
	exam_id INT
)
RETURNS INT
BEGIN
	DECLARE app_id INT;
    DECLARE clinic_id INT;
    
	SELECT E.app_id INTO app_id
    FROM examination AS E
    WHERE E.id = exam_id;
    
    SELECT clinic_id INTO clinic_id
    FROM appointment AS A
    WHERE A.id = app_id;

	RETURN clinic_id;
END //


CREATE PROCEDURE setRoomManager
(
    IN room_num 	INT,
    IN clinic_id 	INT,
	IN doctor_id 	INT
)
BEGIN
	UPDATE room AS R
    SET R.doctor_id = doctor_id, R.is_active = TRUE
    WHERE R.num = room_num AND R.clinic_id = clinic_id;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER checkMedicineQuantity
BEFORE INSERT ON prescription
FOR EACH ROW
BEGIN
	DECLARE clinic_id INT;
    DECLARE remaining_quantity INT;
    SET clinic_id = findClinicByExamId(NEW.exam_id);

    SELECT MIC.quantity INTO remaining_quantity
    FROM medicine_in_clinic AS MIC
    WHERE MIC.clinic_id = clinic_id AND MIC.serial_num = NEW.serial_num;

	IF remaining_quantity < NEW.quantity THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quá số lượng thuốc trong phòng khám';
	END IF;

	UPDATE medicine_in_clinic AS MIC
    SET MIC.quantity = MIC.quantity - NEW.quantity
    WHERE MIC.clinic_id = clinic_id AND MIC.serial_num = NEW.serial_num;
END //
DELIMITER ;


