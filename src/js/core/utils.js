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
