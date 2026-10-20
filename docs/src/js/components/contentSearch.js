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
    var _searchTokens = [];
    var _timeOutID;

    var $liveSearch = $("#liveSearch");

    var $liveSearchField = $liveSearch.find(".liveSearch-field");
    var $liveSearchResultList = $liveSearch.find(".liveSearch-result-list");
    var $liveSearchButton = $liveSearch.find(".liveSearch-button");


    var $contentSearchField = $liveSearch.find(".contentSearch-field");
    var $contentSearchResultList = $(".searchPage-result-list");

    function normalizeSearchTerm(term) {
        return (term || "").trim().toLowerCase();
    }

    function combineSearchTerm(searchTerm) {
        return searchTerm.replace(/[^a-z0-9]+/g, "");
    }

    function tokenizeSearchTerm(searchTerm) {
        return searchTerm.split(/[^a-z0-9]+/).filter(function (token) {
            return token.length > 0;
        });
    }

    function escapeRegExp(value) {
        return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    }

    function uniqueTokens(tokens) {
        var seen = {};

        return tokens.filter(function (token) {
            if (seen[token]) {
                return false;
            }

            seen[token] = true;
            return true;
        });
    }

    function normalizePage(currentPage) {
        return {
            title: (currentPage.title || ""),
            group: (currentPage.group || ""),
            description: (currentPage.description || ""),
            url: (currentPage.url || ""),
            content: (currentPage.content || ""),
            value: 0
        };
    }

    function updateSearchState(term) {
        _searchTerm = normalizeSearchTerm(term);
        _searchTermCombined = combineSearchTerm(_searchTerm);
        _searchTokens = uniqueTokens(tokenizeSearchTerm(_searchTerm));
    }

    function countMatches(text, searchValues) {
        var matchCount = 0;
        var i = 0;

        for (i; i < searchValues.length; i++) {
            matchCount += countWordOccurrences(text, searchValues[i]);
        }

        return matchCount;
    }

    function countWordOccurrences(text, searchValue) {
        var matches = text.match(new RegExp("(^|[^a-z0-9])" + escapeRegExp(searchValue) + "(?=$|[^a-z0-9])", "g"));

        return matches ? matches.length : 0;
    }

    function fieldContainsToken(text, token) {
        return countWordOccurrences(text, token) > 0;
    }

    function fieldContainsAllTokens(text) {
        var i = 0;

        if (_searchTokens.length === 0) {
            return false;
        }

        for (i; i < _searchTokens.length; i++) {
            if (!fieldContainsToken(text, _searchTokens[i])) {
                return false;
            }
        }

        return true;
    }

    function pageContainsAllTokens(pageFields) {
        var i = 0;
        var j = 0;

        if (_searchTokens.length === 0) {
            return false;
        }

        for (i; i < _searchTokens.length; i++) {
            var found = false;

            for (j = 0; j < pageFields.length; j++) {
                if (fieldContainsToken(pageFields[j], _searchTokens[i])) {
                    found = true;
                    break;
                }
            }

            if (!found) {
                return false;
            }
        }

        return true;
    }

    function scoreTitleMatches(currentPage) {
        var title = currentPage.title.toLowerCase();
        var score = 0;

        if (_searchTerm !== "" && title === _searchTerm) {
            score += 5000;
        }

        if (_searchTerm !== "" && title.indexOf(_searchTerm) === 0) {
            score += 2500;
        }

        if (_searchTermCombined !== _searchTerm && _searchTermCombined !== "" && combineSearchTerm(title).indexOf(_searchTermCombined) === 0) {
            score += 1500;
        }

        if (fieldContainsAllTokens(title)) {
            score += 1200;
        }

        return score;
    }

    function scoreUrlMatches(currentPage) {
        var url = currentPage.url.toLowerCase();
        var score = 0;

        if (_searchTerm !== "" && url.indexOf(_searchTerm) >= 0) {
            score += 300;
        }

        if (_searchTermCombined !== _searchTerm && _searchTermCombined !== "" && combineSearchTerm(url).indexOf(_searchTermCombined) >= 0) {
            score += 200;
        }

        if (fieldContainsAllTokens(url)) {
            score += 400;
        }

        return score;
    }

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

        var searchValues = _searchTokens.slice();

        for (i; i < length; i++) {

            var found = false;

            var currentPage = normalizePage(response[i]);
            var pageFields = [
                currentPage.title.toLowerCase(),
                currentPage.description.toLowerCase(),
                currentPage.group.toLowerCase(),
                currentPage.url.toLowerCase(),
                currentPage.content.toLowerCase()
            ];

            if (!pageContainsAllTokens(pageFields)) {
                continue;
            }

            currentPage.value += scoreTitleMatches(currentPage);
            currentPage.value += scoreUrlMatches(currentPage);

            var occurrences = 0;

            for (j = 0; j < 5; j++) {

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
                        text = currentPage.url.toLowerCase();
                        multiplier = 120;
                        break;
                    case 4:
                        text = currentPage.content.toLowerCase();
                        multiplier = 1;
                }

                if (searchValues.some(function (value) { return fieldContainsToken(text, value); }) ||
                    (_searchTerm !== "" && text.indexOf(_searchTerm) >= 0) ||
                    (_searchTermCombined !== "" && combineSearchTerm(text).indexOf(_searchTermCombined) >= 0)) {
                    found = true;
                    occurrences = countMatches(text, searchValues);

                    if (_searchTerm !== "" && text.indexOf(_searchTerm) >= 0) {
                        occurrences += 2;
                    }

                    if (_searchTermCombined !== "" && combineSearchTerm(text).indexOf(_searchTermCombined) >= 0) {
                        occurrences += 2;
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
        return $.getJSON(searchJsonUrl).fail(function (jqXHR, textStatus, errorThrown) {
            console.error("ACE docs search JSON request failed", {
                url: searchJsonUrl,
                status: jqXHR && jqXHR.status,
                textStatus: textStatus,
                error: errorThrown
            });
        });
    }

    function searchTermValid(searchTerm) {
        return !(searchTerm === "" || searchTerm.length < _searchStartLength);
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
        if ($liveSearchResultList.length === 0) {
            return;
        }

        if (!results || results.length === 0) {
            $liveSearchResultList.empty().addClass("hidden");
            return;
        }

        var i = 0,
            length = results.length;

        var html = "";

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = currentPage.description;
            if (description.length > _maxDescriptionLengthLive) {
                description = description.substr(0, _maxDescriptionLengthLive) + "&hellip;";
            }

            html += String.format("<li><a href=\"{1}\">{0}<br><small>{2}</small></a></li>", currentPage.title, currentPage.url, description);
        }

        $liveSearchResultList.empty().append(html).removeClass("hidden");
    }

    function hideLiveResultList() {
        if ($liveSearchResultList.length > 0) {
            $liveSearchResultList.addClass("hidden");
        }
    }

    function search() {
        var term = $liveSearchField.val();

        updateSearchState(term);

        console.info("ACE docs live search", {
            term: _searchTerm,
            tokens: _searchTokens,
            minLength: _searchStartLength
        });

        if (!searchTermValid(_searchTerm)) {
            $liveSearchResultList.empty();
            hideLiveResultList();
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
        console.info("ACE docs live search results", {
            term: _searchTerm,
            count: results.length
        });
        showLiveResultList(results);
    }

    function openSearchPage(e) {
        if (e) {
            e.preventDefault();
        }

        var searchTerm = normalizeSearchTerm($liveSearchField.val());

        if (!searchTermValid(searchTerm)) {
            hideLiveResultList();
            return false;
        }

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

        updateSearchState(term);

        console.info("ACE docs content search", {
            term: _searchTerm,
            tokens: _searchTokens,
            minLength: _searchStartLength
        });

        if (!searchTermValid(_searchTerm)) {
            $contentSearchResultList.empty();
            return false;
        }
        startContentSearch();
    }

    function updateSearchFieldFromQueryParams() {
        updateSearchState(utils.getQueryParam(searchTermParamName));
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
        console.info("ACE docs content search results", {
            term: _searchTerm,
            count: results.length
        });
        showContentResultList(results);
    }

    function showContentResultList(results) {
        if ($contentSearchResultList.length === 0) {
            return;
        }

        var i = 0,
            length = results.length;

        var html = "";

        if (length === 0) {
            $contentSearchResultList.empty().append("<li>No results found.</li>");
            return;
        }

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = currentPage.description;
            if (description.length > _maxDescriptionLengthContent) {
                description = description.substr(0, _maxDescriptionLengthContent) + "&hellip;";
            }

            html += String.format("<li><a href=\"{1}\">{0}</a><span class=\"additionalInfo\"><br><small><span class=\"url\">{3}</span><br><span class=\"description\">{2}</span></small></span></li>", currentPage.title, currentPage.url, description, document.location.origin + currentPage.url);
        }

        $contentSearchResultList.empty().append(html);
    }

    return {
        init: init
    };


})(jQuery);
