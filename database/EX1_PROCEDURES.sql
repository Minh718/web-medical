USE clinicSystemDB;

DELIMITER //
CREATE FUNCTION isValidEmail(email VARCHAR(100)) 
  RETURNS BOOL reads sql data
  BEGIN
    DECLARE email_pattern VARCHAR(100);
      SET email_pattern = '^[A-Z|a-z|0-9|.|_|%|-]+@[A-Z|a-z|0-9|.|-]+\.[A-Z|a-z]{2,4}$';
      RETURN email REGEXP email_pattern;
  END //


  CREATE FUNCTION isValidPhoneNumber(phone_num VARCHAR(15))
  RETURNS BOOL reads sql data
  BEGIN
    DECLARE phone_num_pattern VARCHAR(15);
      SET phone_num_pattern = '^[0-9]{10,11}$';
      RETURN phone_num REGEXP phone_num_pattern;
  END //


CREATE PROCEDURE insertUser(
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
    IN type       VARCHAR(20)
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
      
      IF LENGTH(username) < 6 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username ít nhất có 6 kí tự!';
      END IF;
      
      IF EXISTS (SELECT username FROM _user WHERE _user.username = username) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username đã tồn tại!';
      END IF;
      
    INSERT INTO _user(fname, minit, lname, gender, birthdate, addr, email, phone_num, username, _password, type)
    VALUES (fname, minit, lname, gender, STR_TO_DATE(birthdate, '%d-%m-%Y'), addr, email, phone_num, username, _password, type);
      
  END //

CREATE PROCEDURE updateInfoUser(
    IN id       INT,
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
  SET _user.fname = fname, _user.minit = minit, _user.lname = lname, _user.gender = gender, _user.birthdate = birthdate, _user.addr = addr, _user.email = email, _user.phone_num = phone_num
	WHERE _user.id = id;
    
  END //
CREATE PROCEDURE updatePasswordById(
	IN id	INT,
  IN _password			VARCHAR(255),
  IN newPassword  		VARCHAR(255)
  )
  BEGIN
	DECLARE passwordUser VARCHAR(255);
    IF NOT EXISTS(SELECT username FROM _user WHERE _user.id = id) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User không tồn tại';
      END IF;
    IF LENGTH(newPassword) < 8 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu mới phải ít nhất có 8 kí tự';
      END IF;
	SELECT _user._password INTO passwordUser FROM _user WHERE _user.id = id;
	IF SHA2(_password, 256) != passwordUser THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu hiện tại không chính xác';
	END IF;
      UPDATE _user
      SET _user._password = SHA2(newPassword, 256)
      WHERE _user.id = id;
  END //

CREATE PROCEDURE deleteUserById(
    IN id		INT
  )
  BEGIN
    DECLARE _type VARCHAR(20);
    DECLARE is_active BIT;
    IF NOT EXISTS(SELECT id FROM _user WHERE _user.id = id) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Id của user không tồn tại';
      END IF;
    SELECT type, _user.is_active INTO _type, is_active FROM _user where _user.id = id;
    if _type = 'staff' AND is_active = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Không thể xóa tài khoản vì có liên kết dữ liệu';
    END IF;
      DELETE FROM _user WHERE _user.id = id;	
  END //

  DELIMITER ;



