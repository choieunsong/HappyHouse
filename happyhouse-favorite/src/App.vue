<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
import axios from "axios";
export default {
  components: {},
  name: "#app",
  created() {
    // 로그인 정보 불러오기
    axios
      .get("http://localhost:9090/happyhouse/favorite/getUserInfo")
      .then(({ data }) => {
        console.log(data);
        this.$store.dispatch("setUserIno", data);
      })
      .catch(() => {
        console.log("로그인 정보 불러오기 실패");
      });

    this.$router.push("/happyhouse/favoriteLocation");
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
