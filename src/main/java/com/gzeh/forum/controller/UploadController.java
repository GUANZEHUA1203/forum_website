package com.gzeh.forum.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.gzeh.forum.base.BaseController;
import com.gzeh.forum.common.annontation.AnnAuthType;
import com.gzeh.forum.common.annontation.AuthPermissions;
import com.gzeh.forum.util.OSSUnit;

@Controller
@RequestMapping("/")
public class UploadController extends BaseController {

    @Value("${uploadPath}")
    private String uploadPath;
    @Value("${uploadUrl}")
    private String uploadUrl;

/*    @RequestMapping("/upload")
    @AuthPermissions(authName= AnnAuthType.anon)
    @ResponseBody
    public Object upload(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        Map<String,Object> params= initAllHttpParams(request);
        String fileExtension = file.getFileItem().getName().substring(file.getFileItem().getName().lastIndexOf("."));
        String path = new SimpleDateFormat("yyyyMM/dd/HH/").format(new Date()) + RandomStringUtils.random(32,true,true)
                + fileExtension;
        File imgFile = new File(uploadPath + path);
        if(!imgFile.getParentFile().exists()){
            imgFile.getParentFile().mkdirs();
        }
        
        //用于判断文件接收是否完整
        String md5 = DigestUtils.md5DigestAsHex(file.getInputStream());
        if(params.containsKey("md5") && !params.get("md5").equals(md5)){
            return R.error("md5验证失败");
        }
        FileUtils.copyInputStreamToFile(file.getInputStream(),imgFile);
        return R.ok(params).put("path",path).put("pathAll",uploadUrl + path).put("md5",md5).put("uploadUrl",uploadUrl).put("size",file.getSize());
    }*/

   /* @RequestMapping("/ice/upload")
    @AuthPermissions(authName= AnnAuthType.anon)
    @ResponseBody
    public Object iceUpload(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
    	String respone = "";
        try {
        	respone = HttpColourLifeServer.getInstince().httpPostUpload(file.getSize() + "", file.getName(), file.getInputStream());
        	System.err.println("httpPostDevicePush=====>" + respone);
			JSONObject uploadJsonObject = JSONObject.parseObject(respone);
			if (uploadJsonObject == null || !uploadJsonObject.containsKey("code")
					|| !uploadJsonObject.get("code").toString().equals("0"))
				return R.error("上传失败:" + uploadJsonObject.get("message").toString());

			return R.ok("上传成功").data(uploadJsonObject.get("content"));
		} catch (Exception e) {
			e.printStackTrace();
			return R.error("上传失败:" + e.getMessage());
		}
    }*/

    @RequestMapping("/upload")
    @AuthPermissions(authName= AnnAuthType.anon)
    @ResponseBody
    public Object ownUpload(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request) throws IOException {
        try {
        	CommonsMultipartFile cf = (CommonsMultipartFile) file;  
            DiskFileItem fi = (DiskFileItem) cf.getFileItem();  
            InputStream fileContent = fi.getInputStream();
            String fileName = fi.getName();
         	String diskName = "datas/" ;
        	String path = OSSUnit.uploadFile(fileContent, diskName, fileName);
        	if (path == null)
        		return renderError("上传失败:path is null");
            System.err.println("=========>" + path);
			return renderSuccess(path);
		} catch (Exception e) {
			e.printStackTrace();
			return renderError(e.getMessage());
		}
    }
}
