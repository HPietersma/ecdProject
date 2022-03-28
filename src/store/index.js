import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

axios.defaults.baseURL = "http://localhost:80/htdocs/ecdProject/src/php/"
//axios.defaults.baseURL = "http://localhost:81/ecd/src/php/"

export default new Vuex.Store({
  state: {
    users: [],
    loginData: null,
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
    setLoginData(state, loginData) {
      state.loginData = loginData;
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
    login({ commit }, loginData) {
      axios.post("login.php?action=login", loginData
      ) 
        .then (response => {
          console.log(response.data);
          if (response.data.succes === true) {
            commit("setLoginData", response.data.data);
          }
          else {
            window.alert(response.data.data);
          }
        })
        .catch (err => {
          console.log(err);
        })
    }
  },
  modules: {
  }
})
