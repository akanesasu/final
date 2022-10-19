<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>

<body>
<div class="container">

<!-- BODY -->
<div class="body">
<div class="row">
    <div class="col-lg-10">
        <form role="form" action="/whynull/board/write" method="post">
            <h2 class="display-6 fw-bold" name="subject_content">
                <c:choose>
                    <c:when test="${param.boardNum eq '1'}">자유게시판</c:when>
                    <c:when test="${param.boardNum eq '2'}">정보게시판</c:when>
                    <c:when test="${param.boardNum eq '3'}">홍보게시판</c:when>
                    <c:when test="${param.boardNum eq '4'}">코드질답게시판</c:when>
                </c:choose>
            </h2>
            <div class="form-group mt-4 mb-2">
                <div class="form-check form-check-inline">
                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio1" value="일반">
                   <label class="form-check-label" for="inlineRadio1">일반</label>
                </div>
                <div class="form-check form-check-inline">
                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio2" value="질문">
                   <label class="form-check-label" for="inlineRadio2">질문</label>
                </div>
                <div class="form-check form-check-inline">
                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio3" value="IT">
                   <label class="form-check-label" for="inlineRadio3">IT</label>
                </div>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <label class="label fw-bold" for="title" style="margin: 0 10px 0 0;">제목</label>
                <input type="text" name="post_title" class="form-control w-75" id="post_title" required>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <label class="label fw-bold" for="title" style="margin: 0 10px 0 0;">작성자</label>
                <input type="text" name="mem_id" class="form-control w-75" id="mem_id" required>
            </div>
            <input type="hidden" name="boardNum" id="boardNum" value="${param.boardNum}">
            <textarea rows="1" cols="1" id="post_content" name="post_content"></textarea>
            <script>
                var ckeditor_config = {
                    resize_enabled : false,
                    enterMode : CKEDITOR.ENTER_BR,
                    shiftEnterMode : CKEDITOR.ENTER_P,
                    filebrowserUploadUrl : "#"
                };

                CKEDITOR.replace("post_content", ckeditor_config);
            </script>
            <br>
            <div class="text-end">
                <button type="submit" class="btn btn-secondary mb-3">작성</button>
            </div>
        </form>
    </div>
    <div class="col-2">
        <p class="ad text-center">광고</p>
    </div>
</div>
<%@include file="../includes/footer.jsp"%>
</div> <!-- END BODY -->

<script>
</script>
</body>
</html>