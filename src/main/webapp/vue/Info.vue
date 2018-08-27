<template>
<div>
    <aside style="width:11rem" class='col'>
        <div class='h4'></div>
        <div class='box rest'>
            <nav class='col p1'>
                <router-link to='qna'>문의하기</router-link>
                <router-link to='login'>로그인</router-link>
                <router-link to='join'>회원가입</router-link>
            </nav>
        </div>
    </aside>
    <router-view id="main-container"/>
</div>
</template>
<script>

export default {
    // mounted(){
    //     document.getElementById('overlay').classList.remove('hide');
    // }
}
</script>
