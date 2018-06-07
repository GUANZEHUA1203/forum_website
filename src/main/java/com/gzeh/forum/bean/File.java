package com.gzeh.forum.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;


/**
 * <p>
 * 
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@TableName("tbl_file")
public class File extends Model<File> {

    private static final long serialVersionUID = 1L;

	@TableId(value="fi_id",type=IdType.INPUT)
	private Long fiId;
	@TableField("fl_name")
	private String flName;
	@TableField("fl_date")
	private Date flDate;


	public Long getFiId() {
		return fiId;
	}

	public void setFiId(Long fiId) {
		this.fiId = fiId;
	}

	public String getFlName() {
		return flName;
	}

	public void setFlName(String flName) {
		this.flName = flName;
	}

	public Date getFlDate() {
		return flDate;
	}

	public void setFlDate(Date flDate) {
		this.flDate = flDate;
	}

	@Override
	protected Serializable pkVal() {
		return this.fiId;
	}

}
