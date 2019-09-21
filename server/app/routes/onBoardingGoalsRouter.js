
const express = require('express');
const router = express.Router();
var onBoardingGoalsController = require('../controller/onBoardingGoalsController.js');

router.route('/goals')
    .get(onBoardingGoalsController.list_all_Goals); 


router.route('/onBoardingGoals/:goalsId')
    .get(onBoardingGoalsController.get_a_goalById);

module.exports = router;