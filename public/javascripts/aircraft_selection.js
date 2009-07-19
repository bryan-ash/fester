$(document).ready(function () {
  $(".our_aircraft").change(function () {
    $("#other_aircraft").val("");
  });

  $("#other_aircraft").keypress(function () {
    $(".our_aircraft").removeAttr("checked");
  });
});
