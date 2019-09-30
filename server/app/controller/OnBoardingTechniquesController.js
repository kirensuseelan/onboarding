var onBoardingTechniques = require('../model/onBoardingTechniquesModel');

exports.list_all_Techniques = function(req, res) {
    onBoardingTechniques.getAllTechniques(function(err, onBoardingTechniques) {
      if (err){
        res.send(err);
      }else{
      res.json(onBoardingTechniques);
      }
    });
  };

  exports.get_a_techniqueById = function(req, res) {
    onBoardingTechniques.getTechniquesById(req.params.techniquesId, function(err, onBoardingTechniques) {
      if (err)
        res.send(err);
      res.json(onBoardingTechniques);
    });
  };

  exports.get_mapped_techniques = function(req, res){
    onBoardingTechniques.getMappedTechniques(req.params.selectedGoals,function(err, onBoardingTechniques) {
      if (err)
        res.send(err);
      res.json(onBoardingTechniques);
    });
  };