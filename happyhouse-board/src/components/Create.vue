<template>
  <div>
    <h2 class="text-center">게시글 등록</h2>
    <table class=" table table-condensed">
      <tr>
        <th>글쓴이</th>
        <td>
          <input
            readonly
            type="text"
            ref="writer"
            id="writer"
            placeholder="작성자를 입력해주세요"
            v-model = "getUserInfo.username"
          />
        </td>
      </tr>
      <tr>
        <th>제목</th>
        <td>
          <input
            type="text"
            v-model="title"
            ref="title"
            id="title"
            placeholder="제목을 입력해주세요"
          />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea id="content" v-model="content" ref="content" cols="100" rows="10"></textarea>
        </td>
      </tr>
    </table>

    <div class="text-right">
      <button class="btn btn-primary btn-group" @click="createHandler">등록</button>
      <button class="btn btn-primary btn-group" @click="moveHandler">목록</button>
    </div>
  </div>
</template>

  <script>
  import axios from 'axios';
  import {bus} from '@/boardbus';
  export default{
  data() {
    return {
      title: "",
      content: ""
    };
  },
  computed: {
      getUserInfo : function(){
        console.log('computed');
        console.log(this.$store.state.userinfo);
        return this.$store.state.userinfo;
      },
  },
  created(){
    let writer = this.getUserInfo.username;
    console.log('writer');
    console.log(writer);
  },
  methods: {
    createHandler() {
      //데이타 검증
      let err = true;
      let msg = "";

        !this.title &&
        ((msg = "제목을 입력해 주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.content &&
        ((msg = "내용을 입력해 주세요"), (err = false), this.$refs.content.focus());

      if (!err) {
        alert(msg);
      } else {
        axios
          .post("http://localhost:9090/happyhouse/notice/board", {
            writer: this.getUserInfo.username,
            title: this.title,
            content: this.content
          })
          .then(({ data }) => {
            if (data == "success") {
              alert("등록이 완료 됐습니다.");
              this.moveHandler();
            } else {
              alert("등록 실패");
            }
          })
          .catch(() => {
            alert("error 발생");
          });
      }
    },
    moveHandler() {
      this.$router.push('/happyhouse/list');
      setTimeout(()=>{
        this.content = '';
        bus.$emit('setList');
      }, 100);
    }
  }
  };
  </script>

<style>
.btn-group{
  margin: 10px;
  padding: 5px 30px;
}
</style>