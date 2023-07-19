<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table {
			width: 500px;
			border-collapse: collapse;
		}
		th, td {
			border: 1px solid #ccccc;
			padding: 5px;
		}
	</style>
	<script type="text/javascript">
		function fn_delete(code) {
			if (confirm("정말 삭제하시겠습니까?")) {
				location="deleteCode.do?code="+code;
			}
		}
		function fn_update(code) {
			if (confirm("수정 하시겠습니까?")) {
				location="updateCode.do?code="+code;
			}
		}
	</script>
</head>
<body>
	Total : ${total}개
<%-- 	Total : ${resultList.size()} 개 --%>
	<table border="1">
		<caption>코드목록</caption>
		<tr>
			<th>번호</th>
			<th>그룹명</th>
			<th>코드명</th>
			<th>구분</th>
		</tr>
		<c:set var="count" value="1"/>
		<c:forEach items="${resultList}" var="result" varStatus="status">
			<tr align="center">
<%-- 				<td>${result.code}</td> --%>
				<td>${count}</td>
				<td>${result.gid2}</td>
<!-- 				<td> -->
<%-- 					<c:if test="${result.gid eq 1}"> --%>
<!-- 						hobby -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${result.gid eq 2}"> --%>
<!-- 						job -->
<%-- 					</c:if> --%>
<!-- 				</td> -->
				<td>${result.name}</td>
<%-- 				<td><button type="button" onclick="location='deleteCode.do?code=${result.code}'" >삭제</button></td> --%>
				<td>
					<button type="button" onclick="fn_delete('${result.code}')" >삭제</button>
					<button type="button" onclick="fn_update('${result.code}')" >수정</button>					
				</td>
			</tr>
			<c:set var="count" value="${count+1}"/>
		</c:forEach>
		 <tr align="right">
		 	<td colspan="4"><button type="button" onclick="location='codeWrite.do'">코드 입력</button></td>
		 </tr>
	</table>
</body>
</html>