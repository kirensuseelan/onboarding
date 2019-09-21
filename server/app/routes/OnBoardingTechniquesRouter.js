
const express = require('express');
const router = express.Router();
var OnBoardingTechniquesController = require('../controller/OnBoardingTechniquesController');

router.route('/techniques')
    .get(OnBoardingTechniquesController.list_all_Techniques); 

router.route('/techniques/:techniquesId')
    .get(OnBoardingTechniquesController.get_a_techniqueById);

router.route('/mappedtechniques/:selectedGoals')
    .get(OnBoardingTechniquesController.get_mapped_techniques);

module.exports = router;