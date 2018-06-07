package com.gzeh.forum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.bean.Reply;
import com.gzeh.forum.services.IReplyService;
import com.gzeh.forum.util.StringUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Controller
@RequestMapping("/reply")
public class ReplyController extends BaseController {
	
	@Autowired
	private IReplyService replyService;
	
	
    @PostMapping("/getReplyByATid")
    @ResponseBody
    public Object getReplyInfo(String atid) {
    	List<Reply> replysByAtId = replyService.getReplysByAtId(StringUtil.getLong(atid));
    	return renderSuccess(replysByAtId);
    }
    
    
    @PostMapping("/addReply")
    @ResponseBody
    public Object add(String atid,String replycontxt) {
    	Reply r=new Reply();
    	r.setReId(idGenerator.nextId());
    	r.setReContxt(replycontxt);
    	r.setAccountName(getStaffName());
    	replyService.insert(r);
    	return renderSuccess();
    }

    @PostMapping("/edit")
	@ResponseBody
	public Object update(String recontxt,Long reid){
		Reply r=new Reply();
		r.setReContxt(recontxt);
		r.setReId(reid);
		boolean b = replyService.updateById(r);
		return renderSuccess("修改成功");
	}
}
