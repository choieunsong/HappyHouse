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
    }
  },
  actions: {
    setUserInfo({ commit }, data) {
      console.log(data);
      commit("SET_USER_INFO", data);
    },
    setDealsInfo({ commit }, data) {
      console.log(data);
      commit("SET_DEALS_INFO", data);
    }
  },
});
