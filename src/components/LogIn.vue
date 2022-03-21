<template>
    <v-container fill-height align="center">
        <v-row justify="center">
            <v-col 
                xs="12" 
                sm="8" 
                md="6" 
                lg="5" 
                xl="5"
            >
                <v-card :elevation="mobileViewElevation" :class="mobileViewPadding">
                    <v-form>
                        <v-text-field 
                            label="gebruikersnaam"
                            prepend-icon="mdi-account-circle"
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
                        v-on:click="test()"
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
            }
        },

    }
</script>

<style scoped>

</style>
