<template>
    <v-container
        fill-height
        align-center
    >
        {{clientData}}
    </v-container>
</template>

<script>
export default {
    name: "ClientComponent",

    data() {
        return {
            data: null,
        }
    },
    created() {
        this.$store.dispatch("fetchClient", {"client_id": this.$route.query.id});
    },
    computed: {
        clientData() {
            return this.$store.state.clientData;
        }
    },
    watch: {
        
    },
    methods: {
    
    },
}

</script>
<style scoped>



</style>