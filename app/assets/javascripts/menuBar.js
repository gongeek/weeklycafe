app.addModule('menu-bar', function (context) {
    var moduleEl;
    return {
        init: function () {
            moduleEl = context.getElement();
            $(moduleEl).scrollToFixed();
        }
    };
});