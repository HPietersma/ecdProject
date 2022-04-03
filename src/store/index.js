import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
//import router from '@/router'

Vue.use(Vuex)

//axios.defaults.baseURL = "http://localhost:80/htdocs/ecdProject/src/php"
axios.defaults.baseURL = "http://localhost:81/ecd/src/php"
axios.defaults.withCredentials = true

export default new Vuex.Store({
  state: {
    user: null,
    loginData: null,
    clients: null,
    clientData: null,
  },
  getters: {
    getUsers: state => {
      return state.user;
    },
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setLoginData(state, loginData) {
      state.loginData = loginData;
    },
    setClients(state, clients) {
      state.clients = clients;
    },
    setClientData(state, clientData) {
      state.clientData = clientData;
    },

  },
  actions: {
    login({ commit }, loginData) {
      axios.post("?action=login", loginData) 
        .then (response => {
          console.log(response.data);
          if (response.data.succes === true) {
            commit("setLoginData", response.data.succes);
            localStorage.logged_in = response.data.succes;
          }
          else {
            window.alert(response.data.data);
          }
        })
        .catch (err => {
          console.log(err);
        })
    },
    logout() {
      axios.post("?action=logout")
        .then (response => {
          console.log(response)
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
    fetchClients({ commit }) {
      axios.get("?action=getClients")
      .then (response => {
        console.log(response.data);

        commit("setClients", response.data.data);
      })
      .catch ( err => { 
        console.log(err)
      })
    },
    fetchClientData({ commit }, client_id) {
      axios.post("?action=getClientData", client_id)
      .then (response => {
        console.log(response.data);

        commit("setClientData", response.data.data);
      })
      .catch ( err => { 
        console.log(err)
      })
    },
  },
  modules: {
  }
})
