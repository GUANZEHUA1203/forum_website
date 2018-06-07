package com.gzeh.forum.shiro;


import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.Sets;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.services.IAccountService;
import com.gzeh.forum.services.IRoleService;

/**
 * @description：shiro权限认证
 * @author：zhixuan.wang
 * @date：2015/10/1 14:51
 */
public class ShiroDbRealm extends AuthorizingRealm {
    private static final Logger LOGGER = LogManager.getLogger(ShiroDbRealm.class);

    @Autowired 
    private IAccountService iAccountService;
    @Autowired 
    private IRoleService iRoleService;
    
    public ShiroDbRealm(CacheManager cacheManager, CredentialsMatcher matcher) {
        super(cacheManager, matcher);
    }
    
    /**
     * Shiro登录认证(原理：用户提交 用户名和密码  --- shiro 封装令牌 ---- realm 通过用户名将密码查询返回 ---- shiro 自动去比较查询出密码和用户输入密码是否一致---- 进行登陆控制 )
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken authcToken) throws AuthenticationException {
        LOGGER.info("Shiro开始登录认证");
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        AccountVo uservo = new AccountVo();
        uservo.setAcLoginName(token.getUsername());
        List<Account> list = iAccountService.selectByLoginName(uservo);
        // 账号不存在
        if (list == null || list.isEmpty()) {
            return null;
        }
        Account user = list.get(0);
        // 读取用户的url和角色
        Map<String, List<String>> resourceMap = iRoleService.selectPermissionMapByUserId(user.getAcId());
        List<String> urls = resourceMap.get("urls");
        List<String> roles = resourceMap.get("roles");
        ShiroUser shiroUser = new ShiroUser(user.getAcId(), user.getAcLoginName(), user.getAcRealName(), urls);
        shiroUser.setRoles(roles);
        // 认证缓存信息
        return new SimpleAuthenticationInfo(shiroUser, user.getAcPassword().toCharArray(), 
                ShiroByteSource.of(user.getAcSalt()), getName());
    }

    /**
     * Shiro权限认证
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(
            PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        List<String> roles = shiroUser.getRoles();
        HashSet<String> newHashSet = Sets.newHashSet();
        for (String string : roles) {
        	newHashSet.add(string);
		}
        info.setRoles(newHashSet);
        info.addStringPermissions(shiroUser.getUrlSet());
        
        return info;
    }

    @Override
    protected Object getAuthenticationCacheKey(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) super.getAvailablePrincipal(principals);
        return shiroUser.toString();
    }

    @Override
    protected Object getAuthorizationCacheKey(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) super.getAvailablePrincipal(principals);
        return shiroUser.toString();
    }

    /**
     * 清除用户缓存
     * @param shiroUser
     */
    public void removeUserCache(ShiroUser shiroUser){
        removeUserCache(shiroUser.getLoginName());
    }

    /**
     * 清除用户缓存
     * @param loginName
     */
    public void removeUserCache(String loginName){
        SimplePrincipalCollection principals = new SimplePrincipalCollection();
        principals.add(loginName, super.getName());
        super.clearCachedAuthenticationInfo(principals);
    }
}
