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
	        merchant_uid : '9003',//주문번호
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
	        	alert("실패.. 코드: "+rsp.error_code+" / 메시지: "+rsp.error_msg);
	            
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
	        merchant_uid : '9003',//주문번호
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
	        	alert("실패.. 코드: "+rsp.error_code+" / 메시지: "+rsp.error_msg);
	            
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
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
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

<h1 class="bg-primary text-center">상품구매</h1>



<form class="form-horizontal" >

<input type="hidden" name="prodNo" value="${product.prodNo}" />
<input type="hidden" name="buyerId" value="${user.userId}" />


<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
	 <div class="prodName"> ${product.prodName} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
	 <div class="col-sm-4"> ${product.prodDetail}</div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
	 <div class="col-sm-4"> ${product.manuDate} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
	 <div class="price"> ${product.price} </div>
</div>

<div class="form-group">
 <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
	 <div class="userId"> ${user.userId} </div>
</div>


<!-- ////////////////////////////////////////////////////////////// -->

<div class="form-group">
 <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
	 <div class="col-sm-4">
		  <select class="form-control" id="paymentOption" name="paymentOption" >
		  <option value="1">현금구매</option>
  			<option value="2">신용구매</option>
  			</select>
		   </div>
</div>

<div class="form-group">
 <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
		   </div>
</div>


<div class="form-group">
 <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
		   </div>
</div>

<div class="form-group">
 <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
	 <div class="col-sm-5">
		  <input type="hidden"  name="divyAddr">
		 <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
		 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	     <input type="text" id="sample6_address"  name="address" placeholder="주소"><br>
		 <input type="text" id="sample6_detailAddress"  name="detailAddress" placeholder="상세주소">
	     <input type="text" id="sample6_extraAddress"  name="extraAddress" placeholder="참고항목">
		   </div>
</div>

<div class="form-group">
 <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">구매자요청사항</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyRequest" name="divyRequest">
		   </div>
</div>

<div class="form-group">
 <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
	 <div class="col-sm-4">
		  <input type="text" class="form-control" id="divyDate" name="divyDate" >
		   </div>
</div>


<div class="form-group">
	<div class="col-sm-offset-4  col-sm-4 text-center">
    <button type="button" class="btn btn-primary"  >이니시스</button>
    <button type="button" class="kakao"  >카카오페이</button>
  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
 </div>
 </div>

</form>


</div>


</body>
</html>
