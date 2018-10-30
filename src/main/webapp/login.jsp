<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<div id="main">
<div class="wrap">
	<div class="content">
		<h2>로그인</h2>
		<div class="box">
			<div class="row">
				<div class="rest">
					<form action="/login" method="post">
					<div class="row">
						<div class="col">
							<input type="text" placeholder="아이디" name="kjsori_userId" required="required">
							<input type="password" placeholder="비밀번호" style="margin-top: 3px;" name="kjsori_userPwd" required="required">
						</div>
						<button id="login_btn" class="ml3 big btn" style="padding:5px 20px">로그인</button>
					</div>
					</form>
				</div>
				<div style="margin-left: 30px;" class="rest">
					<div>
						<span>아직 회원이 아니신가요?</span> <br>
						<a href="/join.jsp" class="link">회원가입</a>
					</div>
					<div>
						<span>아이디/비밀번호를 분실하셨나요?</span> <br>
						<a href="/idpw_search.jsp" class="link">아이디/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="include/footer.jsp"%>