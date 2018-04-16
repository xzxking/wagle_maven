<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<title>Insert title here</title>
</head>
<body>
<div>&nbsp;
	<div class="w3-container w3-card w3-center" style="margin: 1% 20% 0 20%;">
	       <span class="w3-center w3-large">
				<h3>관리자 <b>회원</b> 관리</h3>
		  </span>
	       
	       <c:if test="${count==0}">
	       <div class="w3-container w3-white w3-round w3-margin">
	       		 <div class="w3-center w3-container">
	       			<h4 class="w3-yellow">가입한 회원이 없습니다</h4>
	       		</div>	
	       </div>
	       </c:if>
	       
	       <c:if test="${count!=0}">
	       <div class="w3-container w3-margin w3-white w3-round">
	       		<h6 class="w3-right">전체 회원 수:${count}</h6>
	       
	       <table class="w3-table w3-bordered w3-small" width="525">
	       <tr class="w3-yellow w3-center">
	       <td align="center" width="25" class="w3-center">NUM</td>
	       <td align="center" width="50" class="w3-center">EMAIL</td>
	       <td align="center" width="50" class="w3-center">PASSWORD</td>
	       <td align="center" width="50" class="w3-center">NAME</td>
	       <td align="center" width="50" class="w3-center">GENDER</td>   
	       <td align="center" width="50" class="w3-center">AGE</td>
	       <td align="center" width="50" class="w3-center">LOCATE</td>
	       <td align="center" width="50" class="w3-center">PWD_Q</td>
	       <td align="center" width="50" class="w3-center">PWD_A</td>
	       <td align="center" width="50" class="w3-center">REGDATE</td>
	       <td align="center" width="50" class="w3-center">Modified</td>
	       </tr>
	 
	        <c:forEach var="member" items="${memberlist}">
	          <tr height="15">
	          <td align="center" width="25" class="w3-center">${number}</td>
	          <c:set var="number" value="${number-1}" />
	        	    <td align="center" width="50" class="w3-center">${member.email}</td>
	        	    <td align="center" width="50" class="w3-center">${member.pwd}</td>
	        	    <td align="center" width="50" class="w3-center">${member.name}</td>
	        	    <td align="center" width="50" class="w3-center">${member.gender}</td>
	        	    <td align="center" width="50" class="w3-center">${member.age}</td>
	        	    <td align="center" width="50" class="w3-center">${member.loc}</td>
	        	    <td align="center" width="50" class="w3-center" style="font-size: 8pt;">${member.pwdQ}</td>
	        	    <td align="center" width="50" class="w3-center" style="font-size: 8pt;">${member.pwdA}</td>
	        	    <td align="center" width="50" class="w3-center">${member.regdate}</td>
	               	<td align="center" width="50" class="w3-center">
	               		
	               		<!-- 수정 삭제 만들기  -->
	               		<form method="post" action="${pageContext.request.contextPath}/member/updateForm" style="display: inline-block;">
		  					<input type="submit" class="w3-button w3-light-gray w3-hover-white" value="수정">
		  					<input type="hidden" name="email" value="${member.email}">
							<input type="hidden" name="num" value="${member.num}">
						</form>
	  					
						
						<form method="post" action="${pageContext.request.contextPath}/member/deleteForm" style="display: inline-block;">
							<input type="submit" class="w3-button w3-yellow w3-hover-white" value="삭제" >
							
							<!-- hidden으로 email, pwd가져오기!!!  -->
		               		<input type="hidden" name="email" value="${member.email}">
							<input type="hidden" name="pwd" value="${member.pwd}">
							<input type="hidden" name="num" value="${member.num}">
		               		<!--  -->
	               		</form>
	               	</td>
	          </tr>
	          </c:forEach>
	           
	       </table>
	       
	       <div class = "w3-center w3-white w3-margin">
	       		<c:if test="${count>0}"> 
					<c:if test="${startPage > bottomLine}">
						<a href="memberlist?pageNum=${startPage - bottomLine}">[이전]</a>
					</c:if>
		
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href="memberlist?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
							<c:if test="${i == currentPage}">
								<font color='blue'>[${i}]</font>
							</c:if>
						</a>
					</c:forEach>
		
					<c:if test="${endPage < pageCount}">
						<a href="memberlist?pageNum=${startPage + bottomLine}">[다음]</a>
					</c:if>
				</c:if>
			</div>
			
	     </div>
	     </c:if>
	           
	</div>
</div>

</body>
</html>