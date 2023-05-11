const router = require("express").Router();

router.use("/usuarios", require("./usuarios"));

router.use("/login", require("./login"));
router.use("/inventario", require("./inventario"));
router.use("/forgetuser", require("./forgetUser"));
router.use("/email", require("./sendEmail"));
router.use("/tipoid", require("./TipoIdentificacion"));
router.use("/singup", require("./singUp"));
router.use("/physicalresourse", require("./PhysicalResource"));


module.exports = router;
