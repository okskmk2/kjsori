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
					<div class="row">
						<div class="col">
							<input type="text" placeholder="아이디"> <input type="text"
								placeholder="비밀번호" style="margin-top: 3px;">
						</div>
						<a id="login_btn" class="ml3 big btn">로그인</a>
					</div>
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