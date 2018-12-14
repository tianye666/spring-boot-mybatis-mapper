<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>




<html>
	<head>
		<form action="${pageContext.request.contextPath }/user/login" method="post">
			帐号：<input name="username"/><br/>
			密码：<input type="password" name="password"/><br/>
			<input type="submit" value="登录"/><input type="reset" value="取消"/>
	    </form>
	</head>
		
	
	
	
		
</html>