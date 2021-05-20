<template>
  <div>
    <h4 class="text-center">질문 내용</h4>
    <table class="table table-condensed w-25" v-if="board">
      <tr>
        <th>번호</th>
        <td v-text="board.no"></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td v-text="board.writer"></td>
      </tr>
      <tr>
        <th>제목</th>
        <td v-text="board.title"></td>
      </tr>
      <tr>
        <th>날짜</th>
        <td>{{ board.regtime | toDate }}</td>
      </tr>
      <tr>
        <td colspan="2" v-text="board.content"></td>
      </tr>
    </table>

    <div class="text-right">
      <router-link class="btn btn-primary" to="/list">목록</router-link>
      <router-link class="btn btn-primary" :to="'/update?no=' + board.no">수정</router-link>
      <router-link class="btn btn-primary" :to="'/remove?no=' + board.no">삭제</router-link>
    </div>

    <div v-if="board.comment != null">
      <h4>답변</h4>
      <div v-text="board.comment"></div>
    </div>

    <div v-if="board.comment == null">
      <h4>답변을 등록하세요</h4>
      <textarea id="comment" v-model.lazy="board.comment" ref="comment" cols="30" rows="10"></textarea>
      <button class="btn btn-primary" @click="createComment">등록</button>
    </div>


  </div>
</template>
<script>
import moment from "moment";
import {mapGetters} from "vuex";
import axios from "axios";

export default {
  computed:{
    ...mapGetters(["board"])
  },
  filters: {
    toDate: function (regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    }
  },
  created() {
    // 가져와달라는 요청을 해야하므로 dispatch
    this.$store.dispatch('getBoard', `/board/${this.$route.query.no}`)
  },
  methods: {
    createComment: function() {
      console.log("comment : "+this.board);
      let err = true;
      let msg = "";
      
      err && !this.comment && ((msg = "내용을 입력해 주세요"), (err = false), this.$refs.comment.focus());

      if (!err) alert(msg);
      else {
        console.log("comment : "+this.board);
        axios
          .put(`http://localhost:9999/happyhouse/qna?no=`+this.board.no, {
            no: this.board.no,
            title: this.board.title,
            writer: this.board.writer,
            content: this.board.content,
            comment: this.board.comment,
          })
          .then(({ data }) => {
            if (data == "success") {
              console.log("update................", data);
              alert("답변 등록 완료!!!");
              this.moveHandler();
            } else {
              alert("답변 등록 중 오류 발생");
            }
          })
          .catch(() => {
            alert("오류 발생");
          });
      } // else end
    }, //function end
    moveHandler: function() {
       console.log("comment : "+this.board);
      this.$router.push("'search?no=' + board.no");
    }
  }
};
</script>
