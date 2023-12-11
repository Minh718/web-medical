DELIMITER //
CREATE FUNCTION revenueOfClinic(
	clinic_id 	INT, 
    start_date 	DATE,
    end_date	DATE
)
RETURNS INT
BEGIN
    DECLARE revenue INT;
    
    SELECT SUM(total_cost) INTO revenue
    FROM 	(SELECT *
			FROM bill
			WHERE start_date <= bill._timestamp 
			AND bill._timestamp <= end_date) AS B, 
            
			(SELECT E.bill_id, E.app_id
			FROM examination AS E
			GROUP BY E.bill_id, E.app_id) AS B_A,
            
            appointment AS A
    WHERE B.id = B_A.bill_id AND B_A.app_id = A.id AND A.clinic_id = clinic_id;
    
    RETURN revenue;
END //


CREATE PROCEDURE topDoctor(
    IN start_date 	DATE,
    IN end_date		DATE
)
BEGIN
    DECLARE most_times INT;

    SELECT MAX(times) INTO most_times
    FROM (
        SELECT COUNT(*) AS times
        FROM examination AS E
        WHERE start_date <= E._timestamp AND E._timestamp <= end_date
        GROUP BY E.doctor_id
    ) AS E
    LIMIT 1;

    SELECT U.id AS doctor_id, U.fname, U.minit, U.lname, U.gender, U.birthdate, COUNT(*) AS times
    FROM examination AS E
    INNER JOIN 
        medical_staff AS MS ON E.doctor_id = MS.id
    INNER JOIN 
        _user AS U ON MS.id = U.id
    WHERE E._timestamp BETWEEN start_date AND end_date
    GROUP BY E.doctor_id
    HAVING times = most_times;
END //


CREATE PROCEDURE appointmentStatistic(
	IN start_time 	TIME,	
	IN start_date 	DATE,
    IN end_time		TIME,
    IN end_date		DATE
)
BEGIN
	SELECT 	PA._status, COUNT(*) AS total_times
    FROM 	patient_appointment AS PA,
			(SELECT *
			FROM appointment AS A
			WHERE 	(start_date < A._date OR (start_date = A._date AND start_time <= A._time)) 
			AND (A._date < end_date OR (A._date = end_date AND A._time <= end_time)))
            AS A
    WHERE PA.app_id = A.id
    GROUP BY PA._status;
END //


CREATE PROCEDURE countPatientsForExamination(
	IN clinic_id 	INT,
	IN start_time 	TIME,	
	IN start_date 	DATE,
    IN end_time		TIME,
    IN end_date		DATE
)
BEGIN
	SELECT 	PA._status, COUNT(*) AS count
    FROM 	patient_appointment AS PA,
			(SELECT *
			FROM appointment AS A
			WHERE 	A.clinic_id = clinic_id
					AND (start_date < A._date OR (start_date = A._date AND start_time <= A._time)) 
					AND (A._date < end_date OR (A._date = end_date AND A._time <= end_time)))
            AS A
    WHERE PA.app_id = A.id
    GROUP BY PA._status
    HAVING PA._status = "done";
END //
DELIMITER ;


