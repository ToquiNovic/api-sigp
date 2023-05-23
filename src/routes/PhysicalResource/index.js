const router = require("express").Router();

router.use("/", require("./PhysicalResource"));
router.use("/searchRecurse", require("./SearchBar"));
router.use("/reservas", require("./Reservas"));
router.use("/details" , require("./detailPhysicalResource"));

module.exports = router;