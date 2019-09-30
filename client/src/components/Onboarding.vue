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
      <div id="goals">
        <Model-component
          :recievedData="selectedItem"
          @finished="finished"
        ></Model-component>
        <b-card
          class="shadow bg-white rounded"
          header="Team Onboarding Goals"
          header-tag="header"
        >
          <b-card-group deck>
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
          </b-card-group>
        </b-card>
      </div>
      <div class="techniques">
        <b-card
          class="shadow bg-white rounded"
          header="Team Onboarding Techniques"
          header-tag="header"
        >
          <b-card-group deck>
            <div v-if="techniques" class="goalcards">
              <div>
                <!-- <div class="ajax_loader hidden" ref="hidden"><i class="fa fa-spinner fa-spin"></i></div> -->
                <!-- <b-spinner label="Spinning" class="loaderTechniques"></b-spinner> -->
              </div>
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
          </b-card-group>
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
      }
    };
  },
  methods: {
    async fetchCharacteristicsWithScenario() {
      var self = this;
      if (self.selected != null) {
        const response = await scenariosApi.fetchCharacteristcsCollectionWithScenarioID(
          self.selected.Id
        );
        console.log(response);
        self.characteristicsGroup = response;
      }
    },
    finished(value) {
      this.selectedGoals = value.userSelectedGoals;
      this.fetchTechnique();
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
#goals {
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
</style>
