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
  },
  fetchTechniqueByID(techID) {
    return axios
      .get("techniques/" + techID)
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  }
};
