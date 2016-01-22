// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .



 $(function() {
    $('.rating').barrating({
      theme: 'bars-reversed',
      initialRating: null,
      readonly: true
    });

    $('.rating-form').barrating({
      theme: 'bars-reversed',
      initialRating: null,
    });

    $('#review_method').change(function(){
      var data = {
        "flowers": "0.5g, 1.0g, 1.5g, 2.0g, 2.5g",
        "wax": "0.1g, 0.2g, 0.3g, 0.4g, 0.5g",
        "tincture": "0.1ml, 0.3ml, 0.5ml"
      }
      var $dropdown = $(this);
      var key = $dropdown.val();
      var vals = data[key].split(',');
      var $amountDropdown = $('#review_amount');
      $amountDropdown.empty();
      $.each(vals, function(index, value){
        $amountDropdown.append("<option>" + value + "</option>")
      });


    });
 });

