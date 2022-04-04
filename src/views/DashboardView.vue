<template>
  <div>
    <!-- <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link to="/dashboard/casus">Casus</router-link> |
      <router-link to="/dashboard/clienten">Clienten</router-link> |
      <a href="#" v-on:click="logout()">Logout</a>
    </nav> -->

    <v-app-bar
      dense
      color="indigo lighten-1"
      class="white--text"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" v-show="mobile"></v-app-bar-nav-icon>
      <v-tabs 
        align-with-title 
        v-show="!mobile"
      >
        <v-tab to="/">Home</v-tab>
        <v-tab to="/about">About</v-tab>
        <v-tab to="/dashboard/casus">Casus</v-tab>
        <v-tab to="/dashboard/clienten">Clienten</v-tab>
      </v-tabs>
        <v-spacer></v-spacer>
      <v-btn 
        @click="logout()" 
        outlined
      >
        Logout 
        <v-icon>mdi-logout-variant</v-icon> 
      </v-btn>
    </v-app-bar>  

    <v-navigation-drawer
      v-model="drawer"
      absolute
      bottom
      temporary
      v-if="mobile"
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="indigo--text text--accent-4"
        >
          <v-list-item to="/">
            <v-list-item-title>Home</v-list-item-title>
          </v-list-item>

          <v-list-item to="/about">
            <v-list-item-title>About</v-list-item-title>
          </v-list-item>

          <v-list-item to="/dashboard/casus">
            <v-list-item-title>Casus</v-list-item-title>
          </v-list-item>

          <v-list-item to="/dashboard/clienten">
            <v-list-item-title >Clienten</v-list-item-title>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>


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
      drawer: false,
      group: null,
    }
  },
  created() {

  },

  computed: {
    mobile() {
      switch (this.$vuetify.breakpoint.name) {
        case 'xs': return true
        case 'sm': return true
        case 'md': return false
        case 'lg': return false
        case 'xl': return false
        default: return false
      }
    }
  },
  watch: {
    group () {
      this.drawer = false
    },
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
