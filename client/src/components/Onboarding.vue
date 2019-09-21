<template>
  <div class="hello">
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
      integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
      crossorigin="anonymous"
    />
    <h1>{{ msg }}</h1>
    <div id="goals">
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
              :sub-title="goal.Description"
            >
              <div style="text-align:right">
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
          <div v-if="techiques" class="goalcards">
            <b-card
              class="cardsCustom shadow bg-white rounded"
              v-for="technique in techiques"
              :key="technique.Id"
              :header="technique.Name"
              header-tag="header"
              :sub-title="technique.Description"
            >
              <!-- v-bind:bg-variant="{ dark: goal.isActive }" v-bind:bg-textvariant="{ white: !goal.isActive }"-->
              <div style="text-align:right">
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
            </b-card>
          </div>
        </b-card-group>
      </b-card>
    </div>
  </div>
</template>

<script>
import goalsApi from "@/services/goalsAPI";
import techniquesApi from "@/services/techniquesAPI";

export default {
  name: "Onboarding",
  props: {
    msg: String
  },
  data() {
    return {
      goals: [],
      techiques: [],
      selectedGoals: String
    };
  },
  methods: {
    async fetchGoal() {
      var self = this;
      const response = await goalsApi.fetchGoalsCollection();
      self.goals = response;
      self.selectedGoals = "";
    },
    async fetchTechnique() {
      var self = this;
      const response = await techniquesApi.fetchMappedTechniques(
        self.selectedGoals
      );
      self.techiques = response;
    },
    addGoals(activatedGoal) {
      var self = this;
      var goals = self.selectedGoals;
      goals = goals + "," + activatedGoal.Id;
      self.selectedGoals = goals;
      activatedGoal.isActive = true;
      this.fetchTechnique();
    },
    removeGoals(deselectedGoal) {
      var self = this;
      var goals = self.selectedGoals;
      goals = goals.replace("," + deselectedGoal.Id, "");
      self.selectedGoals = goals;
      console.log(self.selectedGoals);
      this.fetchTechnique();
      deselectedGoal.isActive = false;
    },
    addTechnique(activatedtech) {
      activatedtech.isActive = true;
    },
    removeTechnique(removedTech) {
      removedTech.isActive = false;
    }
  },
  mounted() {
    this.fetchGoal();
    this.fetchTechnique();
  }
};
</script>

<style>
#goals {
  width: 48%;
  height: 250px;
  margin-left: 10px;
  float: left;
}

.techniques {
  width: 48%;
  height: 250px;
  margin-left: 10px;
  float: right;
  z-index: 9999;
}
.goalcards {
  z-index: 9999;
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
</style>
