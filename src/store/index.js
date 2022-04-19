import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
//import router from '@/router'

Vue.use(Vuex)

//axios.defaults.baseURL = "http://localhost:80/ecdProject/src/php/"
//axios.defaults.baseURL = "http://localhost:80/htdocs/ecdProject/src/php"
axios.defaults.baseURL = "http://localhost:81/ecd/src/php"
axios.defaults.withCredentials = true

export default new Vuex.Store({
  state: {
    error: null,
    user: null,
    loginData: null,
    clients: null,
    clientData: null,
    klassen: null,
    klas: null,
    routes: {
      "Supervisor": [
        {"title": "Home", "link": "/"},
        {"title": "Casus", "link": "/dashboard/casus"},
        {"title": "Clienten", "link": "/dashboard/clienten"},
        {"title": "Klassen", "link": "/dashboard/klassen"},
      ], 
      "Behandelend_arts": [
        {"title": "Test", "link": "/"},
        {"title": "Test", "link": "/dashboard/casus"},
        {"title": "Test", "link": "/dashboard/clienten"},
      ],
      
    },
  },
  getters: {
    getUsers: state => {
      return state.user;
    },
  },
  mutations: {
    setError(state, error) {
      state.error = error;
    },
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
    setKlassen(state, klassenData) {
      state.klassen = klassenData;
    },
    setKlas(state, klas) {
      state.klas = klas;
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
            localStorage.role = response.data.data.role;
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
      localStorage.removeItem("logged_in");
      localStorage.removeItem("role");

      axios.post("?action=logout")
        .then (response => {
          console.log(response)
        })
        .catch (err => {
          console.log(err);
        }) 
    },
    register({ commit }, loginData) {
      axios.post("?action=register", loginData
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
    fetchKlassen({ commit }) {
      axios.get("?action=getKlassen")
      .then (response => {
        console.log(response.data);
        if (response.data.error) {
          commit("setError", response.data.error)
        }
        else {
          commit("setKlassen", response.data.data);
        }
      })
      .catch ( err => { 
        console.log(err)
      })
    },
    fetchKlas({ commit }, klas_id) {
      axios.post("?action=getKlas", klas_id)
      .then (response => {
        console.log(response.data);

        commit("setKlas", response.data.data);
      })
      .catch ( err => { 
        console.log(err)
      })
    },
    createNewClient({ commit }, clientData) {
      console.log(commit);
      axios.post("?action=createNewClient", clientData) 
        .then (response => {
          console.log(response.data);
        })
        .catch (err => {
          console.log(err);
        })
    }
  },

  modules: {
  }
})
