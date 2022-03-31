<template>
    <v-container
        fill-height
        align-center
    >
        <v-row justify="center">
            <v-col
                cols="5"
                align-content-space-between
            >
                <v-btn 
                    color="purple lighten-1" 
                    block 
                    class="white--text mt-5 font-weight-black text-h4" 
                    height="75px"
                    v-on:click="casus()"
                >
                    Casussen
                </v-btn>
                <v-btn 
                    color="purple lighten-1" 
                    block 
                    class="white--text mt-5 font-weight-black text-h4"
                    height="75px"
                    v-on:click="clienten()"
                >
                    Clienten
                </v-btn>
                <v-btn color="purple lighten-1" block class="white--text mt-5" height="75px">text</v-btn>
                <v-btn color="purple lighten-1" block class="white--text mt-5" height="75px">text</v-btn>
                <v-btn color="purple lighten-1" block class="white--text mt-5" height="75px">text</v-btn>
                {{userData}}
            </v-col>
        </v-row>
    </v-container>
</template>
<script>
    export default {
        name: "dashboardRouter",

        data() {
            return {

            }

        },
        created() {
            this.$store.dispatch("fetchUserData");
        },
        methods: {
            casus() {
                this.$router.push({path: "casus"});
            },
            clienten() {
                this.$router.push({path: "clienten"});
            }
        },
        computed: {
            userData() {
                return this.$store.state.user;
            },
        }
    }

</script>
<style scoped>



</style>