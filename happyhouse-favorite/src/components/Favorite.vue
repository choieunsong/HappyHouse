<template>
    <div class="container-fluid" style="margin-top: 20px">
        <section class="head">
            <div class="container">
            <h2>{{getUserInfo.username}}님의 관심지역 목록</h2>
            </div>
        </section>
    <div class="row content">

        <div class="list-group col-md-4">
            <list :deals="deals"></list>
        </div>
        <div class="col-md-8">
            <div class="row">
                <!-- 카카오 -->
                <div class="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    <ul id="category">
                        <li id="BK9" data-order="0"> 
                            <span class="category_bg bank"></span>
                            은행
                        </li>       
                        <li id="MT1" data-order="1"> 
                            <span class="category_bg mart"></span>
                            마트
                        </li>  
                        <li id="PM9" data-order="2"> 
                            <span class="category_bg pharmacy"></span>
                            약국
                        </li>  
                        <li id="OL7" data-order="3"> 
                            <span class="category_bg oil"></span>
                            주유소
                        </li>  
                        <li id="CE7" data-order="4"> 
                            <span class="category_bg cafe"></span>
                            카페
                        </li>  
                        <li id="CS2" data-order="5"> 
                            <span class="category_bg store"></span>
                            편의점
                        </li>      
                    </ul>
				</div>
            </div>
            <detail></detail>
        </div>
    </div>
    </div>
</template>

<script>
import axios from "axios";
import {bus} from '@/boardbus';
import List from '@/components/List.vue';
import Detail from '@/components/Detail.vue';

export default {
    name: "Favorite",
    components: {
        List,
        Detail
    },
    data(){
        return {
            deals: [],
            imgsrc: '',
        }
    },
    computed: {
        getUserInfo(){
            return this.$store.state.userinfo;
        },
        getImageSource(){
            // this.imgsrc = "@/assets/house/house"+parseInt(Math.random() * 4)+".jpg";
            return "@/assets/house/house"+parseInt(Math.random() * 4)+".jpg";
        },
        getDealLength(){
            return this.$store.getters.getDealLength;
        }
    },
    created(){
        //this.favoriteList();
        bus.$on('favoriteList',this.favoriteList);
    },
    mounted(){
        if (window.kakao && window.kakao.maps) {
            console.log(window.kakao);
            this.initMap();
        } else {
            const script = document.createElement('script');
            /* global kakao */
            script.onload = () => kakao.maps.load(this.initMap);
            script.src = "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=5d2d848495108af4b2b93c70751c2ac3&libraries=services";
            document.head.appendChild(script);
            console.log(script);
        }
    },
    methods: {
        favoriteList(){
            let userinfo = this.getUserInfo;
            console.log(userinfo);
            console.log(userinfo.userno);

            axios.
            get(`http://localhost:9090/happyhouse/favorite/${userinfo.userno}`)
            .then(({data}) => {
                console.log('favorite list');
                console.log(data);
                this.deals = data;
                console.log(this.deals);

                this.$store.dispatch('setDealsInfo', data);
                let len = this.getDealLength;
                console.log('>>>>>>>>>>>>>>>>>>>>>>len: '+len);
                setTimeout(()=>{
                if(len > 0){
                    bus.$emit('toggleFlag', true);
                }else{
                    bus.$emit('toggleFlag', false);
                }
            }, 100);
            })
            .catch(err => {
                console.log(err);
                alert("관심지역 목록 조회 중 오류 발생");
            })
        },
        initMap(){
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);
            map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
        }
    },
};
</script>

<style>
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
@import url("https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700");
/* @import "@/assets/css/api.css";  */

img{
    width: 100%;
    padding: 10px;
}

h2 {
    float: left;
    width: 100%;
    margin-bottom: 40px;
    margin-top: 30px;
}

.head {
    float: left;
    width: 100%;
}
.listing-block {
    background: #fff;
    height: 1000px;
    overflow-y: scroll;
}

.map-box {
    background-color: #a3ccff;
}

.title{
    font-weight: bold;
    color:darkcyan;
}

.card :hover{
    background-color: lightgray;
}

.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
