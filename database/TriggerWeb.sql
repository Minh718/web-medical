DELIMITER //
CREATE PROCEDURE loginUser(
    IN username		VARCHAR(50),
    IN _password	VARCHAR(255)
)
BEGIN
	DECLARE passwordUser VARCHAR(255);
	IF NOT EXISTS (SELECT username FROM _user WHERE _user.username = username) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tên đăng nhập không chính xác';
	END IF;
    
	SELECT _user._password INTO passwordUser FROM _user WHERE _user.username = username;

	IF _password != passwordUser THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Mật khẩu không chính xác';
	END IF;
    
	SELECT * from _user where  _user.username = username; 
END //
DELIMITER ;