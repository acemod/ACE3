window.app = window.app || {};
window.app.analytics = (function () {


    function sendEvent(category, action, label, value) {

        if (!ga) {
            return null;
        }

        try {
            return ga("send", "event", category, action, label, value);
        } catch(ex)  {}
    }


    return {
        sendEvent: sendEvent
    };
})();
