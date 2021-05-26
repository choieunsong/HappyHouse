<template>
  <div style="margin-top: 40px;">
    <div class="container">

      <div class="text-right" style="margin: 30px 0 30px;" v-if="isAdmin">
        <router-link to="/happyhouse/create" class="btn btn-primary">등록하기</router-link>
      </div>

      <div class="table-responsive" v-if="boards.length > 0">

        <table class="table table-hover">
          <thead>
            <tr>
              <th>번호</th>
              <th>작성자</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr scope="row" v-for="(board, index) in boards" :key="index"  @click="searchBoard(board.no )">
              <td>{{ board.no }}</td>
              <td v-text="board.writer"></td>
              <td v-text="board.title"></td>
              <td>{{ board.regtime | toDate }}</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-else>게시글이 없습니다.</div>
    </div>

  </div> 
  
</template>

<script>
// import http from '@/util/http-common.js'
import moment from "moment";
import axios from "axios";
import {bus} from '@/boardbus'
export default {
  name: "list",
  data() {
    return { 
      boards: [], 
      isAdmin: false,
    };
  },
  computed: {
      getUserInfo : function(){
        console.log('computed');
        console.log(this.$store.state.userinfo);
        return this.$store.state.userinfo;
      },
  },
  filters: {
    toDate: function (regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    }
  },
  methods: {
    searchBoard(no){
      this.$router.push('/happyhouse/search')
      setTimeout(()=>{
        bus.$emit('searchBoard', no)
      }, 100);

    },
    movePage() {
      this.$router.push("/happyhouse/create");
    },
    setList(){
      axios
      .get("http://localhost:9090/happyhouse/notice/board")
      // .then(result => {
      //   console.log(result);
      //   console.log(result.data);
      // })
      .then(({ data }) => {
        //결과 Object에서 data만 추출
        this.boards = data;
        console.log("list......", data);
      })
      .catch(err => {
        console.log(err);
        alert("오류 발생!!");
      });
    },
  },
  created() {
    bus.$on('setList', this.setList);
    this.setList();
  },
  mounted(){
      console.log('mounted getUserInfo');
      console.log(this.getUserInfo.username);
      console.log(this.getUserInfo.state);
      console.log(this.getUserInfo.state == '1');
      this.isAdmin = this.getUserInfo.state == '1' ? true : false;
      console.log(this.isAdmin);
  }
  
};
</script>
