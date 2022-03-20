import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

let address = "localhost:81/ecd/src/api/login.php";

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
      axios.get(address + "?action=test")
        .then (response => {
          console.log(response.data);

          commit("setUsers", response.data);
        })
    }
  },
  modules: {
  }
})
