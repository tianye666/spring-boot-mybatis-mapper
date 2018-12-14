
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

		
		<script type="text/javascript">
		
			var personid;
			$(function(){
				$("#datagrid1").datagrid({
					pagination:true,
					pageSize:3,
					pageList:[3,5,10,20,30,40],
					fitColumns:true,
					checkbox:true,
					url:"${pageContext.request.contextPath}/person/showPersonByPage",
					rownumbers:true,
					striped:true,
					toolbar:"#btn"
				});
				

			
				$("#addPersonButton").linkbutton({
					text:"添加联系人",
					iconCls:"icon-add",
					onClick:function(){
						$("#addPersonDialog").dialog("open");
						
					}
				});
				
				$("#deleteCheckedButton").linkbutton({
					text:"删除选中",
					iconCls:"icon-remove",
					onClick:function(){
						var array = $("#datagrid1").datagrid("getChecked");
						var ids = new Array();
						for(var i=0;i<array.length;i++){
							ids[i] = array[i].id;
						}
						console.info(typeof(ids));
						$.ajax({
							type:"POST",
							url:"${pageContext.request.contextPath}/person/deletePersons",
							data:"ids="+ids,
							success:function(){
								$.messager.show({
									title:"消息",
									msg:"删除成功"
								});
								$("#datagrid1").datagrid("reload");
							}	
						});
					}
					
				});
				
				$("#addPersonDialog").dialog({
					title:"请输入添加联系人信息",
					width:500,
					height:500,
					closed:true,
					modal:true,
					href:"${pageContext.request.contextPath}/view/AddPersonView.jsp",
					
				});
				
				
				
				$("#updatePersonDialog").dialog({
					title:"请修改联系人信息",
					width:500,
					height:500,
					closed:true,
					modal:true,
					cache:false,
					href:"${pageContext.request.contextPath}/view/UpdatePersonView.jsp"
					
				});
				
				$("#deleteCheckedButton").linkbutton({
					text:"删除选中",
					iconCls:"icon-remove",
					onClick:function(){
						var array = $("#datagrid1").datagrid("getChecked");
						var ids = new Array();
						for(var i=0;i<array.length;i++){
							ids[i] = array[i].id;
						}
						console.info(typeof(ids));
						$.ajax({
							type:"POST",
							url:"${pageContext.request.contextPath}/person/deletePersons",
							data:"ids="+ids,
							success:function(){
								$.messager.show({
									title:"消息",
									msg:"删除成功"
								});
								$("#datagrid1").datagrid("reload");
							}	
						});
					}
					
				});
				
				
				
			});
			
			
			
			function myFormatter(value,row,index){
				return "<a href='#' class='l-btn' onclick='deletePerson("+row.id+")' >删除</a>&nbsp<a href='#' class='l-btn' onclick='updatePerson("+row.id+")'>修改</a>";
			}
			
			
			function deletePerson(id){
				$.messager.confirm("确认删除","您是否确认删除这条记录",
									function(confirm){
										if(confirm){
											$.ajax({
												type:"post",
												url:"${pageContext.request.contextPath}/person/deletePerson",
												data:"id="+id,
												success:function(){
													$.messager.show({
														title:"消息",
														msg:"删除成功"
													});
													$("#datagrid1").datagrid("reload");
												}
												
											});
										}
									}
								); 
				
			
			}
			function updatePerson(id){
				personid=id;
				$("#updatePersonDialog").dialog("open");
			}
		
		</script>
	
		<div id = d1>
		</div>	
		
			
	
		
		<table id="datagrid1">
		<thead>
		<tr>
			<th data-options="field:'66',checkbox:true"></th>
			<th data-options="field:'id',width:1">id</th>
			<th data-options="field:'name',width:1">姓名</th>
			<th data-options="field:'mobile',width:1">手机</th>
			<th data-options="field:'telphone',width:1">电话</th>
			<th data-options="field:'email',width:1">邮箱</th>
			<th data-options="field:'city',width:1">城市</th>
			<th data-options="field:'birthday',width:1">生日</th>
			
			<th data-options="field:'xx',formatter:myFormatter">操作</th>
		</tr>
		</thead>
		</table>
			<div id="btn">
				<a id="addPersonButton" ></a>
				<a id="deleteCheckedButton"></a>
			</div>
			
			<div id="addPersonDialog"></div>
			<div id="updatePersonDialog"></div>			     	
	