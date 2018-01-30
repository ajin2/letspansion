<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="after.ReplyBoardDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="after.AfterDataBean"%>
<%@page import="after.AfterDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <%@ include file="setting.jsp"%>
      
      <link href="<%=project%>after/style.css" rel="stylesheet" type="text/css">
      <script src="/LetsPension/after/request.js"></script>
      <script src="/LetsPension/js/jquery-3.2.1.js"></script>
      
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/gambit-smoothscroll-min.js"></script>
      <script type="text/javascript" src="js/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="css/boards.css"/>
      
      
   </head>
</html>

<%
   request.setCharacterEncoding("utf-8");

   int am_num = (Integer) request.getAttribute( "am_num" );
   String pageNum = (String) request.getAttribute( "pageNum" );
   AfterDataBean afterDto = (AfterDataBean) request.getAttribute( "afterDto" );
   int re_num = (Integer) request.getAttribute( "re_num" );
   ArrayList<ReplyBoardDataBean> replyDto = (ArrayList<ReplyBoardDataBean>)request.getAttribute("replyDto");
%>

<script>
   $(document).ready(function(){
      alert("시작");
      makecomment();
   });

   var httpRequest = null;
   var number = 0;
   function insert() {
      alert("추가 시작");
      $('#inputform').attr('action', './insertReply.do');
      $('#inputform').submit();
   }
   
   
   function makecomment(){
      
      $('#listcomment').empty();
      <%
         for( int i=0; i<replyDto.size(); i++) {
            int replyNum = replyDto.get(i).getRe_num();
            String content = replyDto.get(i).getRe_content();
            String m_id = replyDto.get(i).getM_id();
            
      %>
         if ( "${sessionScope.memId}" == "<%=m_id%>" ){
            $('#listcomment').append(
               "<div id='re_"+<%=replyNum%>+"'>"
               +    "<table>"
               +       "<tr>"
               +         "<th style='width: 20px'>" + <%=replyNum%> + "</th>"
               +         "<th style='width: 50px' id='<%=m_id%>'><%=m_id%></th>"
               +         "<td>"
               +            "<p class='staticContent' id='re_content_<%=replyNum%>' name='re_content_<%=replyNum%>'><%=content%></p>"
               +            "<input type='text' class='editBoxContent' value='<%=content%>' style='display:none;'>"
               +         "</td>"
               +         "<th style='width: 200px'>"
               +            "<input class='inputbutton' type='button' value='수정' onclick='javascript:mod(<%=replyNum%>,<%=m_id%>,re_content_<%=replyNum%>)'>"
               +            "<input class='inputbutton' type='button' value='삭제' onclick='javascript:del("+<%=replyNum%>+")'>"
               +         "</th>"
               +      "</tr>"
               +    "</table>"
               +"</div>"
               );
         } else {
            $('#listcomment').append(
                  "<div>"
                  +    "<table>"
                  +       "<tr>"
                  +         "<th style='width: 20px'>" + <%=replyNum%> + "</th>"
                  +         "<th style='width: 50px'><%=m_id%></th>"
                  +         "<td>"
                  +            "<p class='staticContent'><%=content%></p>"
                  +            "<input type='text' class='editBoxContent' value='<%=content%>' style='display:none;'>"
                  +         "</td>"
                  +      "</tr>"
                  +    "</table>"
                  +"</div>"
                  );
         }
         <%
         }
       %>
   }
   
   // 글 삭제
   function del( replyNum ){
      
      $('input[name=re_num]').val( replyNum );
      
      $('#inputform').attr('action', './deleteReply.do');
      $('#inputform').submit();
   }
   
   // 글 수정
   function mod( replyNum, m_id, content ) {
      var content = document.getElementById("re_content_" + replyNum ).textContent;
      
        var m_id = document.getElementById("m_id").value;
        
         var newdiv = document.createElement("div");
         newdiv.innerHTML = "<form id='modifyform' name='modifyform' action=''>"
                     +"<input type='hidden' name='am_num' value='<%=afterDto.getAm_num()%>'>"
                     +"<input type='hidden' name='re_num' value='"+replyNum+"'>"
                     +"<table>"
                     +   "<tr>"
                     +      "<th> 아이디 </th>"
                     +      "<td> <input type='text' name='m_id' value='"+m_id+"' readonly> </td>"
                     +   "</tr>"
                     +   "<tr>"
                     +      "<th> 내용 </th>"
                     +      "<td> <input type='text' name='re_content' value='"+content+"'> </td>"
                     +   "</tr>"
                     +   "<tr>"
                     +      "<th colspan='3'>"
                     +         "<input type='button' value='수정' onclick='modify()'>"
                     +         "<input type='reset' value='취소'>"
                     +         "<input type='button' value='수정취소'>"
                     +      "</th>"
                     +   "</tr>"
                     +"</table>"
                     +"</form>";
                     
         newdiv.setAttribute("id", "rep_" + replyNum);
         
         var renum = document.getElementById("re_" + replyNum);
         renum.appendChild(newdiv);
      
   }
   
   function modify() {
      $('#modifyform').attr('action', './modifyReply.do');
      $('#modifyform').submit();
   }
   
