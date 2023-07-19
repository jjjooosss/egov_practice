<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form action="deptModifySave.do" method="post">
		<table>
			<tr>
				<th>부서번호</th>
				<td><input type="text" name="deptno" value="${deptVO.deptno}" readonly></td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td><input type="text" name="dname" value="${deptVO.dname}"></td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td><input type="text" name="loc" value="${deptVO.loc}"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<button type="submit">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>