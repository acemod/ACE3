window.app = window.app || {};
window.app.analytics = (function () {


    function sendEvent(category, action, label, value) {

        if (!window.ga) {
            return;
        }

        try {
            ga("send", "event", category, action, label, value);
        } catch(ex)  {}
    }


    return {
        sendEvent: sendEvent
    };
})();
