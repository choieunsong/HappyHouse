<template>
    <div class="list-group listing-block shadow p-3 mb-1 bg-white rounded">
        <a class="list-group-item shadow p-3 mb-1 bg-white rounded list-group-item-action" v-for="(deal, index) in deals" :key="index" @click="moveHandler(deal)">
                <span class="icon-box">
                <label for="id-of-input" class="custom-checkbox">
                    <input type="checkbox" id="id-of-input" :value="deal.no" v-model="dealno" @change="remove($event)">
                    <i class="far fa-heart fa-2x heart-icon" data-toggle="tooltip" data-placement="top" title="관심지역 제거"></i>
                </label>
                </span>
            <div class="row">
                <div class="col-sm-5">
                    <img :src="imgsrc[parseInt(Math.random() * 4)].houseUrl" alt="house image" > 
                </div>
                <div class="col-sm-7 text-left">
                    <h4 class="title">{{deal.aptName}}</h4>
                    <h5>{{deal.city}} {{deal.gugun}} {{deal.dong}} {{deal.jibun}}번지</h5>
                    <h5>거래가: {{deal.dealAmount}}</h5>
                    <h5>{{deal.floor}}층</h5>
                </div>
            </div>
        </a>
    </div>
</template>

<script>
import axios from 'axios';
import {bus} from '@/boardbus'
export default {
    name: 'List',
    props: ['deals'],
    components: {  },
    data() {
        return {
            // deals: [],
            imgsrc: [
                {
                    houseUrl: "./img/house1.jpg"
                },
                {
                    houseUrl: "./img/house2.jpg"
                },
                {
                    houseUrl: "./img/house3.jpg"
                },
                {
                    houseUrl: "./img/house4.jpg"
                },
            ],
            dealno : [],
        };
    },
    computed: {
        getUsername(){
            return this.$store.state.username;
        },
        getDealLength(){
            return this.$store.getters.getDealLength;
        }
    },
    methods: {
        moveHandler(deal){
            console.log('list -- moveHandler');
            console.log(deal);
            console.log('list get ready for query');
            let query = {
                x : deal.lng,
                y : deal.lat,
                aptName: deal.aptName,
                dong: deal.dong
            };
            console.log(query); 
            setTimeout(()=>{
                bus.$emit('setDetail', deal);
                bus.$emit('toggleIsClick');
                bus.$emit('search', query);
            }, 100);

            
        },
        remove(e){
            console.log('remove event');
            console.log(this.dealno);
            let no = this.dealno[0];
            axios.
            delete(`http://localhost:9090/happyhouse/favorite/${no}`)
            .then(({data}) => {
                if(data == "success"){
                    console.log('관심지역 삭제 완료');
                    setTimeout(()=>{
                        bus.$emit('favoriteList');
                    }, 100);
                }else{
                    alert("관심지역을 삭제하는 도중 문제가 발생했습니다.");
                }
            })
            .catch(err => {
                console.log(err);
                alert("관심지역을 삭제하는 도중 문제가 발생했습니다.");
            })
            this.dealno = [];

            let dealLen = this.getDealLength;
            console.log('dealLen: '+dealLen);
            setTimeout(()=>{
                if(dealLen > 0){
                    bus.$emit('toggleFlag', true);
                }else{
                    bus.$emit('toggleFlag', false);
                }
            }, 100);
        }
    },
    created(){
        
    }
};
</script>

<style>
    .icon-box{
        float: right;
    }
    label input[type="checkbox"] {
        display: none;
    }
    .custom-checkbox {
        margin-left: 2em;
        position: relative;
        cursor: pointer;
    }

    .custom-checkbox .heart-icon {
        color: crimson;
        position: absolute;
        top: -0.4em;
        left: -1em;
    }

    .custom-checkbox .heart-icon:hover {
        color: gray;
    }
</style>