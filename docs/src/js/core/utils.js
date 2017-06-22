String.format = function () {
    var myString = arguments[0];
    for (var i = 1; i < arguments.length; i++) {
        var regX = new RegExp("\\{" + (i - 1) + "\\}", "gm");
        myString = myString.replace(regX, arguments[i]);
    }
    return myString;
};

Date.prototype.addHours = function (hours) {
    return new Date(
        this.getFullYear(),
        this.getMonth(),
        this.getDate(),
        this.getHours() + hours,
        this.getMinutes(),
        this.getSeconds(),
        this.getMilliseconds()
    );
};

window.utils = window.utils || {};
utils.getQueryParam = function (name) {
    "use strict";
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
};

utils.countOccurrences = function (text, searchTerm) {
    text += "";
    searchTerm += "";
    if (searchTerm.length <= 0) return text.length + 1;

    var n = 0, pos = 0;
    var step = searchTerm.length;

    while (true) {
        pos = text.indexOf(searchTerm, pos);
        if (pos >= 0) {
            n++;
            pos += step;
        } else break;
    }
    return (n);
};
