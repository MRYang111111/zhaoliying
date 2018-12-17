<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17/017
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/heightchart/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/js/heightchart/highcharts-3d.js"></script>
<script src="${pageContext.request.contextPath }/js/heightchart/modules/exporting.js"></script>
<html>
<head>
    <title>heightchart</title>
    <script>
        $(function () {
            $('#test').highcharts({
                title: {
                    text: '各浏览器份额'
                },
                series: [{
                    type: 'pie',
                    name: '浏览器占比',
                    data: [
                        ['Firefox',   45.0],
                        ['IE',       26.8],
                        ['Safari',    8.5],
                        ['Opera',     6.2],
                        ['Others',   0.7]
                    ]
                }]
            });
        });
    </script>
</head>
<body>
<div id="test"></div>

</body>
</html>
