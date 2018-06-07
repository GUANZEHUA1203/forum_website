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
@TableName("tbl_account_role")
public class AccountRole extends Model<AccountRole> {

    private static final long serialVersionUID = 1L;
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId("ar_id")
	private Long arId;
    /**
     * 账户id
     */
	@TableField("ac_id")
	private Long acId;
    /**
     * 角色id
     */
	@TableField("ro_id")
	private Long roId;


	public Long getArId() {
		return arId;
	}

	public void setArId(Long arId) {
		this.arId = arId;
	}

	public Long getAcId() {
		return acId;
	}

	public void setAcId(Long acId) {
		this.acId = acId;
	}

	public Long getRoId() {
		return roId;
	}

	public void setRoId(Long roId) {
		this.roId = roId;
	}

	@Override
	protected Serializable pkVal() {
		return this.arId;
	}

}
