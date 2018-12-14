<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>

		<script type="text/javascript">
			$(function(){
				$("#tree1").tree({
					url:"${pageContext.request.contextPath}/view/tree-json.jsp",
					onClick:function(node){
						if($("#tree1").tree("isLeaf",node.target)){
							if($("#tabs").tabs("exists",node.text)){
							$("#tabs").tabs("select",node.text);
							}else{
								$("#tabs").tabs("add",{
									title:node.text,
									closable:true,
									href:node.mypath
								});
							}
						}
					}
				});
				
				
			});
		</script>
	


		<ul id="tree1">
			
		</ul>
	

	
	
	
		
