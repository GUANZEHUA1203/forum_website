package com.gzeh.forum.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.bean.Permisson;
import com.gzeh.forum.services.IPermissonService;
import com.gzeh.forum.shiro.ShiroUser;
import com.gzeh.forum.util.Object2mapUtil;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
@Controller
@RequestMapping("/permisson")
public class PermissonController extends BaseController {
	
	  @Autowired
	    private IPermissonService iPermissonService;

	    /**
	     * 菜单树
	     *
	     * @return
	     */
	    @PostMapping("/tree")
	    @ResponseBody
	    public Object tree() {
	         ShiroUser shiroUser = getShiroUser();
	        return iPermissonService.selectTree(shiroUser);
	    }

	    /**
	     * 资源管理页
	     *
	     * @return
	     */
	    @GetMapping("/manager")
	    public String manager() {
	        return "admin/permission/permission";
	    }

	    /**
	     * 资源管理列表
	     *
	     * @return
	     */
	    @PostMapping("/treeGrid")
	    @ResponseBody
	    public Object treeGrid() {
	    	ArrayList<Map> newArrayList = Lists.newArrayList();
	    	
	    	List<Permisson> selectAll = iPermissonService.selectAll();
	    	//easyui id标识
	    	for (Permisson permisson : selectAll) {
	    		Map<String, Object> objectToMap=new HashMap<>();;
				try {
					objectToMap = Object2mapUtil.objectToMap(permisson);
					Object object = objectToMap.get("peId");
		    		objectToMap.put("id", object);
//		    		objectToMap.put("state", "closed");
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
		    	newArrayList.add(objectToMap);
			}
	        return newArrayList;
	    }

	    /**
	     * 添加资源页
	     *
	     * @return
	     */
	    @GetMapping("/addPage")
	    public String addPage() {
	        return "admin/permission/permissionAdd";
	    }

	    /**
	     * 添加资源
	     *
	     * @param resource
	     * @return
	     */
	    @RequestMapping("/add")
	    @ResponseBody
	    public Object add(@Valid Permisson resource) {
	        resource.setPeCreateTime(new Date());
	        // 选择菜单时将openMode设置为null
	        Integer type = resource.getPeResourceType();
	        if (null != type && type == 0) {
	            resource.setPeOpenMode(null);
	        }
	        iPermissonService.insert(resource);
	        return renderSuccess("添加成功！");
	    }

	    
	    
	    
	    
	    
	    
	    /**
	     * 查询所有的菜单
	     */
	    @RequestMapping("/allTree")
	    @ResponseBody
	    public Object allMenu() {
	        return iPermissonService.selectAllMenu();
	    }

	    /**
	     * 查询所有的资源tree
	     */
	    @RequestMapping("/allTrees")
	    @ResponseBody
	    public Object allTree() {
	        return iPermissonService.selectAllTree();
	    }

	    /**
	     * 编辑资源页
	     *
	     * @param model
	     * @param id
	     * @return
	     */
	    @GetMapping("/editPage")
	    public String editPage(Model model, Long id) {
	       Permisson selectById = iPermissonService.selectById(id);
	        model.addAttribute("resource", selectById);
	        return "admin/permission/permissionEdit";
	    }

	    /**
	     * 编辑资源
	     *
	     * @param resource
	     * @return
	     */
	    @RequestMapping("/edit")
	    @ResponseBody
	    public Object edit(@Valid Permisson resource) {
	    	iPermissonService.updateById(resource);
	        return renderSuccess("修改成功");
	    }

	    /**
	     * 删除资源
	     *
	     * @param id
	     * @return
	     */
	    @RequestMapping("/delete")
	    @ResponseBody
	    public Object delete(Long id) {
	        iPermissonService.deleteById(id);
	        return renderSuccess("删除成功！");
	    }
	
}
