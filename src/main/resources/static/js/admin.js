$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

$(document).on('click', '#btn-removeMember', function () {
    $(this).parent().parent().remove();
 });

function myRegion() {
	alert("준비중입니다!");
	
}