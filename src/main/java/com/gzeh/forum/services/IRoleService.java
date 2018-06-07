package com.gzeh.forum.services;

import com.gzeh.forum.bean.Role;
import com.gzeh.forum.common.result.PageInfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
public interface IRoleService extends IService<Role> {
	
	/**
	 * @param userId账户id
	 * @return
	 */
	Map<String, List<String>> selectPermissionMapByUserId(long userId);
	
    /**
     * @param acid  账户id
     * @return
     */
    List<Role> selectRolesByAcid(Long acid);
    
    
    void updateRolePermission(Long roleid,String permissionid);
    
    
    Object selectTree();
    
    PageInfo selectRolePageInfo(PageInfo pageinfo);
    
    List<Long> selectPermissionByRoleId(Long roleid);
    
    
    
    
	
	
}
