<template>
  <div class="hello">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
      integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
      crossorigin="anonymous"
    />
    <div class="header">
      <img src="..\assets\POD_1.png" class="imgheader" />
      <h1 style="margin-top:2%;">{{ msg }}</h1>
    </div>
    <div Class="Application">
      <Model-component
          :recievedData="selectedItem"
          @finished="finished"
        ></Model-component>
      <div class="characteristics">
        <b-card
          class="shadow bg-white rounded"
          header="Onboarding Context"
          header-tag="header"
        >
          <b-card-group deck>
            <div style="margin-left: 15px;">
              <b-form-select
                v-model="selected"
                class="mb-3"
                v-on:change="fetchCharacteristicsWithScenario()"
              >
                <option :value="null">Select scenario</option>
                <option
                  v-for="scenario in scenarios"
                  :key="scenario.Id"
                  :value="scenario"
                  >{{ scenario.Name }}</option
                >
              </b-form-select>
            </div>
            <div v-if="characteristicsGroup" class="goalcards">
              <b-card
                class="cardsCustom shadow bg-white rounded"
                v-for="character in characteristicsGroup"
                :key="character.Id"
                :header="character.Name"
                header-tag="header"
              >
                <div class="summaryDiv">
                  <label>Summary :</label>
                  <div
                    v-for="questions in character.charecteristicsMapped[0]"
                    :key="questions.Id"
                    class="characteristicsList"
                  >
                    <li>{{ questions.Name }} : {{ questions.AnsweredText }}</li>
                  </div>
                </div>
              </b-card>
            </div>
          </b-card-group>
        </b-card>
      </div>
      <div class="goals">
        
        <b-card
          class="shadow bg-white rounded"
          header="Recommended Team Onboarding Goals"
          header-tag="header"
        >
          <!-- <b-card-group deck>
            <div v-if="goals" class="goalcards">
              <b-card
                class="cardsCustom shadow bg-white rounded"
                v-for="goal in goals"
                :key="goal.Id"
                :header="goal.Name"
                header-tag="header"
              >
                <div>
                  <div class="description">
                    <label style="float:left;white-space: pre-wrap;">{{
                      goal.Description
                    }}</label>
                  </div>
                </div>
                <div>
                  <div>
                    <b-button
                      v-b-modal.ModelComponent
                      class="buttonDetail"
                      variant="primary"
                      @click="setselectedGoal(goal)"
                      >More Details</b-button
                    >
                  </div>
                  <div style="float:right;">
                    <i
                      class="far fa-check-circle fa-2x"
                      style="cursor:pointer"
                      @click="addGoals(goal)"
                      v-bind:class="{ included: goal.isActive }"
                      v-show="!goal.isActive"
                    ></i>
                    <i
                      class="far fa-times-circle fa-2x"
                      v-bind:class="{ deleteenabled: goal.isActive }"
                      @click="removeGoals(goal)"
                      v-show="goal.isActive"
                    ></i>
                  </div>
                </div>
              </b-card>
            </div>
          </b-card-group> -->
      <table class="table">
        <thead>
          <tr>
            <td><strong>ID</strong></td>
            <td><strong>Goals</strong></td>
            <td>Included</td>
            <td>Supported By</td>
          </tr>
        </thead>
        <tbody>
          <tr  v-for="goal in goals"
                  :key="goal.Id">
            <td class="tablecolumnIDText"><span data-tooltip=""  data-tooltip-position="bottom"  >{{goal.Name}}</span></td>
            <td  class="tablecolumnText"><a href="#"  v-b-modal.ModelComponent @click="setselectedGoal(goal)" ><span>{{goal.Description}}</span></a></td>
            <td>
               <div style="">
                <div v-show="!goal.isActive" >
                     <i
                        class="far fa-check-circle fa-2x"
                        @click="addGoals(goal)"
                      ></i>
                </div>
                <div v-show="goal.isActive">
                      <i
                        class="far fa-times-circle fa-2x deleteenabled"
                        @click="removeGoals(goal)"
                      ></i>
                </div>
                    </div>
            </td>
            <td></td>
          </tr>
        </tbody>
      </table>

        </b-card>
      </div>
      <div class="techniques">
        <b-card
          class="shadow bg-white rounded"
          header="Recommended Team Onboarding Techniques"
          header-tag="header"
        >
        <!-- <b-table
      :items="techniques"
      :fields="Techniquesfields">
       <template v-slot:cell(isActive)="row">
         
         <div style="">
                <div v-show="!row.isActive" :key="row.Name">
                     <i
                        class="far fa-check-circle fa-2x"
                        @click="addTechnique(row)"
                      ></i>
                </div>
                <div v-show="row.isActive" :key="row.Name">
                      <i
                        class="far fa-times-circle fa-2x deleteenabled"
                        @click="removeTechnique(row)"
                      ></i>
                </div>
                    </div>
       </template>
      </b-table> -->
      <table class="table">
        <thead>
          <tr>
            <td><strong>ID</strong></td>
            <td><strong>Techniques</strong></td>
            <td>Included</td>
            <td>Contributes To</td>
          </tr>
        </thead>
        <tbody>
          <tr  v-for="technique in techniques"
                  :key="technique.Id">
            <td class="tablecolumnIDText"><span :data-tooltip="technique.DetailedDescription"  data-tooltip-position="bottom" >{{technique.Name}}</span></td>
            <td class="tablecolumnText"><a href="#"  v-b-modal.ModelComponent @click="setselectedTechnique(technique)" ><span >{{technique.Description}}</span></a></td>
            <td>
               <div style="">
                <div v-show="!technique.isActive" >
                     <i
                        class="far fa-check-circle fa-2x"
                        @click="addTechnique(technique)"
                      ></i>
                </div>
                <div v-show="technique.isActive">
                      <i
                        class="far fa-times-circle fa-2x deleteenabled"
                        @click="removeTechnique(technique)"
                      ></i>
                </div>
                    </div>
            </td>
            <td></td>
          </tr>
        </tbody>
      </table>

          <!-- <b-card-group deck>
            <div v-if="techniques" class="goalcards">
              <div>
                <b-card
                  class="cardsCustom shadow bg-white rounded"
                  v-for="technique in techniques"
                  :key="technique.Id"
                  :header="technique.Name"
                  header-tag="header"
                >
                  <div>
                    <div class="description">
                      <label style="float:left;white-space: pre-wrap;">{{
                        technique.Description
                      }}</label>
                    </div>
                  </div>
                  <div>
                    <b-button
                      v-b-modal.ModelComponent
                      class="buttonDetail"
                      variant="primary"
                      @click="setselectedTechnique(technique)"
                      >More Details</b-button
                    >
                    <div style="float:right">
                      <i
                        class="far fa-check-circle fa-2x"
                        @click="addTechnique(technique)"
                        v-bind:class="{ included: technique.isActive }"
                        v-show="!technique.isActive"
                      ></i>
                      <i
                        class="far fa-times-circle fa-2x"
                        @click="removeTechnique(technique)"
                        v-bind:class="{ deleteenabled: technique.isActive }"
                        v-show="technique.isActive"
                      ></i>
                    </div>
                  </div>
                </b-card>
              </div>
            </div>
          </b-card-group> -->
        </b-card>
      </div>
    </div>
    <div class="footer"></div>
  </div>
