<%--base标签的使用
request.getScheme() 获取协议
request.getServerName() 获取服务器名称地址
request.getServerPort() 获取端口号
request.getContextPath() 获取项目名称
--%>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()
    +request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册学生</title>
    <base href= <%=basePath%>/>
</head>
<body>
<div align="center">
    <form action="student/addStudent.do" method="post">
        <table>
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><input type="text" name="age"/></td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><input type="submit" value="注册"/></td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>