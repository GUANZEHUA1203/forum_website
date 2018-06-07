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
@TableName("tbl_block_summary")
public class BlockSummary extends Model<BlockSummary> {

    private static final long serialVersionUID = 1L;

    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="bs_id",type=IdType.INPUT)
	private Long bsId;
	@TableField("bs_block")
	private Long bsBlock;
	@TableField("bs_account")
	private Long bsAccount;
    /**
     * 最后发帖人
     */
	@TableField("bs_lastman")
	private String bsLastman;
	@TableField("bs_lasttime")
	private Date bsLasttime;


	public Long getBsId() {
		return bsId;
	}

	public void setBsId(Long bsId) {
		this.bsId = bsId;
	}

	public Long getBsBlock() {
		return bsBlock;
	}

	public void setBsBlock(Long bsBlock) {
		this.bsBlock = bsBlock;
	}

	public Long getBsAccount() {
		return bsAccount;
	}

	public void setBsAccount(Long bsAccount) {
		this.bsAccount = bsAccount;
	}

	public String getBsLastman() {
		return bsLastman;
	}

	public void setBsLastman(String bsLastman) {
		this.bsLastman = bsLastman;
	}

	public Date getBsLasttime() {
		return bsLasttime;
	}

	public void setBsLasttime(Date bsLasttime) {
		this.bsLasttime = bsLasttime;
	}

	@Override
	protected Serializable pkVal() {
		return this.bsId;
	}

}
