<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var aticleDataGrid;
    var organizationTree;

    $(function() {

    	aticleDataGrid = $('#aticleDataGrid').datagrid({
            url : '${path }/aticle/list',
            fit : true,
            fitColumns : false,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'at_data',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : 'ID',
                field : 'at_id',
            },{
                width : '80',
                title : '发帖者',
                field : 'ac_login_name',
            }, 
            {
                width : '150',
                title : '标题',
                field : 'at_title',
                formatter : function(value, row, index) {
                    if(value.length>200){
                    	value.substring(200)
                      }else{
						return value;
                     }
              	}
            },{
                width : '150',
                title : '内容',
                field : 'at_content',
                formatter : function(value, row, index) {
                    if(value.length>200){
                    	value.substring(200)
                      }else{
						return value;
                     }
              	}
            },
            {
                width : '150',
                title : '所属版块',
                field : 'blockname',
            },
            {
                width : '50',
                title : '积分',
                field : 'level',
            }, 
            {
                width : '100',
                title : '发帖时间',
                field : 'at_data',
                sortable : true
            },
            {
                width : '100',
                title : '最后回帖时间',
                field : 'lasttime'
            }, {
                width : '150',
                title : '用户等级',
                field : 'levelInfo',
                formatter : function(value, row, index) {
                      return value.leName+'['+value.leOption+']';
                }
            }, {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/aticle/update">
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'glyphicon-pencil icon-blue\'" onclick="editAticleFun(\'{0}\');" >编辑</a>', row.at_id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/aticle/del">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'glyphicon-trash icon-red\'" onclick="deleteAticleFun(\'{0}\');" >删除</a>', row.at_id);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.user-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.user-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#aticleToolbar'
        });
    });
    
    function addAticleFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/aticle/addpage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = aticleDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#aticleAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteAticleFun(id) {
        console.info("asdf");
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = aticleDataGrid.datagrid('getSelections');
            id = rows[0].acid;
        } else {//点击操作里面的删除图标会触发这个
        	aticleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/aticle/del', {
                	atid : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        aticleDataGrid.datagrid('reload');
                    } else {
                        parent.$.messager.alert('错误', result.msg, 'error');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }
    
    function editAticleFun(id) {
        if (id == undefined) {
            var rows = aticleDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	aticleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path}/aticle/editpage?atcid=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = aticleDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#userEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function searchAticleFun() {
    	aticleDataGrid.datagrid('load', $.serializeObject($('#searchAticleForm')));
    }
    function cleanAticleFun() {
        $('#searchUserForm input').val('');
        aticleDataGrid.datagrid('load', {});
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="searchAticleForm">
            <table>
                <tr>
                    <th>姓名:</th>
                    <td><input name="accountName" placeholder="请输入用户姓名"/></td>
                    <th>创建时间:</th>
                    <td>
                        <input class="Wdate" name="startTime" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />至
                        <input class="Wdate" name="endTime" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly" />
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'glyphicon-search',plain:true" onclick="searchAticleFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'glyphicon-remove-circle',plain:true" onclick="cleanAticleFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'用户列表'" >
        <table id="aticleDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="aticleToolbar" style="display: none;">
    <shiro:hasPermission name="/aticle/add">
        <a onclick="addAticleFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'glyphicon-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>