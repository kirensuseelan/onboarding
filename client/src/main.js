import Vue from "vue";
import "./plugins/bootstrap-vue";
import App from "./App.vue";
import router from "./router/router";
import store from "./store";
import axios from "axios";

Vue.config.productionTip = false;
axios.defaults.baseURL = "http://localhost:5000/";

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
