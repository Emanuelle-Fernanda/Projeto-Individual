var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/guardar", function (req, res){
    quizController.guardar(req, res);
})

module.exports = router;