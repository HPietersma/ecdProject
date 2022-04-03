<template>
    <v-container
        fill-height
        align-center
    >
        <v-row justify="center">
            <v-col cols="3">
                <div 
                    class="elevation-1 text-left pa-2"
                >
                    <p>Naam: {{clientData.client[0].voornaam}} {{clientData.client[0].achternaam}}</p>
                    <p>Geboortedatum: {{clientData.client[0].geboortedatum}}</p>
                    <p>Telefoon: {{clientData.client[0].telefoon}}</p>
                    <p>E-mail: {{clientData.client[0].email}}</p>
                    <p>Adres:   {{clientData.client[0].adres}}</p>
                    <p>Plaats: {{clientData.client[0].plaats}}</p>
                  
                </div>
            </v-col>
        </v-row>
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
            this.$store.dispatch("fetchClientData", {"client_id": this.$route.query.id});
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