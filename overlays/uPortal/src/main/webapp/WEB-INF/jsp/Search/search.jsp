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

<%
/**
 * The following modifies the tabKeys variable such that the defaultTabKey is first,
 * resulting in the search results showing uPortal search results first.
 *
 * Out of the box, this view would do two sets of loops to render search results:
 * uPortal, then the others. The following changes that behavior such that there's only
 * one main loop to render the search results from both uPortal and external search providers.
 */
java.util.ArrayList<String> modifiedTabKeys = new java.util.ArrayList<>();

modifiedTabKeys.add( (String)request.getAttribute("defaultTabKey") );
modifiedTabKeys.add( "googleInstitution.results" );

request.setAttribute("tabKeys", modifiedTabKeys);
%>

<!-- Portlet -->
<div class="fl-widget portlet search-portlet" role="section">

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
                  <h3>Search Results</h3>

                  <div id="${n}_${loopStatus.index}" role="tabpanel" class="tab-pane">
                      <div class="search-results">
                          <c:forEach var="tabKey" items="${tabKeys}" varStatus="loopStatus">
                          <c:forEach items="${ results[tabKey] }" var="result">
                              <div class="search-result">
                                  <div class="panel panel-default">
                                      <div class="panel-heading">
                                          <c:choose>
                                            <c:when test="${tabKey.equals(defaultTabKey) && !result.first.type.contains('Online Service/Link')}">
                                            <a class="result_link" href="${result.second}">
                                              <span class="result_title">${ result.first.title }</span>
                                            </a>
                                            </c:when>
                                            <c:otherwise>
                                            <a class="result_link" href="${result.second}" target="_blank" rel="noopener noreferrer">
                                              <span class="result_title">${ result.first.title } <i class="fa fa-external-link"></i></span>
                                            </a>
                                            </c:otherwise>
                                          </c:choose>
                                      </div>
                                      <div class="panel-body">
                                          <p class="result_excerpt">${ result.first.summary }</p>
                                      </div>
                                  </div>
                              </div>
                          </c:forEach>
                          </c:forEach>
                      </div>
                  </div>
                </c:when>
                <c:otherwise>
                    <p><spring:message code="no.results"/></p>
                </c:otherwise>
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
