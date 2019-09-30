var sql = require('./db.js');

var onBoardingCharacteristicGroup=function(characteristicGroup){
    this.Id=characteristicGroup.GroupID;
    this.Name=characteristicGroup.Name;
    this.Description=characteristicGroup.Description;
    this.charecteristicsMapped=[];
};

var onBoardingCharacteristics=function(characteristics){
    this.Id=characteristics.characteristicsID;
    this.Name=characteristics.characteristic;
    this.Description=characteristics.shortForm;
    this.answersMapped=[];
    this.AnsweredID=0;
    this.AnsweredText="";
};

var onBoardingCharacteristicsAnswer=function(answer){
    this.AnswerID=answer.answerID;
    this.AnswerText=answer.answerText;
};

var onBoardingScenario=function(scenario){
    this.Id=scenario.scenarioID;
    this.Name=scenario.scenario;
    this.Description=scenario.scenarioDescription;
    this.CharacteristicsGroup=[];
};


onBoardingCharacteristicGroup.getAll=function(result){
    var sqlquery="CALL get_characteristicsGroup_Characteristics(0)";
    sql.query(sqlquery, function (err, res) {

        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
            var characteristicsGroupCollection=[];
            characteristicsGroupCollection= structureCharacteristics(res);
          result(null, characteristicsGroupCollection);
        }
    });   
};

function structureCharacteristics(res){
    var characteristicsGroup=[];
    
    res[0].forEach(group => {
        var characterGroup=new onBoardingCharacteristicGroup(group);
        characteristicsGroup.push(characterGroup);
    });
    characteristicsGroup.forEach(chargroup=>{
        var filtered = res[1].filter(function(charecter) {return charecter.GroupID==chargroup.Id});
        var questiongroup=[];
        filtered.forEach(question=>{
            var characteristic=new onBoardingCharacteristics(question);
            var answers=res[2].filter(function(answer) {return answer.characteristicsID==question.characteristicsID});
            var answerlist=[];
            answers.forEach(ans=>{
                    var answ=new onBoardingCharacteristicsAnswer(ans);
                    answerlist.push(answ);
            });
            characteristic.answersMapped=answerlist;
            if(res[3] != null){
                
                var answered=res[3].filter(function(an) { return an.characteristicsID==question.characteristicsID});
                
                if(answered[0]!=null){
                    characteristic.AnsweredID=answered[0].answerID;
                    characteristic.AnsweredText=answered[0].answerText;
                }
            }
            questiongroup.push(characteristic);
        });
        chargroup.charecteristicsMapped.push(questiongroup);
    });
    return characteristicsGroup;
}



onBoardingCharacteristicGroup.getAllScenario = function (result) {
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
onBoardingCharacteristicGroup.getScenario_ByID = function (ScenarioID, result) {
    var sqlquery="CALL get_characteristicsGroup_Characteristics("+ScenarioID+")";
    sql.query(sqlquery, function (err, res) {

        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
            var characteristicsGroupCollection=[];
            characteristicsGroupCollection= structureCharacteristics(res);
          result(null, characteristicsGroupCollection);
        }
});
};


module.exports=onBoardingCharacteristicGroup;