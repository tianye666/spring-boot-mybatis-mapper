<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>




<html>
	<head>
		<link rel="stylesheet" type="text/css" 
		href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/easyui/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.min.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			$(function(){
				
			});
		</script>
	
	</head>
	<body class="easyui-layout">
		<div data-options="region:'north',height:'100',href:'${pageContext.request.contextPath}/view/head.jsp'"></div>
		<div data-options="region:'south'"></div>
		<div data-options="region:'center',href:'${pageContext.request.contextPath }/view/tabs.jsp'"></div>

		<div data-options="region:'west',width:'150',title:'导航菜单',href:'${pageContext.request.contextPath }/view/tree.jsp'"></div>
	</body>
	
	
	
		
</html>