</script>



<body onload="inputfocus()" id="talk">
    <div class="talk">
    <jsp:include page="/home/pensionHeader.jsp" flush="false"/>
      <div class="top_bg"><h3><span>후기</span></h3></div>
      <div class="board">
      <div class="snb">
      
      <div class="center">

<h2> <%=page_content%> </h2>
    

<table width="700px">
   <tr>
      <th style="width: 10%"> <%=str_writer%> </th>
      <td style="width: 10%" align="center"> 
         <%=afterDto.getM_id()%> 
      </td>
      <th style="width: 10%"> <%=str_readcount%> </th>
      <td style="width: 10%" align="center"> 
         <%=afterDto.getAm_readcount()%>
      </td>
   </tr>
   <tr>
      <th> <%=str_reg_date%> </th>
      <td colspan="3" align="center">
         <%
            SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm" );
         %>
         <%=sdf.format( afterDto.getAm_reg_date() )%>
      </td>
   </tr>
   <tr>
      <th> <%=str_subject%> </th>
      <td colspan="3">
         <%=afterDto.getAm_subject()%>
      </td>
   </tr>
   <tr>
      <th> <%=str_content%> </th>
      <td colspan="3">
         <pre><%=afterDto.getAm_content()%></pre>
      </td>
   </tr>
   <tr>
      <th colspan="4">
      <c:if test="${sessionScope.memId == afterDto.getM_id() }">
         <input class="inputbutton" type="button" value="<%=btn_modify%>"
            onclick="location='modifyView.do?am_num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
         <input class="inputbutton" type="button" value="<%=btn_delete%>"
            onclick="location='deletePro.do?am_num=<%=afterDto.getAm_num()%>&pageNum=<%=pageNum%>'">
         <input class="inputbutton" type="button" value="<%=btn_list%>"
            onclick="location='list.do?pageNum=<%=pageNum%>'">
      </c:if>
      <c:if test="${sessionScope.memId != afterDto.getM_id() }">
         <input class="inputbutton" type="button" value="<%=btn_list%>"
            onclick="location='list.do?pageNum=<%=pageNum%>'">
      </c:if>
      </th>
   </tr>
</table>

<!--  댓글 시작  -->


   <!-- 글 작성 -->
   <hr color="red" size="2" align="left" width="50%">
   <form action="" id="inputform" name="inputform">
      <input type="hidden" id="am_num" name="am_num" value="<%=afterDto.getAm_num()%>">
      <input type="hidden" id="pageNum" name="pageNum" value="<%=pageNum%>">
      <input type="hidden" name="re_num" value="">
      <!-- <input type="hidden" name="mid" value=""> -->
      <table>
         <tr>
            <th> 이름 </th>
            <td> <input class="input" type="text" id="m_id" name="m_id" value="${sessionScope.memId}" readonly> </td>
         </tr>
         <tr>
            <th> 내용 </th>
            <td>
               &nbsp;<textarea id="re_content" name="re_content" rows="3" cols="21"></textarea>
            </td>
         </tr>
         <tr>
            <th colspan="2">
               <input class="inputbutton" type="button" value="작성" onclick="insert()">
               <input class="inputbutton" type="reset" value="취소">
            </th>
         </tr>
      </table>
   </form>
   <br><br>
   
   <hr color="red" size="2" align="left" width="50%">
   <div id="result"></div>
   
   
   <!-- 글 목록 -->
   <!-- <div id="listcomment" style="display:'none'"> -->
   <form id="listcommentform">
   <div id="listcomment">
   </div>
   </form>
   <br><br>

<!-- 댓글 끝 -->

</div></div></div></div>

</body>


