package com.gzeh.forum.services.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.AccountRole;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.dao.AccountMapper;
import com.gzeh.forum.dao.AccountRoleMapper;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.util.BeanUtils;
import com.gzeh.forum.util.IdGenerator;
import com.gzeh.forum.util.StringUtil;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements IAccountService {

	@Autowired
	AccountMapper accountMapper;
	
	@Autowired
	AccountRoleMapper accountRoleMapper;
	
	@Autowired
	IdGenerator idGenerator;
	
	@Override
	public List<Account> selectByLoginName(AccountVo accountvo) {
		Account account=new Account();
		account.setAcLoginName(accountvo.getAcLoginName());
		EntityWrapper<Account> entityAccount=new EntityWrapper<Account>(account);
		
		if(account.getAcId()!=null) {
			entityAccount.where("ac_id={0}", account.getAcId());
		}
		List<Account> selectList = accountMapper.selectList(entityAccount);
		return selectList;
	}

	@Override
	public void insertAccountvo(AccountVo account) {
		account.setAcId(idGenerator.nextId());
		Account ac = BeanUtils.copy(account, Account.class);
		this.insert(ac);
		String roles = account.getRoles();
		String[] split = roles.split(",");
		Long acId = ac.getAcId();
		for (String string : split) {
			AccountRole ar=new AccountRole();
			ar.setAcId(acId);
			ar.setRoId(Long.getLong(string));
			this.accountRoleMapper.insert(ar);
		}
	}

	@Override
	public PageInfo selectDataGrid(PageInfo pageinfo) {
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageinfo.getNowpage(), pageinfo.getSize());
        page.setOrderByField(pageinfo.getSort());
        page.setAsc(pageinfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = accountMapper.selectUserPage(page, pageinfo.getCondition());
        pageinfo.setRows(list);
        pageinfo.setTotal(page.getTotal());
		return pageinfo;
	}

	@Override
	public void updateByVo(AccountVo account) {
		 Account ac = BeanUtils.copy(account, Account.class);
	        if (StringUtils.isEmpty(ac.getAcPassword())) {
	        	ac.setAcPassword(null);
	        }
	        this.accountMapper.updateById(ac);
	        List<AccountRole> selectbyAccountId = accountRoleMapper.selectbyAccountId(account.getAcId());
	        if(selectbyAccountId!=null &selectbyAccountId.size()>0){
	        	for (AccountRole accountRole : selectbyAccountId) {
					accountRoleMapper.deleteById(accountRole.getArId());
				}
	        }
	        String[] split = account.getRoles().split(",");
	        for (String string : split) {
				AccountRole ar=new AccountRole();
				ar.setRoId(StringUtil.getLong(string));
				ar.setAcId(account.getAcId());
				accountRoleMapper.insert(ar);
			}
	}

	@Override
	public AccountVo selectVoById(Long acid) {
		AccountVo selectById = this.accountMapper.selectUserVoById(acid);
		return selectById;
	}
	
}
