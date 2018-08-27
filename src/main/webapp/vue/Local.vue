<template>
<div>
    <aside style="width:11rem" class='col'>
        <div class='h4'></div>
        <div class='box rest'>
            <nav class='col p1'>
                <a @click="openBoard('cap')">서울경기지사</a>
                <a @click="openBoard('jl')">전라지사</a>
                <a @click="openBoard('ks')">경상지사</a>
                <a @click="openBoard('cc')">충청지사</a>
                <a @click="openBoard('gw')">강원지사</a>
            </nav>
        </div>
    </aside>
    <Board :settings="settings" id='main-container'></Board>
</div>
</template>
<script>
import Board from "./Board.vue";
export default {
    data (){
        return {
            settings:{
                title:"지역보존회"
            }
        }
    },
    methods:{
        openBoard(title){
            this.settings = {
                title:title
            }
        }
    },
    components:{Board}
}
</script>
