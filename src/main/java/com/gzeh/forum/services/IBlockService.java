package com.gzeh.forum.services;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.gzeh.forum.bean.Block;
import com.gzeh.forum.common.result.Tree;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
public interface IBlockService extends IService<Block> {
	List<Tree> getBlockList();
	
}
