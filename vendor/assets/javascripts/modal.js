(function ($) {
    function close_modal(modal_id) {
        $("#lean_overlay").fadeOut(200);
        $(modal_id).css({'display': 'none'});
        $('.enter-del-btn').off('click');
    }

    $.closeModal = function (modal_id) {
        close_modal(modal_id)
    };
    $.showModal = function (options, e) {
        var defaults = {
            top: 100,
            overlay: 0.5,
            closeButton: null,
            modalId: options.modalId,
            cb: options.cb
        };
        var overlay = $("<div id='lean_overlay'></div>");
        $("body").append(overlay);
        options = $.extend(defaults, options);
        var o = options;

        var modal_id = o.modalId || ( '#' + $(this).data('modal')),
            $l = $("#lean_overlay");
        $l.click(function () {
            close_modal(modal_id);
        });
        $(o.closeButton).click(function () {
            close_modal(modal_id);
        });
        var modal_height = $(modal_id).outerHeight();
        var modal_width = $(modal_id).outerWidth();
        $l.css({'display': 'block', opacity: 0});
        $l.fadeTo(200, o.overlay);
        $(modal_id).css({
            'display': 'block',
            'position': 'fixed',
            'opacity': 1,
            'z-index': 11000,
            'left': 50 + '%',
            'margin-left': -(modal_width / 2) + "px",
            'top': o.top || "50%",
            'margin-top': -(modal_height / 2) + "px"

        });
        $(modal_id).slideDown(200, 1);
        e && e.preventDefault();
    };
    $.fn.extend({
        leanModal: function (options) {
            var defaults = {
                top: 100,
                overlay: 0.5,
                closeButton: null,
                modalId: options.modalId,
                cb: options.cb
            };
            var overlay = $("<div id='lean_overlay'></div>");
            $("body").append(overlay);
            options = $.extend(defaults, options);
            return this.each(function () {
                var o = options;
                $(this).click(function (e) {
                    var modal_id = o.modalId || ( '#' + $(this).data('modal')),
                        $l = $("#lean_overlay");
                    //处理日历通信问题
                    if (typeof o.cb === 'function') {
                        o.cb($(this).data('id'), $(this).data('start-day'));
                    }

                    $l.click(function () {
                        close_modal(modal_id);
                    });
                    $(o.closeButton).click(function () {
                        close_modal(modal_id);
                    });
                    var modal_height = $(modal_id).outerHeight();
                    var modal_width = $(modal_id).outerWidth();
                    $l.css({'display': 'block', opacity: 0});
                    $l.fadeTo(200, o.overlay);
                    $(modal_id).css({
                        'display': 'block',
                        'position': 'fixed',
                        'opacity': 1,
                        'z-index': 11000,
                        'left': 50 + '%',
                        'margin-left': -(modal_width / 2) + "px",
                        'top': "50%",
                        'margin-top': -(modal_height / 2) + "px"

                    });
                    $(modal_id).slideDown(200, 1);
                    e.preventDefault();
                });

            });

        }
    });

})(jQuery);
