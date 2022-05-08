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
                <v-expansion-panels 
                    v-if="casussen"
                    :value="opened"
                >
                    <v-expansion-panel>
                        <v-expansion-panel-header>
                            <h4>Nieuw</h4> <div><v-icon v-if="casusNieuw.length > 0" color="primary">mdi-exclamation</v-icon></div>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            <div
                                v-for="(item, index) in casusNieuw" :key="index"
                                class="pa-1 ma-1 items"
                                v-on:click="selectedCasus(item)"
                            >
                                {{item.naam}}
                            </div>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                    <v-expansion-panel>
                        <v-expansion-panel-header>
                            <h4>Actief</h4>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content> 
                            <div
                                v-for="(item, index) in casusActief" :key="index"
                                class="pa-1 ma-1 items"
                                v-on:click="selectedCasus(item)"
                            >
                                {{item.naam}}
                            </div>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                    <v-expansion-panel>
                        <v-expansion-panel-header>
                            <h4>Afgerond</h4>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            <div
                                v-for="(item, index) in casusAfgerond" :key="index"
                                class="pa-1 ma-1 items"
                                v-on:click="selectedCasus(item)"
                            >
                                {{item.naam}}
                            </div>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                    
                </v-expansion-panels>
            </v-col>
        </v-row>
    </v-container>
</template>
<script>
    export default {
        name: "CasusComponent",

        data() {
            return {
                opened: 1,
            }

        },
        created() {
            this.$store.dispatch("getCasussen");
        },
        computed: {
            casussen() {
                return this.$store.state.casussen;
            },
            casusAfgerond() {
                return this.$store.state.casussen.data.filter(i => i.status == "1")
            },
            casusActief() {
                return this.$store.state.casussen.data.filter(i => i.status == "2")
            },
            casusNieuw() {
                return this.$store.state.casussen.data.filter(i => i.status == "3")
            }
        },
        watch: {
            
        },
        methods: {
            selectedCasus(casus) {
                this.$router.push({path: "casusView", query: {id: casus.id}});
            }
        },
    }

</script>
<style scoped>

.items {
    user-select: none;
    border-radius: 5px;
}

.items:hover {
    background-color: rgb(240, 243, 250);
}


</style>