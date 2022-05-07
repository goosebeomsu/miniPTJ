<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>�������� ����</title>

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

$(function(){
	$("a[href='#' ]").on("click", function(){
		history.go(-1);
		
	})
});

$(function(){
	$("button.btn.btn-primary").on("click", function(){
		$('form').attr('method', 'POST').attr('action', '/purchase/updatePurchase?tranNo='+$('#tranNo').val()).submit();
		
	})
});

$(function() {
	$('#divyDate').datepicker({
		dateFormat: "yy-mm-dd"
		

	});
	
});

</script>

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


<div class="container">

<h1 class="bg-primary text-center">������������</h1>

<form class="form-horizontal">




<div class="form-group">
 <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
	 <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>

<!-- ////////////////////////////// -->
<div class="form-group">
 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
	 <div class="col-sm-4">
		  <select class="form-control" id="paymentOption" name="paymentOption">
		  <option value="1">���ݱ���</option>
  			<option value="2">�ſ뱸��</option>
  			</select>
		   </div>
</div>

<div class="form-group">
 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" >
		   </div>
</div>

<div class="form-group">
 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
		   </div>
</div>

 <div class="form-group">
 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}">
		   </div>
</div>

<div class="form-group">
 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}">
		   </div>
</div>

<div class="form-group">
 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate}" >
		   </div>
</div>

<div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
    <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
 </div>
 </div>

<input type="hidden" id="tranNo" name="tranNo" value= "${purchase.tranNo}"/>
<input type="hidden" name="prodNo" value="${purchase.prodNo}" />
<input type="hidden" name="orderDate" value="${purchase.orderDate}" />
</form>


</div>


</body>
</html>