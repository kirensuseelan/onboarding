var onBoardingCharacteristics = require('../model/onBoardingCharacteristics');

exports.list_all_GroupsWithCharacteristics = function(req, res) {
    onBoardingCharacteristics.getAll(function(err, onBoardingCharacter) {
      if (err){
        res.send(err);
      }else{
      res.json(onBoardingCharacter);
      }
    });
  };
