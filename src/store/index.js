import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
//import router from '@/router'

Vue.use(Vuex)

axios.defaults.baseURL = "http://localhost:80/htdocs/ecdProject/src/php"
//axios.defaults.baseURL = "http://localhost:81/ecd/src/php"
axios.defaults.withCredentials = true

export default new Vuex.Store({
  state: {
    user: null,
    loginData: null,
  },
  getters: {
    getUsers: state => {
      return state.users;
    },
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setLoginData(state, loginData) {
      state.loginData = loginData;
    },
  },
  actions: {
    fetchUsers({ commit }) {
      axios.get("?action=test")
        .then (response => {
          console.log(response.data);

          commit("setUsers", response.data);
        })
        .catch ( err => { 
          console.log(err)
        })
    },
    login({ commit }, loginData) {
      axios.post("?action=login", loginData
      ) 
        .then (response => {
          console.log(response.data);
          if (response.data.succes === true) {
            commit("setLoginData", response.data.succes);
            localStorage.logged_in = response.data.succes;
            console.log(localStorage.logged_in);
          }
          else {
            window.alert(response.data.data);
          }
        })
        .catch (err => {
          console.log(err);
        })
    },
    fetchUserData({ commit }) {
      axios.get("?action=getUserData")
        .then (response => {
          console.log(response.data);

          commit("setUser", response.data);
        })
        .catch ( err => { 
          console.log(err)
        })
    },
  },
  modules: {
  }
})
