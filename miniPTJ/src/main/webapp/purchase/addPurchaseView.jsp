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

  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 150px;
        }
    </style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function fncAddPurchase(){
	
	var value ="";
	

	alert($("input[name='postcode']").val());
	
	var value = $("input[name='address']").val() + " " 
				+  $("input[name='detailAddress']").val() + " " +  $("input[name='extraAddress']").val();
					
	alert(value);


	
	 IMP.request_pay({
	    	pg : "html5_inicis", 
	        pay_method : 'card', 
	        merchant_uid : '9003',//�ֹ���ȣ
	        name : $(".prodName").text(), 
	        amount : $(".price").text(),
	        buyer_email : 'captain9697@naver.com',
	        buyer_name : $("#receiverName").val(),
	        buyer_tel : $("#receiverPhone").val(),
	        buyer_addr : value,
	        m_redirect_url : '01181'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	
	        	alert(rsp.pg);
	        	alert(rsp.buyer_addr);
	        	
	        	$('form').attr('method', 'POST').attr('action', '/purchase/addPurchase?&imp='+rsp.imp_uid).submit()
	        	
	            
	        } else {
	        	alert("����.. �ڵ�: "+rsp.error_code+" / �޽���: "+rsp.error_msg);
	            
	        }
	    });///IMP.request_pay end
	
	
}

function fncAddPurchase(){
	
	var value ="";
	

	alert($("input[name='postcode']").val());
	
	var value = $("input[name='address']").val() + " " 
				+  $("input[name='detailAddress']").val() + " " +  $("input[name='extraAddress']").val();
					
	alert(value);


	
	 IMP.request_pay({
	    	pg : "html5_inicis", 
	        pay_method : 'card', 
	        merchant_uid : '9003',//�ֹ���ȣ
	        name : $(".prodName").text(), 
	        amount : $(".price").text(),
	        buyer_email : 'captain9697@naver.com',
	        buyer_name : $("#receiverName").val(),
	        buyer_tel : $("#receiverPhone").val(),
	        buyer_addr : value,
	        m_redirect_url : '01181'
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	
	        	alert(rsp.pg);
	        	alert(rsp.buyer_addr);
	        	
	        	$('form').attr('method', 'POST').attr('action', '/purchase/addPurchase?&imp='+rsp.imp_uid).submit()
	        	
	            
	        } else {
	        	alert("����.. �ڵ�: "+rsp.error_code+" / �޽���: "+rsp.error_msg);
	            
	        }
	    });///IMP.request_pay end
	
	
}

$(function() {
	$('#divyDate').datepicker({
		dateFormat: "yy-mm-dd"
		

	});
	
});

 $(function(){
	 
	 IMP.init("imp88340030");
	 
	 $("button.btn.btn-primary").on("click", function(){
		// alert( $("button.btn.btn-primary").text());
		 fncAddPurchase();
	 })
	 
	  $("button.kakao").on("click", function(){
		// alert( $("button.btn.btn-primary").text());
		 fncAddPurchaseKakao();
	 })
 })
 
 $(function(){
	 $("a[href='#' ]").on("click", function(){
		// resetData();
		 history.go(-1);
	 })
 })
 
 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
//function resetData(){
//	document.detailForm.reset();
//}

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


<div class="container">

<h1 class="bg-primary text-center">��ǰ����</h1>



<form class="form-horizontal" >

<input type="hidden" name="prodNo" value="${product.prodNo}" />
<input type="hidden" name="buyerId" value="${user.userId}" />


<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
	 <div class="prodName"> ${product.prodName} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
	 <div class="col-sm-4"> ${product.prodDetail}</div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
	 <div class="col-sm-4"> ${product.manuDate} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
	 <div class="price"> ${product.price} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
	 <div class="userId"> ${user.userId} </div>
</div>


<!-- ////////////////////////////////////////////////////////////// -->

<div class="form-group">
 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
	 <div class="col-sm-4">
		  <select class="form-control" id="paymentOption" name="paymentOption" >
		  <option value="1">���ݱ���</option>
  			<option value="2">�ſ뱸��</option>
  			</select>
		   </div>
</div>

<div class="form-group">
 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
		   </div>
</div>


<div class="form-group">
 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
		   </div>
</div>

<div class="form-group">
 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
	 <div class="col-sm-5">
		  <input type="hidden"  name="divyAddr">
		 <input type="text" id="sample6_postcode" name="postcode" placeholder="�����ȣ">
		 <input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
	     <input type="text" id="sample6_address"  name="address" placeholder="�ּ�"><br>
		 <input type="text" id="sample6_detailAddress"  name="detailAddress" placeholder="���ּ�">
	     <input type="text" id="sample6_extraAddress"  name="extraAddress" placeholder="�����׸�">
		   </div>
</div>

<div class="form-group">
 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ�û����</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyRequest" name="divyRequest">
		   </div>
</div>

<div class="form-group">
 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyDate" name="divyDate" >
		   </div>
</div>


<div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
    <button type="button" class="btn btn-primary"  >�̴Ͻý�</button>
    <button type="button" class="kakao"  >īī������</button>
  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
 </div>
 </div>

</form>


</div>


</body>
</html>
