<%@ page contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>��ǰ���</title>


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

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 150px;
        }
    </style>

	<script type="text/javascript">
	
	$(function(){
		$("button.btn.btn-primary").on("click", function(){
			self.location =	"/product/listProduct?menu=manage"
		})
	});
	
	$(function(){
		$("a[href='#' ]").on("click", function(){
			self.location =	"../product/addProductView.jsp;"
		})
	});

	
	</script>		

</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

<div class="container">


	<div class="page-header">
	       <h3 class=" text-info">��ǰ���</h3>
	</div>
	
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ǰ ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
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
			<div class="col-xs-8 col-md-4">${product.price}</div>
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
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
				<a class="btn btn-primary btn" href="#" role="button">�߰����</a>
	  		</div>
		</div>


</div>


</body>
</html>