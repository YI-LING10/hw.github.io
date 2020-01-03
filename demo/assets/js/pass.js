// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
  	var pass = document.getElementById("exampleInput");
  	var pass1 = document.getElementById("exampleInput1");
  	var pass2 = document.getElementById("exampleInput2");
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
      	if(pass.value!=""){
      		if (form.checkValidity() === false|| pass.value != "0104") {
          		event.preventDefault();
          		event.stopPropagation();
          		if (pass.value != "0104"){
          			alert("請輸入正確的驗證碼");
          		}else{
          			alert("請輸入內容");
          		}
        	}
      	}else if(pass1.value!=""){
      		if (form.checkValidity() === false|| pass1.value != "0104") {
          		event.preventDefault();
          		event.stopPropagation();
          		event.stopPropagation();
          		if (pass.value != "0104"){
          			alert("請輸入正確的驗證碼");
          		}else{
          			alert("請輸入內容");
          		}
        	}
      	}else if(pass2.value!=""){
      		if (form.checkValidity() === false|| pass2.value != "0104") {
          		event.preventDefault();
          		event.stopPropagation();
          		event.stopPropagation();
          		if (pass.value != "0104"){
          			alert("請輸入正確的驗證碼");
          		}else{
          			alert("請輸入內容");
          		}
        	}
      	}else{
      		if (form.checkValidity() === false) {
          		event.preventDefault();
          		event.stopPropagation();
        	}
      	}
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
// // Example starter JavaScript for disabling form submissions if there are invalid fields
// (function() {
//   'use strict';
//   window.addEventListener('load', function() {
//   	var pass1 = document.getElementById("exampleInput1");
//     // Fetch all the forms we want to apply custom Bootstrap validation styles to
//     var forms = document.getElementsByClassName('needs-validation');
//     // Loop over them and prevent submission
//     var validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false|| pass1.value != "0104") {
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//       }, false);
//     });
//   }, false);
// })();
// // Example starter JavaScript for disabling form submissions if there are invalid fields
// (function() {
//   'use strict';
//   window.addEventListener('load', function() {
//   	var pass2 = document.getElementById("exampleInput2");
//     // Fetch all the forms we want to apply custom Bootstrap validation styles to
//     var forms = document.getElementsByClassName('needs-validation');
//     // Loop over them and prevent submission
//     var validation = Array.prototype.filter.call(forms, function(form) {
//       form.addEventListener('submit', function(event) {
//         if (form.checkValidity() === false|| pass2.value != "0104") {
//           event.preventDefault();
//           event.stopPropagation();
//         }
//         form.classList.add('was-validated');
//       }, false);
//     });
//   }, false);
// })();