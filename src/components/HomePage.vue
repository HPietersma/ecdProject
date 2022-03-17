<template>
    <v-container fill-height>
        <v-row justify="center" align="center">
            <v-col cols="12" xl="3" lg="4" md="5" sm="7" align="center">
                <v-text-field label="gebruikersnaam">
                </v-text-field>

                <v-text-field label="wachtwoord">
                </v-text-field>

                <v-btn 
                    elevation="2" 
                    block
                    color="purple lighten-1"
                    class="white--text"
                    :loading="loading"
                    @click="loader = 'loading'"
                >
                    inloggen
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    export default {
        name: 'HomePage',

        data() {
            return {
                test: false,
            }
        },

        created() {

        },

        computed: {

        },

        methods: {

        },

    }
</script>

<style scoped>

</style>
