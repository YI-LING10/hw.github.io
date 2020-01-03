var num=0;
var p=new Array();
p[0]="image/love1.png";
p[1]="image/love2.png";
function change(){
num++;
if (num==p.length) {
num=0;
}
document.getElementById("pic").src=p[num];
}
function over(){
document.getElementById("pic").src=p[1];
}
function moveout(){
document.getElementById("pic").src=p[0];
}