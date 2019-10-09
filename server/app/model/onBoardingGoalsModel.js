var sql = require('./db.js');

var onBoardingGoals=function(onboardinggoal){
    this.Id=onboardinggoal.GoalsID;
    this.Name=onboardinggoal.Name;
    this.Description=onboardinggoal.Description;
    this.isActive=false;
};


onBoardingGoals.getGoalsById = function (goalId, result) {
    sql.query("Select name from goals where id = ? ", goalId, function (err, res) {             
            if(err) {
                // console.log("error: ", err);
                result(err, null);
            }
            else{
                result(null, res);
          
            }
        });   
};
onBoardingGoals.getAllGoals = function (result) {
    sql.query("Select * from goals", function (err, res) {

            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{
                var ongoal=[]
                res.forEach(goal => {
                    ongoal.push(new onBoardingGoals(goal));
                });
              result(null, ongoal);
            }
        });   
};


module.exports= onBoardingGoals;