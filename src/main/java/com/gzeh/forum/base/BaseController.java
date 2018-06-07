package com.gzeh.forum.base;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.base.Splitter;
import com.google.common.base.Strings;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.BlockSummary;
import com.gzeh.forum.common.redis.BaseRedisSession;
import com.gzeh.forum.common.redis.RedisManager;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.common.result.Result;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.services.IAticleService;
import com.gzeh.forum.services.IBlockSummaryService;
import com.gzeh.forum.shiro.ShiroUser;
import com.gzeh.forum.util.Charsets;
import com.gzeh.forum.util.IdGenerator;
import com.gzeh.forum.util.StringEscapeEditor;
import com.gzeh.forum.util.URLUtils;

public abstract class BaseController extends BaseRedisSession{
    // 控制器本来就是单例，这样似乎更加合理
    protected Logger logger = LogManager.getLogger(getClass());

    @Autowired
    public IdGenerator idGenerator;
    
    
    @Autowired
    public IAccountService iAccountService;//账户
    
    
    @Autowired
	public IAticleService aticleService;//文章
    
    
    @Autowired
    public IBlockSummaryService iBlockSummaryService;//版块
    
    
    @Autowired
	private RedisManager redisManager;
    
    
    @InitBinder
    public void initBinder(ServletRequestDataBinder binder) {
        /**
         * 自动转换日期类型的字段格式
         */
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
        /**
         * 防止XSS攻击
         */
        binder.registerCustomEditor(String.class, new StringEscapeEditor());
    }

    /**
     * 获取当前登录用户对象
     * @return {ShiroUser}
     */
    public ShiroUser getShiroUser() {
        return (ShiroUser) SecurityUtils.getSubject().getPrincipal();
    }

    /**
     * 获取当前登录用户id
     * @return {Long}
     */
    public Long getUserId() {
        return this.getShiroUser().getId();
    }

    /**
     * 获取当前登录用户名
     * @return {String}
     */
    public String getStaffName() {
        return this.getShiroUser().getName();
    }

    /**
     * ajax失败
     * @param msg 失败的消息
     * @return {Object}
     */
    public Object renderError(String msg) {
        Result result = new Result();
        result.setMsg(msg);
        return result;
    }
    
    /**
     * ajax成功
     * @return {Object}
     */
    public Object renderSuccess() {
        Result result = new Result();
        result.setSuccess(true);
        return result;
    }
    
    /**
     * ajax成功
     * @param msg 消息
     * @return {Object}
     */
    public Object renderSuccess(String msg) {
        Result result = new Result();
        result.setSuccess(true);
        result.setMsg(msg);
        return result;
    }

    /**
     * ajax成功
     * @param obj 成功时的对象
     * @return {Object}
     */
    public Object renderSuccess(Object obj) {
        Result result = new Result();
        result.setSuccess(true);
        result.setObj(obj);
        return result;
    }
    
    public <T> Page<T> getPage(int current, int size, String sort, String order){
        Page<T> page = new Page<T>(current, size, sort);
        if ("desc".equals(order)) {
            page.setAsc(false);
        } else {
            page.setAsc(true);
        }
        return page;
    }
    
    public <T> PageInfo pageToPageInfo(Page<T> page) {
        PageInfo pageInfo = new PageInfo();
        pageInfo.setRows(page.getRecords());
        pageInfo.setTotal(page.getTotal());
        pageInfo.setOrder(page.getOrderByField());
        return pageInfo;
    }


	/**
	 * redirect跳转
	 * @param url 目标url
	 */
	protected String redirect(String url) {
		return new StringBuilder("redirect:").append(url).toString();
	}
	
	/**
	 * 下载文件
	 * @param file 文件
	 */
	protected ResponseEntity<Resource> download(File file) {
		String fileName = file.getName();
		return download(file, fileName);
	}
	
	/**
	 * 下载
	 * @param file 文件
	 * @param fileName 生成的文件名
	 * @return {ResponseEntity}
	 */
	protected ResponseEntity<Resource> download(File file, String fileName) {
		Resource resource = new FileSystemResource(file);
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		String header = request.getHeader("User-Agent");
		// 避免空指针
		header = header == null ? "" : header.toUpperCase();
		HttpStatus status;
		if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
			fileName = URLUtils.encodeURL(fileName, Charsets.UTF_8);
			status = HttpStatus.OK;
		} else {
			fileName = new String(fileName.getBytes(Charsets.UTF_8), Charsets.ISO_8859_1);
			status = HttpStatus.CREATED;
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		return new ResponseEntity<Resource>(resource, headers, status);
	}
	// 分隔逗号数据1,2,3
		protected List<String> splitter_item(String item) {
			if (!Strings.isNullOrEmpty(item)) {
				return Splitter.on(",").trimResults().omitEmptyStrings().splitToList(item);
			}
			return null;
		}
		
		
		/**
		 * 更新积分
		 * @param level
		 */
	public boolean updateLevel(Integer level){
		Account selectById = this.iAccountService.selectById(getUserId());
		selectById.setLevel(selectById.getLevel()==null?5:selectById.getLevel()+level);
	    return this.iAccountService.insertOrUpdate(selectById);
	}
		
		
	/**
	 * 更新积分和最后发帖时间
	 * @param level
	 */
	public boolean updateLevelorLastTime(Integer level,Date now){
		int levelval=0;
		levelval=level==null?0:level;
		Account selectById = this.iAccountService.selectById(getUserId());
		selectById.setLevel(selectById.getLevel()+levelval);
		selectById.setLastTime(now);
	    return this.iAccountService.insertOrUpdate(selectById);
	}
	
	
	/**
	 * 更新版块
	 * @param blockid
	 */
	public boolean updateBlock(Long blockid){
		//查找模块信息
		BlockSummary emp=new BlockSummary();
		emp.setBsBlock(blockid);
		EntityWrapper<BlockSummary> ew=new EntityWrapper<BlockSummary>(emp);
		List<BlockSummary> selectList = iBlockSummaryService.selectList(ew);
		//更新
		BlockSummary bs=new BlockSummary();
		bs.setBsBlock(blockid);
		bs.setBsLasttime(new Date());
		bs.setBsLastman(getStaffName());
		long countAticle=(selectList!=null&&selectList.size()>0)?selectList.get(0).getBsAccount()+1:1;
		bs.setBsAccount(countAticle);
		if(selectList.size()>0){
			Long bsId = selectList.get(0).getBsId();
			bs.setBsId(bsId);
		}
		return iBlockSummaryService.insertOrUpdate(bs);
	}
	
	
	/**
	 * @return
	 */
	protected Map<String,Object> initAllHttpParams(HttpServletRequest request) {
		Enumeration KeyVal=request.getParameterNames();
		Map<String,Object> params=new TreeMap<String,Object>();
		while(KeyVal.hasMoreElements()){
			String key=String.valueOf(KeyVal.nextElement());
			String value=request.getParameter(key);
			if(!key.equals("sign"))
			params.put(key,value);
		}
		return params;
	}
	
	public void dislike(){
		Long userId = getUserId();
		if(userId == null || userId == null){
			logger.error("session or session id is null");
			return;
		}
		
	}
	
	
}
