
const express = require('express');
const router = express.Router();
var OnBoardingCharacteristicsController = require('../controller/OnBoardingCharacteristicsController');

router.route('/Characteristics')
    .get(OnBoardingCharacteristicsController.list_all_GroupsWithCharacteristics); 

module.exports = router;
