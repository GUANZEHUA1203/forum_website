package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
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
@TableName("tbl_role")
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId("ro_id")
	private Long roId;
	@TableField("ro_name")
	private String roName;
	@TableField("ro_status")
	private String roStatus;
	@TableField("ro_description")
	private String roDescription;
    /**
     * 序号
     */
	private Integer seq;


	public Long getRoId() {
		return roId;
	}

	public void setRoId(Long roId) {
		this.roId = roId;
	}

	public String getRoName() {
		return roName;
	}

	public void setRoName(String roName) {
		this.roName = roName;
	}

	public String getRoStatus() {
		return roStatus;
	}

	public void setRoStatus(String roStatus) {
		this.roStatus = roStatus;
	}

	public String getRoDescription() {
		return roDescription;
	}

	public void setRoDescription(String roDescription) {
		this.roDescription = roDescription;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	@Override
	protected Serializable pkVal() {
		return this.roId;
	}

}
