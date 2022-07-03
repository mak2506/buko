/**
 * 
 */
$(document).ready(function(){

  $("#edit").click(function(e){
	e.preventDefault();
	$(this).parent().parent().parent().find("input").prop("disabled", false);
	$(this).css("display", "none");
	$("#update").css("display", "")
});

}); 