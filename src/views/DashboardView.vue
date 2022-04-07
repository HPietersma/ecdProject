<template>
  <div>
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
        <v-tab v-for="(route, i) in routes" :key="i" :to="route.link">{{route.title}}</v-tab>

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
          <v-list-item v-for="(route, i) in routes" :key="i" :to="route.link">
            <v-list-item-title>{{route.title}}</v-list-item-title>
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
      routes: [
                {"title": "Home", "link": "/"},
                {"title": "Casus", "link": "/dashboard/casus"},
                {"title": "Clienten", "link": "/dashboard/clienten"},
              ],
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
