import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userinfo: {
      userno: 6,
      userid: "song",
      email: "song@naver.com",
      username: "은송",
      address: "수원시 권선구",
      state: 0,
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
      state.userinfo = payload;
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
