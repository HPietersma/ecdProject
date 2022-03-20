<template>
    <v-container fill-height class="test1">
        <v-row justify="center" align="center" class="test">
            <v-col cols="3" align="center">
                <v-text-field label="gebruikersnaam"/>
                <v-text-field label="wachtwoord"/>
                <v-btn 
                    elevation="2" 
                    block
                    color="purple lighten-1"
                    class="white--text"
                >
                    inloggen
                </v-btn>
            </v-col>
        </v-row>
        {{ users }}
    </v-container>
</template>

<script>
    export default {
        name: 'LogIn',

        data() {
            return {
                test: false,
            }
        },

        created() {
            this.$store.dispatch("fetchUsers")
        },

        computed: {
            users() {
                return this.$store.state.users;
            }
        },

        methods: {

        },

    }
</script>

<style scoped>

</style>
