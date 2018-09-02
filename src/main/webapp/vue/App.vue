<template>
<div style="margin-bottom:5rem;">
    <div id='overlay' class='hide'></div>
    <header>
        <div class='row ai-center wrap'>
            <h1 style="width:11rem"><router-link to='/'>성균관경전소리</router-link></h1>
            <nav class='ml1'>
                <router-link to='/about'>기관소개</router-link>
                <router-link to='/study'>경전성독</router-link>
                <router-link to='/local'>지역보존회</router-link>
                <router-link to='/album'>활동사진</router-link>
                <router-link to='/notice'>공지사항</router-link>
                <router-link to='/info/qna'>문의하기</router-link>
            </nav>
            <nav class='rest tr ml1'>
                <router-link to='/info/login'>로그인</router-link>
                <router-link to='/info/join'>회원가입</router-link>
            </nav>        
        </div>
    </header>
    <router-view class='row wrap' style="min-height:47rem;margin-top:1rem;"/>
</div>
</template>
<script>
export default {
}
</script>
