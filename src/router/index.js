import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '@/views/HomeView'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/register',
    name: 'register',
    component: () => import('../views/RegisterView.vue')
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    components: {
      default: () => import('../views/DashboardView.vue'),
      nav: () => import('../views/nav.vue'),
    },
    children: [
      {
        path: "casus",
        component: () => import('../components/casus/Casus.vue'),
      },
      {
        path: "casusView",
        component: () => import('../components/casus/CasusView.vue'),
      },
      {
        path: "klassen",
        component: () => import('../components/supervisor/Klassen.vue')
      },
      {
        path: "klas",
        component: () => import('../components/supervisor/Klas.vue')
      },
      {
        path: "opdrachten",
        component: () => import('../components/supervisor/Opdrachten.vue')
      },
      {
        path: "clienten",
        component: () => import('../components/clienten/Clienten.vue')
      },
      {
        path: "client",
        component: () => import('../components/clienten/Client.vue')
      },
      {
        path: "clientForm",
        component: () => import('../components/clienten/ClientForm.vue'),
      },
    ]
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
