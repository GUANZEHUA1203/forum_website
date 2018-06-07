package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
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
 * @since 2018-04-23
 */
@TableName("tbl_role_permission")
public class RolePermission extends Model<RolePermission> {

    private static final long serialVersionUID = 1L;

    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="rp_id",type=IdType.AUTO)
	private Long rpId;
	@TableField("ro_id")
	private Long roId;
	@TableField("pe_id")
	private Long peId;


	public Long getRpId() {
		return rpId;
	}

	public void setRpId(Long rpId) {
		this.rpId = rpId;
	}

	public Long getRoId() {
		return roId;
	}

	public void setRoId(Long roId) {
		this.roId = roId;
	}

	public Long getPeId() {
		return peId;
	}

	public void setPeId(Long peId) {
		this.peId = peId;
	}

	@Override
	protected Serializable pkVal() {
		return this.rpId;
	}

}
