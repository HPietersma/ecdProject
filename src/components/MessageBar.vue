<template>
    <div
        align-center
        class="test"
    >
        <v-row justify="center">
            <v-col cols="3">
                <div class="test2">
                    TestTestTest
                </div>
            </v-col>
        </v-row>
    </div>
</template>
<script>
    export default {
        name: "ClientComponent",

        data() {
            return {
                data: null,
            }
        },
        created() {
            
        },
        computed: {
        
        },
        watch: {
            
        },
        methods: {
      
        },
    }

</script>
<style scoped>

    .test {
        background-color: rgb(202, 233, 202);
        border: 1px solid rgba(0, 0, 0, 0);
    }

    .test2 {
        padding: 10px;
    }


</style>