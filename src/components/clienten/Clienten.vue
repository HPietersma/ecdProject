<template>
    <v-container
        fill-height
        align-center
    >
        <v-row>
            <v-btn
                color="primary"
                outlined
                x-small
                class=""
                :class="mobile ? 'yes' : 'no'"
                to="/dashboard/clientForm"
            >
                nieuwe client
            </v-btn>
        </v-row>
        <v-row justify="center">
            <v-data-table
                :headers="headers"
                :items="clients"
                :search="search"
                :loading="loading"
                @click:row="selectedClient"
                class="elevation-1 noselect"
            >
                <template v-slot:top>
                    <v-text-field
                        v-model="search"
                        label="Zoeken"
                        class="mx-4"
                        prepend-icon="mdi-account-search"
                    >
                    </v-text-field>
                </template>
            </v-data-table>
            <router-view/>
        </v-row>
    </v-container>
</template>
<script>
    export default {
        name: "ClientenComponent",

        data() {
            return {
                search: "",
                headers: [
                    { text: 'Achternaam', value: 'achternaam' },
                    { text: 'Voornaam', value: 'voornaam' },
                    { text: 'Geboortedatum', value: 'geboortedatum' },
                ],
                emptyTable: [],
                loading: true,
                   
            }
        },
        created() {
            this.$store.dispatch("fetchClients");
        },
        computed: {
            clients() {
                let clients = this.$store.state.clients;
                if (clients) {
                    return clients;
                }
                else {
                    return this.emptyTable;
                }                
            },
            mobile() {
                switch(this.$vuetify.breakpoint.name) {
                    case "xs": return true
                    default : return false
                }
            },
        },
        watch: {
            clients() {
                if (this.clients) {
                    this.loading = false;
                }
                else {
                    this.loading = true;
                }
            }
        },
        methods: {
            selectedClient(client) {
                this.$router.push({path: "client", query: {id: client.id}});
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


</style>