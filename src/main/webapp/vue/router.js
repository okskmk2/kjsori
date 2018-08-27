import Vue from 'vue';
import Router from 'vue-router';
import Home from './Home.vue';
import About from './About.vue';
import Study from './Study.vue';
import Local from './Local.vue';
import Album from './Album.vue';
import Info from './Info.vue';
import Notice from './Notice.vue';
import Qna from './Qna.vue';
import Login from './Login.vue';
import Join from './Join.vue';

Vue.use(Router);

export default new Router({
    mode:'history',
    routes:[
        {path:'/', component: Home},
        {path:'/about', component: About},
        {path:'/study', component: Study},
        {path:'/local', component: Local},
        {path:'/album', component: Album},
        {path:'/notice', component: Notice},
        {path:'/info', component:Info, children:[
            {path:'qna', component: Qna},
            {path:'login', component: Login},
            {path:'join', component: Join},
        ]}
    ]
})