package com.gzeh.forum.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Maps;
import com.gzeh.forum.bean.Reply;
import com.gzeh.forum.dao.ReplyMapper;
import com.gzeh.forum.services.IReplyService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Service
public class ReplyServiceImpl extends ServiceImpl<ReplyMapper, Reply> implements IReplyService {
	@Autowired
	private ReplyMapper rm;

	@Override
	public List<Reply> getReplysByAtId(long id) {
		Map<String, Object> param = Maps.newHashMap();
		param.put("at_id",id);
		return rm.selectByMap(param);
	}
	
}
