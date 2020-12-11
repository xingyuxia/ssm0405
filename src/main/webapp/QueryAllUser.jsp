<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/11/3
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询所有user</title>
</head>
<script type="text/javascript">
    function SelectAll(e) {
        var checkboxs = document.getElementsByName("ids");
        for (var i = 0; i < checkboxs.length; i++) {
            var e = checkboxs[i];
            e.checked = !e.checked;
        }
    }
    function ionc() {
            location.href="${pageContext.request.contextPath}/deleteAll.do";
    }
</script>
<body>
  <form action="${pageContext.request.contextPath}/queryByName.do" method="post">
    <a href="${pageContext.request.contextPath}/addUser.jsp">添加</a><br>
    密码:<input type="text" name="password" >
    名称:<input type="text" name="name" >
    性别:<input type="text" name="sex" >
    <input type="submit" value="查询"><br>
    <table border="1">
        <tr>
            <td><input type="button" value="全选|反选" onclick="SelectAll()"><input type="button" value="批量删除" onclick="ionc()"></td>
            <th>编号</th>
            <th>密码</th>
            <th>名称</th>
            <th>性别</th>
            <th>角色</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list}" var="user" varStatus="index">
            <tr>
                <td><input type="checkbox" name="ids" value="${user.uid}"></td>
                <td>${index.index+1}</td>
                <td>${user.password}</td>
                <td>${user.name}</td>
                <td>${user.sex}</td>
                <td>${user.roleBean.role}</td>
                <td><a href="${pageContext.request.contextPath}/delete.do?id=${user.uid}">删除</a>|<a href="${pageContext.request.contextPath}/queryById.do?id=${user.uid}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
  </form>
  <a href="${pageContext.request.contextPath}/queryAll.do?page=1">首页</a>
  <a href="${pageContext.request.contextPath}/queryAll.do?page=${page-1}" ${page-1<=1?"hidden":""}>上一页</a>
  <a href="${pageContext.request.contextPath}/queryAll.do?page=${page+1}">下一页</a>
  <a>尾页</a>
</body>
</html>
