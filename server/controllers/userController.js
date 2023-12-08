const createConnection = require("../config/database");

const userController = {
  registerUser: async (req, res) => {
    const fname = req.body.fname;
    const minit = req.body.minit;
    const lname = req.body.lname;
    const gender = req.body.gender;
    const address = req.body.address;
    const phone = req.body.phone;
    const email = req.body.email;
    const birthdate = req.body.birthdate;
    const username = req.body.username;
    const password = req.body.password;
    const connection = await createConnection();
    try {
      try {
        let sql = `CALL insertUser('${fname}','${minit}','${lname}','${gender}','${birthdate}','${address}','${email}','${phone}','${username}','${password}','user')`;
        const result = await connection.query(sql);
        return res.status(200).json(result);
      } catch (e) {
        return res.status(500).json({ error: e });
      }
    } catch (err) {
      return res.status(500).json({ error: err });
    } finally {
      await connection.end();
    }
  },
  loginUser: async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    const connection = await createConnection();
    try {
      let sql = `CALL loginUser('${username}','${password}')`;
      const result = await connection.query(sql);
      return res.status(200).json(result);
    } catch (err) {
      res.status(500).json({ error: err });
    } finally {
      await connection.end();
    }
  },
  changePassword: async (req, res) => {
    const id = req.body.id;
    const password = req.body.password;
    const newPassword = req.body.newPassword;
    const connection = await createConnection();
    try {
      let sql = `CALL updatePasswordById( ${id},'${password}','${newPassword}')`;
     console.log(sql)
      const result = await connection.query(sql);
      return res.status(200).json(result);
    } catch (err) {
      res.status(500).json({ error: err });
    } finally {
      await connection.end();
    }
  },
  updateUserInfo: async (req, res) => {
    const id = req.body.id;
    const fname = req.body.fname;
    const minit = req.body.minit;
    const lname = req.body.lname;
    const gender = req.body.gender;
    const address = req.body.address;
    const phone = req.body.phone;
    const email = req.body.email;
    const birthdate = req.body.birthdate;
    const connection = await createConnection();
    try {
      let sql = `CALL updateInfoUser(${id},'${fname}','${minit}','${lname}','${gender}','${birthdate}','${address}','${email}','${phone}')`;
      // console.log(sql)
      const result = await connection.query(sql);
      res.status(200).json(result);
    } catch (err) {
      res.status(500).json({error: err});
    } finally {
      await connection.end();
    }
  },
  deleteUser: async (req, res) => {
    const id = req.params.idUser;;
    const connection = await createConnection();
    try {
      let sql = `CALL deleteUserById(${id})`;
      // console.log(sql)
      const result = await connection.query(sql);
      res.status(200).json(result);
    } catch (err) {
      res.status(500).json({error: err});
    } finally {
      await connection.end();
    }
  },
  getPeopleInMonth: async (req, res) => {
    const id = req.body.id;
    const month = req.body.month;
    const connection = await createConnection();
    try {
      let sql = `CALL getPeopleVisitInTheMonth(${month},${id})`;
      const result = await connection.query(sql);
      res.status(200).json(result);
    } catch (err) {
      res.status(500).json({error: err});
    } finally {
      await connection.end();
    }
  },
};

module.exports = userController;