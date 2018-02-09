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
<%@ include file="/WEB-INF/jsp/include.jsp"%>
<%@ taglib uri="/WEB-INF/tag/portletUrl.tld" prefix="pURL" %>
<c:set var="n"><portlet:namespace/></c:set>
<portlet:actionURL var="formUrl"/>
<portlet:resourceURL var="autocompleteUrl" id="retrieveSearchJSONResults"/>
<c:set var="n"><portlet:namespace/></c:set>

<!-- Portlet -->
<div class="fl-widget portlet search-portlet" role="section">

    <!-- Portlet Titlebar
        <div class="fl-widget-titlebar titlebar portlet-titlebar" role="sectionhead">
        <h2 class="title" role="heading"><spring:message code="search"/></h2>
    </div>
    -->

    <!-- Portlet Body -->
    <div class="fl-widget-content portlet-body" role="main">

        <!-- Portlet Section -->
        <div id="${n}search" class="portlet-section" role="region">

            <div class="portlet-section-body">

                <form id="${n}searchForm" action="${ formUrl }" class="form-inline" style="margin-bottom:10px;" method="POST">
                    <div class="form-group">
                        <input id="${n}searchInput" type="search" class="searchInput form-control" name="query" value="${ fn:escapeXml(query )}" aria-label="<spring:message code="search"/>"/>
                        <input id="${n}searchButton" type="submit" class="btn btn-default" value="<spring:message code="search.submit"/>"/>
                    </div>
                </form>

                <c:if test="${hitMaxQueries}">
                    <div>
                        <spring:message code="search.rate.limit.reached"/>
                    </div>
                </c:if>

                <c:choose>
                <c:when test="${not empty results}">
                    <h3><spring:message code="${defaultTabKey}"/></h3>
                    <c:choose>
                    <c:when test="${not empty results[defaultTabKey]}">
                    <p>Showing ${fn:length(results[defaultTabKey])} result(s)</p>
                    <c:forEach items="${ results[defaultTabKey] }" var="result">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="result_link" href="${result.second}"><span class="result_title"><i class="fa fa-arrow-circle-right"></i> ${ result.first.title }</span></a>
                        </div>
                        <div class="panel-body">
                            <p class="result_excerpt">${ result.first.summary }</p>
                        </div>
                        <%-- Start of display marketplace specific information --%>
                        <c:if test="false">
                        <c:if test="${up:contains(result.first.type, 'marketplace')}">
                            <div class="panel-footer">
                                <p><a class="marketplace_entry_link" href="${pURL:getStringFromPortletUrl(result.first.portletUrl, pageContext.request)}">About this app</a>
                            </div>
                        </c:if>
                        </c:if>
                        <%-- End of display marketplace specific information --%>
                    </div>
                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p><spring:message code="no.results"/></p>
                    </c:otherwise>
                    </c:choose>
                    <c:forEach var="tabKey" items="${tabKeys}" varStatus="loopStatus">
                    <div id="${n}_${loopStatus.index}"  role="tabpanel"class="tab-pane ${tabKey}">
                        <h3><spring:message code="${tabKey}"/></h3>
                        <c:choose>
                        <c:when test="${not empty results[tabKey]}">
                        <p>Showing ${fn:length(results[tabKey])} result(s)</p>
                        <div class="search-results">
                            <c:forEach items="${ results[tabKey] }" var="result">
                                <div class="search-result">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <a class="result_link" href="${result.second}" target="_blank"><span class="result_title"><i class="fa fa-external-link"></i> ${ result.first.title }</span></a>
                                        </div>
                                        <div class="panel-body">
                                            <p class="result_excerpt">${ result.first.summary }</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <p><spring:message code="no.results"/></p>
                        </c:otherwise>
                        </c:choose>
                    </div>
                    </c:forEach>
                </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<rs:resourceURL value="/rs/jquery/1.10.2/jquery-1.10.2.min.js"/>"></script>
<script type="text/javascript" src="<rs:resourceURL value="/rs/jqueryui/1.10.3/jquery-ui-1.10.3.min.js"/>"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/search/autosuggestHandler.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search/autosuggest.css">

<script language="javascript" type="text/javascript"><rs:compressJs>
/*
* Switch jQuery to extreme noConflict mode, keeping a reference to it in the searchjQ["${n}"] namespace
*/
var searchjQ = searchjQ || {};
searchjQ["${n}"] = searchjQ["${n}"] || {};
searchjQ["${n}"].jQuery = jQuery.noConflict(true);

<%-- Only set prepopulateAutoSuggestUrl if the portlet preference is not empty. --%>
<c:if test="${not empty portletPreferencesValues['prepopulateAutoSuggestUrl'][0]}">
    <c:set var="prepopulateAutoSuggestUrl" value="${pageContext.request.contextPath}${portletPreferencesValues['prepopulateAutoSuggestUrl'][0]}"/>
</c:if>

searchjQ["${n}"].jQuery(document).ready(function() {
    <c:if test="false">
    initSearchAuto(searchjQ["${n}"].jQuery, {
        searchFieldSelector: "#${n}searchInput",
        prepopulateAutoSuggestUrl: "${prepopulateAutoSuggestUrl}",
        prepopulateUrlPattern: "${pageContext.request.contextPath}${portletPreferencesValues['prepopulateUrlPattern'][0]}",
        autoSuggestResultsProcessor: "${portletPreferencesValues['autoSuggestResultsProcessor'][0]}",
        autoSuggestSearchUrl: "${autocompleteUrl}"
    });
    </c:if>
});

// Only search if the user entered some text to search for
searchjQ["${n}"].jQuery( "#${n}searchForm" ).submit(function( event ) {
    if ( searchjQ["${n}"].jQuery( "#${n}searchInput" ).val().trim().length == 0 ) {
        event.preventDefault();
    } else {
        document.getElementById('${n}searchButton').disabled = 1;
    }

});

</rs:compressJs></script>
