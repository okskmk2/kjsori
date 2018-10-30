<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<div id="main">
	<div class="wrap">
		<div class="content">
			<h2>공지사항</h2>
			<div class='bbs_bgroup'><button onclick="javascript:location.href = 'addform.jsp'">글쓰기</button></div>
			<table class="bbs_list">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>311</td>
						<td><a href="#">성균관 경전소리 보존회 공지사항 테스트</a></td>
						<td>관리자</td>
						<td>25</td>
						<td>2018-10-24</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>