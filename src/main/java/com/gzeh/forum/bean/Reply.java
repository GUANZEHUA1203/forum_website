package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@TableName("tbl_reply")
public class Reply extends Model<Reply> {

    private static final long serialVersionUID = 1L;

    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="re_id",type=IdType.INPUT)
	private Long reId;
	@TableField("re_contxt")
	private String reContxt;
	@TableField("account_name")
	private String accountName;
	@TableField("re_data")
	private Date reData;


	public Long getReId() {
		return reId;
	}

	public void setReId(Long reId) {
		this.reId = reId;
	}

	public String getReContxt() {
		return reContxt;
	}

	public void setReContxt(String reContxt) {
		this.reContxt = reContxt;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Date getReData() {
		return reData;
	}

	public void setReData(Date reData) {
		this.reData = reData;
	}

	@Override
	protected Serializable pkVal() {
		return this.reId;
	}

}
