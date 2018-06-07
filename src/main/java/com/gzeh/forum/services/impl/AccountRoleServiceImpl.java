package com.gzeh.forum.services.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.gzeh.forum.bean.AccountRole;
import com.gzeh.forum.dao.AccountRoleMapper;
import com.gzeh.forum.services.IAccountRoleService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
@Service
public class AccountRoleServiceImpl extends ServiceImpl<AccountRoleMapper, AccountRole> implements IAccountRoleService {
	
}
