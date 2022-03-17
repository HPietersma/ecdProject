<template>
  <v-app>
    <v-main>
      <HomePage/>
    </v-main>
  </v-app>
</template>

<script>
//import HelloWorld from './components/HelloWorld';
import HomePage from './components/HomePage';

export default {
  name: 'App',

  components: {
    //HelloWorld,
    HomePage,
  },

  data: () => ({
    //
  }),
};
</script>

<style scoped>

</style>
