(function ($) {
    'use strict';
    $.fn.toTop = function (opt) {
        var elem = this;
        var win = $(window);
        var doc = $('html, body');
        var options = $.extend({
            autohide: true,
            offset: 200,
            speed: 200,
            position: true,
            right: 20,
            bottom: 20
        }, opt);

        elem.css({
            'cursor': 'pointer'
        });

        if (options.autohide) {
            elem.css('display', 'none');
        }
        if (options.position) {
            elem.css({
                'position': 'fixed',
                'right': options.right,
                'bottom': options.bottom
            });
        }

        elem.click(function () {
            doc.animate({scrollTop: 0}, options.speed);
        });

        win.scroll(function () {
            var scrolling = win.scrollTop();

            if (options.autohide) {
                if (scrolling > options.offset) {
                    elem.fadeIn(options.speed);
                }
                else elem.fadeOut(options.speed);
            }

        });

    };
}(jQuery));

app.addModule('to-top', function (context) {
    return {
        init: function () {
            $(context.getElement()).toTop();
        }
    };
});