package com.gzeh.forum.services.impl;




import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.gzeh.forum.bean.Permisson;
import com.gzeh.forum.bean.Role;
import com.gzeh.forum.common.result.Tree;
import com.gzeh.forum.dao.AccountRoleMapper;
import com.gzeh.forum.dao.PermissonMapper;
import com.gzeh.forum.dao.RoleMapper;
import com.gzeh.forum.services.IPermissonService;
import com.gzeh.forum.shiro.ShiroUser;

/**
 *
 * @author gzh
 * @since 2018-04-23
 */
@Service
public class PermissonServiceImpl extends ServiceImpl<PermissonMapper, Permisson> implements IPermissonService {
	
	@Autowired
	private PermissonMapper permissonMapper;
	
	@Autowired
	private AccountRoleMapper accountRoleMapper;
	
	@Autowired
	private RoleMapper roleMapper;
	
	
	private static final int RESOURCE_MENU = 0; // 菜单
	
  private List<Permisson> selectAllByStatus(Integer status) {
	   Permisson resource = new Permisson();
        if (status != null) {
            resource.setPeStatus(status);
        }
        EntityWrapper<Permisson> wrapper = new EntityWrapper<Permisson>(resource);
        wrapper.orderBy("pe_seq");
        return permissonMapper.selectList(wrapper);
    }
	
//  类型
	private List<Permisson> selectByType(Integer type) {
		Permisson permisson = new Permisson();
		permisson.setPeResourceType(type);
		permisson.setPeStatus(0);
        EntityWrapper<Permisson> wrapper = new EntityWrapper<Permisson>(permisson);
        wrapper.orderBy("pe_seq");//排序
        return permissonMapper.selectList(wrapper);
    }
		
	
	@Override
	public List<Permisson> selectAll() {
		List<Permisson> selectAllByStatus = selectAllByStatus(null);
		return selectAllByStatus;
	}

	
	
	@Override
	public List<Tree> selectAllMenu() {
		  List<Tree> trees = new ArrayList<Tree>();
	        // 查询所有菜单
	        List<Permisson> resources = this.selectByType(RESOURCE_MENU);
	        if (resources == null) {
	            return trees;
	        }
	        for (Permisson resource : resources) {
	            Tree tree = new Tree();
	            tree.setId(resource.getPeId());
                tree.setPid(resource.getPeParent());
                tree.setText(resource.getPeName());
                tree.setIconCls(resource.getPeIcon());
                tree.setAttributes(resource.getPeUrl());
                tree.setState(resource.getPeOpened());
                trees.add(tree);
	        }
	        return trees;
	}

	@Override
	public List<Tree> selectAllTree() {
		 // 获取所有的资源 tree形式，展示
        List<Tree> trees = new ArrayList<Tree>();
        List<Permisson> resources = this.selectAllByStatus(0);
        if (resources == null) {
            return trees;
        }
        for (Permisson resource : resources) {
            Tree tree = new Tree();
            tree.setId(resource.getPeId());
            tree.setPid(resource.getPeParent());
            tree.setText(resource.getPeName());
            tree.setIconCls(resource.getPeIcon());
            tree.setAttributes(resource.getPeUrl());
            tree.setState(resource.getPeOpened());
            trees.add(tree);
        }
        return trees;	
	}

	@Override
	public List<Tree> selectTree(ShiroUser shiroUser) {
		 List<Tree> trees = new ArrayList<Tree>();
		List<String> rolesList = shiroUser.getRoles();
//		管理员
		if(rolesList.contains("admin")){
			  List<Permisson> resourceList = this.selectByType(RESOURCE_MENU);
	            if (resourceList == null) {
	                return trees;
	            }
	            for (Permisson resource : resourceList) {
	                Tree tree = new Tree();
	                tree.setId(resource.getPeId());
	                tree.setPid(resource.getPeParent());
	                tree.setText(resource.getPeName());
	                tree.setIconCls(resource.getPeIcon());
	                tree.setAttributes(resource.getPeUrl());
	                tree.setOpenMode(resource.getPeOpenMode());
	                tree.setState(resource.getPeOpened());
	                trees.add(tree);
	            }
	            return trees;
		}
		
		 // 普通用户
        List<Long> roleIdList = accountRoleMapper.getRolesIdByAcId(shiroUser.getId());
        if (roleIdList == null) {
            return trees;
        }
        List<Permisson> resourceLists = roleMapper.selectPermissionListByRoleIdList(roleIdList);
        if (resourceLists == null) {
            return trees;
        }
        for (Permisson resource : resourceLists) {
        	if(resource.getPeStatus()==0&&resource.getPeResourceType()==0) {//状态为0 类型为0
        	   Tree tree = new Tree();
               tree.setId(resource.getPeId());
               tree.setPid(resource.getPeParent());
               tree.setText(resource.getPeName());
               tree.setIconCls(resource.getPeIcon());
               tree.setAttributes(resource.getPeUrl());
               tree.setOpenMode(resource.getPeOpenMode());
               tree.setState(resource.getPeOpened());
               trees.add(tree);
        	}
        }
        return trees;
	}
	
}
