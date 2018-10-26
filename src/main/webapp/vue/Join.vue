<template>
    <div>
        <div class='h4'>
            <h3>회원가입</h3>
        </div>
        <div id='main'>
            <div style="width:35rem; margin:0 auto;">
            <div style="margin-bottom:0.5rem">
            <div style="margin-bottom:0.25rem">회원약관</div>
            <textarea rows="10" style="width:34rem"></textarea>
            <div class='tr'>
                <label for="agree">약관동의</label><input type="checkbox" id='agree'><br>
            </div>
            </div>
            <label for="">아이디</label>
            <input type="text">
            <label for="">비밀번호</label>
            <input type="password">
            <label for="">비밀번호확인</label>
            <input type="password">
            <label for="">이름</label>
            <input type="text">
            <button class='primary'>가입</button>
            </div>
        </div>
    </div>
</template>
<script>

export default {
}
</script>
