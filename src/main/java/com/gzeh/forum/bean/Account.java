package com.gzeh.forum.bean;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.gzeh.forum.util.LongJsonDeserializer;
import com.gzeh.forum.util.LongJsonSerializer;


/**
 * <p>
 * 
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@TableName("tbl_account")
public class Account extends Model<Account> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户表
     */
//    @JsonSerialize(using=LongJsonSerializer.class)
//    @JsonDeserialize(using = LongJsonDeserializer.class)
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="ac_id",type=IdType.INPUT)
	private Long acId;
    /**
     * 登录名称
     */
	@TableField("ac_login_name")
	private String acLoginName;
    /**
     * 真实名字
     */
	@TableField("ac_real_name")
	private String acRealName;
    /**
     * 邮箱
     */
	@TableField("ac_mail")
	private String acMail;
    /**
     * 账户密码
     */
	@TableField("ac_password")
	private String acPassword;
    /**
     * 性别
     */
	@TableField("ac_sex")
	private String acSex;
	
//	加盐
	@TableField("ac_salt")
	private String acSalt;
	
	@TableField("ac_lasttime")
	private Date lastTime;//最后发帖时间
	
	@TableField("ac_level")
	private Long level;//


		
	
	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public String getAcSalt() {
		return acSalt;
	}

	public void setAcSalt(String acSalt) {
		this.acSalt = acSalt;
	}

	public Account() {
		super();
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

	@Override
	protected Serializable pkVal() {
		return this.acId;
	}

	public Account(Long acId, String acLoginName, String acRealName, String acMail, String acPassword, String acSex) {
		super();
		this.acId = acId;
		this.acLoginName = acLoginName;
		this.acRealName = acRealName;
		this.acMail = acMail;
		this.acPassword = acPassword;
		this.acSex = acSex;
	}

	@Override
	public String toString() {
		return "Account [acId=" + acId + ", acLoginName=" + acLoginName + ", acRealName=" + acRealName + ", acMail="
				+ acMail + ", acPassword=" + acPassword + ", acSex=" + acSex + "]";
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}
	
	

}
