package com.gzeh.forum.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.base.annotation.AnnAuthType;
import com.gzeh.forum.base.annotation.AuthPermissions;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.Aticle;
import com.gzeh.forum.bean.Block;
import com.gzeh.forum.bean.BlockSummary;
import com.gzeh.forum.common.SystemConfig;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.services.IAticleService;
import com.gzeh.forum.services.IBlockService;
import com.gzeh.forum.services.IBlockSummaryService;
import com.gzeh.forum.util.SerializeUtils;
import com.gzeh.forum.util.StringUtil;

/**
 * @author gzh
 * @since 2018-04-21
 */
@Controller
@RequestMapping("/aticle")
public class AticleController extends BaseController {
	
	@Autowired
	IAccountService iAccountService;
	
	@Autowired
	IAticleService aticleService;
	
	@Autowired
	IBlockService iBlockService;
	
	
	
	@GetMapping("/addpage")
	public String getaddpage() {
		return "/admin/aticle/aticleAdd";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	@AuthPermissions(authName = AnnAuthType.user)
	public Object posted(String title,String content,String blockid){
		Long blockLong = StringUtil.getLong(blockid);
		
		Account selectById = iAccountService.selectById(getUserId());
		Date lastTime = selectById.getLastTime();
		//时间间隔
		if(lastTime==null||new Date().getTime()-lastTime.getTime()>SystemConfig.ATICLE_TIME){
			Aticle aticle = new Aticle(title,getUserId(),content,new Date(),blockLong);
			aticle.setAtId(idGenerator.nextId());
			this.aticleService.insert(aticle);
		}else{
			return renderError("稍后再发送帖子");
		}
		//更新发帖时间和等级
		updateLevelorLastTime(5, new Date());
		//更新模块详细信息
		updateBlock(blockLong);
		return renderSuccess();
	}
	
	@GetMapping("/editpage")
	public String geteditpage(Model model, Long atcid) {
		Aticle selectById = this.aticleService.selectById(atcid);
		Block block = iBlockService.selectById(selectById.getBlockId());
		ArrayList<String> blocks = Lists.newArrayList();
		model.addAttribute("aticle", selectById);
		model.addAttribute("block",blocks.add(block.getBlId()));
		return "/admin/aticle/aticleEdit";
	}
	
	@RequestMapping("/update")
	@AuthPermissions(authName = AnnAuthType.user)
	public Object updateActicle(Aticle aticle){
		this.aticleService.updateById(aticle);
		return renderSuccess();
	}
	@GetMapping("/manager")
	public String getManagerpage() {
		return "/admin/aticle/aticle";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	@AuthPermissions(authName = AnnAuthType.user)
	public Object getAticleList(@RequestParam(value="blockid",required=false) String blockid,Aticle aticle,
			Integer page, Integer rows, String sort, String order,String startTime,String endTime,
			String accountName){
		Map<String, Object> paramMap = Maps.newHashMap();
		PageInfo pageinfo = new PageInfo(page, rows, sort, order);
		
		
		//查找用户信息
		if(accountName!=null) {
			Account ac=new Account();
			EntityWrapper<Account> ew =new EntityWrapper<>();
			ew.like("ac_login_name", accountName);
			List<Account> selectList=Lists.newArrayList();
				selectList = iAccountService.selectList(ew);
			List<Long> acids=Lists.newArrayList();
			for (Account acc : selectList) {
				acids.add(acc.getAcId());
			}
			if(acids!=null&&acids.size()!=0) paramMap.put("acids", acids);
		}
		if(StringUtil.isNotBlock(blockid))paramMap.put("blockid", blockid);
		if(StringUtil.isNotBlock(startTime))paramMap.put("startTime", startTime);
		if(StringUtil.isNotBlock(endTime))paramMap.put("endTime", endTime);
		
		
		pageinfo.setCondition(paramMap);
		PageInfo pageInfoList = this.aticleService.pageInfoList(pageinfo);
		return pageInfoList;
	}
	
	@RequestMapping("/del")
	@ResponseBody
	@AuthPermissions(authName = AnnAuthType.user)
	public Object deleteAticle(@RequestParam(value="atid",required=true) String atid){
		Aticle ac=new Aticle();
		ac.setAtId(StringUtil.getLong(atid));
		EntityWrapper<Aticle> ew=new EntityWrapper<Aticle>(ac);
		 aticleService.delete(ew);
		return renderSuccess();
	}
	
	@RequestMapping("like")
	@ResponseBody
	public Object likeAticle(@RequestParam(value="atid",required=true) String atid){
		Long userId = getUserId();
		
		return renderSuccess();
	}
	
	
	
	
	
}
