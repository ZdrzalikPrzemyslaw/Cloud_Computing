<template>
  <div class=".container-fluid">
    <div class="row">
      <div class="col-md-2" id="firstColumn">
        <SearchChats @search-event="handleChatListAppEvent" />
        <ChatsList
          :chats="eventChatList"
          @search-event="handleChatIdAppEvent"
          @search-event-name="handleChatNameAppEvent"
        />
      </div>
      <div class="col-md-1" />
      <div class="col-md-6">
        <ConversationView
          :chatId="eventChatId"
          :chatName="eventChatName"
          @search-event="handleBoolAppEvent"
          ref="send"
          id="centerColumn"
        />
        <SendMessage
          :chatId="eventChatId"
          v-if="eventBool"
          @send-message="handleSendMessageAppEvent"
        />
      </div>
      <div class="col-md-2" id="lastColumn">
        <Settings />
        <SearchUsers @search-event="handleUserListAppEvent" />
        <UserList :chatId="eventChatId" :usersFromSearch="eventUserList" />
      </div>
    </div>
  </div>
</template>

<script>
import ChatsList from "../components/ChatsList";
import ConversationView from "../components/ConversationView";
import Settings from "../components/Settings";
import SearchChats from "../components/SearchChats";
import SendMessage from "../components/SendMessage";
import SearchUsers from "../components/SearchUsers.vue";
import UserList from "../components/UserList.vue";

export default {
  name: "Home",
  components: {
    SearchChats,
    Settings,
    ChatsList,
    ConversationView,
    SendMessage,
    SearchUsers,
    UserList,
  },
  data() {
    return {
      eventChatList: Array,
      eventUserList: Array,
      eventChatId: Number,
      eventChatName: String,
      eventBool: Boolean,
    };
  },
  methods: {
    handleChatListAppEvent: function (data) {
      this.eventChatList = data;
    },
    handleUserListAppEvent: function (data) {
      this.eventUserList = data;
    },
    handleChatIdAppEvent: function (data) {
      this.eventChatId = data;
    },
    handleBoolAppEvent: function (data) {
      this.eventBool = data;
    },
    handleSendMessageAppEvent: function () {
      this.$refs.send.getChatMessages();
    },
    handleChatNameAppEvent: function (data) {
      this.eventChatName = data;
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  width: 100%;
  height: 100%;
  font-size: 20px;
}
body {
  background-image: url("bac.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}

.container-fluid * {
  width: 100%;
  height: 100%;
  table-layout: fixed;
}
#firstColumn {
  margin: 60px 10px;
}
#lastColumn {
  align-items: left;
  margin: 15px 10px;
}
#centerColumn {
  margin-top: 60px;
}
</style>