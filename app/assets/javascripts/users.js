$(document).ready(function (e) {
  $("#submit").attr("disabled", true);
  $("#privacy").click(function () {
    $("#submit").attr("disabled", !this.checked);
  });
});
