// Entry point for the build script in your package.json
//= require select2/dist/js/select2.js
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

$(document).ready(function() {
    $('.select2').select2({
    });
});

$('.select2').each(function () {
$(this).select2({
    theme: 'bootstrap-5',
    dropdownParent: $(this).parent(),
});
});