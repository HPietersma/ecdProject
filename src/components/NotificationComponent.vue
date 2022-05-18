<template>
    <div class="notificationDiv" :class="message.succes ? 'yes' : 'no'">
        <div> {{ message.message }} </div> 
        <v-spacer></v-spacer>
        <v-icon small @click="hideNotification()">mdi-window-close</v-icon>
    </div>
</template>
<script>
export default {
    data() {
        return {
            data: null,
        }
    },
    created() {
        setTimeout(this.hideNotification, 5000);
    },
    computed: {
        message() {
            return this.$store.state.notificationMessage;
        }
    },
    watch: {
        
    },
    methods: {
        hideNotification() {
            this.$store.dispatch("hideNotification");
        }
    },
}

</script>
<style scoped>
    .notificationDiv {
        position: fixed;
        bottom: 0;
        right: 0;
        margin-right: 15px;
        margin-bottom: 15px;
        border-radius: 5px;
        width: 320px;
        padding: 5px;
        padding-left: 10px;
        padding-right: 10px;
        display: flex;
    }

    .yes {
        background-color: rgb(177, 236, 177);
        color: rgb(1, 110, 1);
    }

    .no {
        background-color: rgb(236, 177, 177);
        color: rgb(110, 1, 1);
    }


</style>