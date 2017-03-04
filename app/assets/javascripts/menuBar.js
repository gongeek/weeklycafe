app.addModule('menu-bar', function (context) {
    var moduleEl,
        reg = /[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/;

    function dealInput(inputRss) {
        if (!reg.test(inputRss)) {
            toastr.warning('请输入合法的http地址!');
            return;
        }
        $.post('/site/create', {'rss[rss]': inputRss, 'authenticity_token': AUTH_TOKEN}, function (data) {
            if (data && data.ok === true) {
                toastr.success('提交成功，待审核！');
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
                    toastr.warning('请先登入!');
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