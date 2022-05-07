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
	$('form').attr('method', 'POST').attr('action', '/product/listProduct?&menu='+$('#menu').val()).submit();
}

$(function(){
	$("button.btn.btn-default").on("click", function(){
		//alert(  $( '.ct_btn01:contains("검색")' ).html() );
		fncGetList(1);
	})
});


$(function(){
	$( ".ct_list_pop td:nth-child(2)" ).css("color" , "#3187de");
});

$(function(){
	$('.caption h4').on("click", function(){
		
		
		//alert( $('.caption h4').text() );
		//alert( $(this).find('#prodNo').val() );
		//alert( $('#menu').val() );
		
		if($('#menu').val() =='manage'){
			
		self.location = "/product/updateProductView?prodNo="+ $(this).find('#prodNo').val();	
		} else{
		self.location =	"/product/getProduct?prodNo="+ $(this).find('#prodNo').val();
		}
	})
});

$(function(){
	$('.tran').on("click", function(){
	
	
		console.log("/purchase/updateTranCode?prodNo="+$(this).parent().find('#prodNo2').val()+"&tranCode="+$(this).parent().find('#tranCode').val());
		self.location = "/purchase/updateTranCode?prodNo="+$(this).parent().find('#prodNo2').val()+"&tranCode="+$(this).parent().find('#tranCode').val();
		fncGetList(1);
	})
});

$(function(){
	$( '.caption h4' ).css("color" , "#3187de");
	$( '.caption h4' ).css("text-decoration" , "underline");
});

$(function(){
	
	
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
	  
	    <!--  table Start /////////////////////////////////////-->
			
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
					<c:choose>
					<c:when test="${param.menu.equals('manage') && user.role.equals('admin')}">
						<c:if test="${product.proTranCode.equals('100') }">
							
							<td align="left">구매완료
							  <button class="tran"> 배송하기 </button>
							 <!-- <span class="ex" style="display:none;">${product.prodNo}</span>
							<span class="am" style="display:none;">${product.proTranCode}</span>-->
							  <input type="hidden" id="prodNo2" name="prodNo" value="${product.prodNo}"/>							
							 <input type="hidden" id="tranCode" name="tranCode" value="${product.proTranCode}"/>
							 </td>
						</c:if>
						<c:if test="${product.proTranCode.equals('200') }">
							<td align="left">배송중</td>
						</c:if>
						<c:if test="${product.proTranCode.equals('300') }">
							<td align="left">배송완료</td>
						</c:if>
					</c:when>
					<c:when test="${param.menu.equals('search') && user.role.equals('admin')}">
						<td align="left">구매완료</td>
					</c:when>
					<c:otherwise>
						<td align="left">재고없음</td>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
        
        </p>
       
      </div>
    </div>
  </div>
	</c:forEach>
</div>
			
				
	  <!--  table End /////////////////////////////////////-->
	     <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   <input type="hidden" id="menu" name="menu" value="${param.menu}"/>
		 
	    
	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	


</body>
</html>