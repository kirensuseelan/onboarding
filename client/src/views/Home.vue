<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png" /> -->
    <Onboarding msg="Personalized Onboarding Designer" />
  </div>
</template>

<script>
// @ is an alias to /src
import Onboarding from "@/components/Onboarding.vue";

export default {
  name: "home",
  components: {
    Onboarding
  }
};
</script>
