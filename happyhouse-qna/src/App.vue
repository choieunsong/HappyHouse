<template>
  <div id="app" class="container">
    <nav-header></nav-header>
    <router-view/>
  </div>
</template>


<script>
import axios from "axios";
import NavHeader from "@/components/NavHeader.vue";
export default {
  components: { NavHeader },
  name: '#app',
  created(){
      axios
      .get("http://localhost:9090/happyhouse/qna/board/getUserInfo")
      .then(({data}) => {
        console.log(data);
        this.$store.dispatch('setUserInfo', data);
      })
      .catch(() => {
        alert('로그인정보 불러오기 실패');
      });

      this.$router.push('/list');
  }
}
</script>