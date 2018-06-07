<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {

        $('#userEditRoleIds').combotree({
            url : '${path }/role/list',
           	parentField : 'pid',
            panelHeight : 'auto', 
            multiple : true,
            required : true,
            cascadeCheck : false,
            value :  ${roleIds}
        });

        $('#userEditForm').form({
            url : '${path }/account/update',
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
                    var form = $('#userEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        $("#userEditSex").val('${user.acSex}');
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="userEditForm" method="post">
            <div class="light-info" style="overflow: hidden;padding: 3px;">
                <div>密码不修改请留空。</div>
            </div>
            <table class="grid">
                <tr>
                    <td>登录名</td>
                    <td><input name="acId" type="hidden"  value="${user.acId}">
                    <input name="acLoginName" type="text" placeholder="请输入登录名称" class="easyui-validatebox" data-options="required:true" value="${user.acLoginName}"></td>
                    <td>姓名</td>
                    <td><input name="acRealName" type="text" placeholder="请输入姓名" class="easyui-validatebox" data-options="required:true" value="${user.acRealName}"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="text" name="acPassword"/></td>
                    <td>性别</td>
                    <td><select id="userEditSex" name="acSex" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">男</option>
                            <option value="1">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td>电子邮箱</td>
                    <td><input type="text" name="acMail" value="${user.acMail}" class="easyui-validatebox"/></td>
                </tr>
                <tr>
                    <td>角色</td>
                    <td><input  id="userEditRoleIds" name="roles" style="width: 140px; height: 29px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>