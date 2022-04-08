<template>
    <v-container
        fill-height
        align-center
    >
        <v-row justify="center">
            <v-data-table
                :headers="headers"
                :items="klassen"
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
        name: "KlassenComponent",

        data() {
            return {
                search: "",
                headers: [
                    { text: 'id', value: 'id' },
                    { text: 'naam', value: 'naam' },
                ],
                emptyTable: [],
                loading: true,
                   
            }
        },
        created() {
            this.$store.dispatch("fetchKlassen");
        },
        computed: {
            klassen() {
                let klassen = this.$store.state.klassen;
                if (klassen) {
                    return klassen;
                }
                else {
                    return this.emptyTable;
                }                
            },
        },
        watch: {
            klassen() {
                if (this.klassen) {
                    this.loading = false;
                }
                else {
                    this.loading = true;
                }
            }
        },
        methods: {
            // selectedClient(client) {
            //     this.$router.push({path: "client", query: {id: client.id}});
            // }
        },
    }

</script>
<style scoped>
    .noselect {
        user-select: none;
    }


</style>