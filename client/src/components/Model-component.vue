<template>
  <div>
    <b-modal
      id="ModelComponent"
      v-if="recievedData.type == 'Goal'"
      :title="recievedData.data.Name"
      :hide-footer="true"
    >
      <p class="my-4">{{ recievedData.data.Description }}</p>
      <!-- <b-btn class="mt-3" variant="outline-danger" block @click="hideModal()">Close Me</b-btn> -->
      <div>
        <i
          class="far fa-check-circle fa-2x"
          style="cursor:pointer"
          @click="updateParentToIncludeGoals()"
          v-bind:class="{ included: recievedData.data.isActive }"
          v-show="!recievedData.data.isActive"
        ></i>
        <i
          class="far fa-times-circle fa-2x"
          v-bind:class="{ deleteenabled: recievedData.data.isActive }"
          @click="updateParentToRemove()"
          v-show="recievedData.data.isActive"
        ></i>
      </div>
    </b-modal>

    <b-modal
      id="ModelComponent"
      v-if="recievedData.type == 'Techniques'"
      :title="recievedData.data.Name"
      :hide-footer="true"
    >
      <p class="my-4">{{ recievedData.data.Description }}</p>
      <p class="my-4">{{ recievedData.data.DetailedDescription }}</p>
      <div class="d-block text-left">
        <div>Contributes to achieve goals:</div>
        <b-list-group>
          <b-list-group-item
            v-for="goal in recievedData.data.GoalsMapped"
            :key="goal.Name"
            >{{ goal.Name }} : {{ goal.Description }}
          </b-list-group-item>
        </b-list-group>
      </div>
      <!-- <b-btn class="mt-3" variant="outline-danger" block @click="hideModal()">Close Me</b-btn> -->
      <div style="float:right; margin-top:10px;">
        <i
          class="far fa-check-circle fa-2x"
          style="cursor:pointer"
          @click="updateParentToInclude()"
          v-bind:class="{ included: recievedData.data.isActive }"
          v-show="!recievedData.data.isActive"
        ></i>
        <i
          class="far fa-times-circle fa-2x"
          v-bind:class="{ deleteenabled: recievedData.data.isActive }"
          @click="updateParentToRemove()"
          v-show="recievedData.data.isActive"
        ></i>
      </div>
    </b-modal>
  </div>
</template>

<script>
export default {
  props: {
    recievedData: Object
  },
  data() {
    return {};
  },
  methods: {
    updateParentToIncludeGoals() {
      this.recievedData.data.isActive = true;
      this.recievedData.userSelectedGoals =
        this.recievedData.userSelectedGoals + "," + this.recievedData.data.Id;
      this.$emit("finished", this.recievedData);
      this.$bvModal.hide("ModelComponent");
    },
    updateParentToInclude() {
      this.recievedData.data.isActive = true;
      this.$bvModal.hide("ModelComponent");
    },
    updateParentToRemove() {
      this.recievedData.data.isActive = false;
      this.$bvModal.hide("ModelComponent");
    }
  }
};
</script>
