package com.qq.connect;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qq.connect.oauth.Oauth;
/***
 * 资源管理
 * @author lsp
 *
 */
public class IndexServlet  extends HttpServlet {

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        response.setContentType("text/html;charset=utf-8"); 
	        request.getSession().setAttribute("tag",request.getParameter("tag"));
	        request.getSession().setAttribute("custid",request.getParameter("custid"));
	        try {
	            response.sendRedirect(new Oauth().getAuthorizeURL(request));
	        } catch (QQConnectException e) {
	            e.printStackTrace();
	        }
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        doGet(request,  response);
	    }
}
