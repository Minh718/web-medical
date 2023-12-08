const clinicRouter = require("express").Router();
const clinicController = require("../controllers/clinicController");

clinicRouter.get("/", clinicController.getClinics);
clinicRouter.post("/appsInDate", clinicController.getStasusAppsInDate);
clinicRouter.post("/updateApp", clinicController.updateApp);
clinicRouter.get("/delete_app/:idApp", clinicController.deleteApp);
module.exports = clinicRouter;