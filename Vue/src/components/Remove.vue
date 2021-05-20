<template>
  <div>삭제중...</div>
</template>
<script>
import axios from "axios";
export default {
  created() {
    // let no = new URL(document.location).searchParams.get("no");
    console.log('remove.............',no)
    const no = this.$route.query.no;
    console.log('remove.............',no)
    axios
      .delete(`http://localhost:9999/happyhouse/qna/${no}`)
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
}
</script>
