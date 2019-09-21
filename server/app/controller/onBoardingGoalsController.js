var onBoardingGoals = require('../model/onBoardingGoalsModel.js');

exports.list_all_Goals = function(req, res) {
    onBoardingGoals.getAllGoals(function(err, onBoardingGoals) {
      if (err){
        res.send(err);
      }else{
      res.json(onBoardingGoals);
      }
    });
  };

  exports.get_a_goalById = function(req, res) {
    onBoardingGoals.getGoalsById(req.params.goalId, function(err, onBoardingGoals) {
      if (err)
        res.send(err);
      res.json(onBoardingGoals);
    });
  };