import Vue from "vue";
import VueRouter from "vue-router";
import Favorite from "@/components/Favorite.vue";
import List from "@/components/List.vue";
import Detail from "@/components/Detail.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/happyhouse/favoriteLocation",
    name: "Favorite",
    component: Favorite,
  },
  {
    path: "/happyhouse/favorite/list",
    name: "List",
    component: List,
  },
  {
    path: "/happyhouse/favorite/detail",
    name: "Detail",
    component: Detail,
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
