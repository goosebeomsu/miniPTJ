<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 150px;
        }
    </style>

<script type="text/javascript">

function fncAddProduct(){
	//Form 유효성 검증
 	var name =$("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val(); 
	var manuDate = $("input[name='manuDate']").val(); 
	var price = $("input[name='prodName']").val(); 

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

	
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
}

$(function() {
	$('#manuDate').datepicker({
		 dateFormat: "yy-mm-dd"

	});
	
});

 $(function(){
	 $("button.btn.btn-primary").on("click", function(){
		 alert( $("button.btn.btn-primary").text());
		 fncAddProduct();
	 })
 })
 
 $(function(){
	 $("a[href='#' ]").on("click", function(){
		// resetData();
		$("form")[0].reset();
	 })
 })

//function resetData(){
//	document.detailForm.reset();
//}

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


<div class="container">

<h1 class="bg-primary text-center">상품등록</h1>

<form class="form-horizontal" enctype="multipart/form-data">




<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		   </div>
</div>

<div class="form-group">
 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		   </div>
</div>

<div class="form-group">
 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="manuDate" name="manuDate" >
		   </div>
</div>

<div class="form-group">
 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		   </div>
</div>

<div class="form-group">
 <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
	 <div class="col-sm-4">
		  <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="img">
		   </div>
</div>

<div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
    <button type="button" class="btn btn-primary"  >등&nbsp;록</button>
  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
 </div>
 </div>

</form>


</div>


</body>
</html>
