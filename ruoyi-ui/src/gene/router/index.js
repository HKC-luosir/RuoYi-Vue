import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '@/gene/views/index/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/parser',
    name: 'parser',
    component: () => import(/* webpackChunkName: "parser-example" */'@/gene/components/parser/example/Index.vue')
  },
  {
    path: '/tinymce',
    name: 'tinymce',
    component: () => import(/* webpackChunkName: "tinymce-example" */'@/gene/components/tinymce/example/Index.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
