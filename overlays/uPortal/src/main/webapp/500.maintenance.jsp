<%@ page import="java.net.InetAddress" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  InetAddress ia = InetAddress.getLocalHost();
  String hostName = ia.getHostName();
  pageContext.setAttribute("hostName", hostName);

  response.setStatus(503);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Unavailable for System Maintenance | MyCPP</title>

    <link rel="stylesheet" type="text/css" href="/uPortal/media/skins/respondr/mycpp-2016.css" />
    <style>
    @media only screen and (max-width: 768px) {
      .portal .portal-header .portal-header-main { margin-top: 0px; }
    }
    </style>
  </head>
  <body class="up dashboard portal">
    <div id="wrapper">
        <header class="portal-header">
            <div class="container-fluid portal-header-main">
                <div class="row">
                  <div id="region-header-left" class="col-sm-6 col-md-8 text-left">
                    <section class="up-portlet-wrapper cpp-portal-logo">
                        <h1 class="portal-logo">
                            <a href="//www.cpp.edu?utm_source=mycpp&amp;utm_medium=referral&amp;utm_campaign=mycpp" target="_blank" rel="noopener noreferrer">
                              <img src="//www.cpp.edu/common/2018/assets/img/cpp-white.png" alt="Cal Poly Pomona" style="padding-right: 5px; border-right: #ffb500 1px solid">
                            </a> <a href="/" style="vertical-align: middle;">MyCPP</a>
                        </h1>
                    </section>
                  </div>
                </div>
            </div>
        </header>
        <div id="portalPageBody" class="prtal-content">
          <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>MyCPP is Unavailable for System Maintenance</h1>
                    <p>We are performing a scheduled system maintenance between 9:30pm and 11:59pm. Thanks for your patience.</p>
                    <p>To access other online services such as BroncoDirect, Blackboard or Email, please use one of the following links:</p>
                    <ul>
                      <li><a href="https://blackboard.cpp.edu/webapps/bb-auth-provider-cas-bb_bb60/execute/casLogin?cmd=login&authProviderId=_164_1&redirectUrl=https%3A%2F%2Fblackboard.cpp.edu%2Fwebapps%2Fportal%2Fframeset.jsp" target="_blank" rel="noopener noreferrer">Blackboard</a></li>
                      <li>
                        <a href="https://idp.cpp.edu/idp/profile/cas/login?service=https://cmsweb.cms.cpp.edu/psp/CPOMPRDF/EMPLOYEE/SA/s/WEBLIB_PTPP_SC.HOMEPAGE.FieldFormula.IScript_AppHP?1=1" target="_blank" rel="noopener noreferrer">BroncoDirect</a>
                        <ul>
                          <li><a href="https://idp.cpp.edu/idp/profile/cas/login?service=https://cmsweb.cms.cpp.edu/psp/CPOMPRDF/EMPLOYEE/SA/c/SA_LEARNER_SERVICES.CLASS_SEARCH.GBL?1=1" target="_blank" rel="noopener noreferrer">Class Schedule Search</a></li>
                          <li><a href="https://idp.cpp.edu/idp/profile/cas/login?service=https://cmsweb.cms.cpp.edu/psp/CPOMPRDF/EMPLOYEE/SA/c/ESTABLISH_COURSES.CATALOG_SEARCH.GBL?1=1" target="_blank" rel="noopener noreferrer">Course Catalog Search</a></li>
                          <li><a href="https://idp.cpp.edu/idp/profile/cas/login?service=https://cmsweb.cms.cpp.edu/psp/CPOMPRDF/EMPLOYEE/SA/c/SA_LEARNER_SERVICES.SSS_STUDENT_CENTER.GBL?1=1" target="_blank" rel="noopener noreferrer">Student Center</a></li>
                          <li><a href="https://idp.cpp.edu/idp/profile/cas/login?service=https://cmsweb.cms.cpp.edu/psp/CPOMPRDF/EMPLOYEE/SA/c/SA_LEARNER_SERVICES.SSF_SS_ACCT_SUMM.GBL?1=1" target="_blank" rel="noopener noreferrer">View Charges/Make Payment</a></li>
                        </ul>
                      </li>
                      <li><a href="//outlook.office365.com/cpp.edu" target="_blank" rel="noopener noreferrer">Email</a></li>
                    </ul>

                    <p style="text-align: right; font-size: x-small;">
                        <c:out value="[${fn:toUpperCase(fn:substring(hostName,0,2))}]" />
                    </p>
                </div>
            </div>
          </div>
        </div> <!-- /portalPageBody -->
    </div><!-- /wrapper -->
  </body>
</html>
