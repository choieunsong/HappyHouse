<template>
  <div id="app" class="container">
    <nav-header></nav-header>
    <h2 class="text-center">QnA 게시판</h2>
    <router-view />
  </div>
</template>

<script>
import NavHeader from '@/components/NavHeader.vue'
export default {
  name:'App',
  components:{
    NavHeader
  }
}
</script>