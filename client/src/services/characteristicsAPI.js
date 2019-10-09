import axios from "axios";

export default {
  fetchCharacteristcsCollection() {
    return axios
      .get("Characteristics/")
      .then(response => {
        return response.data;
      })
      .catch(error => console.log(error));
  },

};
