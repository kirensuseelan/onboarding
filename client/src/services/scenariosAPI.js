import axios from "axios";

export default {
  fetchScenariosCollection() {
    return axios
      .get("Scenarios/")
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  },
  fetchCharacteristcsCollectionWithScenarioID(scenarioID) {
    return axios
      .get("Scenarios/"+ scenarioID)
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  }
};