</template>

<script>
import goalsApi from "@/services/goalsAPI";
import techniquesApi from "@/services/techniquesAPI";
import characterApi from "@/services/characteristicsAPI";
import scenariosApi from "@/services/scenariosAPI";
import ModelComponent from "@/components/Model-component.vue";

export default {
  name: "Onboarding",
  props: {
    msg: String
  },
  components: {
    ModelComponent
  },
  data() {
    return {
      characteristicsGroup: [],
      scenarios: [],
      goals: [],
      techniques: [],
      selected: null,
      selectedGoals: String,
      selectedTechniques: "",
      selectedItem: {
        type: String,
        data: Object,
        userSelectedGoals: String
      },
       Techniquesfields: [
          {
            key: 'Name',
            label: 'Techniques Id',
            sortable: true
          },
          {
            key: 'Description',
            label: 'Techniques',
            sortable: true
          },
          {
            key: 'isActive',
            label: 'Included',
            sortable: true,
          }
        ],
    };
  },
  methods: {
    async fetchCharacteristicsWithScenario() {
      var self = this;
      if (self.selected != null) {
        const response = await scenariosApi.fetchCharacteristcsCollectionWithScenarioID(
          self.selected.Id
        );
        self.characteristicsGroup = response.CharacteristicsGroup;
        self.selectedGoals=response.selectedgoals;
        self.setGoalsSelected();
      }
      else{
        self.fetchCharacteristics();
        self.selectedGoals="";
         self.goals.forEach(goal=>{
           goal.isActive=false;
        });
        self.fetchTechnique();
      }
    },
    finished(value) {
      this.selectedGoals = value.userSelectedGoals;
      this.fetchTechnique();
    },
    setGoalsSelected(){
      var self = this;
      if(self.selectedGoals){
          var selectedgoalIDs = self.selectedGoals.split(",");
          self.goals.forEach(goal=>{
          selectedgoalIDs.forEach(goalId=>{
            if(goal.Id==goalId){
              goal.isActive=true;
            }
          });
        });   
      }
      else{
         self.goals.forEach(goal=>{
           goal.isActive=false;
        });
      }
      self.goals.sort(function(a, b) {  return b.isActive - a.isActive });
      self.fetchTechnique();
    },
    setselectedGoal(selectedobject) {
      var self = this;
      self.selectedItem.type = "Goal";
      self.selectedItem.data = selectedobject;
      self.selectedItem.userSelectedGoals = self.selectedGoals;
    },
    async setselectedTechnique(selectedobject) {
      var self = this;
      self.selectedItem.type = "Techniques";

      const response = await techniquesApi.fetchTechniqueByID(
        selectedobject.Id
      );
      selectedobject.DetailedDescription = response.DetailedDescription;
      selectedobject.GoalsMapped = response.GoalsMapped;
      self.selectedItem.data = selectedobject;
    },
    async fetchGoal() {
      var self = this;
      const response = await goalsApi.fetchGoalsCollection();
      self.goals = response;
      self.selectedGoals = "";
    },
    async fetchCharacteristics() {
      var self = this;
      const response = await characterApi.fetchCharacteristcsCollection();

      self.characteristicsGroup = response;
    },
    async fetchScenarios() {
      var self = this;
      const response = await scenariosApi.fetchScenariosCollection();
      self.scenarios = response;
    },
    async fetchTechnique() {
      var self = this;
      const response = await techniquesApi.fetchMappedTechniques(
        self.selectedGoals
      );
      if (
        self.selectedTechniques != undefined &&
        self.selectedTechniques != ""
      ) {
        var selectedTechniquesID = self.selectedTechniques.split(",");
        response.forEach(tech => {
          selectedTechniquesID.forEach(techId => {
            console.log(techId);
            console.log(tech);
            if (techId != "" && tech.Id == techId && !tech.isActive) {
              tech.isActive = true;
            }
          });
        });

      }
      self.techniques = response;
      console.log(response);
    },
    addGoals(activatedGoal) {
      var self = this;
      var goals = self.selectedGoals;
      goals = goals + "," + activatedGoal.Id;
      self.selectedGoals = goals;
      activatedGoal.isActive = true;
      self.fetchTechnique();
    },
    removeGoals(deselectedGoal) {
      var self = this;
      var goals = self.selectedGoals;
      goals = goals.replace("," + deselectedGoal.Id, "");
      self.selectedGoals = goals;
      self.fetchTechnique();
      deselectedGoal.isActive = false;
    },
    addTechnique(activatedtech) {
      var self = this;
      var tech = self.selectedTechniques;
      tech = tech + "," + activatedtech.Id;
      self.selectedTechniques = tech;
      activatedtech.isActive = true;
      console.log('tech add');
    },
    removeTechnique(removedTech) {
      var self = this;
      var tech = self.selectedTechniques;
      tech = tech.replace("," + removedTech.Id, "");
      self.selectedTechniques = tech;
      removedTech.isActive = false;
    }
  },
  mounted() {
    this.fetchGoal();
    this.fetchTechnique();
    this.fetchCharacteristics();
    this.fetchScenarios();

    this.$root.$on("bv::dropdown::show", bvEvent => {
      console.log("Dropdown is about to be shown", bvEvent);
    });
  }
};
</script>

