<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {

        $('#userAddBlocks').combotree({
            url: '${path }/role/list',
            multiple: true,
            required: true,
            panelHeight : 'auto'
        });

        $('#userAddForm').form({
            url : '${path }/account/add',
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
                    var form = $('#userAddForm');
                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
            }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="userAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>登录名</td>
                    <td><input name="acLoginName" type="text" placeholder="请输入登录名称" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>姓名</td>
                    <td><input name="acRealName" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="acPassword" type="password" placeholder="请输入密码" class="easyui-validatebox" data-options="required:true"></td>
                    <td>性别</td>
                    <td>
                        <select name="acSex" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0" selected="selected">男</option>
                            <option value="1" >女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>角色</td>
                    <td><select id="userAddBlocks" name="roles" style="width: 140px; height: 29px;"></select></td>
                </tr>
            </table>
        </form>
    </div>
</div>