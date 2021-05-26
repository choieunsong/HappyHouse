<template>
    <li class="list-group-item">
        <div v-if="!updated">
            <div style="margin-bottom: 10px;">
                <span class="reply-header">{{reply.writer}}</span>
                (<span class="reply-header">{{reply.writetime | toDate}}</span>)
            </div>
            <div class="row">
                <div class="col-10">
                    <h5 class="card-text">{{reply.content}}</h5>
                </div>
                <div class="text-right" v-if="getUsername == reply.writer">
                    <div class="row">
                        <button class="btn btn-primary btn-reply" @click="toggleComment()">수정</button>
                        <button class="btn btn-primary btn-reply" @click="deleteComment(bno)">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <div v-else>
            <div>
            <div class="form-group row">                
                <label for="writer" class="col-sm-2 col-form-label">작성자 : </label>
                <div class="col-sm-10">
                    <input type="text" readonly class="form-control-plaintext" id="writer" v-model="getUsername">
                </div>
            </div>
            <div class="form-group">
                <textarea class="form-control" id="content" v-model="reply.content" ref="content" style="min-width: 100%"></textarea>
            </div>
            <div class="text-right">
                <div class="row">
                <button class ="btn btn-primary btn-reply" @click="updateComment(bno)">등록</button>
                <button class  ="btn btn-primary btn-reply" @click="toggleComment()">취소</button>
                </div>
            </div>
        </div>
        </div>
    </li>
</template>

<script>
import moment from "moment";
import axios from 'axios';
import {bus} from '@/boardbus'
export default {
    name: 'Comment',
    props: ['reply', 'bno'],
    data(){
        return{
            updated: false,
        }
    },
    computed: {
        getUsername(){
            return this.$store.state.userinfo.username;
        }
    },
    methods:{
        updateComment(bno){
            console.log(bno);
            axios
            .put(`http://localhost:9090/happyhouse/notice/board/reply`,{
                bno: bno,
                no: this.reply.no,
                write: this.reply.write,
                content: this.reply.content
            })
            .then(({data}) => {
                if(data == "success"){
                    console.log(data);
                    
                    this.updated = false;
                    
                    setTimeout(()=>{ 
                        bus.$emit('searchBoard', bno)
                    }, 100);
                } else{
                    alert("오류발생");
                }
            })
            .catch(() => {
                alert("오류 발생");
            });
        },
        toggleComment(){
            if(this.updated){
                this.updated  = false;
            }else{
                this.updated = true;
            }
        },
        deleteComment(bno){
            console.log(bno);
            console.log(this.reply.no);
            axios
            .delete(`http://localhost:9090/happyhouse/notice/board/reply/${this.reply.no}`)
            .then(({data}) => {
                if(data =="success"){
                    console.log(data);
                    console.log(bno);
                    
                    setTimeout(()=>{
                        bus.$emit('searchBoard', bno);
                    }, 100);
                } else {
                    alert("오류 발생");
                }
                
            })
            .catch(()=>{
                alert("오류 발생");
            })
        },
    },
    filters: {
        toDate: function (regtime) {
            return moment(new Date(regtime)).format("YYYY.MM.DD.HH:mm");
        }
    },
}
</script>

<style>
.reply-header{
    font-size: 15px;
}

.btn-reply{
    margin: 10px;
}
</style>