<style>
.Application {
  overflow-x: scroll;
  overflow-y: auto;
  white-space: nowrap;
  height: 82vh;
  margin-top: 10px;
}
.buttonDetail {
  float: left;
}
.goals {
  width: 45%;
  margin-left: 10px;
  display: inline-block;
}
.model {
  z-index: 999999999 !Important;
}
.techniques {
  width: 45%;
  margin-left: 10px;
  display: inline-block;
}
.characteristics {
  width: 45%;
  margin-left: 10px;
  display: inline-block;
}
.goalcards {
  /* z-index: 9999; */
  width: 100% !Important;
  flex: none !Important;
  margin-left: 0px !Important;
}
.cardsCustom {
  margin-bottom: 10px !Important;
}
.cardremoveborder {
  border: none !important;
}
.included {
  color: green;
  cursor: pointer;
}

.deleteenabled {
  color: red;
  cursor: pointer;
}
.hidden {
  display: none;
}
.ajax_loader {
  position: absolute;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  background: rgba(0, 0, 0, 0.5);
}
.ajax_loader i {
  position: absolute;
  left: 50%;
  top: 50%;
}
.header {
  width: 100%;
  height: 20px;
  background-color: #cbf3fd;
  color: #f4812e;
  text-align: left;
  vertical-align: middle;
  /* border: 1px solid transparent;
        padding-bottom: 20px; */
  display: inline-table;
  font-family: initial;
  font-style: italic;
}

