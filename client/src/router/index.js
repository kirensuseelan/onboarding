import Vue from "vue";
import VueRouter from "vue-router";
import Onboarding from "@/components/Onboarding";

Vue.use(VueRouter);

export default new VueRouter({
  routes: [
    {
      path: "/",
      name: "Onboarding",
      component: Onboarding
    }
  ],
  mode: "history"
});
