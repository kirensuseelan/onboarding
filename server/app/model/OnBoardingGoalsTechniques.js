var sql = require('./db.js');
var onBoardingTechniques = require('../model/onBoardingTechniquesModel');

var onBoardingGoalTechniques=function(goaltech){
    this.Id=goaltech.TechniquesId;
    this.Name=goaltech.Name;
    this.Description=goaltech.Description;
    this.isActive=false;
};


onBoardingGoalTechniques.getMappedTechniques = function (selectedGoals, result) {
    sql.query("CALL get_goals_techniques(?)", selectedGoals , function (err, res) {

            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{

                var onTechnique=[]
                res.forEach(tech => {
                    onTechnique.push(new onBoardingTechniques(tech));
                });
              result(null, onTechnique);
            }
        });   
};
