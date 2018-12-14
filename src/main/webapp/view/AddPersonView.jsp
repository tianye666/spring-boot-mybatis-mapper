<%@page contentType="text/html; charset=UTF-8" %>
		
		<script type="text/javascript">
			$(function(){
				
				$("#category1").combobox({
					valueField:"categoryId",
					textField:"categoryName",
					url:"${pageContext.request.contextPath}/person/showAllCategory",
					onLoadSuccess:function(data){
								$("#category").combobox("setValue",data[0].categoryId);
					}
				});
				
				
				$("#addPersonName").validatebox({
					required:true,
					validType:"length[2,8]"
					
				});
			
				$("#addPersonMobile").validatebox({
					required:true,
					validType:["isNumber","isLength[11]"]
				});
				
				$("#addPersonTelphome").validatebox({
					required:true,
					validType:["isLength[13]"]
				});
				
				
				$("#addPersonCity").validatebox({
					required:true
				});
				
				$("#addPersonEmail").validatebox({
					required:true,
					validType:["email"]
				});
				
				$("#addPersonBirthday").datebox({
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
				
				
				
				$("#submit1").linkbutton({
					text:"确认添加",
					iconCls:"icon-add",
					onClick:function(){
						$("#addPersonForm").form("submit",{
							url:"${pageContext.request.contextPath }/person/addPerson",
							onSubmit:function(){
								return $("#addPersonForm").form("validate");
							},
							success:function(){
								$.messager.show({
									title:"信息",
									msg:"添加成功"
								});
								$("#addPersonDialog").dialog("close");
								$("#datagrid1").datagrid("load");
							}
				
						});
					}
				
				});
				
				
				
				
			});
		
		</script>


		<form id="addPersonForm" method="post" align="center">
			姓名:<input id="addPersonName" name="name" /><br>
			手机:<input id="addPersonMobile" name="mobile" /><br>
			电话:<input id="addPersonTelphome" name="telphone" /><br>
			邮箱:<input id="addPersonEmail" name="email" /><br>
			城市:<input id="addPersonCity" name="city" /><br>
			生日:<input id="addPersonBirthday" name="birthday" /><br>
			分组:<input id="category1" name="categoryId"/><br>
			<a id="submit1"></a>
		</form>

