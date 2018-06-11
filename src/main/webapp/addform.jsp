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

.join-btns {
	text-align: center;
	margin-top: 30px;
}

.join-btns>button {
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
			<table id="form-table">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="join-btns">
				<button style="background-color: seagreen;">등록</button>
				<button>취소</button>
			</div>
		</div>
	</div>
</div>
<script>
	let id_dupl_chk_btn = document.getElementById('id_dupl_chk_btn');

	id_dupl_chk_btn.addEventListener('click', function() {
		ajax({
			url : "/api/idcheck",
			method : "post",
			data:{
				id:'한글'
			},
			onsuccess : function(response) {
				alert(response);
			},
			onerror : function(error) {
				alert(error);
			}
		});
	});



</script>
<%@ include file="include/footer.jsp"%>