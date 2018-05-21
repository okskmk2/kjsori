<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="include/header.jsp"%>
<style>
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
        border: 1px solid #ababab;
        flex-grow: 1;
    }

    #join-table {
        border-collapse: collapse;
        width: 100%;
        border-top: 3px solid dimgray;
        margin-top: 20px;
    }

    #join-table tr {
        border-bottom: #eaeaea 1px solid;
        height: 50px
    }

    #join-table th {
        text-align: left;
        width: 160px;
        padding: 10px 20px;
        background-color: #f9f9f9;
    }

    #join-table td {
        padding: 10px;
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
<main>
<div class="wrap">
	<div class="content">
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
		<table id="join-table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><input>
						<button>중복확인</button></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input>
						<button>중복확인</button></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input></td>
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
					<td><input>
						<button>우편번호 검색</button></td>
				</tr>
				<tr>
					<th></th>
					<td><input>&nbsp;-&nbsp; <input></td>
				</tr>
				<tr>
					<th>정보수신여부</th>
					<td><input type="checkbox">이메일 수신 <input
						type="checkbox">SMS 수신</td>
				</tr>
			</tbody>
		</table>
		<div class="join-btns">
			<button style="background-color: seagreen;">회원가입</button>
			<button>취소</button>
		</div>
	</div>
</div>
</main>
<%@ include file="include/footer.jsp"%>