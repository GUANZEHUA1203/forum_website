<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var resourceTreeGrid;
    $(function() {
        resourceTreeGrid = $('#syslogTreeGrid').datagrid({
        	url : '${path }/syslog/list',
            fit : true,
            fitColumns : false,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'logId',
            sortName : 'createTime',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '100',
                title : 'ID',
                field : 'logId',
                sortable : true
            },{
                width : '80',
                title : '登录名',
                field : 'accountId',
                sortable : true
            }, {
                width : '80',
                title : '姓名',
                field : 'loginName',
                sortable : true
            },{
                width : '130',
                title : '创建时间',
                field : 'createTime',
                sortable : true
            },   {
                width : '400',
                title : '参数内容',
                field : 'content',
                sortable : true
            },{
                width : '120',
                title : 'IP地址',
                field : 'clientIp',
                sortable : true
            }]]
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false"  style="overflow: hidden;">
        <table id="syslogTreeGrid"></table>
    </div>
</div>
