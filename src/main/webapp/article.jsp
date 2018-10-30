<%@page import="java.util.Map"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page
	import="com.google.appengine.api.datastore.EntityNotFoundException"%>
<%@page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>
<%
	String key = request.getParameter("key");
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	Entity entity = null;
	try {
		entity = ds.get(KeyFactory.stringToKey(key));
	} catch (EntityNotFoundException | IllegalArgumentException e) {
		e.printStackTrace();
	}
	Map<String, Object> article = entity.getProperties();
	request.setAttribute("article", article);
%>
<div id="main">
	<div class="wrap">
		<div class="content">
			${param.bbsType} 
			<table class='obj-table'>
				<tr>
					<th>제목</th>
					<td>${article.title}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.author_id}</td>
				</tr>
				<tr>
					<th>작성일자</th>
					<td>${article.reg_dt}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.content}</td>
				</tr>
			</table>
			<div class="big btn-group">
				<a href="/local.jsp"><button style="background-color: seagreen;">목록으로</button></a>
			</div>
		</div>
	</div>
</div>

<%@ include file="include/footer.jsp"%>