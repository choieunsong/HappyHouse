import Vue from "vue";
import VueRouter from "vue-router";
import List from "@/components/List.vue";
import Create from "@/components/Create.vue";
import Search from "@/components/Search.vue";
import Update from "@/components/Update.vue";
import Remove from "@/components/Remove.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/list",
    name: "List",
    component: List
  },
  {
    path: "/create",
    name: "Create",
    component: Create
  },
  {
    path: "/search",
    name: "Search",
    component: Search
  },
  {
    path: "/update",
    name: "Update",
    component: Update
  },
  {
    path: "/remove",
    name: "Remove",
    component: Remove
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
