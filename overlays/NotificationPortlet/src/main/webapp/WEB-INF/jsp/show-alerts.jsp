<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>

<c:set var="n"><portlet:namespace/></c:set>

<portlet:actionURL var="invokeNotificationServiceUrl" escapeXml="false">
    <portlet:param name="uuid" value="${uuid}"/>
    <portlet:param name="action" value="invokeNotificationService"/>
</portlet:actionURL>

<c:if test="${!usePortalJsLibs}">
    <rs:aggregatedResources path="/jQueryUIResources.xml"/>
</c:if>
<script src="<c:url value="/scripts/jquery.notice.min.js"/>" type="text/javascript"></script>

<style>
#${n}emergencyAlert {
    position: relative;
    margin-right: -25px;
    margin-left: -25px;
}
#${n}emergencyAlert .hidden {
    display: none;
}
#${n}emergencyAlert .view-alert .titlebar {
    display: block;
}
#${n}emergencyAlert .view-alert .title {
    border: none;
    font-weight: bold;
    padding-right: 10px;
    margin: 0;
    vertical-align: middle;
}
#${n}emergencyAlert .view-alert a, #${n}emergencyAlert .view-alert a:hover {
    color: #20399d;
}
#${n}emergencyAlert .view-alert .alerts-pager {
    float: right;
}
#${n}emergencyAlert .view-alert .alerts-pager li {
    display: inline;
    list-style-type: none;
}
#${n}emergencyAlert .view-alert .alerts-pager li a {
    color: #fff;
    text-decoration: none;
    font-size: larger;
    cursor: pointer;
}
#${n}emergencyAlert .view-alert .alerts-pager li a.disabled {
    color: #ccc;
}

#${n}emergencyAlert .view-alert {
    padding-top: 0px !important;
}

#${n}emergencyAlert .view-alert .body {
        font-size: 105%;
}

#${n}alert-title {
    padding-right: 10px;
    padding-left: 0;
}

#${n}alert-title{
    padding: 0px;
    margin: 0px;
}

#${n}safety-alert-container {
    background-color: #e31b23;
    font-family: Arial;
    font-weight: bold;
    width: 100%;
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 0px;
    padding-right: 0px;
}

#${n}safety-alert-row {
    background-color: #f6f6f6;
    height: 100px;
    padding: 0;
    margin: 0;
}

#${n}header {
    background-color: #e31b23;
    padding-top: 12px;
    color: #fff;
    font-size: 170%;
    height: 100px;
    vertical-align: middle;
}

#${n}alert-image{
    height: inherit;
    padding: 0;

}

#${n}message {
    vertical-align: center !important;
    height: 80px;
    padding-left: 30px;
    padding-top: 10px;
}

/* media queries */
/* small:  maximum width 480px */
@media screen and (max-width: 480px) {

    #${n}emergencyAlert .view-alert .body {
        padding-right: 10px;
        padding-left: 5px;
        font-size: 95%;
    }

    #${n}emergencyAlert .view-alert .link {
        word-wrap: break-word;
        font-size: 95%;
        padding: 0;
    }

    #${n}emergencyAlert .view-alert .title {
        font-weight: bold;
        padding-left: 10px;
    }

    #${n}safety-alert-container{
		height: 200px;
    }

    #${n}safety-alert-row {
        height: 190px;
    }

    #${n}header {
        height: 190px;
    }

    #${n}alert-image {
        text-align: center;
    }

    #${n}header img {
        width: 5px;
    }

    #${n}alert-title {
        padding-top: 40px;
        padding-right: 20px;
        padding-left: 0;
        text-align: center;
        margin-left: -15px;
    }
}

/* width range:  400px to 600px  */
@media screen and (min-width: 401px) and (max-width: 768px) {

	#${n}emergencyAlert .view-alert .link {
        word-wrap: break-word;
        font-size: 50%;
        padding: 0;
    }

	#${n}safety-alert-container{
		height: 140px;
    }

    #${n}safety-alert-row {
        height: 130px;
    }

    #${n}header {
        height: 130px;
    }
}

/*  medium  */
@media screen and (max-width: 800px) {

	#${n}emergencyAlert .view-alert .title {
        font-size: 140%;
        padding: 0px;
    }

    #${n}emergencyAlert .view-alert .link {
        font-size: 100%;
    }

    #${n}emergencyAlert .view-alert .title {
        font-weight: bold;
        padding: 0 10px 10px 10px;
    }

    #${n}safety-alert-container{
        background-color: #e31b23;
        font-family: Arial;
        font-weight: bold;
        width: 100%;
    }

    #${n}safety-alert-row {
        padding: 0;
        margin: 0;
        text-align: center;
    }

    #${n}header {
        background-color: #e31b23;
        color: #fff;
        font-size: 70%;
        text-align: center;
        vertical-align: middle;
    }

    #${n}alert-image img {
        width: 40px;
    }

    #${n}message {
        vertical-align: center !important;
        font-size: 90%;
        height: 80px;
        padding-left: 5px;
        padding-top: 5px;
    }
}

