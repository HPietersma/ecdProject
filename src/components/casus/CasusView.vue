<template>
    <v-container
        fill-height
        align-center
    >
        <v-row
            justify="center"
        >
            <v-col 
                class="infoPanel elevation-1 mt-5 pa-2 teal lighten-5 rounded mb-5"
                v-if="casus"
                cols="5"
            >
                {{casus.client.voornaam}}
                {{casus.client.achternaam}}<br>
                {{casus.client.geboortedatum}}<br>
                {{casus.client.adres}}<br>
                {{casus.client.plaats}}<br>
                {{casus.client.telefoon}}<br>
            </v-col>

        </v-row>
        <v-row
            justify="center"
            v-for="(casus, index) in casusAnswers" :key="index"
        >
            <v-col
                cols="5"
                class="answers elevation-1 mt-2 lighten-5 rounded"
            >
                {{casus.answer}}
            </v-col>
        </v-row>
        <v-row 
            justify="center"
        >
            <v-col
                cols="5"
                class="teal lighten-4 mt-2 mb-2 rounded"
            >
                <div>
                    <v-textarea
                        background-color="white"
                        solo
                        v-model="casusAnswer.answer"
                    >
                    </v-textarea>

                    <v-btn
                        color="teal white--text"
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
    width: 700px;
    text-align: left;
}

.answers {
    background-color: white;
}



</style>