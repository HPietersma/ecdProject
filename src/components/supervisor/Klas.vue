<template>
<v-container
        fill-height
        align-center
    >
        <v-row justify="center">
            <v-data-table
                :headers="headers"
                :items="klas"
                :search="search"
                :loading="loading"
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
        name: "KlasComponent",

        data() {
            return {
                search: "",
                headers: [
                    { text: 'id', value: 'id' },
                    { text: 'naam', value: 'username' },
                    { text: 'email', value: 'email' },
                ],
                emptyTable: [],
                loading: true,
            }
        },
        created() {
            this.$store.dispatch("fetchKlas", {"klas_id": this.$route.query.id});
        },
        computed: {
            klas() {
                let klas = this.$store.state.klas;
                if (klas) {
                    return klas;
                }
                else {
                    return this.emptyTable;
                }                
            },
        },
        watch: {
            klas() {
                if (this.klas) {
                    this.loading = false;
                }
                else {
                    this.loading = true;
                }
            }
        },
        methods: {
      
        },
    }

</script>
<style scoped>



</style>