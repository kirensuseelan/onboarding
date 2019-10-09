var sql = require('./db.js');

var onBoardingTechniques=function(onBoardingTechnique){
    this.Id=onBoardingTechnique.TechniquesID;
    this.Name=onBoardingTechnique.Name;
    this.Description=onBoardingTechnique.Description;
    this.DetailedDescription=onBoardingTechnique.DetailedDescription;
    this.isActive=false;
    this.OrderTech=1;
    this.GoalsMapped=[];
};


onBoardingTechniques.getTechniquesById = function (techniqueID, result) {

    // var query = sql.query("CALL get_techniquesByID(?)", techniqueID);
    //     query
    //     .on('error', function(err) {
    //         result(err, null);
    //       })
    //     .on('result', function(res) {
    //         var selectedtechnique =new onBoardingTechniques(res[0]);
    //         selectedtechnique.GoalsMapped=res[1];
    //         console.log(selectedtechnique);
    //         result(null, selectedtechnique);
    //     });
    var sqlquery="CALL get_techniquesByID("+ techniqueID + ")";
    sql.query(sqlquery , function (err, res) {             
            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{

                var selectedtechnique ;
                res[0].forEach(tech => {
                    selectedtechnique =new onBoardingTechniques(tech)
                    selectedtechnique.GoalsMapped=res[1];
                });
                result(null, selectedtechnique);
            }
        });
         
};


onBoardingTechniques.getMappedTechniques = function (selectedGoals, result) {
    sql.query("CALL get_goals_techniques(?)", selectedGoals , function (err, res) {

            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{
                
                var allMappedTechniques=[];
                res[0].forEach(tech => {
                    var selectedtechnique =new onBoardingTechniques(tech);
                    if(tech.cnt>0){
                        selectedtechnique.isActive=true;
                    }
                    selectedtechnique.OrderTech=tech.cnt;
                    allMappedTechniques.push(selectedtechnique);
                });
                result(null, allMappedTechniques);
            }
        });   
};


onBoardingTechniques.getAllTechniques = function (result) {
    sql.query("Select * from techniques", function (err, res) {

            if(err) {
                console.log("error: ", err);
                result(null, err);
            }
            else{
                var allTechniques=[];
                res.forEach(tech => {
                    allTechniques.push(new onBoardingTechniques(tech));
                });
                console.log(allTechniques);
              result(null, allTechniques);
            }
        });   
};

module.exports= onBoardingTechniques;