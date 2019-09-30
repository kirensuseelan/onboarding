const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');
const routes = require('./app/routes/onBoardingGoalsRouter.js');
const techroutes = require('./app/routes/OnBoardingTechniquesRouter'); 
const characteristicsRouter=require('./app/routes/OnBoardingCharacteristicsRoutes');
const scenariosRouter=require('./app/routes/onBoardingScenarioRouter');
const port = 5000;


app.use(cors({origin: 'http://localhost:8080'}));
app.set('port', process.env.port || port); 
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); 
app.use('/', routes);
app.use('/',techroutes);
app.use('/',characteristicsRouter);
app.use('/',scenariosRouter);

app.listen(app.get('port'), () => {
    console.log(`server on port ${app.get('port')}`);
});

module.exports=app;