.imgheader {
  float: left;
  width: 13% !important;
}
.footer {
  background-color: #cbf3fd;
  width: 100%;
  height: 20px;
  text-align: center;
}
.characteristicsList {
  text-align: left !Important;
  margin-left: 10px;
}
.summaryDiv {
  text-align: left;
  margin-left: 10px;
}
.description {
  width: 100%;
  float: left;
  text-align: left;
}
.tablecolumnIDText{
  border:none;
  width:25%;
  white-space: pre-wrap;
  margin-left: 10px;
  text-align: center;
}
.tablecolumnText{
  border:none;
  width:100%;
  white-space: pre-wrap;
  margin-left: 10px;
  text-align: left;
}
[data-tooltip] {
    display: inline-block;
    position: relative;
    cursor: help;
    padding: 4px;
}
/* Tooltip styling */
[data-tooltip]:before {
    content: attr(data-tooltip);
    display: none;
    position: absolute;
    background: #000;
    color: #fff;
    padding: 4px 8px;
    font-size: 14px;
    line-height: 1.4;
    min-width: 300px;
    text-align: center;
    border-radius: 4px;
}
/* Dynamic horizontal centering */
[data-tooltip-position="top"]:before,
[data-tooltip-position="bottom"]:before {
    left: 50%;
    -ms-transform: translateX(-50%);
    -moz-transform: translateX(-50%);
    -webkit-transform: translateX(-50%);
    transform: translateX(-50%);
}
/* Dynamic vertical centering */
[data-tooltip-position="right"]:before,
[data-tooltip-position="left"]:before {
    top: 50%;
    -ms-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%);
}
[data-tooltip-position="top"]:before {
    bottom: 100%;
    margin-bottom: 6px;
}
[data-tooltip-position="right"]:before {
    left: 100%;
    margin-left: 6px;
}
[data-tooltip-position="bottom"]:before {
    top: 100%;
    margin-top: 6px;
}
[data-tooltip-position="left"]:before {
    right: 100%;
    margin-right: 6px;
}

/* Tooltip arrow styling/placement */
[data-tooltip]:after {
    content: '';
    display: none;
    position: absolute;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
}
/* Dynamic horizontal centering for the tooltip */
[data-tooltip-position="top"]:after,
[data-tooltip-position="bottom"]:after {
    left: 50%;
    margin-left: -6px;
}
/* Dynamic vertical centering for the tooltip */
[data-tooltip-position="right"]:after,
[data-tooltip-position="left"]:after {
    top: 50%;
    margin-top: -6px;
}
[data-tooltip-position="top"]:after {
    bottom: 100%;
    border-width: 6px 6px 0;
    border-top-color: #000;
}
[data-tooltip-position="right"]:after {
    left: 100%;
    border-width: 6px 6px 6px 0;
    border-right-color: #000;
}
[data-tooltip-position="bottom"]:after {
    top: 100%;
    border-width: 0 6px 6px;
    border-bottom-color: #000;
}
[data-tooltip-position="left"]:after {
    right: 100%;
    border-width: 6px 0 6px 6px;
    border-left-color: #000;
}
/* Show the tooltip when hovering */
[data-tooltip]:hover:before,
[data-tooltip]:hover:after {
    display: block;
    z-index: 50;
}
.tablecolumnIDTextGoal{
  width:50px;
}
.tablecolumnTextGoal{
  text-align: left;
}
</style>
