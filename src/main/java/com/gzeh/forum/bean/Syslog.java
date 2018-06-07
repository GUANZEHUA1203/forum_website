package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import java.io.Serializable;
import java.util.Date;


/**
 * <p>
 * 
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@TableName("tbl_syslog")
public class Syslog extends Model<Syslog> {

    private static final long serialVersionUID = 1L;
    
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId("log_id")
	private Long logId;
	
	@TableField("account_id")
	private Long accountId;
	
	private String option;
	
	private String content;
	
	@TableField("create_time")
	private Date createTime;
	
	@TableField("client_ip")
	private String clientIp;


	public Long getLogId() {
		return logId;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public void setLogId(Long logId) {
		this.logId = logId;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	protected Serializable pkVal() {
		return this.logId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	

}
