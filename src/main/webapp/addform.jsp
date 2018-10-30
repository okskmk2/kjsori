<%@page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@page
	import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="include/header.jsp"%>
<style>
.ck-content {
	min-height: 400px;
}
</style>
<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<div id="main">
	<div class="wrap">
		<div class="content">
			<h2>글 등록</h2>
			<form action="/article?bbsType=${param.bbsType}" method="POST"
				autocomplete="off">

				<c:if test="${not empty userId}">
					<input type="hidden" name="author_id" value="${userId}"
						required="required">
				</c:if>

				<table class="obj-table">
					<tbody>
						<tr>
							<th>제목</th>
							<td><input name="title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="content" id='editor'></textarea></td>
						</tr>
						<c:if test="${empty userId}">
							<tr>
								<th>작성자</th>
								<td><input name="author_id"></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="big btn-group">
					<button style="background-color: seagreen;" type="submit">등록</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
ClassicEditor
.create( document.querySelector( '#editor' ),{
	language: 'ko',        
	ckfinder: {
        uploadUrl: '<%=blobstoreService.createUploadUrl("/upload")%>'
    } 
} )
.catch( error => {
    console.error( error );
} );
</script>
<%@ include file="include/footer.jsp"%>