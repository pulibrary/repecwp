//= require 'jquery'
jQuery(function() {
    // tablesorter
    $("table").tablesorter({
        widthFixed: true,
        widgets: ['stickyHeaders', 'filter', 'zebra'],
    });
});
