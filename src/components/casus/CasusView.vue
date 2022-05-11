<template>
    <v-container
        fill-height
        align-center
    >
        <v-row
            justify="center"
        >
            <div 
                class="infoPanel elevation-1 mt-5 pa-2"
                v-if="casus"
            >
                {{casus.client.voornaam}}
                {{casus.client.achternaam}}<br>
                {{casus.client.geboortedatum}}<br>
                {{casus.client.adres}}<br>
                {{casus.client.plaats}}<br>
                {{casus.client.telefoon}}<br>
            </div>

        </v-row>
        <v-row
            justify="center"
            v-for="casus in casusAnswers" :key="casus"
        >
            <v-col
                cols="8"
                class="answers elevation-1 mt-2"
            >
                {{casus.answer}}
            </v-col>
        </v-row>
        <v-row 
            justify="center"
        >
            <v-col
                cols="5"
            >
                <div>
                    <v-textarea
                        background-color="white"
                        solo
                        v-model="casusAnswer.answer"
                    >
                    </v-textarea>

                    <v-btn
                        color="primary"
                        v-on:click="saveAnswer()"
                    >
                        Opslaan
                    </v-btn>
                </div>
               

            </v-col>
        </v-row>
    </v-container>
</template>
<script>
    export default {
        name: "CasusViewComponent",

        data() {
            return {
                casusAnswer: {
                    "answer": null, 
                    "casus_id": this.$route.query.id
                },
            }
        },
        created() {
            this.$store.dispatch("getCasus", {"casus_id": this.$route.query.id});
            this.$store.dispatch("getCasusAnswers", {"casus_id": this.$route.query.id});
        },
        computed: {
            casus() {
                return this.$store.state.casus;
            },
            casusAnswers() {
                return this.$store.state.casusAnswers;
            },
        },
        watch: {
            
        },
        methods: {
            saveAnswer() {
                if (this.casusAnswer.answer) {
                    this.$store.dispatch("createCasusAnswer", {"casusAnswer": this.casusAnswer});
                }
            }
        },
    }

</script>
<style scoped>

.infoPanel {
    background-color: white;
    width: 700px;
    text-align: left;
}

.answers {
    background-color: white;
}



</style>