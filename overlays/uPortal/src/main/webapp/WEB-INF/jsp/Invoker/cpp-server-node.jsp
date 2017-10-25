<%@ include file="/WEB-INF/jsp/include.jsp" %>

<%@ page import="java.net.InetAddress" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    InetAddress ia = InetAddress.getLocalHost();
    String hostName = ia.getHostName();
    pageContext.setAttribute("hostName", hostName);
%>

<style>
#node {
	font-size: 10px;
	font-style: normal;
	font-variant: normal;
	background-color: rgba(0, 0, 0, 1);
	color: #777;
	padding-left: 15px;
}

#node > .stamp {
	color:#000;
}

#node > a:hover {
	color:#999;
	pointer
}

#region-page-bottom .col-sm-12 { padding: 0; }
</style>

<div id="node">
	<c:out value="[${fn:toUpperCase(fn:substring(hostName,0,2))}]" />&nbsp;<a class="stamp"><%@ include file="release" %></a>
</div>
