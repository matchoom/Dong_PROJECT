<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>PetInDelight</title>
<style>
#asd:hover {
background: none;
}

#asd >a:hover {
background: none;
cursor: default;
}
.disable {
pointer-events: none;
cursor: default;
}
.navbar-flame{ 
    height: 9%;
}

</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%
   String memberId = (String) session.getAttribute("SessionMemberId");
   String memberNickname = (String) session.getAttribute("SessionMemberNickname");
   String memberTelNumber = (String) session.getAttribute("SessionMemberTelNumber");
   String memberGrade = (String) session.getAttribute("SessionMemberGrade");
   
   MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
%>
   <nav class="navbar navbar-flame">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target="#myNavbar">
               <span class="icon-bar"></span> 
               <span class="icon-bar"></span> 
               <span class="icon-bar"></span>
            </button>
            <a href="/PetInDelight/main.do" class="navbar-brand" style="text-decoration: none;">
               <span style="vertical-align: middle; size: cover;"> <img
                  src="${pageContext.request.contextPath}/resource/img/ex1.png">
            </span>
            </a>
         </div>

         <div class="collapse navbar-collapse navbar-right navbar-flame" id="myNavbar">
         <br>
            <ul class="nav navbar-nav">
               <li>
                  <a href="main.do">?????????</a>
               </li>
               <li>
                  <a href="reserve.do">?????? ????????????</a>
               </li>
               <li class="dropdown">
          			<a class="dropdown-toggle" data-toggle="dropdown" href="#">???????????? <span class="caret"></span></a>
          				<ul class="dropdown-menu">
            				<li><a href="reviewBoardlist.do">?????? ?????????</a></li>
            			 	<li><a href="freeboard.do">QnA ?????????</a></li>            				
          			</ul>
        		</li>
               
    
                   
                  <%
                      if(memberId == null) {                
                     %>      
                    <li>                       
                        <a href="login.do">LOGIN</a>
                     </li> 
                    <%
                   } else if(memberGrade.equals("Admin")) {
                %>
                   
                   <li>
                      <a href="admin.do">?????? ??????</a>
                     </li> 
                   		
                      <li id="asd">
                      <a class="disable">${SessionMemberGrade}??? ???????????????.</a>
                      </li>
                	 <li>         
                         <a href="logout.do">LOGOUT</a>
                      </li>
                   <li>
                      <a class="disable">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                   </li>
                <%   
                   } else {
                %> 
                <li class="dropdown">
          			<a class="dropdown-toggle" data-toggle="dropdown" href="#">??????????????? <span class="caret"></span></a>
          				<ul class="dropdown-menu">
            				<li><a href="reserveStatus.do">??????????????????</a></li>
            			 	<li><a href="selectMember.do">??????????????????</a></li>            				
          			</ul>
        		</li>                      
                    <li id="asd">
                      <a class="disable">${SessionMemberNickname}??? ???????????????.</a>
                   </li>
                   <li>         
                         <a href="logout.do">LOGOUT</a>
                    </li> 
                   <li>
                      <a class="disable">&nbsp;&nbsp;&nbsp;&nbsp;</a>
                   </li>

                <%
                   }
                %>
               </ul>
         </div>
      </div>
   </nav>



</body>
</html>