package com.gzeh.forum.services.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.gzeh.forum.bean.File;
import com.gzeh.forum.dao.FileMapper;
import com.gzeh.forum.services.IFileService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Service
public class FileServiceImpl extends ServiceImpl<FileMapper, File> implements IFileService {
	
}
