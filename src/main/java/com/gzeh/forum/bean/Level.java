package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
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
 * @since 2018-04-25
 */
@TableName("tbl_level")
public class Level extends Model<Level> {

    private static final long serialVersionUID = 1L;

    @JsonSerialize(using=ToStringSerializer.class)
	@TableId("le_id")
	private Integer leId;
	@TableField("le_name")
	private String leName;
	@TableField("le_option")
	private String leOption;
	@TableField("le_start")
	private String leStart;
	@TableField("le_end")
	private String leEnd;
	@TableField("le_icon")
	private String leIcon;


	public Integer getLeId() {
		return leId;
	}

	public void setLeId(Integer leId) {
		this.leId = leId;
	}

	public String getLeName() {
		return leName;
	}

	public void setLeName(String leName) {
		this.leName = leName;
	}

	public String getLeOption() {
		return leOption;
	}

	public void setLeOption(String leOption) {
		this.leOption = leOption;
	}

	public String getLeStart() {
		return leStart;
	}

	public void setLeStart(String leStart) {
		this.leStart = leStart;
	}

	public String getLeEnd() {
		return leEnd;
	}

	public void setLeEnd(String leEnd) {
		this.leEnd = leEnd;
	}

	public String getLeIcon() {
		return leIcon;
	}

	public void setLeIcon(String leIcon) {
		this.leIcon = leIcon;
	}

	@Override
	protected Serializable pkVal() {
		return this.leId;
	}

}
