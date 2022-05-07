<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

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
   
 <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <style>
	  body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">
	function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
	
	$(function(){
		$('.prodNo').on("click", function(){
			
			
			var prodNo = $(this).find('#prodNo').val();
			console.log(prodNo);
			
			
				
			self.location = "/purchase/getPurchase?prodNo="+prodNo;	
				
			
		})///////on click end
		
		$( ".prodNo" ).css("color" , "red");
		
		//$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});/////fun end
	
	$(function(){
		$('.user').on("click", function(){
			
			self.location = "/user/getUser?userId="+$(this).find('#userId').val();
		})
	});
	
	$(function(){
		$('.tran').on("click", function(){
			//alert($(this).find('#prodNo2').val());
			//alert($(this).find('#tranCode').val());
		
			self.location = "/purchase/updateTranCode?prodNo="+$(this).find('#prodNo2').val()+"&tranCode="+$(this).find('#tranCode').val();
		})
		
		
	});
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���� �����ȸ</h3>
	    </div>
	    
	       <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		
	    	
		</div>
	  <!--   //////////////////////////////////////////////////////--> 
	  
	    <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��ȣ</th>
            <th align="left">�޴»��</th>
            <th align="left">��ȭ��ȣ</th>
            <th align="left">�����Ȳ</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				
				<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			
		    <input type="hidden" id="get_proTranCode" name="tranCode" value= "${purchase.tranCode}"/>
			
			<td align="left" class="prodNo" >
			<input type="hidden" id="prodNo" name="prodNo" value= "${purchase.prodNo}"/>
			${purchase.prodNo}</td>
			<td align="left">${purchase.receiverName}</td>
		
			<td align="left">${purchase.receiverPhone}</td>
			
			<td align="left">
			<c:choose>
			<c:when test="${purchase.tranCode.equals('100')}"> ���� ���ſϷ� ���� �Դϴ�. </c:when>
			<c:when test="${purchase.tranCode.equals('200')}"> ���� ����� ���� �Դϴ�. </c:when>
			<c:when test="${purchase.tranCode.equals('300')}"> ���� ��ۿϷ� ���� �Դϴ�. </c:when>
			</c:choose>
			</td>
			
			<td align="left" class="tran">
			<c:choose>
			<c:when test="${purchase.tranCode.equals('200')}"> 
			<input type="hidden" id="tranCode" name="tranCode" value= "${purchase.tranCode}"/>
			<input type="hidden" id="prodNo2" name="prodNo" value= "${purchase.prodNo}"/>
			<!-- <a href="/purchase/updateTranCode?prodNo=${purchase.prodNo}&tranCode=${purchase.tranCode}"> ���ǵ���</a> --> 
			���ǵ���
			 </c:when>
			</c:choose>
			</td>		
			
		
		
				</tr>
				<tr>
			
				</tr>
		
				</c:forEach>
		
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	     <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   <input type="hidden" id="menu" name="menu" value="${param.menu}"/>
		 
	    
	
	</div>
	
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	


</body>
</html>