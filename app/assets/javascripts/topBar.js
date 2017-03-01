app.addModule('top-bar', function (context) {
    return {
        onclick: function (event, element, elementType) {
            var $el = $(element);
            if (elementType === 'login-in') {
                if ($el.hasClass('close')) {
                    $el.removeClass('close');
                    $el.addClass('open');
                    event.stopPropagation();
                    event.preventDefault();
                    $(document).on('click.login', function () {
                        $el.removeClass('open');
                        $el.addClass('close');
                        $(document).off('click.login')
                    })
                }
            }
        }

    };
});