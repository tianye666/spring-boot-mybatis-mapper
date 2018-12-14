<%@page contentType="text/html; charset=UTF-8" %>
		
		<script type="text/javascript">
			var categoryid ;
			$(function(){
				$("#updatePersonForm").form("load","${pageContext.request.contextPath}/person/queryOnePerson?id="+personid);
				$("#updatePersonForm").form({
					onLoadSuccess:function(data){ // data代表远程加载后的数据-当前person的信息{} 
						//data.name		data.cate.categroyId
						// 设置 下拉列表的默认选中
						$("#category").combobox("setValue", data.category.categoryId);
					}
				});
				$("#category").combobox({
					valueField:"categoryId",
					textField:"categoryName",
					url:"${pageContext.request.contextPath}/person/showAllCategory"
				});
				
				
				$("#updatePersonName").validatebox({
					required:true,
					validType:"length[2,8]"
					
				});
				
				$("#categorytest").combobox({
					required:true
				});
			
				$("#updatePersonMobile").validatebox({
					required:true,
					validType:["isNumber","isLength[11]"]
				});
				
				$("#updatePersonTelphome").validatebox({
					required:true,
					validType:"isLength[13]"
				});
				
				
				$("#updatePersonCity").validatebox({
					required:true
				});
				
				$("#updatePersonEmail").validatebox({
					required:true,
					validType:"email"
				});
				
				$("#updatePersonBirthday").datebox({
					required:true,
					editable:true
				});
				
				$.extend($.fn.validatebox.defaults.rules,{
					isNumber:{
						validator:function(value){
							
							return !isNaN(value);
						},
						message:"必须为纯数字"
						
					},
					
					isLength:{
						validator:function(value,param){
							return value.length==param[0];
						},
						message:"号码必须为{0}位"
					},
				});
				
				
				$("#submit").linkbutton({
					text:"确认修改",
					iconCls:"icon-edit",
					onClick:function(){
						$("#updatePersonForm").form("submit",{
							url:"${pageContext.request.contextPath }/person/updatePerson",
							onSubmit:function(){
								return $("#updatePersonForm").form("validate");
							},
							success:function(){
								$.messager.show({
									title:"信息",
									msg:"修改成功"
								});
								$("#updatePersonDialog").dialog("close");
								$("#datagrid1").datagrid("reload");
							}
				
						});
					}
				
				});
				
				
				
				
			});
		
		</script>


		<form id="updatePersonForm" method="post" align="center">
			<input name="id" hidden=true>
			姓名:<input id="updatePersonName" name="name" /><br>
			手机:<input id="updatePersonMobile" name="mobile" /><br>
			电话:<input id="updatePersonTelphome" name="telphone" /><br>
			邮箱:<input id="updatePersonEmail" name="email" /><br>
			城市:<input id="updatePersonCity" name="city" /><br>
			生日:<input id="updatePersonBirthday" name="birthday" /><br>
			分组:<input id="category" name="category.categoryId"/><br>
			<a id="submit"></a>
		</form>
	
