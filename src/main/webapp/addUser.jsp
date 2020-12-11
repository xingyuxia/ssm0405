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
    <title>添加user</title>
</head>
<script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/queryAll1.do',
            datatype:'json',
            contentType:'application/json',
            error:function (error) {
                alert('系统内部错误，请联系管理员处理！');
            },
            success:function(data){
               var sta="";
               for (var i=0;i<data.length;i++){
                   sta+="<option value='"+data[i].rid+"'>"+data[i].role+"</option>"
               }
               $("#rid").html(sta);
            }
        })
    })
</script>
<body>
   <form action="${pageContext.request.contextPath}/add.do" method="post">
      名称:<input type="text" name="name"/><br>
      密码:<input type="text" name="password"/><br>
      性别:<input type="radio" name="sex" value="男" checked/>男
          <input type="radio" name="sex" value="女"/>女<br>
      角色:<select name="rid" id="rid">
          </select><br>
       <input type="submit" value="保存"/>
   </form>
</body>
</html>
