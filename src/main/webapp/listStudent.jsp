<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>查询学生ajax</title>
    <%--这样src就能访问自定义开头前缀的路径了--%>
    <base href= <%=basePath%>/>
    <%--一定要有结束标签/script--%>
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript">
        /*入口函数*/
        $(function () {
            //在当前的页面对象加载后，执行loadStudentData();
            loadStudentData();
            //给按钮做单击事件，用id选择器
            $("#btnLoader").click(function () {

                loadStudentData();
            })
        })
function loadStudentData() {
    //发起ajax请求,里面格式为json
    $.ajax({
        //请求地址
        url:"student/queryStudent.do",
        //没有参数
        //请求方式get
        type:"get",
        //指定数据格式
        dataType:"json",
        //指定请求成功的处理函数,data是形参名，是自定义的
        success:function (data) {
            $.each(data,function (i,n) {
                $("#info").append("<tr>")
                    .append("<td>"+n.id+"</td>")
                    .append("<td>"+n.name+"</td>")
                    .append("<td>"+n.age+"</td>")
                    .append("</tr>")

            })
        }
    })
}
    </script>

</head>
<body>
        <div align="center">
            <table>
                <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>年龄</td>
                </tr>
                </thead>
                <tbody id="info">

                </tbody>
            </table>
            <input type="button" id="btnLoader" value="查询数据">
        </div>
</body>
</html>
