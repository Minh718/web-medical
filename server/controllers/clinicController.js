const createConnection = require("../config/database");

const clinicController = {
    getClinics: async (req, res) => {
        const id = req.params.idUser;;
        const connection = await createConnection();
        try {
          let sql = `SELECT * from clinic`;
          // console.log(sql)
          const result = await connection.query(sql);
          res.status(200).json(result);
        } catch (err) {
          res.status(500).json({error: err});
        } finally {
          await connection.end();
        }
      },
      getStasusAppsInDate: async (req, res) => {
        const id = req.body.id;
        const date = req.body.date;
        const connection = await createConnection();
        try {
          let sql = `CALL GetAppointmentStatus('${date}',${id})`;
          // console.log(sql)
          const result = await connection.query(sql);
          res.status(200).json(result);
        } catch (err) {
          res.status(500).json({error: err});
        } finally {
          await connection.end();
        }
      },
      updateApp: async (req, res) => {
        const id = req.body.id;
        const startTime = req.body.startTime;
        const endTime = req.body.endTime;
        const maxPeople = req.body.maxPeople;
        const date = req.body.date;
        const connection = await createConnection();
        try {
          let sql = `UPDATE appointment SET appointment._time = '${startTime}', appointment._end_time = '${endTime}',appointment.max_people = ${maxPeople} WHERE appointment.id = ${id};`;
          const result = await connection.query(sql);
          res.status(200).json(result);
        } catch (err) {
          res.status(500).json({error: err});
        } finally {
          await connection.end();
        }
      },
      deleteApp: async (req, res) => {
        const id = req.params.idApp;;
        const connection = await createConnection();
        try {
          let sql = `DELETE FROM  appointment WHERE appointment.id = ${id}`;
          // console.log(sql)
          const result = await connection.query(sql);
          res.status(200).json(result);
        } catch (err) {
          res.status(500).json({error: err});
        } finally {
          await connection.end();
        }
      },
};

module.exports = clinicController;