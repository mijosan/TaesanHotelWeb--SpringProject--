<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="./resources/css/bootstrap.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>
 
<%@include file="./WEB-INF/nav.jsp" %>
 이메일 : <input type="text" name="str_email01" id="str_email01" style="width:100px"> @ <input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com"> <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> <option value="1">직접입력</option> <option value="naver.com" selected>naver.com</option> <option value="hanmail.net">hanmail.net</option> <option value="hotmail.com">hotmail.com</option> <option value="nate.com">nate.com</option> <option value="yahoo.co.kr">yahoo.co.kr</option> <option value="empas.com">empas.com</option> <option value="dreamwiz.com">dreamwiz.com</option> <option value="freechal.com">freechal.com</option> <option value="lycos.co.kr">lycos.co.kr</option> <option value="korea.com">korea.com</option> <option value="gmail.com">gmail.com</option> <option value="hanmir.com">hanmir.com</option> <option value="paran.com">paran.com</option> </select> <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> <script type="text/javascript"> //이메일 입력방식 선택 $('#selectEmail').change(function(){ $("#selectEmail option:selected").each(function () { if($(this).val()== '1'){ //직접입력일 경우 $("#str_email02").val(''); //값 초기화 $("#str_email02").attr("disabled",false); //활성화 }else{ //직접입력이 아닐경우 $("#str_email02").val($(this).text()); //선택값 입력 $("#str_email02").attr("disabled",true); //비활성화 } }); }); </script>

<p>Date: <input type="text" id="datepicker"></p>
 
<script src="./resources/js/bootstrap.js"></script>
</body>
</html>