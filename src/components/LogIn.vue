<template>
    <v-container fill-height class="test1">
        <v-row justify="center" align="center" class="test">
            <v-col cols="3" align="center">
                <v-form>
                    <v-text-field 
                        label="gebruikersnaam"
                        prepend-icon="mdi-account-circle"
                        class="mr-5"
                    />
                    <v-text-field 
                        label="wachtwoord"
                        :type="showPassword ? 'text' : 'password'"
                        prepend-icon="mdi-lock"
                        :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                        @click:append="showPassword = !showPassword"
                        class="test"
                    />  
                </v-form>
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
                showPassword: false,
            }
        },

        created() {
            this.$store.dispatch("fetchUsers");
            console.log("test");
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
    .test {
        padding-left: 0px;
    }
</style>
