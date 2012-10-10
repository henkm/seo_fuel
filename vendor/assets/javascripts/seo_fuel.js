$(document).ready(function() {
  $('#edit_seo_btn').bind('click', function() {
    $('#edit_seo_btn').slideUp();
    $('#edit_seo_dialog').slideDown();
  });
  
  $('#cancel_seo_btn, #save_seo_tag').bind('click', function() {
    hideSeoForm();
  });
  
});

function hideSeoForm(){
  $('#edit_seo_dialog').slideUp();
  $('#edit_seo_btn').slideDown();
}