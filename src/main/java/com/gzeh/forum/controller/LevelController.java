package com.gzeh.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.bean.Block;
import com.gzeh.forum.bean.Level;
import com.gzeh.forum.services.ILevelService;

import jdk.nashorn.internal.objects.annotations.Getter;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-25
 */
@Controller
@RequestMapping("/level")
public class LevelController  extends BaseController  {
	
	@Autowired
	private ILevelService iLevelService;
	
	
	@GetMapping("/addpage")
	public Object addpage() {
		return "/admin/level/levelAdd";
		
	}
	@RequestMapping("/add")
	@ResponseBody
	public Object insertBlock(Level level){
		this.iLevelService.insert(level);
		return renderSuccess();
	}
	
	
	@GetMapping("/editpage")
	public Object editpage(Model model, Long levelid) {
		Level selectById = this.iLevelService.selectById(levelid);
		model.addAttribute("level", selectById);
		return "/admin/level/levelEdit";
		
	}
	@RequestMapping("/update")
	@ResponseBody
	public Object update(Level Level){
		boolean updateById = this.iLevelService.updateById(Level);
		return renderSuccess();
	}
	

	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Long levelid){
		this.iLevelService.deleteById(levelid);
		return renderSuccess();
	}
	
	@GetMapping("/manager")
	public Object getManager() {
		return "/admin/level/level";
	}
	
	@PostMapping(value="/list")
    @ResponseBody
    public Object dataGrid() {
		return  iLevelService.selectList(null);
    }
	
	@PostMapping(value="/listtree")
    @ResponseBody
    public Object listtree() {
		return iLevelService;
//		return  iLevelService.getBlockList();
    }
	
}
