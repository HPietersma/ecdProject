<template>
  <v-div class="home">
    <LogIn/>
  </v-div>
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
