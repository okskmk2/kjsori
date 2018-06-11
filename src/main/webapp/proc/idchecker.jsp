<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BufferedReader input = new BufferedReader(new InputStreamReader(request.getInputStream()));
StringBuilder builder = new StringBuilder();
String buffer;
while ((buffer = input.readLine()) != null) {
	if (builder.length() > 0) {
		builder.append("\n");
	}
	builder.append(buffer);
}
String body = null;
body = builder.toString();
response.getWriter().print(body);
%>