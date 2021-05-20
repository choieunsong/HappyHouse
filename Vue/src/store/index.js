import Vue from 'vue';
import Vuex from 'vuex';
import http from '@/util/http-common';
Vue.use(Vuex);

export default new Vuex.Store({
    // 저장할 대상은 list할 때 보드 전체정보
    // search update할 때의 보더 저장 정보를 이용?하는 것 구현 할 것이다 → state
    // 이런 데이터를 상태관리 해주겠다고 미리 선언해줌
    state: {
        boards: [], //전체 게시글
        board: {} //update, search할때 현재 보는 게시글
    },
    // 꺼내 쓸 것을 getters에 선언해 줌
    getters: {
        boards(state) {
            return state.boards;
        },
        board(state) {
            return state.board;
        }
    },
    mutations: {
        setBoards(state, payload) {
            state.boards = payload;
        },
        setBoard(state, payload) {
            state.board = payload;
        }
    },
    actions: {
        getBoards(context) {
            http
                .get("board")
                .then(({
                    data
                }) => {
                    // 이commit을 통해 mutation의 setBoards가 실행된다.
                    // 이 data가 위 mutation의 payload로 전달된다.
                    //변경 후 list.vue의 mapGetters로 넘어간다.
                    context.commit("setBoards", data);
                })
                .catch(() => {
                    alert("수행 중 오류가 발생했습니다.");
                });
        },
        getBoard(context, payload) {
            http
                .get(payload)
                .then(({
                    data
                }) => {
                    context.commit("setBoard", data);
                })
                .catch(() => {
                    alert("오류 발생");
                });
        }
    }
});