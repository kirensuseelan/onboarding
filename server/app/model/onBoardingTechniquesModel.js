var sql = require('./db.js');

var onBoardingTechniques=function(onBoardingTechnique){
    this.Id=onBoardingTechnique.TechniquesId;
    this.Name=onBoardingTechnique.Name;
    this.Description=onBoardingTechnique.Description;
    this.isActive=false;
    this.OrderTech=1;
};


onBoardingTechniques.getTechniquesById = function (techniqueID, result) {
    sql.query("Select name from techniques where id = ? ", techniqueID, function (err, res) {             
            if(err) {
                // console.log("error: ", err);
                result(err, null);
            }
            else{
                result(null, res);
          
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