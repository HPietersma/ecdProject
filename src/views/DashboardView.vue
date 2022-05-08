<template>
  <div>
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
      data: null,
    }
  },
  created() {

  },

  computed: {

  },
  watch: {

  },
  methods: {

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
