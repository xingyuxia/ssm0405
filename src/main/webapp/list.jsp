<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/1
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>查询所有</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteAll">批量删除</button>
    </div>
</script>
<form class="layui-form">
    <div class="layui-form-item">
            <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" id="name" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" id="password" autocomplete="off" class="layui-input">
                    </div>
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline">
                        <select name="sex" id="sex">
                            <option value="男" selected>男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <button type="submit" class="layui-btn" lay-submit="" lay-filter="withExport" >查询</button>
                    </div>
            </div>
    </div>
</form>
<table id="users"  lay-filter="test"></table>
<script type="text/html" id="toolbars">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteAll">批量删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table',"form",'layer'], function () {
        var table = layui.table,$=layui.jquery,form=layui.form,layer=layui.layer;
        table.render({
            elem: '#users',
            url: '${pageContext.request.contextPath}/queryAll.do',
            page: true,
            limit:3,
            limits:[1,3,5,7,9],
            toolbar: '#toolbars',
            title: '用户数据表',
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'uid', title: '编号', width: 180,type:'numbers'}
                , {field: 'password', title: '密码', width: 180}
                , {field: 'name', title: '名称', width: 180}
                , {field: 'sex', title: '性别', width: 180}
                , {field: 'rid', title: '角色', width: 187,templet:'<div>{{d.roleBean.role}}</div>'}
                , {fixed: 'right', title:'操作', toolbar: '#barDemo', width:180}
            ]]
        })


        form.on('submit(withExport)',function (data) {
            console.log(data);
            table.reload('users', {
                where: {
                    password:data.field.password,
                    name:data.field.name,
                    sex:data.field.sex
                } //设定异步数据接口的额外参数
            });
            return false;
        })
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStaus=table.checkStatus(obj.config.id)
            var layEvent=obj.event;
            var datas= checkStaus.data;
            //console.log(checkStaus.data) //得到当前行数据
            var str="";
            if(layEvent==='deleteAll'){
                layer.confirm('真的删除行么', function(index){
                    for(var i=0;i<datas.length;i++){
                        if(i<datas.length-1){
                            str+=datas[i].uid+",";
                        } else {
                            str+=datas[i].uid;
                        }
                    }
                    $.ajax({
                        type:'post',
                        url:'${pageContext.request.contextPath}/deleteAll.do?str='+str,
                        datatype:'json',
                        error:function (error) {
                            layer.msg('系统内部错误，请联系管理员处理！', {icon: 4});
                        },
                        success:function(data){
                            if(data==true){
                                layer.msg("删除成功", {icon: 1});
                                table.reload("users");
                            }else{
                                layer.msg('删除失败', {icon: 4});
                                table.reload("users");
                            }
                        }
                    })
                });
            } else if (layEvent==='add'){
                layer.open({
                    type: 2,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['420px', '240px'], //宽高
                    content: '${pageContext.request.contextPath}/add.jsp'
                });
            }
        })
        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            var uid="";
            if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    uid=data.uid;
                    $.ajax({
                        type:'post',
                        url:'${pageContext.request.contextPath}/delete.do?uid='+uid,
                        datatype:'json',
                        error:function (error) {
                            layer.msg('系统内部错误，请联系管理员处理！', {icon: 4});
                        },
                        success:function(data){
                            if(data==true){
                                layer.msg("删除成功", {icon: 1});
                                table.reload("users");
                            }else{
                                layer.msg('删除失败', {icon: 4});
                                table.reload("users");
                            }
                        }
                    });
                });
            }
        })
        });
</script>
</body>
</html>
