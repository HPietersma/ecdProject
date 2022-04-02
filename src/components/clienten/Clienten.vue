<template>
    <v-container
        fill-height
        align-center
    >
        <v-row justify="center">
            <v-data-table
                :headers="headers"
                :items="clients"
                :search="search"
                :loading="loading"
                @click:row="selectedClient"
                class="elevation-1"
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
               console.log(client.id)
           }
        },
    }

</script>
<style scoped>



</style>