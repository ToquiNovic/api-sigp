const router = require("express").Router();

router.use("/usuarios", require("./usuarios"));

router.use("/login", require("./login"));
router.use("/inventario", require("./inventario"));
router.use("/forgetuser", require("./forgetUser"));
router.use("/email", require("./sendEmail"));

module.exports = router;
