<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var blockTreeGrid;
    $(function() {
    	blockTreeGrid = $('#blockTreeGrid').treegrid({
            url : '${path }/block/list',
            idField : 'id',
            treeField : 'blName',
             parentField  : 'blParent', 
            fit : true,
            fitColumns : false,
            border : false,
            frozenColumns : [ [ {
                title : '编号',
                field : 'blId',
                width : 200
            } ] ],
            columns : [ [ {
                field : 'blName',
                title : '资源名称',
                width : 150
            },
            {
                field : 'blManager',
                title : '版块管理员',
                width : 150
            },
            {
                field : 'blIcon',
                title : '图标',
                width : 150
            },

            {
                field : 'blIsdelete',
                title : '是否禁用',
                width : 150,
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
                
            },
            {
                field : 'blParent',
                title : '上级ID',
                width : 150,
                hidden:true
            },
            {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/block/update">
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'glyphicon-pencil icon-blue\'" onclick="editBlockFun(\'{0}\');" >编辑</a>', row.blId);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/block/add">
                        	str += $.formatString('<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:\'glyphicon-plus icon-green\'" onclick="editBlockFun(\'{0}\');" >添加</a>');
                    	</shiro:hasPermission>
                        <shiro:hasPermission name="/block/del">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'glyphicon-trash icon-red\'" onclick="deleteBlockFun(\'{0}\');" >删除</a>', row.blId);
                        </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess:function(data){
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#blockToolbar' 
        });
    });


    function editBlockFun(id) {
        if (id != undefined) {
        	blockTreeGrid.treegrid('select', id);
        }
        var node = blockTreeGrid.treegrid('getSelected');
        if (node) {
            parent.$.modalDialog({
                title : '编辑',
                width : 500,
                height : 350,
                href : '${path }/block/editpage?blockid=' + node.blId,
                buttons : [ {
                    text : '确定',
                    handler : function() {
                        parent.$.modalDialog.openner_treeGrid = blockTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                        var f = parent.$.modalDialog.handler.find('#blockEditForm');
                        f.submit();
                    }
                } ]
            });
        }
    }

    function deleteBlockFun(id) {
        if (id != undefined) {
        	blockTreeGrid.treegrid('select', id);
        }
        var node = blockTreeGrid.treegrid('getSelected');
        if (node) {
            parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
                if (b) {
                    progressLoad();
                    $.post('${path }/block/delete', {
                    	blockid : node.blId
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            blockTreeGrid.treegrid('reload');
                            parent.layoutWestTree.tree('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
            });
        }
    }

    function addBlockFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 650,
            href : '${path }/block/addpage',
            buttons : [ {
                text : '添加版块',
                handler : function() {
                	parent.$.modalDialog.openner_dataGrid = blockTreeGrid;
                    var f = parent.$.modalDialog.handler.find('#blockAddForm');
                    f.submit();
                }
            } ]
        });
    }

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false"  style="overflow: hidden;">
        <table id="blockTreeGrid"></table>
    </div>
</div>
<<div id="blockToolbar" style="display: none;">
    <shiro:hasPermission name="/block/add">
        <a onclick="addBlockFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'glyphicon-plus icon-green',Resiable:true">添加</a>
    </shiro:hasPermission>
</div> 