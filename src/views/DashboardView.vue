<template>
  <div>
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link to="/dashboard/casus">Casus</router-link> |
      <router-link to="/dashboard/clienten">Clienten</router-link> |
      <a href="#" v-on:click="logout()">Logout</a>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
// @ is an alias to /src
//import Dashboard from '@/components/Dashboard.vue'


export default {
  name: 'DashboardView',

  components: {
    //Dashboard,
  },
  data() {
    return {
   
    }
  },
  created() {

  },

  computed: {

  },
  watch: {

  },
  methods: {
    logout() {
      localStorage.logged_in = "false";
      this.$store.dispatch("logout");
      this.$router.push({path: "/"});
    },
  },
}
</script>
  

<style scoped lang="scss">
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
</style>
