<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.net.InetAddress" %>

<%
    InetAddress ia = InetAddress.getLocalHost();
    String hostName = ia.getHostName();
    pageContext.setAttribute("hostName", hostName);
%>

<style type="text/css">
    .legal-footer .row .address .footer-logo {
        max-width: 150px;
    }
    .legal-footer .row .footer-links {
        text-align: right
    }
    .legal-footer .row .footer-links a {
        font-size: 1em;
        line-height: 1.8em;
        padding: 0 10px;
    }
    .legal-footer .row .footer-links div span {
        padding: 0 10px;
    }
    .legal-footer .row .footer-links .node {
        color: transparent;
    }
    .legal-footer .row .footer-links .node:hover {
        color: #fafafa;
    }
</style>

<div class="container-fluid legal-footer">
    <div class="row">
        <div class="col-lg col-md col-sm-6 address">
            <img class="footer-logo" alt="Cal Poly Pomona" src="//www.cpp.edu/common/2018/assets/img/cpp-white.png" />
        </div>
        <div class="col-lg col-md col-sm 6 footer-links">
            <div>
                <span class="node"><span class="sr-only">For troubleshooting purposes, this page is served by:</span> [<c:out value="${fn:toUpperCase(fn:substring(hostName,0,2))}" />]</span>
                <a href="/uPortal/p/feedback">Feedback</a>
                <a href="//www.cpp.edu/privacy.shtml" target="_blank">Privacy Policy</a>
                <a href="//www.cpp.edu/accessibility.shtml" target="_blank">Accessibility</a>
            </div>
        </div>
    </div>
</div>
