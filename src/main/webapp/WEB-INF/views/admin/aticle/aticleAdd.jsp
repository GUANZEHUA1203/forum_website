<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#aticleAddblockId').combotree({
            url: '${path }/block/listtree',
            parentField : 'pid',
            panelHeight : 'auto'
        });
        /* 添加 */
        $('#aticleAddForm').form({
            url : '${path }/aticle/add',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#aticleAddForm');
                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
            },
            onLoadError:function(result){
            	parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="aticleAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>标题</td>
                    <td><input name="title" type="text" placeholder="请输入登录名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>内容</td>
                    <td><input name="content" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>版块</td>
                    <td><select id="aticleAddblockId" name="blockid" style="width: 140px; height: 29px;"></select></td>
                </tr>
            </table>
        </form>
    </div>
</div>