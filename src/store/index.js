import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

let address = "http://localhost:80/ecd/src/php/";

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
      axios.get(address + "login.php?action=test")
        .then (response => {
          console.log(response.data);

          commit("setUsers", response.data);
        })
        .catch ( err => { 
          console.log(err)
        })
    },
    sentLoginData({ commit }, loginData) {
      axios.post(address + "login.php?action=test2", loginData
        //{"username" : loginData.username,
        //"password" : loginData.password}
      ) 
        .then (response => {
          //commit("setLogin", response.data);
          console.log(commit);
          console.log(response);
        })
        .catch (err => {
          console.log(err);
        })
    }
  },
  modules: {
  }
})
