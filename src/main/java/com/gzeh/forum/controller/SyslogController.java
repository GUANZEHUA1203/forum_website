package com.gzeh.forum.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzeh.forum.bean.Syslog;
import com.gzeh.forum.bean.vo.AccountVo;
import com.gzeh.forum.common.result.PageInfo;
import com.gzeh.forum.services.ISyslogService;
import com.gzeh.forum.util.StringUtils;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author gzh
 * @since 2018-04-21
 */
@Controller
@RequestMapping("/syslog")
public class SyslogController {
	
	@Autowired
	ISyslogService iSyslogService;
	  /**
     * 用户管理页
     *
     * @return
     */
    @GetMapping("/manager")
    public String manager() {
        return "admin/syslog/syslog";
    }
    
    
    /**
     * 用户管理页
     *
     * @return
     */
    @ResponseBody
    @PostMapping("/list")
    public Object dataGrid(Syslog syslog, Integer page, Integer rows, String sort, String order) {
 	   PageInfo pageInfo = new PageInfo(page, rows, sort, order);
         Map<String, Object> condition = new HashMap<String, Object>();

//         if (StringUtils.isNotBlank(syslog.getLogId().toString())) {
//             condition.put("logid", syslog.getLogId());
//         }
//         if (accountVo.getCreatedateStart() != null) {
//             condition.put("startTime", accountVo.getCreatedateStart());
//         }
//         if (accountVo.getCreatedateEnd() != null) {
//             condition.put("endTime", accountVo.getCreatedateEnd());
//         }
         pageInfo.setCondition(condition);
         iSyslogService.getSyslogByPage(pageInfo);
         return pageInfo;
     }
}
