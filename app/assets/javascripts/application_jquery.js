$(function() {
  $('.datepicker').datepicker({dateFormat: 'yy-mm-dd', beforeShowDay: $.datepicker.noWeekends } );
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function() {
  $("#switch-view").change(function() {
    $("#employees-index").submit();
  });
});
