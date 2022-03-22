<template>
    <v-container fill-height align="center">
        <v-row justify="center">
            <v-col 
                xs="12" 
                sm="7" 
                md="6" 
                lg="4" 
                xl="3"
            >
                <v-card :elevation="mobileViewElevation" :class="mobileViewPadding">
                    <v-form
                        v-model="valid"
                    >
                        <v-text-field 
                            label="gebruikersnaam"
                            v-model="loginData.username"
                            prepend-icon="mdi-account-circle"
                            :rules="nameRules"
                            required
                        />
                        <v-text-field 
                            label="wachtwoord"
                            v-model="loginData.password"
                            :type="showPassword ? 'text' : 'password'"
                            prepend-icon="mdi-lock"
                            :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                            :rules="nameRules"
                            @click:append="showPassword = !showPassword"
                            required
                        />  
                    </v-form>
                    <v-btn 
                        elevation="2" 
                        block
                        color="purple lighten-1"
                        class="white--text"
                        v-on:click="login()"
                    >
                        inloggen
                    </v-btn>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    export default {
        name: 'LogIn',

        data() {
            return {
                showPassword: false,
                username: "",
                password: "",
                valid: false,
                nameRules: [ v => !!v],
                loginData: {username: "", password: ""}
            }
        },

        created() {
            this.$store.dispatch("fetchUsers");
        },

        computed: {
            users() {
                return this.$store.state.users;
            },
            mobileViewPadding() {
                switch(this.$vuetify.breakpoint.name) {
                    case "xs": return "pa-0 pt-0 pb-0"
                    default : return "pa-5 pt-10 pb-10"
                }
            },
            mobileViewElevation() {
                switch(this.$vuetify.breakpoint.name) {
                    case "xs": return "0"
                    default : return "3"
                }
            }
        },

        methods: {
            test() {
                this.$router.push({path: "dashboard"});
            },
            login() {
                this.$store.dispatch("login", this.loginData)
            }

        },

    }
</script>

<style scoped>

</style>
