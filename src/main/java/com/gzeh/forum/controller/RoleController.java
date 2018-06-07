package com.gzeh.forum.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.bean.Role;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.services.IPermissonService;
import com.gzeh.forum.services.IRolePermissionService;
import com.gzeh.forum.services.IRoleService;
import com.gzeh.forum.util.IdGenerator;
import com.gzeh.forum.util.StringUtils;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {
	
	
	 @Autowired
    IdGenerator idGenerator;

	@Autowired
	private IRoleService iRoleService;
	
	@Autowired 
	IRolePermissionService iRolePermissionService;
	
	@Autowired
	IPermissonService iPermissonService;
	
	

    /**
     * 添加权限页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/role/roleAdd";
    }

	
    @PostMapping("/add")
    @ResponseBody
    public Object add(String rolename,String description,String permisson,int seq,String status) {
    	Role r=new Role();
    	r.setRoId(idGenerator.nextId());
    	r.setRoName(rolename);
    	r.setRoDescription(description);
    	r.setSeq(seq);
    	r.setRoStatus(status);
    	iRoleService.insert(r);
    	return renderSuccess();
    }
    
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long roid) {
    	iRoleService.deleteById(roid);
    	return renderSuccess();
    }
    
    

    /**
     * 角色管理页
     *
     * @return
     */
    @GetMapping("/manager")
    public String manager() {
        return "admin/role/role";
    }
    
    @PostMapping("/list")
    @ResponseBody
    public Object selectRoles(){
    	Object selectTree = iRoleService.selectTree();
    	return selectTree;
    }
    
    
    @PostMapping(value="/pageinfo")
    @ResponseBody
    public Object dataGrid(Role role, Integer page, Integer rows, String sort, String order) {
	   PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(role.getRoName())) {
            condition.put("name", role.getRoName());
        }
        pageInfo.setCondition(condition);
        iRoleService.selectRolePageInfo(pageInfo);
        return pageInfo;
    }
    
    /**
     * 角色管理页-编辑
     *
     * @return
     */
    @GetMapping("/edit")
    public String xiugai(Model model, Long id) {
        Role role = iRoleService.selectById(id);
        model.addAttribute("role", role);
		return "admin/role/roleEdit";
    }
    
    
    @PostMapping("/update")
    @ResponseBody
    public Object update(Role r){
    	 iRoleService.updateById(r);
    	return renderSuccess("修改成功");
    }
    
    
    
    /**
     * 角色管理页-编辑
     *
     * @return
     */
    @GetMapping("/changePerimission")
    public String gant() {
        return "admin/role/roleGrant";
    }
    
    @PostMapping("/selectPermissionByRoleId")
    @ResponseBody
    public Object selectPermissionByRoleId(Long roleid){
    	List<Long> selectPermissionByRoleId = iRoleService.selectPermissionByRoleId(roleid);
    	return renderSuccess(selectPermissionByRoleId);
    }
    
    
    /**
     * 角色管理页-权限编辑页面
     *
     * @return
     */
    @GetMapping("/grantPage")
    public String grantPage(Model model, Long roleid) {
    	model.addAttribute("roleid", roleid);
        return "admin/role/roleGrant";
    }
    
    
    
    @PostMapping("/grant")
    @ResponseBody
    public Object update(Long roleid,String permissionid){
    	iRoleService.updateRolePermission(roleid, permissionid);
    	return "授权成功";
    }
    
    
	
}
