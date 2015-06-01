window.app = window.app || {};
window.app.analytics = (function () {


    function sendEvent(eventName, eventLabel) {

        if (!dataLayer) {
            return null;
        }

        var event = {
            "event": eventName
        };

        if (!!eventLabel && eventLabel != "") {
            event["eventLabel"] = eventLabel;
        }

        dataLayer.push(event);
    }


    return {
        sendEvent: sendEvent
    };
})();
