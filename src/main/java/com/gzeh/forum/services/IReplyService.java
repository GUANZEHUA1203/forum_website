package com.gzeh.forum.services;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.gzeh.forum.bean.Reply;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface IReplyService extends IService<Reply> {
	List<Reply> getReplysByAtId(long id);
}
