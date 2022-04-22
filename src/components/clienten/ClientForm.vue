<template>
    <v-container
        fill-height
        align-center
    >
    <!-- NAW -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4"
                >
                    <v-text-field
                        label="voornaam"
                        v-model="clientData.NAW.voornaam"
                    >
                    </v-text-field>
                    <v-text-field
                        label="achternaam"
                        v-model="clientData.NAW.achternaam"
                    >
                    </v-text-field>
                    <v-text-field
                        label="geboortedatum"
                        v-model="clientData.NAW.geboortedatum"
                    >
                    </v-text-field>
                    <v-text-field
                        label="telefoon"
                        v-model="clientData.NAW.telefoon"
                    >
                    </v-text-field>
                    <v-text-field
                        label="email"
                        v-model="clientData.NAW.email"
                    >
                    </v-text-field>
                    <v-text-field
                        label="adres"
                        v-model="clientData.NAW.adres"
                    >
                    </v-text-field>
                    <v-text-field
                        label="woonplaats"
                        v-model="clientData.NAW.woonplaats"
                    >
                    </v-text-field>
                </v-card>        
            </v-col>
        </v-row>
    <!-- REANIMEREN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4"
                >
                    <v-card-title>
                        Reanimeren
                        <v-spacer></v-spacer>
                        <v-switch
                            inset
                            :label="clientData.reanimeren ? 'ja' : 'nee'"
                            v-model="clientData.reanimeren"
                        >
                            
                        </v-switch>
                    </v-card-title>
                </v-card>        
            </v-col>
        </v-row>
    <!-- AANDOENINGEN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Aandoeningen
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            small
                            @click="addAandoening"
                        >
                        <v-icon>mdi-plus-box-outline</v-icon>
                        </v-btn>
                    </v-card-title>
                    <v-text-field 
                        solo 
                        hide-details="auto"
                        append-icon="mdi-window-close" 
                        v-on:click:append="delAandoening(index)"
                        v-for="(items, index) in clientData.aandoeningen" :key="index"
                        v-model="items.item"
                        placeholder="Aandoening"
                        class="mb-4"
                    >
                    </v-text-field>
                </v-card>     
            </v-col>
        </v-row>
    <!-- MEDICATIE -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Medicatie
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            small
                            @click="addMedicatie"
                        >
                        <v-icon>mdi-plus-box-outline</v-icon>
                        </v-btn>
                    </v-card-title>
                    <v-text-field 
                        solo 
                        hide-details="auto"
                        append-icon="mdi-window-close" 
                        v-on:click:append="delMedicatie(index)"
                        v-for="(items, index) in clientData.medicatie" :key="index"
                        v-model="items.item"
                        placeholder="Medicatie"
                        class="mb-4"
                    >
                    </v-text-field>
                </v-card>   
            </v-col>
        </v-row>
    <!-- ALLERGIEN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Allergien
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            small
                            @click="addAllergie"
                        >
                        <v-icon>mdi-plus-box-outline</v-icon>
                        </v-btn>
                    </v-card-title>
                    <v-text-field 
                        solo 
                        hide-details="auto"
                        append-icon="mdi-window-close" 
                        v-on:click:append="delAllergie(index)"
                        v-for="(items, index) in clientData.allergien" :key="index"
                        v-model="items.item"
                        placeholder="Allergie"
                        class="mb-4"
                    >
                    </v-text-field>
                </v-card>    
            </v-col>
        </v-row>  
    <!-- HULPMIDDELEN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Hulpmiddelen
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            small
                            @click="addHulpmiddel"
                        >
                            <v-icon>mdi-plus-box-outline</v-icon>
                        </v-btn>
                    </v-card-title>
                    <v-text-field 
                        solo 
                        hide-details="auto"
                        append-icon="mdi-window-close" 
                        v-on:click:append="delHulpmiddel(index)"
                        v-for="(items, index) in clientData.hulpmiddelen" :key="index"
                        v-model="items.item"
                        placeholder="Hulpmiddel"
                        class="mb-4"
                    >
                    </v-text-field>
                </v-card>    
            </v-col>
        </v-row> 
    <!-- CONTACTPERSONEN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Contactpersonen
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            small
                            @click="addContactpersoon"
                        >
                            <v-icon>mdi-plus-box-outline</v-icon>
                        </v-btn>
                    </v-card-title>
                    <v-card
                        class="px-4 pb-4 pt-1 mb-4 text-right"
                        v-for="(item, index) in clientData.contactpersonen" :key="index"
                    >
                        <v-btn
                            icon
                            small
                            v-on:click="delContactpersoon(index)"
                        >
                            <v-icon>mdi-window-close</v-icon>
                        </v-btn>
                        <v-text-field
                            label="naam"
                            v-model="item.naam"
                        >
                        </v-text-field>
                        <v-text-field
                            label="telefoon"
                            v-model="item.telefoon"
                        >
                        </v-text-field>
                        <v-text-field
                            label="e-mail"
                            v-model="item.email"
                        >
                        </v-text-field>
                        <v-text-field
                            label="adres"
                            v-model="item.adres"
                        >
                        </v-text-field>
                        <v-text-field
                            label="woonplaats"
                            v-model="item.woonplaats"
                        >
                        </v-text-field>
                    </v-card>
                </v-card>    
            </v-col>
        </v-row> 
    <!-- BEHANDELPLAN -->
        <v-row justify="center">
            <v-col 
                xs="12"
                md="6"
                lg="5"
            >
                <v-card
                    class="px-4 pb-4"
                >
                    <v-card-title>
                        Behandelplan
                    </v-card-title>
                    <v-textarea 
                        solo 
                        hide-details="auto"
                        v-model="clientData.behandelplan"
                        placeholder="Behandelplan"
                        class="mb-4"
                    >
                    </v-textarea>
                </v-card>    
            </v-col>
        </v-row> 
        <v-row
            class="mb-4"
        >
            <v-col>
                <v-btn
                    color="primary"
                    v-on:click="createNewClient()"
                >
                    Opslaan
                </v-btn>
            </v-col>
        </v-row>
        <div v-if="showPostMessage">
            {{postMessage}}
        </div>
    </v-container>
