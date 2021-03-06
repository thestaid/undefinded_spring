<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>무엇이든지 물어보세요</title>
<script src="${pageContext.request.contextPath }/
   SmartEditor/js/HuskyEZCreator.js"></script>
<style>
	
   .commentTop{
      background-color: #e2583e; 
      color: #fff;
      height: 20px;
   }
   .commentFooter_a{
       text-decoration: none;
       font-weight: bold;
       color:black;
   }
   .signup-form{
      height: 200px;
   }
   #writer{
      margin: 10px 0px 10px 6px;
   }
   iframe{
      background-color:white;
   }
   #visitorId{
      margin-top:30px;
      width:300px;
      border:none;
      background-color: #fff;
      font-size:15px;
      font-weight:bold;
   }
   .container{
      margin: auto;
      width:80%;
   }
   .boardListForm{
      margin:200px 20px 100px 20px;
      width:60%;
   }   
   h3{
      font-weight:bolder;      
      margin-top:50px; 
      margin-bottom:30px;
      padding-bottom:10px;
      border-bottom: 2px solid gray; 
   }
   
</style>
<jsp:include page="../ui/myResource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../ui/navbar.jsp">
   <jsp:param value="visitors" name="active"/>
</jsp:include>
   <div class="mainContent">
      <div class="boardListForm">
      <h3><strong>무엇이든지 물어보세요</strong></h3>
      <div class="insertform">
         <%-- 아이디 로그인시 default값에서 로그인 아이디로 바뀐다. --%>
         <form action="<c:choose><c:when test="${empty id }">javascript:visitorLoginCheck()</c:when>
         <c:otherwise>insert.do</c:otherwise></c:choose>" method="post" class="commentInsertForm">
            <input type="hidden" name="writer" value="<c:choose><c:when test="${empty id}">로그인 하시면 글 작성이 가능해요 :)</c:when><c:otherwise>${id }</c:otherwise></c:choose>"/>
            <input type="text" id="visitorId" value="<c:choose><c:when test="${empty id}">로그인 하시면 글 작성이 가능해요 :)</c:when><c:otherwise>&nbsp ${id }</c:otherwise></c:choose>" disabled="disabled"/>
            <div class="form-group" style="margin-bottom:3px;">
               <textarea class="form-control" name="content" id="content" style="width:100%;height:150px;"></textarea>                              
            </div>            
            <div>
               <button type="submit" class="bt-default btn-sm pull-right">확인</button>
            </div>            
         </form>      
      </div>
      
      <form action="visitors.do" method="post" id="keywordForm" class="signupForm">
         <div class="row form-group" style="margin-top:50px;">
            <input type="text" name="keyword" placeholder="아이디" value="${keyword }" class="pull-left" style="width:200px;margin-left:18px;"/>
            <button type="submit" class="bt-default btn-sm" style="padding: 5px 5px 1px 5px; margin-left: 3px;">
               <strong>&nbsp<span class="glyphicon glyphicon-search" style="font-size:10px;"></span>&nbsp</strong>
            </button>
         </div>
      </form>
            
      <c:forEach var="tmp" items="${list }">
         <div class="comment" style="clear:right;margin-top:30px;">
            <div class="commentTop">
               <span class="pull-left" style="font-size:15px;font-weight:bold;">&nbsp ${tmp.writer }</span>
               <span class="pull-right">${tmp.regdate } &nbsp</span>         
            </div>
            <div class="commentBody" style="clear:both;margin-bottom:20px;">${tmp.content }</div>
            <div class="commentFooter">
               
               <%-- 아이디가 admin이거나 글의 주인일 경우 삭제와 수정을 가능하게 하기위한 처리 --%>
               <c:if test="${id eq 'admin' or id eq tmp.writer or 'test' eq tmp.writer}">   <!-- 수정사항 : 임시계정 부여 -->
                  <a href="javascript:deleteConfirm${tmp.num }()" class="pull-right commentFooter_a" id="visitUpdate${tmp.num }" style="margin-left:5px">삭제</a>
                  <a href="javascript:updateform${tmp.num }()" class="pull-right commentFooter_a" id="visitDelete${tmp.num }">수정</a><br/>               
               </c:if>
               
               <div id="num${tmp.num }" style="width:100%;display:none;">
                  <form action="update.do?num=${tmp.num }&keyword=${keyword}" method="post" class="commentUpdateForm" id="visitorUpdateFrom${tmp.num }">
                     <input type="hidden" value="${tmp.num }" name="num" id="updateNum${tmp.num }"/>                        
                     <div class="form-group" style="margin-bottom:3px;">
                        <textarea class="form-control" name="content" id="content2${tmp.num }" style="width:99%;height:100px;"></textarea>                              
                     </div>            
                     <div>
                        <button type="submit" class="bt-default btn-sm pull-right" style="margin-bottom: 10px">수정</button>
                     </div>
                  </form>         
               </div>
            </div>
         </div>   
         <script>
         function visitorLoginCheck() {
            alert("로그인 해주세요!");
         }
            //업데이트 폼의 ajax 처리
            function updateform${tmp.num }(){
               var num=$("#updateNum${tmp.num }").val();
               $("#num"+num).toggle();
               $.ajax({
                  url:"updateform.do",
                  method:"get",
                  data:{"num":num},
                  success:function(data){
                     $("#content2${tmp.num }").text(data);
                  }         
               });
            };
            //삭제시 여부를 묻는 함수
            function deleteConfirm${tmp.num }(){
               var isDelete=confirm("삭제하시겠습니까?");
               if(isDelete){
                  location.href="${pageContext.request.contextPath }/visitor/delete.do?num=${tmp.num }";
               }               
            };
            //수정 삭제 hover시 애니메이션
            $("#visitUpdate${tmp.num }").mouseover(function(){
            	$("#visitUpdate${tmp.num }").css("color", "#e2583e").css("text-decoration", "none");
            });
            $("#visitUpdate${tmp.num }").mouseout(function(){
            	$("#visitUpdate${tmp.num }").css("color", "black").css("text-decoration", "none");
            });            
            $("#visitDelete${tmp.num }").mouseover(function(){
            	$("#visitDelete${tmp.num }").css("color", "#e2583e").css("text-decoration", "none");
            });
            $("#visitDelete${tmp.num }").mouseout(function(){
            	$("#visitDelete${tmp.num }").css("color", "black").css("text-decoration", "none");
            });                        
         </script>                              
      </c:forEach>   
  <!-- 페이지 디스플레이 출력 -->
   <div style="text-align: center;margin-top:30px;">
      <ul class="pagination" style="margin:0 auto;">
         <c:choose>
            <c:when test="${pageNum ne 1 }">
               <li><a href="visitors.do?pageNum=${pageNum-1 }&keyword=${keyword}"  
               class="glyphicon glyphicon-chevron-left"></a></li>      
            </c:when>
            <c:otherwise>
               <li class="disabled"><a class="muted glyphicon glyphicon-chevron-left" href="javascript:" ></a></li>
            </c:otherwise>
         </c:choose>      
         
         
         <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
            <c:choose>
               <c:when test="${i eq pageNum }">
                  <li class="active"><a href="visitors.do?pageNum=${i }&keyword=${keyword}">${i }</a></li>
                  <script>
                     console.log("${startPageNum}");
                  </script>
               </c:when>
               <c:otherwise>
                  <li><a href="visitors.do?pageNum=${i } &keyword=${keyword}">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:choose>
            <c:when test="${pageNum lt totalPageCount }">
               <li><a href="visitors.do?pageNum=${pageNum+1 }&keyword=${keyword}" class="glyphicon glyphicon-chevron-right"></a></li>
            </c:when>
            <c:otherwise>
               <li class="disabled"><a class="muted glyphicon glyphicon-chevron-right" href="javascript:"></a></li>
            </c:otherwise>
         </c:choose>               
      </ul>   
      </div>   
   	</div>   
   </div>       
   
   <script>
      //글 작성시 로그인을 안했을 경우 폼전송을 막는다.
      $("#insertBtn").click(function(){
         var visitorId=$("#visitorId").val();
         if(visitorId=="로그인 하시면 글 작성이 가능해요^^"){
            alert("로그인을 해주세요!");
            $("#content").val("");
            return false;
         }
      });
   </script> 
</body>
</html>