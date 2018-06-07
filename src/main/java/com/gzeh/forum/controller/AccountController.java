package com.gzeh.forum.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.base.annotation.AnnAuthType;
import com.gzeh.forum.base.annotation.AuthPermissions;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.Role;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.csrf.CsrfToken;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.shiro.PasswordHash;
import com.gzeh.forum.shiro.cache.captcha.DreamCaptcha;
import com.gzeh.forum.util.StringUtils;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Controller
public class AccountController extends BaseController {
	@Autowired
	DreamCaptcha dreamCaptcha;
	
	@Autowired
	IAccountService iAccountService;
	
    @Autowired
    private PasswordHash passwordHash;
	
	
    @GetMapping("/")
    @AuthPermissions(authName = AnnAuthType.anon)
    public String index() {
        return "redirect:/index";
    }
    @GetMapping("/index")
    @AuthPermissions(authName = AnnAuthType.anon)
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/login")
    @CsrfToken(create = true)
    @AuthPermissions(authName = AnnAuthType.anon)
    public String login() {
        logger.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index";
        }
        return "login";
    }
    
    @PostMapping("/account/register")
    @ResponseBody
    @AuthPermissions(authName = AnnAuthType.anon)
    public Object register(@Valid AccountVo userVo) {
        List<Account> list = iAccountService.selectByLoginName(userVo);
        if (list != null && !list.isEmpty()) {
            return renderError("登录名已存在!");
        }
        userVo.setAcId(new Random().nextLong());
        String salt = StringUtils.getUUId();
        String pwd = passwordHash.toHex(userVo.getAcPassword(), salt);
        userVo.setAcSalt(salt);
        userVo.setAcPassword(pwd);
        
        iAccountService.insertAccountvo(userVo);
        return renderSuccess("添加成功");
    }
    
	
	/**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return {Object}
     */
    @PostMapping("/account/login")
    @CsrfToken(remove = true)
    @ResponseBody
    @AuthPermissions(authName = AnnAuthType.anon)
    public Object loginPost(HttpServletRequest request, HttpServletResponse response,
            String username, String password, String captcha, 
            @RequestParam(value = "rememberMe", defaultValue = "0") Integer rememberMe) {
        logger.info("POST请求登录");
        // 改为全部抛出异常，避免ajax csrf token被刷新
        if (StringUtils.isBlank(username)) {
            throw new RuntimeException("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            throw new RuntimeException("密码不能为空");
        }
        if (StringUtils.isBlank(captcha)) {
            throw new RuntimeException("验证码不能为空");
        }
        if (!dreamCaptcha.validate(request, response, captcha)) {
            throw new RuntimeException("验证码错误");
        }
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 设置记住密码
        token.setRememberMe(1 == rememberMe);
        try {
            user.login(token);
            updateLevel(5);
            return renderSuccess("欢迎登录，积分+5");
        } catch (UnknownAccountException e) {
            throw new RuntimeException("账号不存在！", e);
        } catch (DisabledAccountException e) {
            throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
            throw new RuntimeException("密码错误！", e);
        } catch (Throwable e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }
    
    /**
     * 退出
     * @return {Result}
     */
    @PostMapping("/logout")
    @ResponseBody
    public Object logout() {
        logger.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return renderSuccess();
    }
    
    /**
     * 用户管理页
     *
     * @return
     */
    @GetMapping("/account/manager")
    public String manager() {
        return "admin/user/user";
    }
    
    /**
     * 编辑用户页
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long acid) {
        AccountVo selectVoById = iAccountService.selectVoById(acid);
        List<Role> rolesList = selectVoById.getRolesList();
        List<Long> ids = new ArrayList<Long>();
        for (Role role : rolesList) {
            ids.add(role.getRoId());
        }
        model.addAttribute("roleIds", ids);
        model.addAttribute("user", selectVoById);
        return "admin/user/userEdit";
    }
    
    
    /**
     * 添加用户页
     *
     * @return
     */
    @GetMapping("/account/addPage")
    public String addPage() {
        return "admin/user/userAdd";
    }

    
    /**
     * 修改密码页
     *
     * @return
     */
    @GetMapping("/account/editPwdPage")
    public String editPwdPage() {
        return "admin/user/userEditPwd";
    }
    
    @PostMapping(value="/account/add")
    @ResponseBody
    public Object add(@Valid AccountVo accountVo) {
    	List<Account> selectByLoginName = iAccountService.selectByLoginName(accountVo);
    	if(selectByLoginName.size()>0){
    		return renderError("用户已添加");
    	}
	   String salt = StringUtils.getUUId();
       String pwd = passwordHash.toHex(accountVo.getAcPassword(), salt);
       accountVo.setAcSalt(salt);
       accountVo.setAcPassword(pwd);
       iAccountService.insertAccountvo(accountVo);
       return renderSuccess("添加成功");
    }
    
    
    @PostMapping(value="/account/list")
    @ResponseBody
    public Object dataGrid(AccountVo accountVo, Integer page, Integer rows, String sort, String order) {
	   PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(accountVo.getAcLoginName())) {
            condition.put("name", accountVo.getAcLoginName());
        }
        if (accountVo.getCreatedateStart() != null) {
            condition.put("startTime", accountVo.getCreatedateStart());
        }
        if (accountVo.getCreatedateEnd() != null) {
            condition.put("endTime", accountVo.getCreatedateEnd());
        }
        pageInfo.setCondition(condition);
        iAccountService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    @PostMapping(value="/account/update")
    @ResponseBody
    public Object update(@Valid AccountVo accountVo) {
    	 List<Account> selectByLoginName = iAccountService.selectByLoginName(accountVo);
        if (selectByLoginName != null && !selectByLoginName.isEmpty()) {
            return renderError("登录名已存在!");
        }
        // 更新密码
        if (StringUtils.isNotBlank(accountVo.getAcPassword())) {
            Account user = iAccountService.selectById(accountVo.getAcId());
            String salt = user.getAcSalt();
            String pwd = passwordHash.toHex(accountVo.getAcPassword(), salt);
            accountVo.setAcPassword(pwd);
        }
        iAccountService.updateByVo(accountVo);
        return renderSuccess("修改成功！");
    }
    
    
    @PostMapping(value="/account/del")
    @ResponseBody
    public Object delete(@RequestParam(value="acid") Long acid) {
    	if(acid==getUserId()){
    		return renderError("不能自己删除自己");
    	}
    	iAccountService.deleteById(acid);
		return renderSuccess("删除成功");
    }
    
    

	
}
