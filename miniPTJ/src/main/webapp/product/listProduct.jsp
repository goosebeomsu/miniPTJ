<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품 목록조회</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
 <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <style>
	  body {
            padding-top : 50px;
        }
    </style>


<script type="text/javascript">
function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
	$("#currentPage").val(currentPage);
   //	document.detailForm.submit();	
   console.log(currentPage);
	//console.log($(#menu).val());
	$('.form-inline').attr('method', 'POST').attr('action', '/product/listProduct?&menu='+$('#menu').val()).submit();
}

function fncUpdateTranCodeAll() {
	//document.detailForm.action='/purchase/updateTranCodeAll';
   	//document.detailForm.submit();
	$('.form-check').attr('method', 'POST').attr('action', '/purchase/updateTranCodeAll').submit();
}

$(function(){
	$("button.btn.btn-default").on("click", function(){
		//alert(  $( '.ct_btn01:contains("검색")' ).html() );
		fncGetList(1);
	})
});

$(function(){
	$('.caption h4').on("click", function(){

		
		self.location =	"/product/getProduct?prodNo="+ $(this).find('#prodNo').val();
		
	})
});



$(function(){
	$('.prod_name').on("click", function(){
		
		//alert($(this).find('#prodNo').data('value'));
		self.location = "/product/updateProductView?prodNo="+ $(this).find('#prodNo').text();	
		
	})
});

$(function(){
		
	$(  "td:nth-child(7) > i" ).on("click" , function() {

		var prodNo = $(this).next().val();
	
		$.ajax( 
				{
					url : "/product/json/getProduct/"+prodNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						
						console.log(JSONData);
						console.log(status);
						
						var displayValue = "<h6>"
													+"상품명:"+JSONData.prodName+"<br/>"
													+"상품상세정보:"+JSONData.prodDetail+"<br/>"
													+"가격:"+JSONData.price+"<br/>"
													+"</h6>";
						$("h6").remove();
						$( "#"+prodNo+"" ).html(displayValue);
					}
			});
			////////////////////////////////////////////////////////////////////////////////////////////
		
});
	
	
	
	
	
	
	$( '.caption h4' ).css("color" , "#3187de");
	$( '.caption h4' ).css("text-decoration" , "underline");
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "#3187de");
});
///////////////일괄체크
$(function(){
	$('#cb1').on("click", function(){
		
	
		
		if($('#cb1').prop('checked')){
			
		$('.cb2').prop('checked', true);
			
		} else{
			
		$('.cb2').prop('checked', false);
		
		}
		
	})
	
	$('.cb2').on("click", function(){
		
	
		
		if($("input[name='check']:checked").length == 9){
			
		$('#cb1').prop('checked', true);
			
		} else{
			
		$('#cb1').prop('checked', false);
		
		}
		
	})
	
	
	
	
});
//////트랜코드 업데이트
$(function(){
	$('.tran').on("click", function(){
	
	
		console.log("/purchase/updateTranCode?prodNo="+$(this).parent().find('#prodNo2').val()+"&tranCode="+$(this).parent().find('#tranCode').val());
		self.location = "/purchase/updateTranCode?prodNo="+$(this).parent().find('#prodNo2').val()+"&tranCode="+$(this).parent().find('#tranCode').val();
		fncGetList(1);
	})
});




</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품목록조회</h3>
	    </div>
	    
	       <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
							<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	   
		</div>
	  <!--   //////////////////////////////////////////////////////--> 
	
	
	  <c:if test="${param.menu.equals('search') && (user.role.equals('admin')||user.role.equals('user'))}"> 
	  	<div class="row">
     	<c:forEach var="product" items="${list}">
				<c:set var="i" value="${ i+1 }" />
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail" style="height : 500px; ">
     <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
      <img src="/images/uploadFiles/${product.fileName}" class="img" width="300px"  height="200px" >
      
 
      <div class="caption">
        <h4>
     <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
        ${product.prodName}
        </h4>
        <p>${product.prodDetail}</p>
        <br>
        <p>${product.price}원</p>
        <p>
   <c:choose>
   		<c:when test="${empty product.proTranCode}">
					<td align="left">판매중</td>
				</c:when>
		<c:otherwise>
					<td align="left">재고없음</td>
		</c:otherwise>
   </c:choose>
           
        </p>
       
      </div>
    </div>
  </div>
	</c:forEach>
</div>
	  
	  
	  </c:if>
	  
		
	
			  <form class="form-check"name="detailForm">  
	  <c:if test="${param.menu.equals('manage') && user.role.equals('admin')}">  
	  
	 
	    <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center">
             <input type="checkbox" id="cb1">
            </th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		<c:forEach var="product" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				
				<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			
			<td align="left"> <input  type="checkbox" class="cb2" name="prodNo" value="${product.prodNo}" 
			    name="tranCode"   value="${product.proTranCode}"
					></td>
			
			<td align="left" class="prod_name">
			   <span  id="prodNo"  style="display:none" >${product.prodNo}</span>
			 	${product.prodName}
			 </td>
			 
			<td align="left">${product.price}</td>
		
			<td align="left">${product.regDate}</td>
			
			 <c:if test="${empty product.proTranCode}">
			 <td align="left">판매중</td>
			 </c:if>
			 <c:if test="${product.proTranCode.equals('100') }">
			 <td align="left">구매완료
								
					<input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode}"/>
						<button class="tran">
						배송하기 </button>
						</td>
			 </c:if>
			<c:if test="${product.proTranCode.equals('200') }">
							<td align="left">배송중</td>
						</c:if>
						<c:if test="${product.proTranCode.equals('300') }">
							<td align="left">배송완료</td>
						</c:if>
			<td align="left">
							<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
							<input type="hidden"  value="${product.prodNo}"/>
							</td>
				</tr>
				<tr>
			
				</tr>
		
				</c:forEach>
   
        </tbody>
      
      </table>
      
      <button type="button" class="btn btn-primary">선택상품배송</button>
	 
      </c:if>
      </form>
	  <!--  table End /////////////////////////////////////-->
	     <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   <input type="hidden" id="menu" name="menu" value="${param.menu}"/>
		 

     
	   <script type="text/javascript">
	
		
	    $( "button:contains('선택상품배송')" ).on("click" , function() {
	    	
	 		$(self.location).attr("href","javascript:fncUpdateTranCodeAll();");
		}); 
	 	
	 	</script>  
	
	</div>
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	


</body>
</html>