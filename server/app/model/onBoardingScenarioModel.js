var sql = require('./db.js');
var onboardingCharacteristicsModel=require('./onBoardingCharacteristics')

var onBoardingScenario=function(scenario){
    this.Id=scenario.scenarioID;
    this.Name=scenario.scenario;
    this.Description=scenario.scenarioDescription;
    this.CharacteristicsGroup=[];
};


onBoardingScenario.getAllScenario = function (result) {
    sql.query("Select * from onboardingscenario", function (err, res) {

            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{
                var onscenario=[]
                res.forEach(scenario => {
                    onscenario.push(new onBoardingScenario(scenario));
                   
                });
              result(null, onscenario);
            }
        });   
};

module.exports=onBoardingScenario;