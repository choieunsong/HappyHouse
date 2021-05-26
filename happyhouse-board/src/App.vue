<template>
  <div id="app" class="container">
    <nav-header></nav-header>
    <router-view />
  </div>
</template>


<script>
import axios from "axios";
import {bus} from '@/boardbus';
import NavHeader from "@/components/NavHeader.vue";
export default {
  components: { NavHeader },
  name: '#app',
  created(){
      axios
      .get("http://localhost:9090/happyhouse/notice/board/getUserInfo")
      .then(({data}) => {
        console.log('get login info');
        console.log(data);
        this.$store.dispatch('setUserInfo', data);
      })
      .catch(() => {
        alert('로그인정보 불러오기 실패');
      });

      bus.$emit('setList');
      setTimeout(()=>{
        this.$router.push('/happyhouse/list');
      },100);
  }
}
</script>

