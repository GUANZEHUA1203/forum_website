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
@TableName("tbl_aticle")
public class Aticle extends Model<Aticle> {

    private static final long serialVersionUID = 1L;

    /**
     * 帖子表
     */
    @JsonSerialize(using=ToStringSerializer.class)
	@TableId(value="at_id",type=IdType.INPUT)
	private Long atId;
    /**
     * 帖子标题
     */
	@TableField("at_title")
	private String atTitle;
    /**
     * 发帖人
     */
	@TableField("acount_id")
	private Long acountId;
    /**
     * 帖子内容
     */
	@TableField("at_content")
	private String atContent;
    /**
     * 发帖时间
     */
	@TableField("at_data")
	private Date atData;
    /**
     * 所属模块
     */
	@TableField("block_id")
	private Long blockId;


	
	
	public Aticle() {
		super();
	}

	
	public Aticle(Long atId, String atTitle, Long acountId,String atContent, Long blockId) {
		super();
		this.atId = atId;
		this.atTitle = atTitle;
		this.acountId = acountId;
		this.atContent = atContent;
		this.blockId = blockId;
	}


	public Aticle(String atTitle, Long acountId, String atContent, Date atData, Long blockId) {
		super();
		this.atTitle = atTitle;
		this.acountId = acountId;
		this.atContent = atContent;
		this.atData = atData;
		this.blockId = blockId;
	}

	public Long getAtId() {
		return atId;
	}

	public void setAtId(Long atId) {
		this.atId = atId;
	}

	public String getAtTitle() {
		return atTitle;
	}

	public void setAtTitle(String atTitle) {
		this.atTitle = atTitle;
	}

	public Long getAcountId() {
		return acountId;
	}

	public void setAcountId(Long acountId) {
		this.acountId = acountId;
	}

	public String getAtContent() {
		return atContent;
	}

	public void setAtContent(String atContent) {
		this.atContent = atContent;
	}

	public Date getAtData() {
		return atData;
	}

	public void setAtData(Date atData) {
		this.atData = atData;
	}

	public Long getBlockId() {
		return blockId;
	}

	public void setBlockId(Long blockId) {
		this.blockId = blockId;
	}

	@Override
	protected Serializable pkVal() {
		return this.atId;
	}


	@Override
	public String toString() {
		return "Aticle [atId=" + atId + ", atTitle=" + atTitle + ", acountId=" + acountId + ", atContent=" + atContent
				+ ", atData=" + atData + ", blockId=" + blockId + "]";
	}
	
	
	

}
