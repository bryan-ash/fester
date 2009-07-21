$(document).ready(function () {
  $(".our_aircraft").change(function () {
    $(".other_aircraft").val("");
  });

  $(".other_aircraft").keyup(function () {
    if ($(this).val() > "") {
      $(".our_aircraft").removeAttr("checked");
    }
  });
});
