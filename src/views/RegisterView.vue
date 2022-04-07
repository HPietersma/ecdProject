<template>
  <div class="Regist">
    <Registration/>
  </div>
</template>

<script>
// @ is an alias to /src
//import HelloWorld from '@/components/HelloWorld.vue'
import Registration from '@/components/Registration.vue'
export default {
  name: 'RegisTration',
  components: {
    Registration
  }
}
</script>

<style scoped>
  .Regist {
    height: 100%;
  }
</style>