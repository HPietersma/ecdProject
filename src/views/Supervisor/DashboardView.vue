<template>
  <div>
    <MenuBar/>
    <Dashboard/>
  </div>
</template>

<script>
// @ is an alias to /src
import Dashboard from '@/components/Dashboard.vue'
import MenuBar from '@/components/MenuBar.vue'


export default {
  name: 'DashboardView',
  components: {
    Dashboard,
    MenuBar
  }
}
</script>

<style scoped>
  
</style>
