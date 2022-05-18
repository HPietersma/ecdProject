<template>
  <div id="app">
    <div v-if="error" class="errMessage">
      <h1>{{error.code}}</h1>
      <p>{{error.message}}</p>
      <br>
      <v-btn 
        class="btn"
        @click="logout()" 
      >
        opnieuw inloggen
      </v-btn>
    </div>
    <v-app v-if="!error">
      <!-- <nav>
        <router-link to="/">Home</router-link> |
        <router-link to="/about">About</router-link>
      </nav> -->

      <router-view name="nav"/>
      <router-view/>
      <NotificationComponent v-if="showNotification" />
    </v-app>
  </div>
</template>

<script>
  import NotificationComponent from "./components/NotificationComponent";

  export default {
    name: 'app',
    components: {
      NotificationComponent
    },
    computed: {
      error() {
        return this.$store.state.error
      },
      showNotification() {
        return this.$store.state.showNotification
      }
    },
    methods: {
      logout() {
        this.$store.state.error = null;
        this.$store.dispatch("logout");
        this.$router.push({path: "/"});
      },
    },
  }
  
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background-color: rgb(250, 250, 250);
}

nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}

.errMessage {
  margin-top: 100px;
}

.btn {
  background-color: purple;
}
</style>
