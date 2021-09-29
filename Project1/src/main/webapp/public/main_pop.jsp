<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<link rel="stylesheet" href="public/assets/css/mainpop.css">
<link rel="stylesheet" href="public/assets/js/mainpop.js">
</head>
<body>

   <div id="popup">
       <div id="popmenu">
           <p>!</p>
           <div class="exit">닫기</div>
       </div>
   </div>
   
   	<button>
		<a onclick="ready(); return false;" id="contents">클릭</a>
    </button>
   
   
   <script type="text/javascript">
   $(document).ready(function(){
      $("#contents").click(function(){
     	 $("#popup").fadeIn();
 	  });
      $("#popup").click(function(){
     	 $("#popup").fadeOut();
	  });
});
   </script>
</body>
</html>