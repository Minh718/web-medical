USE clinicSystemDB;

DELIMITER //
CREATE FUNCTION isValidEmail(
	email	VARCHAR(100)
) 
RETURNS BOOL READS SQL DATA
BEGIN
    DECLARE email_pattern VARCHAR(100);
	SET email_pattern = '^[A-Z|a-z|0-9|.|_|%|-]+@[A-Z|a-z|0-9|.|-]+\.[A-Z|a-z]{2,4}$';
	RETURN email REGEXP email_pattern;
END //

CREATE FUNCTION isValidPhoneNumber(
	phone_num	VARCHAR(20)
)
RETURNS BOOL READS SQL DATA
BEGIN
	DECLARE phone_num_pattern VARCHAR(20);
	SET phone_num_pattern = '^[0-9]{10,11}$';
	RETURN phone_num REGEXP phone_num_pattern;
END //

CREATE FUNCTION checkSalary(
	salary 	INT,
    _type 	VARCHAR(20)
)
RETURNS BOOL READS SQL DATA
BEGIN
	DECLARE min_salary_doctor INT;
    DECLARE max_salary_nurse INT;

	IF NOT EXISTS (SELECT * FROM doctor) THEN 
		RETURN TRUE;
	END IF;
    
    IF NOT EXISTS (SELECT * FROM nurse) THEN
		RETURN TRUE;
	END IF;

	SELECT MIN(MS.salary) INTO min_salary_doctor
    FROM doctor AS D, medical_staff AS MS
    WHERE D.id = MS.id;
    
    SELECT MAX(MS.salary) INTO max_salary_nurse
    FROM nurse AS N, medical_staff AS MS
    WHERE N.id = MS.id;
    
    IF _type = 'doctor' THEN
		IF salary <= max_salary_nurse THEN
			RETURN FALSE;
		ELSE 
			RETURN TRUE;
		END IF;
    ELSE 
		IF salary >= min_salary_doctor THEN
			RETURN FALSE;
        ELSE
			RETURN TRUE;
        END IF;
    END IF;
    
END //


