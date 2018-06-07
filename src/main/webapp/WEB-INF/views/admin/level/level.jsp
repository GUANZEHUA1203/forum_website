<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var LevelTreeGrid;
    $(function() {
    	LevelTreeGrid = $('#LevelTreeGrid').treegrid({
            url : '${path }/level/list',
            idField : 'blId',
            treeField : 'blName',
            /* parentField  : 'blParent', */
            fit : true,
            fitColumns : false,
            border : false,
            frozenColumns : [ [ {
                title : '编号',
                field : 'leId',
                width : 200
            } ] ],
            columns : [ [ {
                field : 'leName',
                title : '等级名称',
                width : 150
            },
            {
                field : 'leOption',
                title : '等级说明',
                width : 150
            },
            {
                field : 'leStart',
                title : '开始范围',
                width : 150,
            },

            {
                field : 'leEnd',
                title : '结束范围',
                width : 150,
            },
            {
                field : 'leIcon',
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
                        <shiro:hasPermission name="/level/update">
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'glyphicon-pencil icon-blue\'" onclick="editLevelFun(\'{0}\');" >编辑</a>', row.blId);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/level/del">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="resource-easyui-linkbutton-del" data-options="plain:true,iconCls:\'glyphicon-trash icon-red\'" onclick="deleteLevelFun(\'{0}\');" >删除</a>', row.blId);
                        </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess:function(data){
                $('.resource-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.resource-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#LevelToolbar' 
        });
    });


    function editLevelFun(id) {
        if (id != undefined) {
        	LevelTreeGrid.treegrid('select', id);
        }
        var node = LevelTreeGrid.treegrid('getSelected');
        if (node) {
            parent.$.modalDialog({
                title : '编辑',
                width : 500,
                height : 350,
                href : '${path }/level/editpage?Levelid=' + node.blId,
                buttons : [ {
                    text : '确定',
                    handler : function() {
                        parent.$.modalDialog.openner_treeGrid = LevelTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                        var f = parent.$.modalDialog.handler.find('#LevelEditForm');
                        f.submit();
                    }
                } ]
            });
        }
    }

    function deleteLevelFun(id) {
        if (id != undefined) {
        	LevelTreeGrid.treegrid('select', id);
        }
        var node = LevelTreeGrid.treegrid('getSelected');
        if (node) {
            parent.$.messager.confirm('询问', '您是否要删除当前资源？删除当前资源会连同子资源一起删除!', function(b) {
                if (b) {
                    progressLoad();
                    $.post('${path }/level/delete', {
                        id : node.id
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            LevelTreeGrid.treegrid('reload');
                            parent.layoutWestTree.tree('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
            });
        }
    }

    function addLevelFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 350,
            href : '${path }/level/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_treeGrid = LevelTreeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#resourceAddForm');
                    f.submit();
                }
            } ]
        });
    }

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false"  style="overflow: hidden;">
        <table id="LevelTreeGrid"></table>
    </div>
</div>
<<div id="LevelToolbar" style="display: none;">
    <shiro:hasPermission name="/level/add">
        <a onclick="addLevelFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'glyphicon-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div> 