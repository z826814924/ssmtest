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
    <title>功能入口123</title>
    <%--这样src就能访问自定义开头前缀的路径了--%>
    <base href= <%=basePath%>/>
</head>
<body>
<div align="center">
<p>SSM整合的例子</p>
    <img src="images/timg.jpg" width="600" height="400"/>
    <table>
        <tr>
            <td><a href="addStudent.jsp">注册学生</a>></td>
        </tr>
        <tr>
            <td><a href="listStudent.jsp">浏览学生</a></td>
        </tr>
    </table>
</div>
</body>
</html>
