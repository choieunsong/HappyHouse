s<template>
    <div class="container-fluid" style="margin-top: 20px">
        <section class="head">
            <div class="container" style="margin-bottom: 30px;">
            <h1><strong class="title">{{getUserInfo.username}}</strong>님의 관심지역 목록</h1>
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
                    <li id="CS2" data-order="1" @click="changeMarker('편의점')"> 
                        <span class="category_bg store"></span>
                        편의점
                    </li>        
                    <li id="MT1" data-order="2" @click="changeMarker('마트')"> 
                        <span class="category_bg mart"></span>
                        마트
                    </li>  
                    <li id="SW8" data-order="3" @click="changeMarker('지하철')"> 
                        <span class="category_bg subway"></span>
                        지하철
                    </li>  
                    <li id="SC4" data-order="4" @click="changeMarker('학교')"> 
                        <span class="category_bg school"></span>
                        학교
                    </li>  
                    <li id="FD6" data-order="5" @click="changeMarker('식당')"> 
                        <span class="category_bg restaurant"></span>
                        식당
                    </li>  
                    <li id="CE7" data-order="6" @click="changeMarker('카페')"> 
                        <span class="category_bg cafe"></span>
                        카페
                    </li>     
                </ul>
            </div>
            </div>
            <detail></detail>
            <div class="container" v-if="flag">
                <div style="margin: 40px;" class="justify-content-center">
                    <h3 style="margin-bottom: 30px;">500m 반경 안의 상권 정보</h3>
                    <div class="row">
                        <table class="table table-border">
                            <thead>
                                <th scope="col">편의점</th>
                                <th scope="col">마트</th>
                                <th scope="col">지하철</th>
                                <th scope="col">학교</th>
                                <th scope="col">식당</th>
                                <th scope="col">카페</th>
                            </thead>
                            <tbody>
                                <td>{{this.$store.state.dataCnt.convenient}}개</td>
                                <td>{{this.$store.state.dataCnt.mart}}개</td>
                                <td>{{this.$store.state.dataCnt.subway}}개</td>
                                <td>{{this.$store.state.dataCnt.school}}개</td>
                                <td>{{this.$store.state.dataCnt.restaurant}}개</td>
                                <td>{{this.$store.state.dataCnt.cafe}}개</td>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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
            map: '',
            flag: false,
            type: [
                {name: '편의점', code: 'CS2'},
                {name: '마트', code: 'MT1'},
                {name: '지하철', code: 'SW8'},
                {name: '학교', code: 'SC4'},
                {name: '식당', code: 'FD6'},
                {name: '카페', code: 'CE7'}],
            markers: [],   
            circle: {},
            x: '',
            y: '',
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
        },
        
    },
    created(){
        //this.favoriteList();
        bus.$on('favoriteList',this.favoriteList);
        bus.$on('search',this.search);
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

            // 지도에 표시할 원을 생성합니다
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
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };

            this.map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 
        },
        setCenter(lat, lng){
            var moveLatLng =  new kakao.maps.LatLng(lat, lng);
            this.map.setCenter(moveLatLng);
        },
        search(query){
            console.log('favorite -- send query to kakao api');
            this.flag = true;
            console.log(query);

            this.x = query.x;
            this.y = query.y;
            
            //메인 마커 띄우기 
            var markerPosition = new kakao.maps.LatLng(query.y, query.x);           
            // 마커 생성 
            var marker = new kakao.maps.Marker({
                map: this.map,
                position: markerPosition,
            }); 
            marker.setMap(this.map);
            this.setCenter(query.y, query.x);

           // 지도에 표시할 원을 생성합니다
            this.circle = new kakao.maps.Circle({
                center : markerPosition,  // 원의 중심좌표 입니다 
                radius: 500, // 미터 단위의 원의 반지름입니다 
                strokeWeight:4, // 선의 두께입니다 
                strokeColor: '#75B8FA', // 선의 색깔입니다
                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'dashed', // 선의 스타일 입니다
                fillColor: '#CFE7FF', // 채우기 색깔입니다
                fillOpacity: 0.5  // 채우기 불투명도 입니다   
            }); 

            // 지도에 원을 표시합니다 
            this.circle.setMap(this.map); 


            // 주변 데이터 개수 가져오기 
            for(var i = 0; i < this.type.length; i++){
                this.getSearchLen(i, query);
            }

        },
        getSearchLen(idx, query){
            console.log('~~~~~~~get searchlen ');
            console.log('idx: '+idx+', query: '+query);
            let radius = 500;
            let name = this.type[idx].name;
            let code = this.type[idx].code;
            console.log('name: '+name+", code: "+code);
            axios({
                url: `https://dapi.kakao.com/v2/local/search/keyword.json?query=${name}&x=${query.x}&y=${query.y}&radius=${radius}&category_group_code=${code}`,
                method: 'get',
                headers: {'Authorization': 'KakaoAK 04a0a8afa1148ce20fa12e3de906560b'}
            })
            .then(({data}) => {
                console.log('카카오 찾기 결과 성공 '+idx);
                console.log(data);
                let cnt = data.documents.length;
                console.log(cnt);
                let pass = {
                    idx: idx,
                    cnt: cnt
                };
                console.log(pass);
                this.$store.dispatch('setDataCnt',pass);
            })
            .catch(err => {
                console.log('카카오 찾기 결과 실패');
                console.log(err);
            });
        },
        changeMarker(type){
            console.log('change marker')
            console.log(type);
            
            //기존 마커 지워주기 
            this.setMarker(null);

            var conv = document.getElementById('CS2');
            var mart = document.getElementById('MT1');
            var subway = document.getElementById('SW8');
            var school = document.getElementById('SC4');
            var restaurant = document.getElementById('FD6');
            var cafe = document.getElementById('CE7');

            if(type == '편의점'){
                conv.className = 'menu_selected';
                mart.className = '';
                subway.className = '';
                school.className = '';
                restaurant.className = '';
                cafe.className = '';
                this.getPositions(type, conv.id);
            }else if(type == '마트'){
                conv.className = '';
                mart.className = 'menu_selected';
                subway.className = '';
                school.className = '';
                restaurant.className = '';
                cafe.className = '';
                this.getPositions(type, mart.id);
            }else if(type == '지하철'){
                conv.className = '';
                mart.className = '';
                subway.className = 'menu_selected';
                school.className = '';
                restaurant.className = '';
                cafe.className = '';
                this.getPositions(type, subway.id);
            }else if(type == '학교'){
                conv.className = '';
                mart.className = '';
                subway.className = '';
                school.className = 'menu_selected';
                restaurant.className = '';
                cafe.className = '';
                this.getPositions(type, school.id);
            }else if(type =='식당'){
                conv.className = '';
                mart.className = '';
                subway.className = '';
                school.className = '';
                restaurant.className = 'menu_selected';
                cafe.className = '';
                this.getPositions(type, restaurant.id);
            }else if(type == '카페'){
                conv.className = '';
                mart.className = '';
                subway.className = '';
                school.className = '';
                restaurant.className = '';
                cafe.className = 'menu_selected';
                this.getPositions(type, cafe.id);
            }
        },
        setMarker(flag){
            for(var i = 0; i < this.markers.length; i++){
                this.markers[i].setMap(flag);
            }
        },
        getPositions(type, code){
            console.log('>>>>>>>>>>>>>. get positions ');
            console.log('type: '+type+', code: '+code);

            let radius = 500;
            this.markers = [];

            axios({
                url: `https://dapi.kakao.com/v2/local/search/keyword.json?query=${type}&x=${this.x}&y=${this.y}&radius=${radius}&category_group_code=${code}`,
                method: 'get',
                headers: {'Authorization': 'KakaoAK 04a0a8afa1148ce20fa12e3de906560b'}
            })
            .then(({data}) => {
                console.log('카카오로 좌표 찾기 결과 성공 ');
                console.log(data);
                var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';
                for(var i = 0; i < data.documents.length; i++){
                    var info = data.documents[i];
                    var imageSize = new kakao.maps.Size(30, 30);
                    let markerImage = new kakao.maps.MarkerImage(markerImageSrc, imageSize);

                    var marker = new kakao.maps.Marker({
                        position: new kakao.maps.LatLng(data.documents[i].y, data.documents[i].x),
                        image: markerImage
                    });
                    this.markers.push(marker);
                    console.log('info');
                    console.log(info);
                    var infowindow = new kakao.maps.InfoWindow({
                        position: marker.position,
                        // content: '<div class="placeinfo">' +
                        //             +'<a class="title" href="'+info.place_url+'>'+info.place_name+'</a>'
                        //             +'<span class="title">'+info.road_address_name+'</span>'
                        //             +'<span class="title">거리:'+ info.distance+'m</span></div>'
                        content: '<div style="width:50px; height:30px;>근린공원</div>'
                    })

                    kakao.maps.event.addListener(marker, 'mouseover', function(){
                        console.log('info window open');
                        console.log(marker);
                        console.log(infowindow.content);
                        infowindow.open(this.map, marker);
                    });
                    kakao.maps.event.addListener(marker, 'mouseout', function(){
                        console.log('info window close');
                        infowindow.close();
                    });
                }
                console.log('markers');
                console.log(this.markers);
                this.setMarker(this.map);
            })
            .catch(err => {
                console.log('카카오 찾기 결과 실패');
                console.log(err);
            });
        },
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
    margin-top: 20px;
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

.menu_selected{background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 

.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:400px;}
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

