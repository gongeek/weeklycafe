app.addModule('menu-bar', function (context) {
    var moduleEl,
        reg = /[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/;

    function dealInput(inputRss) {
        if (!reg.test(inputRss)) {
            toastr.warning('Please enter a valid  address!');
            return;
        }
        $.post('/site/create', {'rss': inputRss, 'authenticity_token': AUTH_TOKEN}, function (data) {
            if (data && data.ok === true) {
                toastr.success('Submission successful, pending review！');
                $.closeModal('#modal-add-weekly');
            } else if (data && data.ok === false) {
                toastr.warn(data.msg)
            }
        })

    }

    return {
        init: function () {
            moduleEl = context.getElement();
            $(moduleEl).scrollToFixed();
            toastr.options = {
                "closeButton": true,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "300",
                "timeOut": "1000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        },
        onclick: function (event, element, elementType) {
            var $el = $(element);
            if (elementType === 'add-rss') {
                if (typeof UserInfo === 'undefined') {
                    toastr.warning('Please login first!');
                    return;
                }
                $.showModal({
                    modalId: '#modal-add-weekly',
                    top: '200px'
                }, event)
            } else if (elementType === 'enter-del-btn') {
                var $inputRss = $(element).closest('label').find('input'),
                    inputRss = $inputRss.val();
                dealInput(inputRss);
            }
        },
        onkeydown: function (event, elmemnt, elementType) {
            if (event.target.nodeName.toUpperCase() === 'INPUT' && event.keyCode === 13) {
                dealInput($(event.target).val());
            }
        }
    };
});