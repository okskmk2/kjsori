
<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<div id="main">
<div class="wrap">
	<div class="content">
		<h2>아이디/비밀번호 찾기</h2>
		<div class="row">
			<div class="box rest">
				<div class="row">
					<div class="col">
						<input type="text" placeholder="이름" required="required"> <input type="password"
							placeholder="이메일" style="margin-top: 3px;" required="required">
					</div>
					<button id="id_find_btn" class="ml3">아이디찾기</button>
				</div>
			</div>
			<div class="box rest" style="margin-left: 30px;">
				<div class="row">
					<div class="col">
						<input type="text" placeholder="아이디"> <input type="email"
							placeholder="이메일" style="margin-top: 3px;">
					</div>
					<button id="pw_find_btn" class="ml3">비밀번호재설정</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="include/footer.jsp"%>