import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    username: '',
  },
  getters: {},
  mutations: {
    SET_USER_INFO(state, payload) {
      state.username = payload;
    }
  },
  actions: {
    setUserInfo({ commit }, username) {
      console.log(username);
      commit('SET_USER_INFO', username);
    }
  },
});
