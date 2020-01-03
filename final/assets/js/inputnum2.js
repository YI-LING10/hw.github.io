$(document).ready(function(){
//$('.text_box').val(1);
//$('.text_box').attr('disabled', 'false');
var t = $(".text_box").val();
$(".add").click(function(){
t++;
$(".text_box").val(t);
//return false;
})
$(".min").click(function(){
if(t<=1){
t=1;
//setTotal();
}else{
t--;
}
$(".text_box").val(t);
//return false;
})
})