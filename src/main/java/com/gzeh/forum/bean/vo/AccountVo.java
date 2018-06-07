package com.gzeh.forum.bean.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.gzeh.forum.bean.Account;
import com.gzeh.forum.bean.Role;
import com.gzeh.forum.util.JsonUtils;

/**
 * @description：UserVo
 * @author：zhixuan.wang
 * @date：2015/10/1 14:51
 */
public class AccountVo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	private Long acId;
	@NotBlank
	@Length(min = 4, max = 64)
	private String acLoginName;
	
	@JsonIgnore
	private String acRealName;
	
	private String acMail;
	
	private String acPassword;
	
	private String acSex;
	
//	加盐
	private String acSalt;

	private List<Role> rolesList;
	
	private String roles;

	
	private Date createdateStart;
	private Date createdateEnd;

	
	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getAcSalt() {
		return acSalt;
	}

	public void setAcSalt(String acSalt) {
		this.acSalt = acSalt;
	}

	public Long getAcId() {
		return acId;
	}

	public void setAcId(Long acId) {
		this.acId = acId;
	}

	public String getAcLoginName() {
		return acLoginName;
	}

	public void setAcLoginName(String acLoginName) {
		this.acLoginName = acLoginName;
	}

	public String getAcRealName() {
		return acRealName;
	}

	public void setAcRealName(String acRealName) {
		this.acRealName = acRealName;
	}

	public String getAcMail() {
		return acMail;
	}

	public void setAcMail(String acMail) {
		this.acMail = acMail;
	}

	public String getAcPassword() {
		return acPassword;
	}

	public void setAcPassword(String acPassword) {
		this.acPassword = acPassword;
	}

	public String getAcSex() {
		return acSex;
	}

	public void setAcSex(String acSex) {
		this.acSex = acSex;
	}

	public List<Role> getRolesList() {
		return rolesList;
	}

	public void setRolesList(List<Role> rolesList) {
		this.rolesList = rolesList;
	}

	/**
	 * 比较vo和数据库中的用户是否同一个user，采用id比较
	 * @param user 用户
	 * @return 是否同一个人
	 */
	public boolean equalsUser(Account user) {
		if (user == null) {
			return false;
		}
		Long userId = user.getAcId();
		if (acId == null || userId == null) {
			return false;
		}
		return acId.equals(userId);
	}

	
	
	public Date getCreatedateStart() {
		return createdateStart;
	}

	public void setCreatedateStart(Date createdateStart) {
		this.createdateStart = createdateStart;
	}

	public Date getCreatedateEnd() {
		return createdateEnd;
	}

	public void setCreatedateEnd(Date createdateEnd) {
		this.createdateEnd = createdateEnd;
	}

	@Override
	public String toString() {
		return JsonUtils.toJson(this);
	}
}