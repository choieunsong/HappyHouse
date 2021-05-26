import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userinfo: {
      userno: '',
      userid: '',
      username: '',
      address: '',
      email: '',
      state: 0
    },
  },
  getters: {},
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
    }
  },
  actions: {
    setUserInfo({ commit }, data) {
      console.log('action set data');
      console.log(data);
      commit('SET_USER_INFO', data);
    }
  },
});
