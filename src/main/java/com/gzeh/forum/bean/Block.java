package com.gzeh.forum.bean;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.KeySequence;
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
@TableName("tbl_block")
@KeySequence(value="SEQ_ORACLE_STRING_KEY",idClazz=String.class)
public class Block extends Model<Block> implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="bl_id",type=IdType.INPUT)
	private String blId;
	@TableField("bl_name")
	private String blName;
	@JsonSerialize(using=ToStringSerializer.class)
	@TableField("bl_parent")
	private String blParent;
    /**
     * 是否删除 0：未删除 1：已删除
     */
	@TableField("bl_isdelete")
	@TableLogic
	private Integer blIsdelete;
    /**
     * 创建时间
     */
	@TableField("bl_date")
	private Date blDate;
    /**
     * 版主
     */
	@TableField("bl_manager")
	private Long blManager;
	
	
	@TableField("bl_icon")
	private String blIcon;


	
	
	public String getBlIcon() {
		return blIcon;
	}

	public void setBlIcon(String blIcon) {
		this.blIcon = blIcon;
	}

	public String getBlId() {
		return blId;
	}

	public void setBlId(String blId) {
		this.blId = blId;
	}

	public String getBlName() {
		return blName;
	}

	public void setBlName(String blName) {
		this.blName = blName;
	}

	public String getBlParent() {
		return blParent;
	}

	public void setBlParent(String blParent) {
		this.blParent = blParent;
	}

	public Integer getBlIsdelete() {
		return blIsdelete;
	}

	public void setBlIsdelete(Integer blIsdelete) {
		this.blIsdelete = blIsdelete;
	}

	public Date getBlDate() {
		return blDate;
	}

	public void setBlDate(Date blDate) {
		this.blDate = blDate;
	}

	public Long getBlManager() {
		return blManager;
	}

	public void setBlManager(Long blManager) {
		this.blManager = blManager;
	}

	@Override
	protected Serializable pkVal() {
		return this.blId;
	}

}