</template>
<script>
    export default {
        name: "ClientFormComponent",

        data() {
            return {
                data: null,
                showPostMessage: false,
                clientData: {
                    "NAW": {
                        "voornaam": null, "achternaam": null, "geboortedatum": null, "telefoon": null, "email": null, "adres": null, "woonplaats": null
                    },
                    "reanimeren": true,
                    "aandoeningen": [
                        {"item": null},
                    ],
                    "medicatie": [
                        {"item": null}
                    ],
                    "allergien": [
                        {"item": null}
                    ],
                    "hulpmiddelen": [
                        {"item": null}
                    ],
                    "contactpersonen": [ 
                        {"naam": null, "telefoon": null, "email": null, "adres": null, "woonplaats": null}
                    ],
                    "behandelplan": null,
                }
            }
        },
        created() {
  
        },
        computed: {
            postMessage() {
                return this.$store.state.postMessage;
            },
        },
        watch: {
            postMessage() {
                if (this.postMessage) {
                    this.fshowPostMessage()
                }
            }
        },
        methods: {
            addMedicatie() {
                this.clientData.medicatie.push({"item": null});
            },
            delMedicatie(item) {
                this.clientData.medicatie.splice(item, 1);
            },
            addAandoening() {
                this.clientData.aandoeningen.push({"item": null});
            },
            delAandoening(item) {
                this.clientData.aandoeningen.splice(item, 1);
            },
            addAllergie() {
                this.clientData.allergien.push({"item": null});
            },
            delAllergie(item) {
                this.clientData.allergien.splice(item, 1);
            },
            addHulpmiddel() {
                this.clientData.hulpmiddelen.push({"item": null});
            },
            delHulpmiddel(item) {
                this.clientData.hulpmiddelen.splice(item, 1);
            },
            addContactpersoon() {
                this.clientData.contactpersonen.push({"naam": null, "telefoon": null, "email": null, "adres": null, "woonplaats": null});
            },
            delContactpersoon(item) {
                this.clientData.contactpersonen.splice(item, 1);
            },
            createNewClient() {
                this.$store.dispatch("createNewClient", this.clientData);
            },
            fshowPostMessage() {
                this.showPostMessage = true;
                //setTimeout(this.showPostMessage = false, 5000);
            },
        },
    }

</script>
<style scoped>
    .test {
        padding: 0px;
        margin: 0px;
    }

</style>