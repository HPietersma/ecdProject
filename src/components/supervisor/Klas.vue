<template>
<v-container
    fill-height
    align-center
>
    <div :class="mobile ? 'yes' : 'no'">
        <a @click="goBackOne()">klassen</a>
        >
        <a>{{$route.query.naam}}</a>

    </div>
    <v-row justify="center">
        <v-simple-table
            class="mt-2"
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
                                    {{newCasusData}}
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
                        <td v-for="(casus, index) in klasWithCasussen.klas[index].casussen" :key="index">
                            <div
                                class="status status-1"
                                v-if="casus.status == 0"
                            >
                            </div>
                            <div
                                class="status status-2"
                                v-if="casus.status == 1"
                            >
                            </div>
                            <div
                                class="status status-3"
                                v-if="casus.status == 2"
                            >
                            </div>
                        </td>
                    </tr>
                </tbody>
            </template>
        </v-simple-table>
    </v-row>
</v-container>
</template>
<script>
export default {
    name: "KlasComponent",

    data() {
        return {
            dialog: false,
            emptyTable: [],
            loading: true,
            newCasusData: {"naam": null, "client_id": null, "klas_id": this.$route.query.id,}
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
    height: 2em;
    width: 2em;
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



</style>