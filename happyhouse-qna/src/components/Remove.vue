<template>
  <div>삭제중...</div>
</template>
<script>
import axios from "axios";
import {bus} from '@/boardbus'
export default {
  methods:{
    removeBoard(no){
      console.log(".................remove");
      axios
      .delete(`http://localhost:9090/happyhouse/qna/board/${no}`)
      .then(({ data }) => {
        if (data == "success") {
          alert("삭제 완료!!!");
          this.$router.push("/list");
        } else {
          alert("삭제중 오류 발생");
          this.$router.push(`'/search?no='+${no}`);
        }
      })
      .catch(() => {
        alert("삭제중 오류 발생");
        this.$router.push(`'/search?no='+${no}`);
      });
    }
  },
  created() {
    bus.$on('removeBaord', this.removeBoard);
  }
}
</script>        
