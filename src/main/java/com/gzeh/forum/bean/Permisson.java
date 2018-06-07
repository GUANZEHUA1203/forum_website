package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author gzh
 * @since 2018-04-23
 */
@TableName("tbl_permisson")
public class Permisson extends Model<Permisson> {

    private static final long serialVersionUID = 1L;

    
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId("pe_id")
	private Long peId;
	@TableField("pe_name")
	private String peName;
	@TableField("pe_url")
	private String peUrl;
	@TableField("pe_open_mode")
	private String peOpenMode;
	@TableField("pe_description")
	private String peDescription;
	@TableField("pe_icon")
	private String peIcon;
	@TableField("pe_parent")
	private Long peParent;
	@TableField("pe_seq")
	private Integer peSeq;
	@TableField("pe_status")
	private Integer peStatus;
	@TableField("pe_opened")
	private Integer peOpened;
	@TableField("pe_resource_type")
	private Integer peResourceType;
	@TableField("pe_create_time")
	private Date peCreateTime;


	public Long getPeId() {
		return peId;
	}

	public void setPeId(Long peId) {
		this.peId = peId;
	}

	public String getPeName() {
		return peName;
	}

	public void setPeName(String peName) {
		this.peName = peName;
	}

	public String getPeUrl() {
		return peUrl;
	}

	public void setPeUrl(String peUrl) {
		this.peUrl = peUrl;
	}

	public String getPeOpenMode() {
		return peOpenMode;
	}

	public void setPeOpenMode(String peOpenMode) {
		this.peOpenMode = peOpenMode;
	}

	public String getPeDescription() {
		return peDescription;
	}

	public void setPeDescription(String peDescription) {
		this.peDescription = peDescription;
	}

	public String getPeIcon() {
		return peIcon;
	}

	public void setPeIcon(String peIcon) {
		this.peIcon = peIcon;
	}

	public Long getPeParent() {
		return peParent;
	}

	public void setPeParent(Long peParent) {
		this.peParent = peParent;
	}

	public Integer getPeSeq() {
		return peSeq;
	}

	public void setPeSeq(Integer peSeq) {
		this.peSeq = peSeq;
	}

	public Integer getPeStatus() {
		return peStatus;
	}

	public void setPeStatus(Integer peStatus) {
		this.peStatus = peStatus;
	}

	public Integer getPeOpened() {
		return peOpened;
	}

	public void setPeOpened(Integer peOpened) {
		this.peOpened = peOpened;
	}

	public Integer getPeResourceType() {
		return peResourceType;
	}

	public void setPeResourceType(Integer peResourceType) {
		this.peResourceType = peResourceType;
	}

	public Date getPeCreateTime() {
		return peCreateTime;
	}

	public void setPeCreateTime(Date peCreateTime) {
		this.peCreateTime = peCreateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.peId;
	}

}
