$(document).on('turbolinks:load', function () {
    $('#modal-window').on('shown.bs.modal', function() {
        if (jQuery().datepicker) {
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                orientation: "left",
                autoclose: true
            });
            $('.date-picker-month').datepicker({
                format: "mm/yyyy",
                viewMode: "months",
                minViewMode: "months"
            });
        }
    })
});
