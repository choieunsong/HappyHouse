<template>
  <div style="margin: 40px 0 40px;">

    <h2 class="text-center" style="margin-bottom: 30px;">게시글 내용</h2>

    <div class="shadow p-3 mb-5 bg-white rounded">
      <div >
        <table class="table table-borderless" align="center" v-if="board">
          
            <tr class="second">
              <th colspan="1" width="100">제목</th>
              <th colspan="3">{{board.title}}</th>
            </tr>

            <tr class="second">
              <th>작성자</th>
              <td width="80" align="center">{{board.writer}}</td>
              <th width="70">등록일</th>
              <td width="120" align="center"><span>{{board.regtime | toDate}}</span></td>
            </tr>
            <tr>
                <td height="200" colspan="4">{{board.content}}</td>
              </tr>
        </table>
      </div>
      <div class="text-center" v-if="getUsername == board.writer">
        <button class="btn btn-primary btn-group" @click="updateBoard()">수정</button>
        <button class="btn btn-primary btn-group" @click="removeBoard()">삭제</button>
      </div>
  </div>

    <div style="margin-top: 40px;">
      
        <ul class=" shadow p-3 mb-5 bg-white rounded">
            <li class="list-group-item"> 
              <fieldset class="fieldset-border">
                  <legend class="fieldset-border">댓글 등록하기</legend>
                  <div>
                      <div class="form-group row">
                          <label for="writer" class="col-sm-2 col-form-label">작성자 </label>
                          <div class="col-sm-10">
                              <input type="text" readonly class="form-control-plaintext" id="writer" v-model="getUsername">
                          </div>
                      </div>
                      <div class="form-group">
                          <textarea class="form-control" id="content" v-model="content" ref="content" style="min-width: 100%" rows="4" @keypress.enter="insertComment()"></textarea>
                      </div>
                      <button class="btn btn-primary" @click="insertComment()">등록하기</button>
                  </div>
              </fieldset>
          </li> 
          <comment v-for="(reply, index) in replies" :reply="reply" :key="index" :bno="board.no"></comment>
        </ul>
    </div>

  </div> 
  
</template>
<script>
import axios from "axios";
import moment from "moment";
import {bus} from '@/boardbus'
import Comment from '@/components/Comment.vue';

export default {
  components: {
    Comment,
  },
  data() {
    return { 
      board: {},
      replies: [],
      content: '',
    };
  },
  computed: {
    getUsername(){
      return this.$store.state.username;
    }
  },
  filters: {
    toDate: function (regtime) {
      return moment(new Date(regtime)).format("YYYY.MM.DD");
    }
  },
  created() {
    bus.$on('searchBoard',this.searchBoard)
  },
  methods:{
    updateBoard(){
      this.$router.push('/update');
      setTimeout(()=>{
        bus.$emit('updateBoard',this.board)
      },100)
    },
    removeBoard(){
      this.$router.push('/remove')
      setTimeout(()=>{
        bus.$emit('removeBaord',this.board.no)
      },100);
    },
    searchBoard(no){
      console.log('searchboard.................',no);
      axios
      .get(`http://localhost:9090/happyhouse/qna/board/${no}`)
      .then(({ data }) => {

        this.board = data;
        this.replies = data.replies;
        console.log(this.board);
        console.log('===================');
        console.log(this.replies);
      })
      .catch(err => {
        console.log(err);
        alert("게시글 조회 중 오류 발생");
      });
    },
  insertComment(){
        if(this.content === ''){
            alert("댓글을 입력해 주세요");
            this.$refs.content.focus();
            return;
        }
        console.log(this.content);
        console.log(this.username);
        console.log(this.board.no);
        axios
        .post(`http://localhost:9090/happyhouse/qna/board/reply`,{
            no: 0,
            bno: this.board.no,
            writer: this.getUsername,
            content: this.content
        })
        .then(({data}) => {
            if(data == "success"){
              alert("댓글 등록 완료.");
              // this.$router.push('/search');
              setTimeout(()=>{
                this.content = '';
                bus.$emit('searchBoard', this.board.no)
              }, 100);
            } else{
                alert("등록 실패");
                
            }
        })
        .catch(() => {
            alert("댓글 등록 실패");
        })
    }
  }
}
</script>

<style>
.panel-default { 
    border: 1px solid #ccc;    
}

.second {
  text-align: left;
  font-size: 15px;
  border-bottom: 2px dashed #DCDCDC;
}

.link-dark{
  font-size: 20px;
  color: #32CD32;
}

.btn-group{
  margin: 10px;
  padding: 5px 30px;
}

.form-control{
  border: 1 darkgray;
}

.form-control-plaintext{
  color: darkgray;
}
</style>
