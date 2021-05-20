<template>
  <div>
    <h4 class="text-center">질문 목록</h4>
    <div class="text-right">
      <button class="btn btn-primary" @click="movePage">등록</button>
    </div>
    <div v-if="boards.length > 0">
      <table class="table table-boardered table-condensed">
        <colgroup>
          <col width="10%" />
          <col width="50%" />
          <col width="15%" />
          <col width="25%" />
        </colgroup>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>날짜</th>
        </tr>
        <tr v-for="(board, index) in boards" :key="index">
          <td>{{ board.no }}</td>
          <td>
            <router-link :to="'search?no=' + board.no">{{ board.title }}</router-link>
          </td>
          <td v-text="board.writer"></td>
          <td>{{ board.regtime | toDate }}</td>
        </tr>
      </table>
    </div>
    <div v-else>게시글이 없습니다.</div>
  </div>
</template>
<script>
// import http from '@/util/http-common.js'
import moment from "moment";
import {mapGetters} from "vuex";

export default {
  name: "list",
  computed:{
    // index.js의 getters의 boards를 가져온 것임
    ...mapGetters(["boards"])
  },
  filters: {
    toDate: function (regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    },
  },
  methods: {
    movePage() {
      this.$router.push("/create");
    },
  },
  created() {
    // action을 실행시켜주어야 한다.
    // dispatch에 의해 index의 actions의 getBoards가 실행된다.
    this.$store.dispatch("getBoards");
  },
};
</script>
