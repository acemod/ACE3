window.app = window.app || {};
window.app.contentSearch = (function ($) {

    var defaultSearchJsonUrl = "/js/search.json";
    var logPrefix = "[ACE3 docs search]";
    var storageKeyName = "searchResult";

    var searchTermParamName = "searchTerm";

    var _searchStartLength = 3;
    var _maxEntriesLive = 10;
    var _maxEntriesContent = 25;
    var _maxDescriptionLengthLive = 80;
    var _maxDescriptionLengthContent = 140;

    var _searchTerm = "";
    var _searchTermCombined = "";
    var _timeOutID;

    var $liveSearch = $("#liveSearch");

    var $liveSearchField = $liveSearch.find(".liveSearch-field");
    var $liveSearchResultList = $liveSearch.find(".liveSearch-result-list");
    var $liveSearchButton = $liveSearch.find(".liveSearch-button");


    var $contentSearchField = $liveSearch.find(".contentSearch-field");
    var $contentSearchResultList = $(".searchPage-result-list");

    function init() {
        logInfo("Initializing search", {
            searchJsonUrl: getSearchJsonUrl(),
            hasLiveSearchField: $liveSearchField.length > 0,
            hasContentSearchField: $contentSearchField.length > 0
        });
        updateSearchFieldFromQueryParams();

        $liveSearchField.on("keyup", handleLiveKeyDown);
        $liveSearchField.on("blur", function () {
            setTimeout(hideLiveResultList, 300);
        });
        $liveSearchButton.on("click", openSearchPage);

        $contentSearchField.on("keyup", handleContentKeyDown);

    }


    /*
     ===
     UTIL
     ===
     */

    function getSearchJsonUrl() {
        var $bundleScript = $("script[src*='/dist/bundle']");
        var bundleSrc = $bundleScript.last().attr("src");

        if (!bundleSrc) {
            return defaultSearchJsonUrl;
        }

        return new URL("../js/search.json", new URL(bundleSrc, document.location.href)).toString();
    }

    function logInfo(message, data) {
        if (!window.console || typeof window.console.info !== "function") {
            return;
        }

        if (typeof data === "undefined") {
            window.console.info(logPrefix, message);
        } else {
            window.console.info(logPrefix, message, data);
        }
    }

    function getCachedSearchResults() {
        try {
            return app.storage.getItem(storageKeyName);
        } catch (e) {
            return null;
        }
    }

    function setCachedSearchResults(searchResults) {
        try {
            app.storage.setItem(storageKeyName, searchResults);
        } catch (e) {
            return;
        }
    }

    function getPageText(currentPage, key) {
        var value = currentPage[key];

        if (typeof value !== "string") {
            return "";
        }

        return value.toLowerCase();
    }

    function getPageValue(currentPage, key) {
        var value = currentPage[key];

        if (typeof value !== "string") {
            return "";
        }

        return value;
    }

    function combineSearchTerm(searchTerm) {
        return searchTerm.replace(/\s+/g, "");
    }

    function findSearchTermInArray(response, maxEntries) {
        var results = [],
            i = 0,
            j = 0,
            length = response.length,
            text = "",
            multiplier = 0;

        for (i; i < length; i++) {

            var found = false;

            var currentPage = response[i];
            currentPage.value = 0;

            var occurrences = 0;

            for (j = 0; j < 4; j++) {

                occurrences = 0;

                switch (j) {
                    case 0:
                        text = getPageText(currentPage, "description");
                        multiplier = 100;
                        break;
                    case 1:
                        text = getPageText(currentPage, "title");
                        multiplier = 1000;
                        break;
                    case 2:
                        text = getPageText(currentPage, "group");
                        multiplier = 10;
                        break;
                    case 3:
                        text = getPageText(currentPage, "content");
                        multiplier = 1;
                }

                if (text.indexOf(_searchTerm) >= 0 || text.indexOf(_searchTermCombined) >= 0) {
                    found = true;
                    occurrences = utils.countOccurrences(text, _searchTerm);

                    if (_searchTermCombined !== _searchTerm) {
                        occurrences += utils.countOccurrences(text, _searchTermCombined);
                    }

                    if (occurrences > 0) {
                        currentPage.value += (occurrences * multiplier);
                    }
                }
            }

            if (found) {
                results.push(currentPage);
            }

        }

        results = results.sort(function(x,y) {
            if (x.value > y.value) {
                return -1;
            } else if(y.value > x.value) {
                return 1;
            } else {
                return 0;
            }
        });

        return results.slice(0, maxEntries);
    }

    function getSearchResults() {
        return $.getJSON(getSearchJsonUrl());
    }

    function searchTermValid(searchTerm) {
        if (searchTerm === "" || searchTerm.length < _searchStartLength) {
            return false;
        } else {
            return true;
        }
    }


    /*
     ===
     LIVE SEARCH
     ===
     */

    function handleLiveKeyDown(e) {

        // arrow down, arrow up
        if (e.keyCode === 38 || e.keyCode === 40) {
            e.preventDefault();
            return false;
        }

        // enter
        if (e.keyCode === 13) {
            e.preventDefault();
            openSearchPage(e);
            return false;
        }

        // delays input and makes sure that only a complete search is sent
        clearTimeout(_timeOutID);
        _timeOutID = setTimeout(search, 300);
    }

    function showLiveResultList(results) {
        if (!results) {
            $liveSearchResultList.removeClass("hidden");
            return;
        }

        var i = 0,
            length = results.length;

        var html = "";

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = getPageValue(currentPage, "description");
            if (description.length > _maxDescriptionLengthLive) {
                description = description.substr(0, _maxDescriptionLengthLive) + "&hellip;"
            }

            html += String.format("<li><a href=\"{1}\">{0}<br><small>{2}</small></a></li>", getPageValue(currentPage, "title"), getPageValue(currentPage, "url"), description);
        }

        $liveSearchResultList.empty().append(html).removeClass("hidden");
    }

    function hideLiveResultList() {
        $liveSearchResultList.addClass("hidden");
    }

    function search() {
        var term = $liveSearchField.val();

        _searchTerm = term.trim().toLowerCase();
        _searchTermCombined = combineSearchTerm(_searchTerm);

        if (!searchTermValid(_searchTerm)) {
            logInfo("Skipping live search for short term", _searchTerm);
            $liveSearchResultList.empty();
            return false;
        }

        startLiveSearch();
    }

    function startLiveSearch() {
        var cachedSearchResults = getCachedSearchResults();
        if (!cachedSearchResults) {
            logInfo("Fetching search index for live search", getSearchJsonUrl());
            getSearchResults().done(function (response) {
                setCachedSearchResults(response);
                handleLiveSearchResult(response);
            });
        } else {
            logInfo("Using cached search index for live search");
            handleLiveSearchResult(cachedSearchResults);
        }
    }

    function handleLiveSearchResult(response) {
        var results = findSearchTermInArray(response, _maxEntriesLive);
        logInfo("Live search completed", {
            searchTerm: _searchTerm,
            results: results.length
        });
        showLiveResultList(results);
    }

    function openSearchPage(e) {
        e.preventDefault();
        var searchTerm = $liveSearchField.val().trim();
        document.location.href = String.format("search.html?{0}={1}", searchTermParamName, encodeURIComponent(searchTerm));
        return false;
    }


    /*
     ===
     CONTENT SEARCH
     ===
     */

    function handleContentKeyDown(e) {

        // arrow down, arrow up
        if (e.keyCode === 38 || e.keyCode === 40) {
            e.preventDefault();
            return false;
        }

        // enter
        if (e.keyCode === 13) {
            e.preventDefault();
            contentSearch();
            return false;
        }

        // delays input and makes sure that only a complete search is sent
        clearTimeout(_timeOutID);
        _timeOutID = setTimeout(contentSearch, 300);
    }

    function contentSearch() {
        var term = $contentSearchField.val();

        _searchTerm = term.trim().toLowerCase();
        _searchTermCombined = combineSearchTerm(_searchTerm);

        if (!searchTermValid(_searchTerm)) {
            logInfo("Skipping content search for short term", _searchTerm);
            return false;
        }
        startContentSearch();
    }

    function updateSearchFieldFromQueryParams() {
        _searchTerm = utils.getQueryParam(searchTermParamName);
        _searchTermCombined = combineSearchTerm(_searchTerm);
        logInfo("Loaded search term from query params", _searchTerm);
        $contentSearchField.val(_searchTerm);
        if (searchTermValid(_searchTerm)) {
            startContentSearch();
        }
    }

    function startContentSearch() {
        var cachedSearchResults = getCachedSearchResults();
        if (!cachedSearchResults) {
            logInfo("Fetching search index for content search", getSearchJsonUrl());
            getSearchResults().done(function (response) {
                setCachedSearchResults(response);
                handleContentSearchResult(response);
            });
        } else {
            logInfo("Using cached search index for content search");
            handleContentSearchResult(cachedSearchResults);
        }
    }


    function handleContentSearchResult(response) {
        var results = findSearchTermInArray(response, _maxEntriesContent);
        logInfo("Content search completed", {
            searchTerm: _searchTerm,
            results: results.length
        });
        showContentResultList(results);
    }

    function showContentResultList(results) {
        var i = 0,
            length = results.length;

        var html = "";

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = getPageValue(currentPage, "description");
            if (description.length > _maxDescriptionLengthContent) {
                description = description.substr(0, _maxDescriptionLengthContent) + "&hellip;"
            }

            html += String.format("<li><a href=\"{1}\">{0}</a><span class=\"additionalInfo\"><br><small><span class=\"url\">{3}</span><br><span class=\"description\">{2}</span></small></span></li>", getPageValue(currentPage, "title"), getPageValue(currentPage, "url"), description, document.location.origin + getPageValue(currentPage, "url"));
        }

        $contentSearchResultList.empty().append(html);
    }

    return {
        init: init
    };


})(jQuery);
