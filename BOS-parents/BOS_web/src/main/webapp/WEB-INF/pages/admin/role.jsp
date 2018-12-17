<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>	
<script type="text/javascript">
	$(function(){
		// 数据表格属性
		$("#grid").datagrid({
			toolbar : [
				{
					id : 'add',
					text : '添加角色',
					iconCls : 'icon-add',
					handler : function(){
                        location.href='${pageContext.request.contextPath}/page_admin_role_add.action';
    }
				}
			],
			url : '${pageContext.request.contextPath}/roleAction_pageQuery.action',
            pageList: [5,10,20],
            pagination : true,
			fit:true,
            onDblClickRow : doDblClickRow,
			columns : [[
				{
					field : 'id',
					title : '编号',
					width : 200
				},
				{
					field : 'name',
					title : '名称',
					width : 200
				}, 
				{
					field : 'description',
					title : '描述',
					width : 200
				} 
			]]
		});
        $('#editRoleWindow').window({
            title: '修改取派员',
            width: 700,
            modal: true,
            shadow: true,
            closed: true,
            height: 400,
            resizable:false

        });
        // 授权树初始化
        var setting = {
            data : {
                key : {
                    title : "t"
                },
                simpleData : {
                    enable : true
                }
            },
            check : {
                enable : true,//设置ztree为可以勾选
            }
        };

        $.ajax({
            url : '${pageContext.request.contextPath}/functionAction_listtoajax.action',
            type : 'POST',
            dataType : 'json',
            success : function(data) {
                $.fn.zTree.init($("#functionTree"), setting, data);
            },
            error : function(msg) {
                alert('树加载异常!');
            }
        });

	});
    function doDblClickRow(rowIndex, rowData){
        //rowData,为json对象
        //打开一个新的窗口
        $("#editRoleWindow").window("open");
        //用表单的load方法回显表格的数据
        $("#editRoleWindow").form("load",rowData);
        alert(rowData.id);
        var roleids=rowData.id;
        $("input[name=ids]").val(roleids)
    }
</script>	
</head>
<body class="easyui-layout">
	<div data-options="region:'center'">
		<table id="grid"></table>
	</div>

	<div region="center" style="overflow:auto;padding:5px;" border="false">


		<form id="editRoleWindow" method="post" action="roleAction_edit.action">
            <div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
                <div class="datagrid-toolbar">
                    <a id="edit" icon="icon-edit" href="#" class="easyui-linkbutton" plain="true" >保存</a>
                    <script type="text/javascript">
                        $(function () {
                            $("#edit").click(function () {
                                var  v=$("#editRoleWindow").form("validate");
                                if(v){
                                    //为ztee添加对象的id获取对象
                                    var trssObj=$.fn.zTree.getZTreeObj("functionTree");
                                    //获取ztree的勾直中的节点对象，返回一个数组对象
                                    var array=new Array();
                                    var tNode=trssObj.getCheckedNodes(true);
                                    //遍历对象数组
                                    for (var i=0;i<tNode.length;i++){
                                        var id= tNode[i].id;
                                        array.push(id)
                                    }
                                    var functionId=array.join(",");
                                    //为隐藏域赋值
                                    $("input[name=functionIds]").val(functionId);
                                    $("#editRoleWindow").submit();
                                }else {
                                    $.messager.alert("提示信息","表单提交修改失败","warning");
                                }
                            }) ;
                        });
                    </script>
                </div>
            </div>
			<%--id--%>
			<input type="hidden" name="ids">
            <%--提交ztree数值--%>
            <input type="hidden" name="functionIds">
			<table class="table-edit" width="80%" align="center">
				<tr class="title">
					<td colspan="2">角色信息</td>
				</tr>
				<tr>
					<td>名称</td>
					<td><input type="text" name="name" class="easyui-validatebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>描述</td>
					<td>
						<textarea name="description" rows="4" cols="60"></textarea>
					</td>
				</tr>
				<tr>
					<td>授权</td>
					<td>
						<ul id="functionTree" class="ztree"></ul>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>