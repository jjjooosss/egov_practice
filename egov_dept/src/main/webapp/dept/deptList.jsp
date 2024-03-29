<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{
			width: 400px;
			border-collapse: collapse;
		}
		th, td{
			border: 1px solid #cccccc;
			padding: 5px;
		}
	</style>
</head>
<body>
	<table>
		<caption>부서목록</caption>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
            <tr>
<!--            c:out으로 써도되고 안써도 됨(초기 출력방식) -->
				<td>${result.deptno}</td>
				<td>
					<a href="deptDetail.do?deptno=${result.deptno}">${result.dname}
				</td>
				<td>${result.loc}</td>
            </tr>
        </c:forEach>
	</table>
</body>
</html>