CREATE PROCEDURE insertPatient(
    IN fname		VARCHAR(20),
    IN minit    	VARCHAR(20),
    IN lname		VARCHAR(20),
    IN gender 		VARCHAR(10),
    IN birthdate 	VARCHAR(20),
    IN addr			VARCHAR(255),
    IN email		VARCHAR(50),
	IN phone_num	VARCHAR(15),
    IN username		VARCHAR(50),
    IN _password	VARCHAR(255)
)
BEGIN
    IF LENGTH(fname) <= 1 OR LENGTH(lname) <= 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tên có độ dài quá ngắn! Họ hoặc tên phải > 1 kí tự';
    END IF;

    IF NOT (gender = 'male' OR gender = 'female' OR gender = 'other') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Giới tính không hợp lệ! Chỉ có 3 giá trị: male, female và other';
	END IF;
    
	IF STR_TO_DATE(birthdate, '%d-%m-%Y') IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày sinh không hợp lệ! Định dạng ngày sinh là %d-%m-%Y';
	END IF;
      
	IF STR_TO_DATE(birthdate, '%d-%m-%Y') > CURDATE() THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày sinh phải là ngày trong quá khứ!';
	END IF;
      
	IF EXISTS (SELECT email FROM _user WHERE _user.email = email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email đã được sử dụng!';
	END IF;
      
    IF NOT (SELECT isValidEmail(email)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email không hợp lệ!';
	END IF;
      
    IF NOT (SELECT isValidPhoneNumber(phone_num)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Số điện thoại không hợp lệ! Độ dài từ 10 đến 11 số';
	END IF;
      
	IF LENGTH(username) < 6 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username ít nhất có 6 kí tự!';
	END IF;
      
	IF EXISTS (SELECT username FROM _user WHERE _user.username = username) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username đã tồn tại!';
	END IF;
    
    IF LENGTH(_password) < 8 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu phải chứa ít nhất 8 ký tự.';
	END IF;
    
	IF NOT _password REGEXP '^(?=.*[0-9])(?=.*[a-zA-Z]).+$' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu phải chứa ít nhất một chữ cái và một số!';
    END IF;
    
    INSERT INTO _user(fname, minit, lname, gender, birthdate, addr, email, phone_num, username, _password)
    VALUES (fname, minit, lname, gender, STR_TO_DATE(birthdate, '%d-%m-%Y'), addr, email, phone_num, username, _password);

    INSERT INTO patient(id)
    VALUES (LAST_INSERT_ID());
    
END //

CREATE PROCEDURE insertMedicalStaff(
    IN fname		VARCHAR(20),
    IN minit    	VARCHAR(20),
    IN lname		VARCHAR(20),
    IN gender 		VARCHAR(10),
    IN birthdate 	VARCHAR(20),
    IN addr			VARCHAR(255),
    IN email		VARCHAR(50),
	IN phone_num	VARCHAR(15),
    IN username		VARCHAR(50),
    IN _password	VARCHAR(255),
    
    IN YOE				INT,
    IN license_number 	VARCHAR(50),
    IN salary			INT,
    IN specialty		VARCHAR(50), -- If nurse, this field is null
    
    IN _type       	VARCHAR(20)
)
BEGIN
	DECLARE last_insert_id INT;
    
    IF LENGTH(fname) <= 1 OR LENGTH(lname) <= 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tên có độ dài quá ngắn! Họ hoặc tên phải > 1 kí tự';
    END IF;

    IF NOT (gender = 'male' OR gender = 'female' OR gender = 'other') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Giới tính không hợp lệ! Chỉ có 3 giá trị: male, female và other';
	END IF;
    
	IF STR_TO_DATE(birthdate, '%d-%m-%Y') IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày sinh không hợp lệ! Định dạng ngày sinh là %d-%m-%Y';
	END IF;
      
	IF STR_TO_DATE(birthdate, '%d-%m-%Y') > DATE_ADD(CURDATE(), INTERVAL -18 YEAR) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nhân viên y tế phải trên 18 tuổi!';
	END IF;
      
	IF EXISTS (SELECT email FROM _user WHERE _user.email = email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email đã được sử dụng!';
	END IF;
      
    IF NOT (SELECT isValidEmail(email)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email không hợp lệ!';
	END IF;
      
    IF NOT (SELECT isValidPhoneNumber(phone_num)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Số điện thoại không hợp lệ! Độ dài từ 10 đến 11 số';
	END IF;
      
	IF LENGTH(username) < 6 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username ít nhất có 6 kí tự!';
	END IF;
      
	IF EXISTS (SELECT username FROM _user WHERE _user.username = username) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username đã tồn tại!';
	END IF;
    
    IF LENGTH(_password) < 8 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu phải chứa ít nhất 8 ký tự.';
	END IF;
    
	IF NOT _password REGEXP '^(?=.*[0-9])(?=.*[a-zA-Z]).+$' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu phải chứa ít nhất một chữ cái và một số!';
    END IF;

	IF NOT (_type = 'doctor' OR _type = 'nurse') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Chỉ có hai loại: `doctor` và `nurse`';
    END IF;
    
    IF _type = 'doctor' AND specialty = NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bác sĩ phải có tên chuyên ngành!';
    END IF;
    
    IF license_number = NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'license_number khác NULL';
    END IF;
    
    IF _type = 'doctor' AND YOE < 3 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Bác sĩ phải có ít nhất 3 năm kinh nghiệm';
    END IF;
    
    IF NOT checkSalary(salary, _type) THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Lương của bác sĩ không thể thấp hơn hoặc bằng lương của y tá.';
    END IF;
    
	-- Insert
    
    INSERT INTO _user(fname, minit, lname, gender, birthdate, addr, email, phone_num, username, _password)
    VALUES (fname, minit, lname, gender, STR_TO_DATE(birthdate, '%d-%m-%Y'), addr, email, phone_num, username, _password);
    
    SET last_insert_id = LAST_INSERT_ID();
    
	INSERT INTO medical_staff(id, YOE, license_number, salary)
    VALUES (last_insert_id, YOE, license_number, salary);
    
    IF _type = "doctor" THEN
		INSERT INTO doctor(id, specialty)
		VALUES (last_insert_id, specialty);
    ELSE
		INSERT INTO nurse(id)
		VALUES (last_insert_id);
	END IF;
END //

CREATE PROCEDURE updateInfoUser(
    IN id       	INT,
    IN fname		VARCHAR(20),
    IN minit    	VARCHAR(20),
    IN lname		VARCHAR(20),
    IN gender 		VARCHAR(10),
    IN birthdate 	VARCHAR(20),
    IN addr			VARCHAR(255),
    IN email		VARCHAR(50),
	IN phone_num	VARCHAR(15)
)
BEGIN
	IF LENGTH(fname) <= 1 OR LENGTH(lname) <= 1 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tên có độ dài quá ngắn! Họ hoặc tên phải > 1 kí tự';
	END IF;

	IF NOT (gender = 'male' OR gender = 'female' OR gender = 'other') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Giới tính không hợp lệ! Chỉ có 3 giá trị: NAM, NỮ và KHÁC';
	END IF;

	IF STR_TO_DATE(birthdate, '%d-%m-%Y') IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày sinh không hợp lệ! Định dạng ngày sinh là %d-%m-%Y';
	END IF;
  
	IF STR_TO_DATE(birthdate, '%d-%m-%Y') > CURDATE() THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày sinh phải là ngày trong quá khứ!';
	END IF;
  
	IF EXISTS (SELECT email FROM _user WHERE _user.email = email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email đã được sử dụng!';
	END IF;
  
	IF NOT (SELECT isValidEmail(email)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email không hợp lệ!';
	END IF;
  
	IF NOT (SELECT isValidPhoneNumber(phone_num)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Số điện thoại không hợp lệ! Độ dài từ 10 đến 11 số';
	END IF;
  
	UPDATE _user
	SET _user.fname = fname, _user.minit = minit, _user.lname = lname, 
		_user.gender = gender, _user.birthdate = birthdate, 
        _user.addr = addr, _user.email = email, _user.phone_num = phone_num
	WHERE _user.id = id;
END //

CREATE PROCEDURE updatePasswordById(
	IN id			INT,
	IN _password	VARCHAR(255),
	IN newPassword  VARCHAR(255)
)
BEGIN
	DECLARE passwordUser VARCHAR(255);
	IF NOT EXISTS(SELECT username FROM _user WHERE _user.id = id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User không tồn tại';
	END IF;
    
	IF LENGTH(newPassword) < 8 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu mới phải ít nhất có 8 kí tự';
	END IF;
    
    IF NOT newPassword REGEXP '^(?=.*[0-9])(?=.*[a-zA-Z]).+$' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu mới phải chứa ít nhất một chữ cái và một số!';
    END IF;
    
	SELECT _user._password INTO passwordUser FROM _user WHERE _user.id = id;
	IF _password != passwordUser THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu hiện tại không chính xác';
	END IF;
    
	UPDATE _user
	SET _user._password = newPassword
	WHERE _user.id = id;
END //

CREATE PROCEDURE deactiveUserById(
    IN id		INT
)
BEGIN
	IF NOT EXISTS (SELECT * FROM _user AS U WHERE U.id = id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id không tồn tại';
    END IF;
    
	UPDATE _user
    SET _user.is_active = FALSE
    WHERE _user.id = id;
END // 

CREATE PROCEDURE deleteUserById(
    IN id		INT
)
BEGIN
    IF EXISTS (SELECT * FROM patient AS P WHERE P.id = id) THEN
		IF EXISTS (SELECT * FROM patient_appointment AS PA WHERE PA.patient_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng patient_appointment';
        END IF;
        
        IF EXISTS (SELECT * FROM examination AS E WHERE E.patient_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng examination';
        END IF;
    END IF;
    
    IF EXISTS (SELECT * FROM medical_staff AS MS WHERE MS.id = id) THEN
		IF EXISTS (SELECT * FROM work_at WHERE work_at.ms_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng work_at';
        END IF;
		
        IF EXISTS (SELECT * FROM room WHERE room.doctor_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng room';
        END IF;
        
        IF EXISTS (SELECT * FROM examination WHERE examination.doctor_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng examination';
        END IF;
        
        IF EXISTS (SELECT * FROM work_with WHERE work_with.doctor_id = id OR work_with.nurse_id = id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết với bảng work_with';
        END IF;
    END IF;
END //

CREATE PROCEDURE setActiveById(
	IN id		INT
)
BEGIN
	IF NOT EXISTS (SELECT * FROM _user AS U WHERE U.id = id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không tìm thấy id của user!';
    END IF;
    
    UPDATE _user AS U
    SET U.is_active = TRUE
    WHERE U.id = id;
END//

CREATE PROCEDURE setAdminById(
	IN id		INT
)
BEGIN
	DECLARE is_active BOOL;
	IF NOT EXISTS (SELECT * FROM _user AS U WHERE U.id = id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không tìm thấy id của user!';
    END IF;
    
    SELECT U.is_active INTO is_active
    FROM _user AS U
    WHERE U.id = id;
    IF NOT is_active THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tài khoản bị vô hiệu hóa!';
    END IF;
    
    UPDATE _user AS U
    SET U.is_admin = TRUE
    WHERE U.id = id;
END
DELIMITER ;



