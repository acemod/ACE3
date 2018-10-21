window.app = window.app || {};
window.app.contentSearch = (function ($) {

    var searchJsonUrl = "/js/search.json";
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

    function findSearchTermInArray(response, maxEntries) {
        var results = [],
            i = 0,
            j = 0,
            length = response.length,
            text = "",
            multiplier = 0;

        for (i; i < length; i++) {

            var found = false;

            if (results.length >= maxEntries) {
                break;
            }

            var currentPage = response[i];
            currentPage.value = 0;

            var occurrences = 0;

            for (j = 0; j < 4; j++) {

                occurrences = 0;

                switch (j) {
                    case 0:
                        text = currentPage.description.toLowerCase();
                        multiplier = 100;
                        break;
                    case 1:
                        text = currentPage.title.toLowerCase();
                        multiplier = 1000;
                        break;
                    case 2:
                        text = currentPage.group.toLowerCase();
                        multiplier = 10;
                        break;
                    case 3:
                        text = currentPage.content.toLowerCase();
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

        return results;
    }

    function getSearchResults() {
        return $.getJSON(searchJsonUrl);
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

            var description = currentPage.description;
            if (description.length > _maxDescriptionLengthLive) {
                description = description.substr(0, _maxDescriptionLengthLive) + "&hellip;"
            }

            html += String.format("<li><a href=\"{1}\">{0}<br><small>{2}</small></a></li>", currentPage.title, currentPage.url, description);
        }

        $liveSearchResultList.empty().append(html).removeClass("hidden");
    }

    function hideLiveResultList() {
        $liveSearchResultList.addClass("hidden");
    }

    function search() {
        var term = $liveSearchField.val();

        _searchTerm = term.trim().toLowerCase();
        _searchTermCombined = _searchTerm.replace(" ", "");

        if (!searchTermValid(_searchTerm)) {
            $liveSearchResultList.empty();
            return false;
        }

        startLiveSearch();
    }

    function startLiveSearch() {
        var cachedSearchResults = app.storage.getItem(storageKeyName);
        if (!cachedSearchResults) {
            getSearchResults().done(function (response) {
                app.storage.setItem(storageKeyName, response);
                handleLiveSearchResult(response);
            });
        } else {
            handleLiveSearchResult(cachedSearchResults);
        }
    }

    function handleLiveSearchResult(response) {
        var results = findSearchTermInArray(response, _maxEntriesLive);
        app.analytics.sendEvent("LiveSearch", "Search", _searchTerm);
        showLiveResultList(results);
    }

    function openSearchPage(e) {
        e.preventDefault();
        var searchTerm = $liveSearchField.val().trim();
        app.analytics.sendEvent("LiveSearch", "OpenSearchPage", searchTerm);
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
        _searchTermCombined = _searchTerm.replace(" ", "");

        if (!searchTermValid(_searchTerm)) {
            return false;
        }
        startContentSearch();
    }

    function updateSearchFieldFromQueryParams() {
        _searchTerm = utils.getQueryParam(searchTermParamName);
        _searchTermCombined = _searchTerm.replace(" ", "");
        $contentSearchField.val(_searchTerm);
        if (searchTermValid(_searchTerm)) {
            startContentSearch();
        }
    }

    function startContentSearch() {
        var cachedSearchResults = app.storage.getItem(storageKeyName);
        if (!cachedSearchResults) {
            getSearchResults().done(function (response) {
                app.storage.setItem(storageKeyName, response);
                handleContentSearchResult(response);
            });
        } else {
            handleContentSearchResult(cachedSearchResults);
        }
    }


    function handleContentSearchResult(response) {
        var results = findSearchTermInArray(response, _maxEntriesContent);
        app.analytics.sendEvent("ContentSearch", "Search", _searchTerm);
        showContentResultList(results);
    }

    function showContentResultList(results) {
        var i = 0,
            length = results.length;

        var html = "";

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = currentPage.description;
            if (description.length > _maxDescriptionLengthContent) {
                description = description.substr(0, _maxDescriptionLengthContent) + "&hellip;"
            }

            html += String.format("<li><a href=\"{1}\">{0}</a><span class=\"additionalInfo\"><br><small><span class=\"url\">{3}</span><br><span class\"description\">{2}</small></small></span></li>", currentPage.title, currentPage.url, description, document.location.origin + currentPage.url);
        }

        $contentSearchResultList.empty().append(html);
    }

    return {
        init: init
    };


})(jQuery);
