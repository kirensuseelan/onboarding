import axios from "axios";

export default {
  fetchGoalsCollection() {
    return axios
      .get("goals/")
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  },

  fetchSingleGoal(id) {
    return axios.get("&i=" + id).then(response => {
      return response.data;
    });
  }
};
