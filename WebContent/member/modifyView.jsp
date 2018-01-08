<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="setting.jsp"%>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>


<h2> ${page_modify} </h2>

<c:if test="${result == 1}">
		<body onload="viewfocus()">
			<form name="viewform" method="post" action="logonModifyPro.do"
				onsubmit="return viewcheck()">
				<table>
					<tr>
						<th colspan="2">
							${msg_modifyview}
						</th>	
					</tr>
					<tr>
						<th> ${str_id} </th>
						<td> &nbsp;${memberDto.m_id} </td>						
					</tr>
					<tr>
						<th rowspan="2"> ${str_passwd} </th>
						<td>
							<input class="input" type="password" name="passwd"
								maxlength="15" value="${memberDto.m_passwd}">
						</td>
					</tr>
					<tr>
						<td>
							<input class="input" type="password" name="repasswd"
								maxlength="15" value="${memberDto.m_passwd}">
						</td>
					</tr>
					<tr>
						<th> ${str_name} </th>
						<td> &nbsp;${memberDto.m_name} </td>
					</tr>
					<tr>
						<th> ${str_tel} </th>
						<td>							
							<c:if test="${memberDto.m_tel == null or memberDto.m_tel == ''}">
								<input class="input" type="text" name="tel1"
									maxlength="15" style="width: 28px">
							</c:if>
							<c:if test="${memberDto.m_tel != null and memberDto.m_tel != ''}">
								<input class="input" type="text" name="tel1"
									maxlength="15" style="width: 28px" value="${t[0]}">
							</c:if>					
						</td>
					</tr>
					<tr>
						<th> ${str_email} </th>
						<td>
							<c:if test="${memberDto.m_email == null or memberDto.m_email == ''}">
								<input class="input" type="text" name="email1"
									maxlength="15" style="width:100px">
								@<input class="input" type="text" name="email2"
									maxlength="15" style="width:100px">
							</c:if>									
							<c:if test="${memberDto.m_email != null and memberDto.m_email != ''}">
								<c:set var="e" value="${fn:split( memberDto.m_email, '@') }"/>
								<input class="input" type="text" name="email1"
									maxlength="20" value="${e[0]}" style="width:100px">
								@ <input class="input" type="text" name="email2"
									maxlength="20" value="${e[1]}" style="width:100px">									
							</c:if>
						</td>
					</tr>
					<tr>					
						<th> ${str_reg_date} </th>
						<td>
							&nbsp;<fmt:formatDate value="${memberDto.m_regdate}"
									type="both" pattern="yyyy-MM-dd HH:mm"/>							
						</td>
					</tr>
					<tr>	
						<th colspan="2"> 
							<input class="inputbutton" type="submit" 
								value="${btn_mod}">
							<input class="inputbutton" type="reset"
								value="${btn_cancel}">
							<input class="inputbutton" type="button"
								value="${btn_mod_cancel}" onclick="location='pensionHome.do'">							
						</th>
					</tr>					
				</table>			
			</form>		
		</body>		
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasserror );
		//-->
	</script>		
</c:if>







