<template>
<div>
    <v-container
        fill-height
        align-center
        :class="{blur : BshowModal}"
    >
        <v-row justify="center">
            <v-simple-table
                class="mt-4"
                v-if="klasWithCasussen"
            >
                <template v-slot:default>
                    <thead>
                        <tr>
                            <th class="text-left">
                                Naam
                            </th>
                            <th class="text-left" v-for="item in klasWithCasussen.casussen" :key="item">
                                {{item}}
                            </th>
                            <th>
                                <v-dialog
                                    v-model="dialog"
                                    width="500"
                                >
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-btn 
                                            x-small 
                                            outlined 
                                            color="primary"
                                            v-bind="attrs"
                                            v-on="on"
                                            v-on:click="getClients()"
                                        >
                                            nieuwe casus
                                        </v-btn>
                                    </template>
                                    <v-card class="pa-2">
                                        <v-card-text>
                                            <v-text-field
                                                label="naam"
                                                v-model="newCasusData.naam"
                                            >
                                            </v-text-field>
                                            <v-select
                                                :items="clients"
                                                item-text="id"
                                                label="Client"
                                                solo
                                                v-model="newCasusData.client_id"
                                            >
                                            <template v-slot:item="{item}">
                                                    {{item.voornaam}}
                                                </template>    
                                                <template v-slot:selection="{item}">
                                                    {{item.voornaam}}
                                                </template>
                                            </v-select>
                                        </v-card-text>
                                        <v-divider></v-divider>
                                        <v-card-actions>
                                            <v-spacer></v-spacer>
                                            <v-btn
                                                color="primary"
                                                text
                                                v-on:click="createCasus()"
                                                @click="dialog = false"
                                            >
                                                Aanmaken
                                            </v-btn>
                                        </v-card-actions>
                                    </v-card>
                                </v-dialog>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, index) in klasWithCasussen.klas" :key="index">
                            <td>
                                {{item.user.voornaam}} 
                                {{item.user.achternaam}}
                            </td>
                            <td v-for="(casus, index) in klasWithCasussen.klas[index].casussen" :key="index" v-on:click="showModal(casus.id)">
                                <div
                                    class="status grey lighten-3"
                                    v-if="casus.status == 0"
                                >
                                </div>
                                <div
                                    class="status blue lighten-4"
                                    v-if="casus.status == 1"
                                >
                                </div>
                                <div
                                    class="status blue lighten"
                                    v-if="casus.status == 2"
                                >
                                </div>
                                <div
                                    class="status blue darken-4"
                                    v-if="casus.status == 3"
                                >
                                </div>
                                <div
                                    class="status orange"
                                    v-if="casus.status == 4"
                                >
                                </div>
                                <div
                                    class="status green"
                                    v-if="casus.status == 5"
                                >
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </template>
            </v-simple-table>
        </v-row>
    </v-container>
    <v-card class="casusView" v-if="BshowModal" style="overflow-y: scroll; overflow-x:">
        <div style="display: flex; justify-content: end;">
            <v-spacer/>
            <v-btn
                x-small
                tile
                color="error"
                v-on:click="hideModal()"
            >
                <b>X</b>
            </v-btn>
        </div>
        <CasusView :id="casusID"/>
    </v-card>

</div>
</template>
<script>
import CasusView from "./showCasus.vue";

export default {
    name: "KlasComponent",
    components:{
        CasusView
    },

    data() {
        return {
            dialog: false,
            emptyTable: [],
            loading: true,
            newCasusData: {"naam": null, "client_id": null, "klas_id": this.$route.query.id,},
            casusID: null,
            BshowModal: false,
        }
    },
    created() {
        this.$store.dispatch("getKlasWithCasussen", {"klas_id": this.$route.query.id});
    },
    computed: {
        // klas() {
        //     let klas = this.$store.state.klas;
        //     if (klas) {
        //         return klas;
        //     }
        //     else {
        //         return this.emptyTable;
        //     }                
        // },
        mobile() {
            switch(this.$vuetify.breakpoint.name) {
                case "xs": return true
                default : return false
            }
        },
        clients() {
            let clients = this.$store.state.clients;
            if (clients) {
                return clients;
            }
            else {
                return this.emptyTable;
            }                
        },
        klasWithCasussen() {
            return this.$store.state.casusList;
        },
        // casusListFilteredByName() {
        //     return [...new Set(this.$store.state.casusList.map(({naam})=>naam))];
        // },
    },
    watch: {
        // klas() {
        //     if (this.klas) {
        //         this.loading = false;
        //     }
        //     else {
        //         this.loading = true;
        //     }
        // }
    },
    methods: {
        opdrachten() {
            this.$router.push({path: "opdrachten", query: {id: this.$route.query.id, naam: this.$route.query.naam}});
        },
        goBackOne() {
            this.$router.go(-1);
        },
        createCasus() {
            this.$store.dispatch("createCasus", this.newCasusData)
        },
        getClients() {
            this.$store.dispatch("fetchClients");
        },
        showModal(casus) {
            this.casusID = casus;
            this.BshowModal = true;
        },
        hideModal() {
            this.BshowModal = false;
        }
    },
}

</script>
<style scoped>
.noselect {
    user-select: none;
}

.no {
    margin-left: calc(50% - 275px);
    margin-top: 5px;
    margin-bottom: 5px;
}

.yes {
    margin-left: 5px;
    margin-top: 5px;
    margin-bottom: 5px;
}

.status {
    height: 1.5em;
    width: 1.5em;
    border-radius: 1em;
}

.status-1 {
    background-color: blue;
}

.status-2 {
    background-color: green;
}

.status-3 {
    background-color: red;
}

.casusView {
    background-color: rgb(240, 240, 240);
    position: absolute;
    top: 100px;
    height: 80vh;
    width: 1000px;
    left: 0;
    right: 0;
    margin-left: auto;
    margin-right: auto;
}

.blur {
    filter: blur(5px);
}


</style>