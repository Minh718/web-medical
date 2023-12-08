const userRouter = require("express").Router();
const userController = require("../controllers/userController");

userRouter.post("/register", userController.registerUser);
userRouter.post("/login", userController.loginUser);
userRouter.post("/update_info", userController.updateUserInfo);
userRouter.post("/change_password", userController.changePassword);
userRouter.get("/delete_user/:idUser", userController.deleteUser);
userRouter.post("/month", userController.getPeopleInMonth);

module.exports = userRouter;