<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#levelAddForm').form({
            url : '${path }/level/add',
            onSubmit : function() {
                console.info("asdf");
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
                    parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为level.jsp页面预定义好了
                    parent.layoutWestTree.tree('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#levelAddForm');
                    parent.$.messager.alert('提示', eval(result.msg), 'warning');
                }
            }
        });
        
    });
</script>
<div style="padding: 3px;">
    <form id="levelAddForm" method="post">
        <table class="grid">
            <tr>
                <td>等级名称</td>
                <td><input name="leName" type="text" placeholder="请输入等级名称" class="easyui-validatebox span2" data-options="required:true" ></td>
                <td>等级说明</td>
               <td><input name="leOption" type="text" placeholder="请输入资源名称" class="easyui-validatebox span2" data-options="required:true" ></td>
            </tr>
            <tr>
                <td>经验开始范围</td>
                <td><input name="leStart" type="text" placeholder="请输入资源路径" class="easyui-validatebox span2" data-options="width:140,height:29" ></td>
                <td>经验结束范围</td>
                <td><input name="leEnd" type="text" placeholder="请输入资源路径" class="easyui-validatebox span2" data-options="width:140,height:29" ></td>
            </tr>
            <tr>
                <td>图标</td>
                <td ><input name="leIcon" onclick='top.window.openIconDialog(this)'/></td>
            </tr>
        </table>
    </form>
</div>