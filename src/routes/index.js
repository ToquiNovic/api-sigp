const router = require("express").Router();

router.use("/usuarios", require("./usuarios"));

router.use("/login", require("./login"));
router.use("/inventario", require("./inventario"));
router.use("/forgetuser", require("./forgetUser"));

module.exports = router;
