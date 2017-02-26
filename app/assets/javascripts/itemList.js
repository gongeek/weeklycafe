app.addModule('items-list', function (context) {
    var pageNext = 2;
    return {
        onclick: function (event, element, elementType) {
            if (elementType === 'more-btn') {
                $.get('/items/add?page=' + pageNext);
                pageNext++;
            }
        }

    };
});