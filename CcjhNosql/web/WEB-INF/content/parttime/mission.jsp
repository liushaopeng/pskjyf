<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webcom/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="/webcom/meta.jsp"%>
<%@include file="/webcom/bracket.jsp"%>
<%@include file="/webcom/jquery.validate_js.jsp"%>
<script src="${contextPath}/UserInterface/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/media/js/DT_bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/mvccol/js/jquery.form.js"></script>
<script type="text/javascript">

function del(id) {
	if (confirm('确实要删除吗?')) {
		location.href = "${contextPath}/parttime/mission!delete.action?_id="
				+ id+"&fypage=${fypage}";
	}
} 
function page_submit(num){
	
	if(num==-1){
		$("#fypage").val(0);	
	}else if(num==-2){
		$("#fypage").val($("#fypage").val()-1);	
	}else{
		$("#fypage").val(num);	
	}

	$("#custinfoForm").submit();
}
 

 </script>

 
</head>

<body>

<section>

  <%@include file="/webcom/header-bracket.jsp"%>

  <div class="mainpanel">
	<%@include file="/webcom/header-headerbar.jsp"%>
    
    
    
   
    
	<form  id="custinfoForm" name="custinfoForm" method="post"  action="${contextPath}/parttime/mission.action?" >
    
    <div class="pageheader">
      
      <h2><i class="fa fa-user"></i> 微网站 <span>劳务管理</h2>
      
      <div class="breadcrumb-wrapper1">
          <div class="input-group ">
              <div style="border-radius:3px; height:40px;padding-left:10px;" class="btn-primary">
                  <a href="javascript:qrcode('${ctxurl}/parttime/mission!index.action?custid=${custid}&lscode=${lscode}');"style="color: #ffffff;line-height:25px;">
                     预览&nbsp;<i class="fa fa-mail-reply-all"style="line-height:30px;font-size: 14px;"></i>
                  </a>
              </div>
          </div>
      </div>
    </div>
   <div class="panelss ">
   <div class="panel-body fu10">
       
    </div><!-- panel-body -->
	</div><!-- panel -->

    <div class="panel-body">
      <div class="row">
		<div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-striped table-primary mb30" >
                    <thead>
                      <tr> 
                       	<th class="th5">标题</th> 
                        <th class="th6">日期</th>
                         
						
						<th class="th5">操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="bean">
                      <tr>  
                        <td>${bean.title}</td> 
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${bean.createdate}" /></td>
                         
                        <td class="table-action">
                              
                              <div class="btn-group1">
                                  <a data-toggle="dropdown" class="dropdown-toggle">
                                      <i class="fa fa-cog"></i>
                                  </a>
                                  <ul role="menu" class="dropdown-menu pull-right">
                                   
                                   
                                    
                                  </ul>
                              </div>
                          </td>
                      </tr>
                      </c:forEach>
 
                </table>
                <%@include file="/webcom/bracket-page.jsp"%>
                
            </div>
        </div>
      </div>
		
    </div><!-- contentpanel -->
	</form>
  </div><!-- mainpanel -->
</section>
<%@include file="/webcom/preview.jsp"%>

</body>
</html>
