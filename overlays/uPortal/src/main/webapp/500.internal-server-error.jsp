<%@ page import="java.net.InetAddress" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  response.setStatus(503);
  InetAddress ia = InetAddress.getLocalHost();
  String hostName = ia.getHostName();
  pageContext.setAttribute("hostName", hostName);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>A MyCPP Error Has Occurred</title>

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
                            <a href="//www.cpp.edu?utm_source=mycpp&amp;utm_medium=referral&amp;utm_campaign=mycpp"><img src="/uPortal/img/cpp-logotype.svg" alt="Cal Poly Pomona"></a> <a href="/uPortal" style="vertical-align: middle;">MyCPP</a></h1>
                    </section>
                  </div>
                </div>
            </div>
        </header>
        <div id="portalPageBody" class="prtal-content">
          <div class="container">
            <div class="row">
                <div class="col-md-12" style="text-align: center">
                    <img src="/uPortal/media/cpp/images/error.png" alt="Billy Bronco with a horn on his head - Well that wasn't supposed to happen ..." class="img-responsive center-block" />
                </div>
                <div class="col-md-12">
                    <p><strong>We're sorry, but an error has occurred.</strong></p>
                    <p>It's possible the error has resolved itself. Please go back and retry the action that brought you here.</p>
                    <p>If the error continues, please log a <a href="https://cpp.service-now.com/ehelp">Service Desk ticket</a> or call them at 909-979-6776 and provide the following
                    information:</p>
                    <ul>
                        <li>Your name and BroncoName</li>
                        <li>What content were you trying to view when this error occurred</li>
                        <li>Any other useful information to help reproduce the error</li>
                    </ul>
                    <p>Click <a href="/uPortal">here</a> to go back to MyCPP. </p>
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
