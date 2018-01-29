<%@ include file="/WEB-INF/jsp/include.jsp" %>

<script type="text/javascript">
var base_url = "${base_url[0]}";
var base_url_length = base_url.length;

var cas_url = "${cas_url[0]}";

var hide_customize_fragments = [
    'home-lo',
    'my-status-lo',
    'cpp-employee-lo',
    'cpp-campus-lo',
    'online-services-lo',
    'my-personal-info-lo'
];

function qualifyURL(url) {
    var img = document.createElement('img');
    img.src = url; // set string url
    url = img.src; // get qualified url
    img.src = null; // no server request
    return url;
}

function hideCustomize() {
    if(typeof up.analytics.pageData === 'undefined') {
        return;
    }

    var pageData = up.analytics.pageData;

    if(typeof pageData.tab === 'undefined') {
        return;
    }

    if(typeof pageData.tab.fragmentName === 'undefined') {
        return;
    }

    var fragmentName = pageData.tab.fragmentName;

    if(hide_customize_fragments.indexOf(fragmentName) > -1) {
        up.jQuery('#customizeOptionsWrapper').fadeOut();
    }
}

up.jQuery(document).ready(function ($) {
    hideCustomize();

    $("a").click(function (e) {
        if(!base_url) {
            return;
        }

        var href = $(this).attr('href');
        var target = $(this).attr('target');

        if(href.search("javascript:") == 0) {
            return;
        }

        if(href.search("mailto:") == 0) {
            return;
        }

        if(target && target === '_blank') {
            return;
        }

        if(href.indexOf(cas_url) == 0) {
            return;
        }

        var link_location2 = qualifyURL(href);

        // if the link clicked is external
        if (link_location2.substr(0, base_url.length) != base_url) {
            if (!(confirm("You are about to leave the website without logging out. Please press CANCEL to go back and Log Out."))) {
                e.preventDefault();
            }
        }
    });

});
</script>
