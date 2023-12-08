const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const userRouter = require("./routes/user");
const clinicRouter = require("./routes/clinic");

const port = 8800;
const app = express();
app.use(cors());
app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(morgan("common"));
app.use(express.json());
app.use("/api/users", userRouter);
app.use("/api/clinics", clinicRouter);

app.listen(process.env.PORT || port, (req, res) => {
  console.log("đã kết nối cổng 8800");
});