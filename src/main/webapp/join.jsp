<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<style>
.obj-table.join input{
width: auto;
}
.terms {
	display: flex;
	flex-direction: row;
	margin-bottom: 10px;
}

.terms>div {
	flex-grow: 1;
}

.terms>div+div {
	margin-left: 20px;
}

.term-box {
	height: 150px;
	border: 1px solid #ccc;
	flex-grow: 1;
}

</style>
<div id="main">
	<div class="wrap">
		<div class="content">
		<form action="/join" method="post" name="join">
			<h2>회원가입</h2>
			<div class="terms">
				<div>
					<h4>회원이용약관</h4>
					<div class="term-box">내용</div>
				</div>
				<div>
					<h4>개인정보취급방침</h4>
					<div class="term-box">내용</div>
				</div>
			</div>
			<div>
				<input type="checkbox"> <span>위의 이용약관, 개인정보취급방침, 개인정보
					수집 및 이용, 개인정보 취급위탁에 대하여 동의합니다</span>
			</div>
			<table class="obj-table join">
				<tbody>
					<tr>
						<th>아이디(필수)</th>
						<td><input name='kjsori_userId' required="required"><button id="id_dupl_chk_btn" class='ml5' type="button">중복확인</button></td>
					</tr>
					<tr>
						<th>이름(필수)</th>
						<td><input name='kjsori_userName' required="required"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password"></td>
					</tr>
					<tr>
						<th>비밀번호확인(필수)</th>
						<td><input name='kjsori_userPwd' required="required" type="password"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input></td>
					</tr>
					<tr>
						<th>현주소</th>
						<td><input><button class='ml5'>우편번호 검색</button></td>
					</tr>
					<tr>
						<th></th>
						<td><input>&nbsp;&nbsp;-&nbsp;&nbsp;<input></td>
					</tr>
					<tr>
						<th>정보수신여부</th>
						<td><input type="checkbox">이메일 수신 <input
							type="checkbox">SMS 수신</td>
					</tr>
				</tbody>
			</table>
			<div class="big btn-group">
				<button style="background-color: seagreen;" type="submit">회원가입</button>
				<button type="reset">취소</button>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
	let id_dupl_chk_btn = document.getElementById('id_dupl_chk_btn');

	id_dupl_chk_btn.addEventListener('click', function() {
		axios({
			url : "/api/idcheck",
			method : "post",
			data:{id:document.forms.join.kjsori_userId.value},
		}).then(res=>{
			alert(res.data.message);
		})
/*		ajax({
			url : "/api/idcheck",
			method : "post",
			data:JSON.stringify({id:'sdfaa'}),
			dataType:"json",
			onsuccess : function(response) {
				alert(response);
			},
			onerror : function(error) {
				alert(error);
			}
		});
		*/
	});

</script>
<%@ include file="include/footer.jsp"%>