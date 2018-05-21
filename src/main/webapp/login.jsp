<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<main>
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
						<button id="login_btn" class="ml3">로그인</button>
					</div>
				</div>
				<div style="margin-left: 30px;" class="rest">
					<div>
						<span>아직 회원이 아니신가요?</span> <br>
						<button>회원가입</button>
					</div>
					<div>
						<span>아이디/비밀번호를 분실하셨나요?</span> <br>
						<button>아이디/비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<%@ include file="include/footer.jsp"%>