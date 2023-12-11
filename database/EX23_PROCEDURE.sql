DELIMITER //
CREATE PROCEDURE GetAppointmentStatus(
    IN begin_date	DATE,
    IN end_date 	DATE,
    IN clinic_id INT
)
BEGIN
    SELECT
        a.id AS appointment_id,
        a._time AS time_start ,
        a._end_time AS time_end ,
        a.cur_people AS people_registed,
        a.max_people AS max_people,
        a._date AS date,
        COUNT(CASE WHEN p._status = 'done' THEN 1 END) AS count_confirm,
        COUNT(CASE WHEN p._status = 'unconfirm' THEN 1 END) AS count_unconfirm
    FROM
        appointment a JOIN patient_appointment p ON a.id = p.app_id
    WHERE
        a._date >= begin_date
            AND a._date <= end_date
        AND a.clinic_id = clinic_id
    GROUP BY
        a.id
    ORDER BY
        a.cur_people DESC ;

END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE statisticsRegularPatients(
    IN begin_date	DATE,
    IN end_date 	DATE,
    IN clinic_id INT
)
BEGIN
    SELECT
		u.id,
        u.fname,
        u.minit,
        u.lname,
        u.birthdate,
        u.addr,
        u.email,
        u.phone_num,
        a._date,
         COUNT(u.id) AS lankham
    FROM
        appointment a 
        JOIN patient_appointment pa ON a.id = pa.app_id
        JOIN patient p ON pa.patient_id = p.id
        JOIN _user u on u.id = p.id
    WHERE
        a._date >= begin_date
            AND a._date <= end_date
        AND a.clinic_id = clinic_id AND
        pa._status = 'done'
    GROUP BY
        p.id
    ORDER BY
        COUNT(p.id) DESC;
END //

DELIMITER ;



