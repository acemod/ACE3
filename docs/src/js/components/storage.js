window.app = window.app || {};
window.app.storage = (function () {

    var prefix = "ace3_";
    var timeToInvalidateItem = 1; // 1h

    // gets an item from sessionStorage and checks if the time to invalidate the item is over
    function getItem (key) {
        var currentItem = window.sessionStorage.getItem(prefix + key);

        if (!currentItem) {
            return null;
        }

        currentItem = JSON.parse(currentItem);

        // item is valid
        if (new Date(currentItem.date).addHours(timeToInvalidateItem) > new Date()) {
            return currentItem.item;
        }

        return null;
    }

    // saves an item in the sessionStorage and adds a timestamp
    function setItem (key, value) {

        var itemToSave = {
            date: new Date(),
            item: value
        };

        var currentItem = JSON.stringify(itemToSave);

        window.sessionStorage.setItem(prefix + key, currentItem);
    }

    return {
        getItem: getItem,
        setItem: setItem
    };
})();
