<template>
    <div class="row">
        <div class="container" style="margin-top: 30px;">
            <table class="table table-borderless" align="center">
                <tr class="second">
                    <th>아파트 이름:</th>
                    <td v-if="flag">{{dealInfo.aptName}}</td>
                </tr>
                <tr class="second">
                    <th>주소:</th>
                    <td v-if="flag && isClick">{{getAddress}}</td>
                </tr>
                <tr class="second">
                    <th>거래금액:</th>
                    <td v-if="flag">{{dealInfo.dealAmount}}</td>
                </tr>
                <tr class="second">
                    <th>거래일:</th>
                    <td v-if="flag && isClick">{{getDealDate}}</td>
                </tr>
                <tr class="second">
                    <th>평수:</th>
                    <td v-if="flag && isClick">{{dealInfo.area}}m²</td>
                </tr>
            </table>
        </div>
    </div>
</template>

<script>
import {bus} from '@/boardbus';
export default {
    name: 'Detail',
    components: {  },
    data(){
        return{
            dealInfo: {},
            flag: false,
            isClick: false,
        }
    },
    computed: {
        getAddress: function(){
            return `${this.dealInfo.city} ${this.dealInfo.gugun} ${this.dealInfo.dong} ${this.dealInfo.jibun}지번`
        },
        getDealDate: function(){
            return `${this.dealInfo.dealYear}년 ${this.dealInfo.dealMonth}월 ${this.dealInfo.dealDay}일`;
        },
        getDealLength(){
            return this.$store.getters.getDealLength;
        }
    },
    created(){
        bus.$on('setDetail',this.setDetail);
        bus.$on('toggleFlag',this.toggleFlag);
        bus.$on('toggleIsClick',this.toggleIsClick);

        let dealLen = this.getDealLength;
        console.log('detail created dealLen: '+dealLen);
        if(dealLen > 0){
            this.toggleFlag(true);
        }else{
            this.toggleFlag(false);
        }
    },
    methods: {
        setDetail(deal){
            console.log('set Detail');
            console.log(deal);
            this.dealInfo = deal;
            this.flag = true;
        },
        toggleFlag(map){
            this.flag = map;
        },
        toggleIsClick(){
            this.isClick = true;
        }
    }
};
</script>

<style>
.second {
    text-align: left;
    font-size: 20px;
    border-bottom: 2px dashed #DCDCDC;
}

#latex{
    position: absolute;
    left: 40%;
    top: 295px;
}
</style>