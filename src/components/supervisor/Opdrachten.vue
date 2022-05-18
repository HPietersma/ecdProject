<template>
<v-container
        fill-height
        align-center
    >
        <div :class="mobile ? 'yes' : 'no'">
            <a @click="goBackTwo()">klassen</a>
            >
            <a @click="goBackOne()">{{$route.query.naam}}</a>
            >
            <a>opdrachten</a>

        </div>
        <v-row justify="center">
            <v-data-table
                :headers="headers"
                :items="klas"
                :search="search"
                :loading="loading"
                class="elevation-1 noselect mt-2"
            >
                <template v-slot:top>
                    <div
                        class="pa-2 text-left"
                    >
                        <v-btn
                            small
                            @click="opdrachten()"
                        >
                            opdrachten
                        </v-btn>
                    </div>
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
                { text: 'naam', value: 'voornaam' },
                { text: 'achternaam', value: 'achternaam' },
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
        mobile() {
            switch(this.$vuetify.breakpoint.name) {
                case "xs": return true
                default : return false
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
        opdrachten() {
            this.$router.push({path: "opdrachten", query: {id: this.$route.query.id}});
        },
        goBackOne() {
            this.$router.go(-1);
        },
        goBackTwo() {
            this.$router.go(-2);
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