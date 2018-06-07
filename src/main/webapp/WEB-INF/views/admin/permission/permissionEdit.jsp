<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#resourceEditPid').combotree({
            url : '${path }/permisson/tree',
            parentField : 'pid',
            panelHeight : 'auto',
            value : '${resource.peId}'
        });
        
        $('#resourceEditForm').form({
            url : '${path }/permission/edit',
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
                    var form = $('#resourceEditForm');
                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
            }
        });
        $("#resourceEditStatus").val("${resource.peStatus}");
        $("#resourceEditType").val("${resource.peResourceType}");
        $("#resourceEditOpenMode").val("${resource.peOpenMode}");
        $("#resourceEditOpened").val("${resource.peOpened}");
    });
</script>
<div style="padding: 3px;">
    <form id="resourceEditForm" method="post">
        <table  class="grid">
            <tr>
                <td>资源名称</td>
                <td>
                    <input name="peId" type="hidden"  value="${resource.peId}" >
                    <input name="peName" type="text" placeholder="请输入资源名称" value="${resource.peName}" class="easyui-validatebox span2" data-options="required:true" >
                </td>
                <td>资源类型</td>
                <td>
                    <select id="resourceEditType" name="peResourceType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">菜单</option>
                        <option value="1">按钮</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>资源路径</td>
                <td><input name="peUrl" type="text" value="${resource.peUrl}" placeholder="请输入资源路径" class="easyui-validatebox span2" ></td>
                <td>打开方式</td>
                <td>
                    <select id="resourceEditOpenMode" name="peOpenMode" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option>无(用于上层菜单)</option>
                        <option value="ajax">ajax</option>
                        <option value="iframe">iframe</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>菜单图标</td>
                <td><input name="peIcon" value="${resource.peIcon}" onclick='top.window.openIconDialog(this)'/></td>
                <td>排序</td>
                <td><input name="peSeq" value="${resource.peSeq}" class="easyui-numberspinner" style="width: 140px; height: 29px;" required="required" data-options="editable:false"></td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <select id="resourceEditStatus" name="peStatus" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">正常</option>
                        <option value="1">停用</option>
                    </select>
                </td>
                <td>菜单状态</td>
                <td>
                    <select id="resourceEditOpened" name="peOpened" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                        <option value="0">关闭</option>
                        <option value="1">打开</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>上级资源</td>
                <td colspan="3"><select id="resourceEditPid" name="peParent" style="width: 200px; height: 29px;"></select>
                <a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
            </tr>
        </table>
    </form>
</div>
