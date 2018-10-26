<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<style>
#form-table {
	border-collapse: collapse;
	width: 100%;
	border-top: 3px solid dimgray;
	margin-top: 20px;
}

#form-table tr {
	border-bottom: #eaeaea 1px solid;
	height: 50px
}

#form-table th {
	text-align: left;
	width: 160px;
	padding: 10px 20px;
	background-color: #f9f9f9;
}

#form-table td {
	padding: 10px;
}

#form-table textarea{
	height: 500px;
}

.btns {
	text-align: center;
	margin-top: 30px;
}

.btns>button {
	font-size: 15px;
	width: 110px;
	height: 40px;
	padding: 5px 10px;
	color: #fff;
	border-radius: 3px;
	border-style: none;
	background-color: #6b6b6b;
}
</style>
<div id="main">
	<div class="wrap">
		<div class="content">
			<h2>글 등록</h2>
			<form action="add" method="POST">
			<input type="hidden" name="board_code" value="${param.board_code}">
			<table id="form-table">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<button style="background-color: seagreen;" type="submit">등록</button>
				<button type="reset">취소</button>
			</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>