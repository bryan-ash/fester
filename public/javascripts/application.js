$(document).ready(function () {

  $('input.autocomplete').each( function () {
    var input = $(this);
    input.autocomplete(input.attr('autocomplete_url'),{
      matchContains:1,      //also match inside of strings when caching
      removeInitialValue:0  //when first applying $.autocomplete
    });
  }); 

  $(".add_slot a").click( function (event) {
    event.preventDefault();

    var new_slot = $(".slot:last").clone()
    new_slot.insertAfter(".slot:last");
  });
});