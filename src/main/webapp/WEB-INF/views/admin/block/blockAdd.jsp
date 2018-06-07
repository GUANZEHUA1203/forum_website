<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
    	 userDataGrid = $('#blockuserlistGrid').datagrid({
             url : '${path }/account/list',
             fit : false,
             fitColumns : false,
             striped : true,
             rownumbers : false,
             pagination : true,
             singleSelect : true,
             idField : 'acid',
             sortName : 'createtime',
 	         sortOrder : 'asc',
             pageSize : 20,
             pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
             autoRowHeight:true,
             columns : [ [ {
                 width : '30',
                 title : 'ID',
                 field : 'acid',
                 sortable : true
             },{
                 width : '40',
                 title : '登录名',
                 field : 'loginName',
                 sortable : true
             }, {
                 width : '80',
                 title : '姓名',
                 field : 'realName',
                 sortable : true
             }, 
             {
                 width : '100',
                 title : '角色',
                 field : 'roleNames'
             },
             {
                 width : '100',
                 title : '最后发帖时间',
                 field : 'lasttime'
             },{
                 width : '60',
                 title : '状态',
                 field : 'status',
                 sortable : true,
                 formatter : function(value, row, index) {
                     switch (value) {
                     case 0:
                         return '正常';
                     case 1:
                         return '停用';
                     }
                 }
             }]],
             onClickRow:function(index, row){
					$("input[name='managerman']").val(row.acid);
             }
   		  });
	       $('#blockAddForm').form({
	            url : '${path }/block/add',
	            onSubmit : function() {
	              /*   progressLoad();
	                var isValid = $(this).form('validate');
	                if (!isValid) {
	                    progressClose();
	                }
	                return isValid; */
	            },
	            success : function(result) {
	            	 alert(result);
	            	 console.info(result);
	                progressClose();
	                result = $.parseJSON(result);
	                if (result.success) {
	                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
	                    parent.$.modalDialog.handler.dialog('close');
	                } else {
	                    var form = $('#blockAddForm');
	                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
	                }
	            }
	        });
        
    });
	
    function searchUserFun() {
        userDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
	$("#addchildbtn").click(function(){
		if($(".childblock").css("display")!="none"){
			$(".grid").append("<tr name=\"childblock\" style=\"display: display;\"><td>子模块名称</td><td><input name=\"listChildName\" type=\"text\" placeholder=\"请输入资源名称\" class=\"easyui-validatebox span2\" data-options=\"required:true\" </td></tr>");
		}else{
			$(".childblock").show();
		}
	})
    
</script>
<div style="padding: 3px;">
	 <form id="searchUserForm">
	            <table>
	                <tr>
	                    <th>查找用户:</th>
	                    <td><input name="acLoginName" placeholder="请输入用户姓名"/></td>
	                   <!--  <th>创建时间:</th>-->
	                    <td>
	                       <!--  
	                       <input class="Wdate" name="createdateStart" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
	                        <input class="Wdate" name="createdateEnd" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
	                        --> 
	                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'glyphicon-search',plain:true" onclick="searchUserFun();">查询</a>
	                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'glyphicon-remove-circle',plain:true" onclick="cleanUserFun();">清空</a>
	                    </td> 
	                </tr>
	            </table>
    </form>
    <form id="blockAddForm" method="post" >
    	<input type="hidden" name="managerman">  
        <table class="grid">
            <tr>
                <td>版块名称</td>
                <td><input name="blockName" type="text" placeholder="请输入资源名称" class="easyui-validatebox span2" data-options="required:true" ></td>
            	<td><a href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'glyphicon-plus icon-green'" id="addchildbtn">添加子模块</a></td>
            </tr>
            <tr name="childblock" style="display: none;">
            	<td>子模块名称</td>
            	<td>
            		<input name="listChildName" type="text" placeholder="请输入资源名称" class="easyui-validatebox span2" data-options="required:true" 
            	</td>
            </tr>
            <tr>
            </tr>
        </table>
         <div data-options="region:'north',border:false" style="height: 600px; overflow: hidden;background-color: #fff">
       		 <table id="blockuserlistGrid" data-options="fit:false,border:true"></table>
    	</div>
    </form>
    
</div>