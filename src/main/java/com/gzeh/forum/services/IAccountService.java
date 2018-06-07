package com.gzeh.forum.services;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.result.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface IAccountService extends IService<Account> {
	
	List<Account> selectByLoginName(AccountVo account);
	
	void insertAccountvo(AccountVo account);
	
	/**
	 * @param pageinfo  列表数据
	 * name：
	 * startTime：
	 * endTime
	 * @return
	 */
	PageInfo selectDataGrid(PageInfo pageinfo);
	
	/**
	 * 修改用户
	 * @param account
	 */
	void updateByVo(AccountVo account);
	
	AccountVo selectVoById(Long acid);
	
}
