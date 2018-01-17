<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ include file="setting.jsp" %>
   <script src="${project}member/script.js"></script>

      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<style type="text/css">

div #b{
margin-left:15%;
}
</style>

   <body onload="findfocus()">
   <div class="col-md-12">
      <div class="page-header">
         <h1 align="center"> ${page_findId} <small> LetsBand </small> </h1>
      </div>
      <form class="form-horizontal" method="post" name="findform" action="logonFindIdPro.do" onsubmit="return findcheck()">
      <div class="form-group">
         <label class="col-sm-3 control-label" id="b">${str_name}</label>
      <div class="col-sm-2">
         <input class="form-control" type="text" name="name" placeholder="이름" autofocus>
      </div>
      </div>
      <div class="form-group">
         <label class="col-sm-3 control-label" for="inputEmail" id="b">${str_email}</label>
      <div class="col-sm-2">
         <input type="text" class="form-control" name="email" placeholder="이메일">
      </div>
      <br>
      <br>
      <br>
      <div class="form-group">
         <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">${btn_find}</button>
            <button class="btn btn-primary" type="reset">${btn_cancel}</button>
             <button class="btn btn-primary" type="button" onclick="location='logonMain.do'">${btn_find_cancel}</button>
         </div>
      </div>
      </div>
      </form>
   </div>
   </body>