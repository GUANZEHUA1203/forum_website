package com.gzeh.forum.services.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.Lists;
import com.google.common.primitives.Longs;
import com.gzeh.forum.bean.Block;
import com.gzeh.forum.common.result.Tree;
import com.gzeh.forum.dao.BlockMapper;
import com.gzeh.forum.services.IBlockService;
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
public class BlockServiceImpl extends ServiceImpl<BlockMapper, Block> implements IBlockService {
	@Autowired
	private BlockMapper blockMapper;
	
	@Override
	public List<Tree> getBlockList() {
		ArrayList<Tree> listTree = Lists.newArrayList();
		List<Block> selectList = this.blockMapper.selectList(null);
		for (Block block : selectList) {
			Tree tree=new Tree();
			tree.setId(Longs.tryParse(block.getBlId()));
			
			/*if(Strings.isNotEmpty(block.getBlParent())) {
				tree.setPid(Longs.tryParse((block.getBlParent())));
			}*/
			if(block.getBlParent()!=null) {
				tree.setPid(Longs.tryParse(block.getBlParent()));
			}
			tree.setText(block.getBlName());
			tree.setChecked(false);
			listTree.add(tree);
		}
		return listTree;
	}
	
}
