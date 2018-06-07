package com.gzeh.forum.services;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.gzeh.forum.bean.Permisson;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.result.Tree;
import com.gzeh.forum.shiro.ShiroUser;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
public interface IPermissonService extends IService<Permisson> {
	
	   List<Permisson> selectAll();

	    List<Tree> selectAllMenu();

	    List<Tree> selectAllTree();

	    List<Tree> selectTree(ShiroUser shiroUser);
	
}
