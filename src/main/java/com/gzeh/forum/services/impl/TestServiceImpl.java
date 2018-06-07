package com.gzeh.forum.services.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzeh.forum.bean.Test;
import com.gzeh.forum.dao.TestMapper;
import com.gzeh.forum.dao.impl.MybatisBaseGenericDAOImpl;
import com.gzeh.forum.services.TestService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @since 2018-05-24
 */
@Service
public class TestServiceImpl extends MybatisBaseGenericDAOImpl<Test, Long>  implements TestService {
	@Autowired
	private TestMapper testMapper;

	@Override
	public void insert(Test test) {
		this.testMapper.save(test);
	}

	@Override
	public void insertMapper(Test test) {
		insert("com.gzeh.forum.dao.TestMapper.save", test);
	}
	
	
	
}