/*  large  */
@media screen and (min-width: 801px) and (max-width: 1200px) {

    #${n}emergencyAlert .view-alert .title {
        font-size: 110%;
        padding-left: 0px 0px 0px 10px;
    }

    #${n}emergencyAlert .view-alert .link {
    	padding-left: 0px 0px 0px 10px;
    }

    #${n}header {
        font-size: 150%;
        padding-left: 5px;
    }

    #${n}alert-image {
        padding-right: 0;
    }

    #${n}alert-image img {
        width: 60px;
    }

    #${n}alert-title {
        padding-left: 0;
        padding-right: 10px;
    }

    #${n}message {
        vertical-align: center !important;
        font-size: 100%;
        height: 80px;
        padding-left: 10px;
        padding-top: 5px;
    }
}
</style>

<div id="${n}emergencyAlert" style="display: none;">

    <div id="${n}safety-alert-container" class="container" >
        <span class="sr-only">IMPORTANT!! This is an alert.  Please reed content below.</span>
        <div id="${n}safety-alert-row" class="row">
            <div class="view-alert template hidden" role="section">

                <!-- Portlet Titlebar -->
                <div id="${n}header" class="col-xs-3 col-xs-offset-1">
                    <center>
                        <div class="row">
                            <div id="${n}alert-image" class="col-xs-4">
                                <img id="${n}dimensions" src="//www.cpp.edu/common/resources/img/safety-alert-icon.png" alt="image of safety">
                            </div>
                            <div id="${n}alert-title" class="col-xs-8">
                                <h2 class="title" role="heading"></h2>
                            </div>
                        </div>
                    </center>
                </div>
                <!--/div -->

                <!-- Portlet Body -->
                <div id="${n}message" class="col-xs-7">
                    <div role="main">
                        <p class="body"></p>
                        <a href="//www.cpp.edu/~safety" target="_blank">Safety and Emergency Information</a>
                    </div>
                </div>
            </div>
        </div>  <!-- end row -->
    </div>  <!--end container-->

</div>

<script type="text/javascript">

    var ${n} = ${n} || {};
    <c:choose>
        <c:when test="${!usePortalJsLibs}">
            ${n}.jQuery = jQuery.noConflict(true);
        </c:when>
        <c:otherwise>
            <c:set var="ns"><c:if test="${ not empty portalJsNamespace }">${ portalJsNamespace }.</c:if></c:set>
            ${n}.jQuery = ${ ns }jQuery;
        </c:otherwise>
    </c:choose>

    ${n}.jQuery(function(){
        var $ = ${n}.jQuery;

        var container = $("#${n}emergencyAlert");

        var autoAdvance = ${autoAdvance};
        var intervalId = -1;

        upnotice.show($, container, {
            invokeNotificationServiceUrl: '${invokeNotificationServiceUrl}',
            getNotificationsUrl: '<portlet:resourceURL id="GET-NOTIFICATIONS-UNCATEGORIZED"/>',
            readyCallback: function() {

                // Grab the alerts we just created
                var alerts = container.find('.view-alert').not('.template');

                // Hide all but the first one -- (NOTE:  Need both to toggle class and to manage 'display' property')
                alerts.not(':first').toggleClass('hidden').css('display', 'none');

                var advance = function() {
                    var outgoingAlert = alerts.filter(':visible');
                    var incomingAlert = outgoingAlert.next();
                    if (incomingAlert.size() == 0) {
                      // Cycle to the beginning...
                      incomingAlert = alerts.filter(':first');
                    }
                    outgoingAlert.toggle('slide', { direction: 'left' }).toggleClass('hidden');
                    incomingAlert.toggleClass('hidden').toggle('slide', { direction: 'right' });
                };

                var recede = function() {
                    var outgoingAlert = alerts.filter(':visible');
                    var incomingAlert = outgoingAlert.prev();
                    outgoingAlert.toggle('slide', { direction: 'right' }).toggleClass('hidden');
                    incomingAlert.toggleClass('hidden').toggle('slide', { direction: 'left' });
                };

                // Show paging controls?
                if (alerts.size() > 1) {
                    alerts.find('.alerts-pager').toggleClass('hidden');
                    // All but the first should enable the previous link
                    alerts.filter(':not(:first)').find('.alerts-previous').toggleClass('disabled');
                    // All but the last should enable the next link
                    alerts.filter(':not(:last)').find('.alerts-next').toggleClass('disabled');
                    // Register click handlers
                    alerts.find('.alerts-next:not(.disabled)').click(function() {
                        advance();
                        window.clearInterval(intervalId);
                    });
                    alerts.find('.alerts-previous:not(.disabled)').click(function() {
                        recede();
                        window.clearInterval(intervalId);
                    });
                    // autoAdvance?
                    if (autoAdvance && alerts.size() > 1) {
                        intervalId = window.setInterval(advance, 10000);
                    }
                }

            }
        });

    });

</script>
