<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sns.members.service.MembersVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500&family=Jost:wght@500;600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resource/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resource/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resource/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resource/dist/css/style.css" rel="stylesheet">
<style>
.btn{

	color: white;
}
.btn:hover{

	color: white;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function insert() {
		var title = $('#title').val();
		var content = $('#content').val();
		var boardNo = $('#boardNo').val();
		$.ajax({
			url: 'sendMe.do',
			type: 'POST',
			data: {title:title,
				   content:content,
				   boardNo:boardNo
				   },
					datatype: 'JSON',
			success: function (data){
				alert("쪽지를 보냈습니다")
				self.close();
			},
			error: function (data){
				alert("쪽지를 보내지 못하였습니다.")
			}
		});
		
		
	}
</script>
<title>쪽지보내기</title>
</head>
<body>
<%
   String memberId = (String) session.getAttribute("SessionMemberId");
   String memberNickname = (String) session.getAttribute("SessionMemberNickname");
   
   MembersVO sessionMember = (MembersVO) session.getAttribute("SessionMember");
%>

        <div class="page-header">
            <h1 class="text-primary-gradient fw-medium">받은 쪽지 내용</h1>
        </div>
        <br/>
        <table class="table table-striped table-hover">
        	<tr>
                <th>보낸 이</th>
                <td><span class="form-control">${reply.memberId}</span></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><span class="form-control">${reply.title}</span></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><span style="width:500px; height:300px;"class="form-control">${reply.content}</span>
                </td>
            </tr>
            <tr>
            <td></td>
            <td></td>
            </tr>
        </table>
         
        <!-- 수정에서 넘어오면 저장버튼 안보이게. -->
        <div style="display:flex; justify-content:flex-end; align-items:center;">
        <div align="right">
        <button type="button" class="btn btn-success" onclick="location.href='sendTo.do?replyNo=${reply.replyNo}'">답장하기</button>

        <div class="pull-left">
            
         </div>
        </div>
      </div>
</body>
</html>