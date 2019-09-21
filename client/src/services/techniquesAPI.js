import axios from "axios";

export default {
  fetchTechniquesCollection() {
    return axios
      .get("techniques/")
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  },

  fetchMappedTechniques(selectedGoals) {
    return axios
      .get("mappedtechniques/&i=" + selectedGoals)
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  }
};
