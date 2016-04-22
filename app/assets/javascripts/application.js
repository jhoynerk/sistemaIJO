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
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
//= require cocoon
//= require toastr
//= require chosen-jquery
//= require notifications.js
//= require jquery.timepicker.js
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.printelement.js
//= require validate/localization/messages_es.js

var setupDashboardPage = function() {
  $(".button-collapse").sideNav({
    menuWidth: 300, // Default is 240
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
  });

  $('.collapsible').collapsible({
    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year
    min: new Date(),
    closeOnClear: true,
    closeOnSelect: true
  });
  $('.modal-trigger').leanModal();
  $('#print').on('click', function(){
    $('#printer').printElement();
  });

  //$('select').material_select();
  $("select[required]").css({display: "inline", height: 0, padding: 0, width: 0});
};

$(document).on('page:load ready', setupDashboardPage);

$(function(){
  $.validator.setDefaults({
      errorClass: 'invalid'
  });
  $.validator.addMethod("RIF", function(value, element) {
    return this.optional(element) || /^([V|E|G|J|P|N]{1}-\d{7,10})*$/i.test(value);
  }, "El RIF o Cédula es inválido: Por favor ingresa uno válido. Formato: V-XXXXXXX");

  $.validator.addMethod("telefono", function(value, element) {
    return this.optional(element) || /^0(412|416|414|424|426|212)-\d{7}$/i.test(value);
  }, "El teléfono es inválido: Por favor ingresa uno válido. Format: 0212-0123456");
});
