<%@ page contentType="text/html;charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
 <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!-- iamport.payment.js -->
 

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 60px;
        }
    </style>
    


	<script type="text/javascript">
	 $(function(){
		 $("a[href='#' ]").on("click", function(){
		
			 history.go(-1);
		 })
	 })
	 
	 
	$(function(){

		
	 	$("button.btn.btn-primary").on("click", function(){
	 		
	 		alert($('#prodNo').val());
		 	self.location = "/purchase/addPurchaseView?prodNo="+$('#prodNo').val();
	 })
	})
	


	 
	 
	
	</script>
<title>Insert title here</title>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">


	<div class="page-header">
	       <h3 class=" text-info">��ǰ����ȸ</h3>
	</div>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-4 col-md-2">${product.prodName}</div>
	</div>
	
	<hr/>

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4">
			<img src="/images/uploadFiles/${product.fileName}" align="left"/>
			</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
	</div>
	
	<hr/>

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-4 col-md-2">${product.price}</div>
	</div>
	
	<hr/>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
	</div>
	
	<hr/>

	
	<div class="row">
	  		<div class="col-md-12 text-center ">
	  			
	  			<button type="button" class="btn btn-primary">����</button>
				<a class="btn btn-primary btn" href="#" role="button">����</a>
	  		</div>
		</div>
<input type="hidden" id="prodNo" name="prodNo" value="${param.prodNo}"/>

</div>

</body>
</html>