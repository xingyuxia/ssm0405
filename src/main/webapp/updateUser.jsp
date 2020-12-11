<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/11/3
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>修改user</title>
</head>
<body>
  <form action="${pageContext.request.contextPath}/update.do" method="post">
      编号:<input type="text" name="uid" value="${ulist.uid}"><br>
      名称:<input type="text" name="name" value="${ulist.name}"/><br>
      密码:<input type="text" name="password" value="${ulist.password}"/><br>
      性别:<input type="radio" name="sex" ${ulist.sex=='男'?"checked":""} value="男"/>男
          <input type="radio" name="sex" ${ulist.sex=='女'?"checked":""} value="女"/>女<br>
      角色:<select name="rid">
            <c:forEach var="role" items="${rlist}">
                <option value="${role.rid}" ${role.rid==ulist.rid?'selected':''}>${role.role}</option>
            </c:forEach>
          </select><br>
       <input type="submit" value="修改"/>
   </form>
</body>
</html>
