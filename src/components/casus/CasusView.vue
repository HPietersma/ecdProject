<template>
    <v-container
        fill-height
        align-center
    >
        <v-row
            justify="center"
        >
            <div 
                class="infoPanel"
            >
                {{casus.client[0].voornaam}}
                {{casus.client[0].achternaam}}
            </div>
        </v-row>
    </v-container>
</template>
<script>
    export default {
        name: "CasusViewComponent",

        data() {
            return {
                data: null,
            }
        },
        created() {
            this.$store.dispatch("getCasus", {"casus_id": this.$route.query.id});
        },
        computed: {
            casus() {
                return this.$store.state.casus;
            },
        },
        watch: {
            
        },
        methods: {
        
        },
    }

</script>
<style scoped>

.infoPanel {
    background-color: white;
    width: 700px;
}



</style>