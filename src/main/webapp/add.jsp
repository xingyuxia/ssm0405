<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/4
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>添加</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/add.do" lay-filter="example">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-block">
            <input type="password" lay-verify="number|required" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <select name="rid" id="rid" lay-filter="aihao">
                <option value="">--请选择--</option>
            </select>
        </div>
    </div>

     <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
 <script>
     layui.use(["form",'layer'], function () {
         $ = layui.jquery, form = layui.form, layer = layui.layer;
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
</body>
</html>
