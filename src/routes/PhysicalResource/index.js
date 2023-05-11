const router = require("express").Router();

router.use("/", require("./PhysicalResource"));
router.use("/searchRecurse", require("./SearchBar"));

module.exports = router;