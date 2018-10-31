<%@page import="java.util.HashMap"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@page import="com.google.appengine.api.datastore.Query"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page language="java" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>
<%
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	Query q = new Query("notice");
	PreparedQuery pq = ds.prepare(q);
	Iterator<Entity> it = pq.asIterator();
	ArrayList<Map<String, String>> list = new ArrayList<Map<String, String>>();
	while (it.hasNext()) {
		Entity entity = it.next();
		HashMap<String, String> map = new HashMap<String, String>();
		String id = KeyFactory.keyToString(entity.getKey());
		String title = (String) entity.getProperty("title");
		String authorId = (String) entity.getProperty("author_id");
		String regDt = (String) entity.getProperty("reg_dt");
		map.put("id",id);
		map.put("title", title);
		map.put("author_id", authorId);
		map.put("reg_dt", regDt);
		list.add(map);
	}
	request.setAttribute("list", list);
%>
<div id="main">
	<div class="wrap">
		<div class="content">
			<h2>공지사항</h2>
			<div class='bbs_bgroup'>
				<button
					onclick="javascript:location.href = 'addform.jsp?bbsType=notice'">글쓰기</button>
			</div>
			<table class="bbs_list">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="i">
						<tr>
							<td><a href="/article.jsp?bbsType=notice&key=${i.id}">${i.title}</a></td>
							<td>${i.author_id}</td>
							<td></td>
							<td>${i.reg_dt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="include/footer.jsp"%>