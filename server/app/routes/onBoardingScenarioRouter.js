
const express = require('express');
const router = express.Router();
var OnBoardingScenarioController = require('../controller/onBoardingScenarioController');

router.route('/Scenarios')
    .get(OnBoardingScenarioController.list_all_Scenario); 

router.route('/Scenarios/:id')
    .get(OnBoardingScenarioController.list_Scenario_ByScenarioID); 

module.exports = router;