<template>
  <div class="home">
    <LogIn/>
  </div>
</template>

<script>
// @ is an alias to /src
//import HelloWorld from '@/components/HelloWorld.vue'
import LogIn from '@/components/LogIn.vue'


export default {
  name: 'HomeView',
  components: {
    LogIn
  }
}
</script>

<style scoped>
  .home {
    height: 100%;
  }
</style>
