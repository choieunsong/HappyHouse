<template>
  <div>
    <h4 class="text-center">게시글 수정</h4>
    <table class="table table-condensed w-25">
      <tr>
        <th>제목</th>
        <td>
          <input type="text" id="title" ref="title" placeholder="제목을 입력해주세요" v-model="board.title" />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea id="content" cols="30" rows="10" ref="content" v-model="board.content"></textarea>
        </td>
      </tr>
    </table>

    <div class="text-right">
      <button class="btn btn-primary" @click="updateHandler">수정</button>
      <button class="btn btn-primary" @click="moveHandler">목록</button>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import {mapGetters} from "vuex";
export default {
  computed:{
    ...mapGetters(["board"])
  },
  methods: {
    updateHandler: function() {
      let err = true;
      let msg = "";
      //필수 요건 검사
      err &&
        !this.board.title &&
        ((msg = "제목을 입력해 주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.board.content &&
        ((msg = "내용을 입력해 주세요"), (err = false), this.$refs.content.focus());

      if (!err) alert(msg);
      else {
        axios
          .put(`http://localhost:9999/happyhouse/qna`, {
            no: this.board.no,
            title: this.board.title,
            writer: this.board.writer,
            content: this.board.content
          })
          .then(({ data }) => {
            if (data == "success") {
              console.log("update................", data);
              alert("수정 완료!!!");
              this.moveHandler();
            } else {
              alert("수정 중 오류 발생");
            }
          })
          .catch(() => {
            alert("오류 발생");
          });
      } // else end
    }, //function end
    moveHandler: function() {
      this.$router.push("/list");
    }
  },
  // search를 거쳐야만 update할 수 있다. 
  // create 메소드를 지운 이유는 index.js에 데이터가 담겨있기 때문에 피룡가 없다.
  // 위의 computed에서 board로 가져온다.
}
</script>   
