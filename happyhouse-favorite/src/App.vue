<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
import axios from "axios";
import {bus} from '@/boardbus';
export default {
  components: {},
  name: "#app",
  computed: {
    getUserInfo(){
          return this.$store.state.userinfo;
      },
  },
  created() {
       // 로그인 정보 불러오기
        axios
        .get("http://localhost:9090/happyhouse/favorite/getUserInfo")
        .then(({ data }) => {
            console.log(data);
            this.$store.dispatch("setUserInfo", data);
        })
        .catch(() => {
            console.log("로그인 정보 불러오기 실패");
            let data = {
              userno: 9,
              userid: "ssafy",
              email: "song@naver.com",
              username: "ssafy",
              address: "수원시 권선구",
              state: 0,
            }
            this.$store.dispatch("setUserInfo", data);
            console.log(this.getUserInfo);
        });
    //   let data = {
    //     userno: 9,
    //     userid: "ssafy",
    //     email: "song@naver.com",
    //     username: "ssafy",
    //     address: "수원시 권선구",
    //     state: 0,
    // }
    // this.$store.dispatch("setUserInfo", data);
    // console.log(this.getUserInfo);
    this.$router.push("/happyhouse/favorite");
    setTimeout(()=>{
      bus.$emit('favoriteList');
    }, 100);
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
