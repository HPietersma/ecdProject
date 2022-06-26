<template>
    <v-container
        fill-height
        align-center
    >
        <v-row
            justify="center"
        >
            <v-col 
                class="infoPanel elevation-1 mt-5 pa-2 blue lighten-5 rounded mb-5"
                v-if="casus"
                cols="5"
            >
                <table style="border-collapse: collapse; width: 100%;">
                    <tr>
                        <td>Voornaam</td>
                        <td>{{casus.client.voornaam}}</td>
                    </tr>
                    <tr>
                        <td style="width: 150px;">Achternaam</td>
                        <td>{{casus.client.achternaam}}</td>
                    </tr>
                    <tr>
                        <td>Geboortedatum</td>
                        <td>{{casus.client.geboortedatum}}</td>
                    </tr>
                    <tr>
                        <td>Adres</td>
                        <td>{{casus.client.adres}}</td>
                    </tr>
                    <tr>
                        <td>Plaats</td>
                        <td>{{casus.client.plaats}}</td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td>Reanimeren</td>
                        <td v-if="casus.reanimeren.reanimeren == 0">nee</td>
                        <td v-if="casus.reanimeren.reanimeren == 1">ja</td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td>Aandoening</td>
                        <td>{{casus.aandoeningen[0].aandoening}}</td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td style="vertical-align: top;">Allergien</td>
                        <td><div v-for="(allergie, index) in casus.allergien" :key="index">{{allergie.allergie}}</div></td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td style="vertical-align: top;">Medicatie</td>
                        <td><div v-for="(medicatie, index) in casus.medicatie" :key="index">{{medicatie.medicatie}}</div></td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td style="vertical-align: top;">Hulpmiddelen</td>
                        <td><div v-for="(hulpmiddel, index) in casus.hulpmiddelen" :key="index">{{hulpmiddel.hulpmiddel}}</div></td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td>Contactpersoon</td>
                        <td>{{casus.contactpersonen[0].contactpersoon}}</td>
                    </tr>
                    <tr>
                        <td>Telefoon</td>
                        <td>{{casus.contactpersonen[0].telefoon}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>{{casus.contactpersonen[0].email}}</td>
                    </tr>
                    <tr>
                        <td>Adres</td>
                        <td>{{casus.contactpersonen[0].adres}}</td>
                    </tr>
                    <tr>
                        <td>Plaats</td>
                        <td>{{casus.contactpersonen[0].plaats}}</td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td style="vertical-align: top;">Behandelplan</td>
                        <td>{{casus.behandelplan[0].behandelplan}}</td>
                    </tr>
                    <tr>
                        <td style="height: 10px;"></td>
                    </tr>
                    <tr class="tableBreakLine">
                        <td style="vertical-align: top;">Opdracht</td>
                        <td>{{casus.opdracht.opdracht}}</td>
                    </tr>
                </table>

            </v-col>

        </v-row>

        <v-row
            justify="center"
            v-for="(casus, index) in casusAnswers" :key="index"
        >
            <v-col
                cols="5"
                class="answers elevation-1 mt-2 lighten-5 rounded text-left"
                :class="{ supervisor : casus.supervisor == 1}"
            >
                <table class="text-left">
                    <tr>
                        <td 
                            class="pa-2" 
                            style="width: 100%;"
                        >
                            {{casus.answer}}
                        </td>
                        <td class="pa-2" style="vertical-align: top;" v-if="casus.commentaar">
                            <v-dialog
                                v-model="dialog"
                                width="500"
                            >
                                <template v-slot:activator="{ on, attrs }">
                                    <v-btn 
                                        icon
                                        v-bind="attrs"
                                        v-on="on"
                                        v-on:click="showComment(casus)"
                                    >
                                        <v-icon color="orange">mdi-alert-circle-outline</v-icon>
                                    </v-btn>
                                </template>
                                <v-card class="pa-2">
                                    <v-card-text>
                                       {{commentaar}}
                                    </v-card-text>
                                    <v-divider></v-divider>
                                    <v-card-actions>
                                        <v-spacer></v-spacer>
                                        <v-btn
                                            color="primary"
                                            text
                                            @click="dialog = false"
                                        >
                                            sluiten
                                        </v-btn>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                        </td>
                    </tr>
                </table>
            </v-col>
        </v-row>
        <v-row 
            justify="center"
        >
            <v-col
                cols="5"
                class="blue lighten-4 mt-10 mb-2 rounded"
            >
                <div>
                    <v-textarea
                        background-color="white"
                        solo
                        v-model="casusAnswer.answer"
                    >
                    </v-textarea>

                    <v-btn
                        color="blue white--text"
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
                    "casus_id": this.$route.query.id,
                    "supervisor": 0,
                },
                dialog: false,
                commentaar: false,
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
            },
            showComment(casus) {
                this.commentaar = casus.commentaar;

            },
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

.tableBreakLine {
    border-top: 2px solid white;
}

table tr td {
    padding-left: 2px;
}

.supervisor {
    background-color: #E3F2FD;
}


</style>