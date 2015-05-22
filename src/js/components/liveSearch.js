window.app = window.app || {};
window.app.liveSearch = (function ($) {

    var searchJsonUrl = "/js/search.json";
    var storageKeyName = "searchResult";

    var searchStartLength = 3;
    var maxEntries = 10;
    var maxDescriptionLength = 80;

    var _searchTerm = "";
    var _searchTermCombined = "";
    var _timeOutID;

    var $liveSearch = $("#liveSearch");

    var $contentSearchField = $liveSearch.find(".contentSearch-field");
    var $contentSearchResultList = $liveSearch.find(".contentSearch-result-list");
    var $contentSearchButton = $liveSearch.find(".contentSearch-button");


    function init() {
        $contentSearchField.on("keyup", handleKeyDown);
        $contentSearchField.on("blur", function() {
            setTimeout(hideResultList, 300);
        });
        $contentSearchButton.on("click", openSearchPage);
    }


    function handleKeyDown(e) {

        // arrow down, arrow up
        if (e.keyCode === 38 || e.keyCode === 40) {
            e.preventDefault();
            //navigateSearchResultsList(e.keyCode);
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



    function showResultList(results) {

        if (!results) {
            $contentSearchResultList.removeClass("hidden");
            return;
        }

        var i = 0,
            length = results.length;

        var html = "";

        for (i; i < length; i++) {
            var currentPage = results[i];

            var description = currentPage.description;
            if (description.length > maxDescriptionLength) {
                description = description.substr(0, maxDescriptionLength) + "&hellip;"
            }

            html += String.format("<li><a href=\"{1}\">{0}<br><small>{2}</small></a></li>", currentPage.title, currentPage.url, description);
        }

        $contentSearchResultList.empty().append(html).removeClass("hidden");
    }

    function hideResultList() {
        $contentSearchResultList.addClass("hidden");
    }


    function search() {
        var term = $contentSearchField.val();

        _searchTerm = term.trim().toLowerCase();
        _searchTermCombined = _searchTerm.replace(" ", "");

        if (_searchTerm === "" || _searchTerm.length < searchStartLength) {
            $contentSearchResultList.empty();
            return false;
        }

        startSearch();
    }


    function startSearch() {
        var cachedSearchResults = app.storage.getItem(storageKeyName);
        if (!cachedSearchResults) {
            getSearchResults().then(function (response) {
                app.storage.setItem(storageKeyName, response);
                handleSearchResult(response);
            });
        } else {
            handleSearchResult(cachedSearchResults);
        }
    }

    function handleSearchResult(response) {

        var results = [],
            i = 0,
            length = response.length;

        for (i; i < length; i++) {

            if (results.length >= maxEntries) {
                break;
            }

            var currentPage = response[i];
            if (currentPage.description.indexOf(_searchTerm) >= 0 || currentPage.description.indexOf(_searchTermCombined) >= 0) {
                results.push(currentPage);
                continue;
            }
            if (currentPage.title.indexOf(_searchTerm) >= 0 || currentPage.title.indexOf(_searchTermCombined) >= 0) {
                results.push(currentPage);
                continue;
            }
            if (currentPage.group.indexOf(_searchTerm) >= 0 || currentPage.group.indexOf(_searchTermCombined) >= 0) {
                results.push(currentPage);
                continue;
            }
            if (currentPage.content.indexOf(_searchTerm) >= 0 || currentPage.content.indexOf(_searchTermCombined) >= 0) {
                results.push(currentPage);
            }
        }

        showResultList(results);
    }

    function getSearchResults() {
        return $.getJSON(searchJsonUrl)
    }


    function openSearchPage(e) {
        e.preventDefault();
        var searchTerm = $contentSearchField.val().trim();
        document.location.href = "search.html?searchTerm=" + encodeURIComponent(searchTerm);
        return false;
    }

    return {
        init: init
    };


})(jQuery);
