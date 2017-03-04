app.addModule('all-sites', function (context) {
    return {
        init: function () {
            var jets = new Jets({
                searchTag: '#jets-search',
                contentTag: '#jets-content'
            });
        },
        onclick: function (event, element, elementType) {
            switch (elementType) {
                case 'cancel-btn':
                    $.get('/site/del_sub/' + $(element).data('site-id'));
                    event.stopPropagation();
                    event.preventDefault();
                    break;
                case 'add-btn':
                    $.get('/site/sub/' + $(element).data('site-id'));
                    event.stopPropagation();
                    event.preventDefault();
                    break;
                case 'filter-btn':
                    var $a = $(event.target),
                        $as = $a.closest('.filter').find('a');
                    $as.removeClass('active');
                    $a.addClass('active');
                    if ($a.data('filter')) {
                        $('#jets-content').removeClass().addClass($a.data('filter') + '-filter');
                    }
                    break;
            }
        }

    };
});