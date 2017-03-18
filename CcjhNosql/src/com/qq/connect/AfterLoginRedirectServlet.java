package com.qq.connect;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.lsp.pub.dao.BaseDao;
import com.lsp.pub.db.MongoSequence;
import com.lsp.pub.entity.PubConstants;
import com.lsp.pub.upload.FtpUtils;
import com.lsp.pub.upload.JsonUtil;
import com.lsp.pub.util.DownloadImage;
import com.lsp.pub.util.EncodeUtils;
import com.lsp.pub.util.SysConfig;
import com.lsp.pub.util.UniObject;
import com.lsp.weixin.entity.WxUser;
import com.mongodb.DBObject;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.PageFans;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.PageFansBean;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.javabeans.weibo.Company;
import com.qq.connect.oauth.Oauth;
/**
 * QQ登录验证
 * @author lsp
 *
 */
public class AfterLoginRedirectServlet extends HttpServlet { 
	private BaseDao baseDao;
	private MongoSequence mongoSequence;
	private ApplicationContext applicationContext; 
	public void init(ServletConfig config) throws ServletException {  
        super.init(config);  
        applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());  
        baseDao = (BaseDao) applicationContext.getBean("baseDao"); 
        mongoSequence = (MongoSequence) applicationContext.getBean("mongoSequence");  
    }  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        doPost(request, response);
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        response.setContentType("text/html; charset=utf-8");
            System.out.println(request.getSession().getAttribute("tag"));
	        PrintWriter out = response.getWriter();
	        
	        
	        try {
	            AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);

	            String accessToken   = null,
	                   openID        = null;
	            long tokenExpireIn = 0L;
 
	            if (accessTokenObj.getAccessToken().equals("")) {
                 //	  我们的网站被CSRF攻击了或者用户取消了授权
                 //	   做一些数据统计工作
	                System.out.print("没有获取到响应参数");
	            } else {
	                accessToken = accessTokenObj.getAccessToken();
	                tokenExpireIn = accessTokenObj.getExpireIn();

	                request.getSession().setAttribute("demo_access_token", accessToken);
	                request.getSession().setAttribute("demo_token_expirein", String.valueOf(tokenExpireIn));

	                // 利用获取到的accessToken 去获取当前用的openid -------- start
	                OpenID openIDObj =  new OpenID(accessToken);
	                openID = openIDObj.getUserOpenID();
    
	                UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
	                UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
	              
	                HashMap<String, Object>whereMap=new HashMap<String, Object>();
	                whereMap.put("qqfromUser",openID);
	    	        DBObject  db= baseDao.getMessage(PubConstants.DATA_WXUSER, whereMap);
	    	        System.out.println("qq///"+request.getSession().getAttribute("custid"));
	    	        if(db!=null){
	    	        	//已注册 
	    	        	//验证头像和昵称
	    	        	if(db.get("headimgurl")==null||db.get("nickname")==null||db.get("nickname").toString().equals("游客")||db.get("headimgurl").toString().indexOf("http")>=0||db.get("headimgurl").toString().indexOf("D:")>=0){
	    	        		//更新
	    	        		
	    	        		WxUser  obj=(WxUser) UniObject.DBObjectToObject(db,WxUser.class);
	    	        		obj.setHeadimgurl(updateimg(userInfoBean.getAvatar().getAvatarURL100(),openID));
	    	        		baseDao.insert(PubConstants.DATA_WXUSER, obj);
	    	        	}
	    	        	request.getSession().setAttribute("qqfromUser",db.get("qqfromUser").toString());
                        request.getSession().setAttribute("fromUserid",db.get("_id").toString());
                        request.getSession().setAttribute("custid", request.getSession().getAttribute("custid"));
	    	        }else{
	    	        	//未注册
	    	        	WxUser  obj=new WxUser();
	    	        	String id=UUID.randomUUID().toString();
	    	        	obj.set_id(id);
	    	        	obj.setQqfromUser(openID);
	    	        	if(userInfoBean.getRet()==0){
	    	        		obj.setIsqqhz(userInfoBean.isYellowYearVip());
		    	        	obj.setIsqqvip(userInfoBean.isVip());
		    	        	obj.setQqHzdj(userInfoBean.getLevel());
		    	        	obj.setSex(userInfoBean.getGender());
		    	        	obj.setNickname(userInfoBean.getNickname());
		    	        	obj.setCreatedate(new Date());
		    	        	if(StringUtils.isNotEmpty(userInfoBean.getAvatar().getAvatarURL100())){
		    	        		obj.setHeadimgurl(updateimg(userInfoBean.getAvatar().getAvatarURL100(),openID));  
		    	        	}
	    	        	}
	    	           baseDao.insert(PubConstants.DATA_WXUSER, obj);
	    	           request.getSession().setAttribute("qqfromUser",openID);
	    	           request.getSession().setAttribute("fromUserid",id);
	    	           request.getSession().setAttribute("custid", request.getSession().getAttribute("custid"));
	    	            
	    	        }
	               
                      request.getRequestDispatcher("/"+request.getSession().getAttribute("tag")+".action").forward(request, response);
	 
	               
	            }
	        } catch (QQConnectException e) {
	        } catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    public   String  updateimg(String url,String qqfromUser){
	    	
	    	 
			try {
				if(StringUtils.isNotEmpty(url)){
					String path="logo_"+qqfromUser+".jpg";
					String savePath=SysConfig.getProperty("imgpath")+"/"+path;
				 
					DownloadImage.download(url, savePath);
					File file=new File(savePath);
					
					if(SysConfig.getProperty("isossup").equals("1")){
						 
					}else if(SysConfig.getProperty("isossup").equals("2")){
						FileInputStream localObject1 = new FileInputStream(file);
						
						FTPClient ftp=FtpUtils.getFtpClient(SysConfig.getProperty("ftp"), SysConfig.getProperty("ftpname"), SysConfig.getProperty("ftppwd"),Integer.parseInt(SysConfig.getProperty("ftpport")));
						FtpUtils.uploadImageToFTP(localObject1, ftp, "/"+path);
						FtpUtils.closeFtp(ftp); 
					}else if(SysConfig.getProperty("isossup").endsWith("3")){
						//跨域
						//添加文件到缓存 
						FileInputStream localObject1 = new FileInputStream(file);
						
						JsonUtil.Add(new String[]{"file","FileName","ContentType"},new Object[]{EncodeUtils.base64Encode(JsonUtil.readBytes(localObject1)),path,"img"});
					 	//返回保存的路径
						JsonUtil.UploadFile();
						
						 
					}else{
						 
					} 
					return path;
				}
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	    	 
	    	
	    }
}
