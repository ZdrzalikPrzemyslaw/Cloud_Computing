<template>
  <div id="mainContainer" class="container-fluid">
    <div id="logout_button" class="d-flex">
      <button class="logout_btn btn-sm text-right" v-on:click="logout">
        Logout
      </button>
    </div>
    <!-- <div id="settingsIcon" class="d-flex">
      <button v-on:click="showMenu('.menu')" class="settings_btn btn">
        <i style="color: white;" class="fas fa-user-cog"></i>
      </button>
    </div>
    <div class="menu menu--active justify-content-right">
      <div>
        <div class="row pl-sm-2">
          <div class="col-sm-4 desc text-left">Name and surname</div>
          <div class="col-sm-6 text-left">{{ name }} {{ surname }}</div>
          <div class="col-sm-1">
            <button v-on:click="showMenu('.name-block')" class="pen-icon">
              <i class="fas fa-pencil-alt pen-icon-color"></i>
            </button>
          </div>
        </div>
        <div class="name-block menu--active">
          <form role="form">
            <div class="form-group form-row">
              <label for="name" class="col-form-label text-left col-md-4 desc"
                >Name</label
              >
              <input
                v-model="name"
                type="text"
                id="name"
                class="form-control col-md-6 ml-md-2"
              />
            </div>
            <div class="form-group form-row">
              <label
                for="surname"
                class="col-form-label text-left col-md-4 desc"
                >Surname</label
              >
              <input
                v-model="surname"
                type="text"
                id="surname"
                class="form-control col-md-6 ml-md-2"
              />
            </div>
            <div class="text-right">
              <input
                class="btn btn-sm btn-secondary float-right"
                type="submit"
                value="Submit"
              />
            </div>
          </form>
        </div>
      </div>
      <hr />
      <div>
        <div class="row pl-sm-2">
          <div class="col-sm-4 desc text-left">Login</div>
          <div class="col-sm-6 text-left">{{ login }}</div>
          <div class="col-sm-1">
            <button v-on:click="showMenu('.login-block')" class="pen-icon">
              <i class="fas fa-pencil-alt pen-icon-color"></i>
            </button>
          </div>
        </div>
        <div class="login-block menu--active">
          <form role="form">
            <div class="form-group form-row">
              <label for="login" class="col-form-label text-left col-md-4 desc"
                >New login</label
              >
              <input
                type="text"
                id="login"
                class="form-control col-md-6 ml-md-2"
              />
            </div>
            <div class="text-right">
              <input
                class="btn btn-sm btn-secondary float-right"
                type="submit"
                value="Submit"
              />
            </div>
          </form>
        </div>
      </div>
      <hr />
      <div>
        <div class="row pl-sm-2">
          <div class="col-sm-4 desc text-left">Email</div>
          <div class="col-sm-6 text-left">{{ email }}</div>
          <div class="col-sm-1">
            <button v-on:click="showMenu('.email-block')" class="pen-icon">
              <i class="fas fa-pencil-alt pen-icon-color"></i>
            </button>
          </div>
        </div>
        <div class="email-block menu--active">
          <form role="form">
            <div class="form-group form-row">
              <label for="email" class="col-form-label text-left col-md-4 desc"
                >New email</label
              >
              <input
                type="email"
                id="email"
                class="form-control col-md-6 ml-md-2"
              />
            </div>
            <div class="text-right">
              <input
                class="btn btn-sm btn-secondary float-right"
                type="submit"
                value="Submit"
              />
            </div>
          </form>
        </div>
      </div>
      <hr />
      <div>Change password</div>
      <div style="display: none">
        <form>
          <input type="password" placeholder="Old password" />
          <input type="text" placeholder="New password" />
          <input type="text" placeholder="Repeat new password" />
          <input type="checkbox" value="Show password" />
          <input type="button" value="Submit" />
        </form>
      </div> -->
    <!-- </div> -->
  </div>
</template>

<script>
import store from "@/store";
import router from "@/router";

export default {
  name: "HelloWorld",
  data() {
    return {
      name: "Jan",
      surname: "Nowak",
      login: "JanLogin",
      email: "jannowak@p.lodz.pl",
    };
  },
  methods: {
    // showMenu: function(managedClass) {
    //   const menuButton = document.querySelector(managedClass);
    //   menuButton.classList.toggle("menu--active");
    // },
    confirmChange: function() {},
    logout: function() {
      // wylogowywanie usera za pomoca store
      store.dispatch("auth/logout");
      router.push("/login");
    },
  },
};
/*
div {
  display: flex;
  justify-content: space-between;
}
 */
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css");
 .settings_btn {
   background-color: #00abb7;
   color: rgba(245, 245, 245, 0.8);
   padding: 10px;
   font-size: 22px;
   cursor: pointer;
   margin: 0;
   border: 4px solid rgba(245, 245, 245, 0.8);
   border-radius: 10px;
 }

div > .container-fluid {
  display: flex;
}

.menu {
  position: absolute;
  background-color: #afeeee;
  color: black;
  width: 420px;
  padding: 10px;
  z-index: 1000;
  margin-top: 70px;
}

.name-block,
.login-block,
.email-block {
  padding: 10px;
}

.menu--active {
  display: none;
}

.desc {
  font-weight: 700;
}

.pen-icon {
  border: none;
  background-color: #afeeee;
  cursor: pointer;
}
.pen-icon-color {
  color: #00abb7;
}

.text-right > .btn {
  background: none;
  border: 2px solid black;
  border-radius: 10px;
  color: black;
  display: block;
  font-size: 0.7em;
  font-weight: bold;
  padding: 0.8em 2em;
  position: relative;
  text-transform: uppercase;
  height: 35px;
  top: 10px;
  margin-top: -23px;
}

.logout_btn {
  padding: 0.5em 2.5em;
  background: none;
  border: 4px solid rgba(245, 245, 245, 0.8);
  border-radius: 10px;
  color: rgba(245, 245, 245, 0.8);
  font-size: 1.0em;
  font-weight: bold;
  position: relative;
  text-transform: uppercase;
  margin: 0 20px 0 80px;
}

.logout_btn:hover {
  color: rgb(48, 47, 47, 0.8);
  border: 4px solid rgb(48, 47, 47, 0.8);
  background: rgba(245, 245, 245, 0.8);
}
</style>
