<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {

        $('#aticleEditBlocks').combotree({
        	 url: '${path }/block/listtree',
       		parentField : 'pid',
               panelHeight : 'auto', 
               multiple : true,
               required : true,
               cascadeCheck : false,
             /* value :  ${block} */
        });

       /*  $('#aticleEditForm').form({
            url : '${path }/aticle/update',
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
                    var form = $('#aticleEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            },
            onLoadError:function(result){
					console.info(result);
                }
        }); */

        $('#aticleEditForm').form({
            /* console.info("asdfasdf"); */
            url : '${path }/aticle/update',
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
                    var form = $('#aticleEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });

        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="aticleEditForm" method="post">
         <table class="grid">
                <tr>
                    <td>标题</td>
                    <td><input name="atId" type="hidden"  value="${aticle.atId}">
                   <input name="atTitle" type="text" placeholder="请输入标题" class="easyui-validatebox" data-options="required:false" value="${aticle.atTitle}"></td>
                   
                </tr>
               	<tr>
               		 <td>内容</td>
               		<td>
                     <input name="atContent" type="text" placeholder="请输入内容" class="easyui-validatebox" data-options="required:false" value="${aticle.atContent}"></td>
                	</td>
                </tr>
                <tr>
                    <td>所属版块</td>
                    <td><input  id="aticleEditBlocks" name="blockId" style="width: 140px; height: 29px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>