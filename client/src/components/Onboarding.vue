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
          <b-card
            class="goalcards shadow bg-white rounded"
            v-for="goal in goals"
            :key="goal.id"
            :header="goal.name"
            header-tag="header"
            :sub-title="goal.Description"
          >
            <!-- v-bind:bg-variant="{ dark: goal.isActive }" v-bind:bg-textvariant="{ white: !goal.isActive }"-->
            <div style="text-align:right">
              <i
                  class="far fa-check-circle fa-2x"
                  style="cursor:pointer"
                  @click="addGoals(goal)"
                  v-bind:class="{ included: goal.isActive }"
                  v-show="!goal.isActive"
                ></i
              >
              <i
                class="far fa-times-circle fa-2x"
                v-bind:class="{ deleteenabled: goal.isActive }"
                @click="removeGoals(goal)"
                 v-show="goal.isActive"
              ></i>
            </div>
          </b-card>
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
          <b-card
            class="goalcards shadow bg-white rounded"
            v-for="technique in techiques.sort(x => x.isActive ? -1 : 1)"
            :key="technique.id"
            :header="technique.name"
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
                ></i
              >
              <i
                class="far fa-times-circle fa-2x"
                @click="removeTechnique(technique)"
                v-bind:class="{ deleteenabled: technique.isActive }"
                v-show="technique.isActive"
              ></i>
            </div>
          </b-card>
        </b-card-group>
      </b-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "Onboarding",
  props: {
    msg: String
  },
  data() {
    return {
       sortKey: '',
      goals: [
        {
          id: 1,
          name: "Goal 1",
          Description: "Goal 1 Description",
          isActive: true
        },
        {
          id: 2,
          name: "Goal 2",
          Description: "Goal 2 Description",
          isActive: true
        },
        {
          id: 3,
          name: "Goal 3",
          Description: "Goal 3 Description",
          isActive: false
        },
        {
          id: 4,
          name: "Goal 4",
          Description: "Goal 4 Description",
          isActive: false
        },
        {
          id: 5,
          name: "Goal 5",
          Description: "Goal 5 Description",
          isActive: false
        }
      ],
      techiques: [
        {
          id: 1,
          name: "Techique 1",
          Description: "Techique 1 Description",
          isActive: true
        },
        {
          id: 2,
          name: "Techique 2",
          Description: "Techique 2 Description",
          isActive: true
        },
        {
          id: 3,
          name: "Techique 3",
          Description: "Techique 3 Description",
          isActive: false
        },
        {
          id: 4,
          name: "Techique 4",
          Description: "Techique 4 Description",
          isActive: false
        },
        {
          id: 5,
          name: "Techique 5",
          Description: "Techique 5 Description",
          isActive: false
        },
        {
          id: 6,
          name: "Techique 6",
          Description: "Techique 6 Description",
          isActive: true
        },
        {
          id: 7,
          name: "Techique 7",
          Description: "Techique 7 Description",
          isActive: true
        },
        {
          id: 8,
          name: "Techique 8",
          Description: "Techique 8 Description",
          isActive: false
        },
        {
          id: 9,
          name: "Techique 9",
          Description: "Techique 9 Description",
          isActive: false
        },
        {
          id: 10,
          name: "Techique 10",
          Description: "Techique 10 Description",
          isActive: false
        }
      ]
    };
  },
   methods: {
     
    addGoals(activatedGoal) {
      activatedGoal.isActive=true
      var ref = this
      ref.randomActivateTechnique()
    },
    removeGoals(selectedGoal) {
      selectedGoal.isActive=false
       var ref = this
      ref.randomActivateTechnique()
    },
    addTechnique(activatedtech) {
      activatedtech.isActive=true
    },
    removeTechnique(removedTech) {
      removedTech.isActive=false
    },
    randomActivateTechnique (){
      var ref = this
      for(var i = Math.floor(Math.random() * 10); i <= ref.techiques.length; i++) {
        ref.techiques[i].isActive=! ref.techiques[i].isActive;
      }
      
    }
    
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
  margin-bottom: 15px !Important;
  margin-left: 0px !Important;
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
