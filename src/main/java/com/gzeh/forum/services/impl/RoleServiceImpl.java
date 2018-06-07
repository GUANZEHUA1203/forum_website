package com.gzeh.forum.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.mapper.Condition;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.gzeh.forum.bean.AccountRole;
import com.gzeh.forum.bean.Permisson;
import com.gzeh.forum.bean.Role;
import com.gzeh.forum.bean.RolePermission;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.common.result.Tree;
import com.gzeh.forum.dao.AccountRoleMapper;
import com.gzeh.forum.dao.RoleMapper;
import com.gzeh.forum.dao.RolePermissionMapper;
import com.gzeh.forum.services.IRoleService;
import com.gzeh.forum.util.StringUtil;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {
	
	@Autowired
	private AccountRoleMapper accountRoleMapper;
	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	@Override
	public Map<String, List<String>> selectPermissionMapByUserId(long userId) {
		
		Condition con=new Condition();
		con.where("ac_id={0}", userId);
		//用户查找角色ID
		 List<AccountRole> selectList = accountRoleMapper.selectList(con);
		 
		 List<Long> rolesId = Lists.newArrayList();
		 rolesId = Lists.transform(selectList,new Function<AccountRole,Long>() {
				@Override
				public Long apply(AccountRole input) {
					return input.getRoId();
				}
		 });
		 //角色名称
		 List<String> roleName = Lists.newArrayList();
		 List<Role> selectBatchIds = roleMapper.selectBatchIds(rolesId);
		 roleName = Lists.transform(selectBatchIds,new Function<Role,String>() {
			@Override
			public String apply(Role input) {
				return input.getRoName();
			}
		 });
		 
		 //权限URL
		 List<Permisson> selectPermissionListByRoleIdList = roleMapper.selectPermissionListByRoleIdList(rolesId);
		 
		 //去掉空权限
		 List<String> permissionUrl = Lists.newArrayList();
		 for (Permisson permission : selectPermissionListByRoleIdList) {
			 try {
				
			
			 if(permission.getPeUrl()!=null&&!StringUtils.isEmpty(permission.getPeUrl())){
				 String s = StringUtil.getString(permission.getPeUrl());
				 permissionUrl.add(s);
			 }
			 } catch (Exception e) {
				 System.out.println(e);
				}
		 }
		 Map<String, List<String>> result = Maps.newHashMap();
		 result.put("urls", permissionUrl);
		 result.put("roles",roleName);
		return result;
	}

	@Override
	public List<Role> selectRolesByAcid(Long acid) {
		List<Role> selectRolesByAcid = this.roleMapper.selectRolesByAcid(acid);
		return selectRolesByAcid;
	}

	@Override
	public void updateRolePermission(Long roleid, String permissionid) {
		if(StringUtil.isNotBlock(roleid)&&StringUtil.isNotBlock(permissionid)){
			RolePermission rp=new RolePermission();
			rp.setRoId(roleid);
			EntityWrapper<RolePermission> ew=new EntityWrapper<RolePermission>(rp); 
			rolePermissionMapper.delete(ew);
			
			
			  
	        String[] resourceIdArray = permissionid.split(",");
	        for (String permissionId : resourceIdArray) {
	        	RolePermission rpnew=new RolePermission();
	        	rpnew.setRoId(roleid);
	        	rpnew.setPeId(StringUtil.getLong(permissionId));
	        	this.rolePermissionMapper.insert(rpnew);
	        }
		}
	}

	@Override
	public Object selectTree() {
		  List<Tree> trees = new ArrayList<Tree>();
	        List<Role> roles = this.selectAll();
	        for (Role role : roles) {
	            Tree tree = new Tree();
	            tree.setId(role.getRoId());
	            tree.setText(role.getRoDescription());
	            trees.add(tree);
	        }
	        return trees;
	}
	
	
	
//	获取所有记录
	public List<Role> selectAll() {
        EntityWrapper<Role> wrapper = new EntityWrapper<Role>();
        wrapper.orderBy("seq");
        return roleMapper.selectList(wrapper);
    }

	@Override
	public PageInfo selectRolePageInfo(PageInfo pageinfo) {
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageinfo.getNowpage(), pageinfo.getSize());
        page.setOrderByField(pageinfo.getSort());
        page.setAsc(pageinfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = roleMapper.selectRolePage(page, pageinfo.getCondition());
        pageinfo.setRows(list);
        pageinfo.setTotal(page.getTotal());
		return pageinfo;
	}

	@Override
	public List<Long> selectPermissionByRoleId(Long roleid) {
		return this.roleMapper.selectPermissionListByRoleId(roleid);
	}

	
}
