import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userinfo: {
      userno: 0,
      userid: '',
      username: '',
      address: '',
      email: '',
      state: 0
    },
    deals: [],
    dataCnt: {
      convenient: 0,
      mart: 0,
      subway: 0,
      school: 0,
      restaurant: 0,
      cafe: 0
    },
  },
  getters: {
    getUserInfo: function (state) {
      return state.userinfo;
    },
    getDeals: function (state) {
      return state.deals;
    },
    getDealLength: function (state) {
      return state.deals.length;
    },
    getDataCnt: function (state) {
      return state.dataCnt;
    }
  },
  mutations: {
    SET_USER_INFO(state, payload) {
      console.log("mutation: ");
      console.log(payload);
      state.userinfo.userno = payload.userno;
      state.userinfo.userid = payload.userid;
      state.userinfo.username = payload.username;
      state.userinfo.address = payload.address;
      state.userinfo.email = payload.email;
      state.userinfo.state = payload.state;
      console.log("mutation set user info: ");
      console.log(state.userinfo);
    },
    SET_DEALS_INFO(state, payload) {
      console.log(payload);
      state.deals = payload;
    },
    SET_DATA_CNT(state, payload ) {
      console.log('mutation');
      
      console.log(payload);
      switch (payload.idx) {
        case 0: state.dataCnt.convenient = payload.cnt;
                console.log('case 1:' + payload.cnt);
                break;
        case 1: state.dataCnt.mart = payload.cnt;
                console.log('case 2:' + payload.cnt);
          break;
        case 2: state.dataCnt.subway = payload.cnt;
                console.log('case 3:' + payload.cnt);
          break;
        case 3: state.dataCnt.school = payload.cnt;
              console.log('case 4:' + payload.cnt);
          break;
        case 4: state.dataCnt.restaurant = payload.cnt;
              console.log('case 5:' + payload.cnt);
          break;
        case 5:state.dataCnt.cafe = payload.cnt;
              console.log('case 6:' + payload.cnt);
          break;
      }
    }
  },
  actions: {
    setUserInfo({ commit }, data) {
      console.log(data);
      commit("SET_USER_INFO", data);
    },
    setDealsInfo({ commit }, data) {
      console.log(data);
      commit("SET_DEALS_INFqO", data);
    },
    setDataCnt({ commit }, data) {
      console.log('idx: '+data.idx+', cnt: '+data.cnt);
      commit("SET_DATA_CNT", data);
    }
  },
});
