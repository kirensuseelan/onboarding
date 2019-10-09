var onBoardingScenarioModel = require('../model/onBoardingCharacteristics');

exports.list_all_Scenario = function(req, res) {
    onBoardingScenarioModel.getAllScenario(function(err, onBoardingScenario) {
      if (err){
        res.send(err);
      }else{
      res.json(onBoardingScenario);
      }
    });
  };

  exports.list_Scenario_ByScenarioID = function(req, res) {
    onBoardingScenarioModel.getScenario_ByID(req.params.id, (function(err, onBoardingScenario) {
      if (err){
        res.send(err);
      }else{
      res.json(onBoardingScenario);
      }
    })
    )
  };