<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>��ǰ���</title>

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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 150px;
        }
    </style>

<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name =$("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val(); 
	var manuDate = $("input[name='manuDate']").val(); 
	var price = $("input[name='prodName']").val(); 

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
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

<h1 class="bg-primary text-center">��ǰ���</h1>

<form class="form-horizontal" enctype="multipart/form-data">




<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		   </div>
</div>

<div class="form-group">
 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������">
		   </div>
</div>

<div class="form-group">
 <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="manuDate" name="manuDate" >
		   </div>
</div>

<div class="form-group">
 <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="price" name="price" placeholder="����">
		   </div>
</div>

<div class="form-group">
 <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
	 <div class="col-sm-4">
		  <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="img">
		   </div>
</div>

<div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
    <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
 </div>
 </div>

</form>


</div>


</body>
</html>
