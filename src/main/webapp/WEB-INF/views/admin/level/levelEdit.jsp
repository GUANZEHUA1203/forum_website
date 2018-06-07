<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
    	var blockparent=$("#blParentTmp").val();
        $('#blockEditPid').combotree({
            url : '${path }/block/listtree',
            parentField : 'pid',/*上一级  */
            panelHeight : 'auto',
            multiple : false,/*多项选择  */
            required : true,
            value:blockparent
        });
        
        $('#blockEditForm').form({
            url : '${path }/block/update',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为resource.jsp页面预定义好了
                    parent.layoutWestTree.tree('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#blockEditForm');
                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
            }
        });
    });
</script>
<div style="padding: 3px;">
    <form id="blockEditForm" method="post">
        <table  class="grid">
            <tr>
                <td>版块名称</td>
                <td>
                    <input name="blId" type="hidden"  value="${block.blId}" >
                     <input id="blParentTmp" type="hidden" placeholder="请输入资源名称" value="${block.blParent}" class="easyui-validatebox span2" data-options="required:true" >
                    <input name="blName" type="text" placeholder="请输入资源名称" value="${block.blName}" class="easyui-validatebox span2" data-options="required:true" >
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <select id="blockIsdelete" name="blIsdelete" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">未删除</option>
                        <option value="1">删除</option>
                    </select>
                </td>
             </tr>
            <tr>
                <td>上级资源</td>
                <td colspan="3"><select id="blockEditPid" name="blParent" style="width: 200px; height: 29px;"></select>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#blockEditPid').combotree('clear');" >清空</a></td>
            </tr>
        </table>
    </form>
</div>
