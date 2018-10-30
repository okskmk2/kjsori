<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<div id="main">
<div class="wrap">
	<div class="content">
		<h2>문의하기</h2>
		<table class='obj-table'>
		<tr><th>제목</th><td><input></td></tr>
		<tr><th>문의내용</th><td><textarea rows="5"></textarea></td></tr>
		<tr><th>답신받을 이메일</th><td><input></td></tr>
		</table>
		<div class="big btn-group">
			<button style="background-color: seagreen;" type="submit">등록</button>
			<button type="reset">취소</button>
		</div>
	</div>
</div>
</div>
<%@ include file="include/footer.jsp"%>