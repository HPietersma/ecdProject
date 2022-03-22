import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

//let address = "http://localhost:80/htdocs/ecdProject/src/php/";
axios.defaults.baseURL = "http://localhost:80/htdocs/ecdProject/src/php/"

export default new Vuex.Store({
  state: {
    users: [],
  },
  getters: {
    getUsers: state => {
      return state.users;
    },
  },
  mutations: {
    setUsers(state, users) {
      state.users = users;
    },
  },
  actions: {
    fetchUsers({ commit }) {
      axios.get("login.php?action=test")
        .then (response => {
          console.log(response.data);

          commit("setUsers", response.data);
        })
        .catch ( err => { 
          console.log(err)
        })
    },
    async login({ commit }, loginData) {
      axios.post("login.php?action=login", loginData
      ) 
        .then (response => {
          console.log(response.data);
          console.log(commit);
        })
        .catch (err => {
          console.log(err);
        })
    }
  },
  modules: {
  }
})
