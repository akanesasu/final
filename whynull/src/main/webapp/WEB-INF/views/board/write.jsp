<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../header.jsp"%>

<style>
.ck.ck-editor {
	width: 80%;
	max-width: 600px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 80vh;
}
</style>

<script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>

<body>
<div class="container">

<!-- BODY -->
<div class="body">
<div class="row">
    <div class="col-lg-10">
        <form role="form" action="/whynull/board/write" method="post">
            <h2 class="display-6 fw-bold" name="subject_content">
                <%-- <c:choose>
                    <c:when test="${boardNum eq 1}">

                    </c:when>
                    <c:when test="${boardNum eq 2}">
                        <input type="hidden" name="post_num" value="2">정보
                    </c:when>
                    <c:when test="${boardNum eq 3}">
                        <input type="hidden" name="post_num" value="3">홍보
                    </c:when>
                    <c:when test="${boardNum eq 4}">
                        <input type="hidden" name="post_num" value="4">코드질답
                    </c:when>
                </c:choose> --%>
                <input type="hidden" name="board_num" value="1">자유<span>게시판</span>
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
            <textarea rows="1" cols="1" id="post_content" name="post_content"></textarea>
            <script>
                var ckeditor_config = {
                    resize_enaleb : false,
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
<%@include file="../footer.jsp"%>
</div> <!-- END BODY -->

<script>
$(document).ready(function(e) {
    //var formObj = $("form[role='form']");
    $("input[type='file']").change(function(e) {
        var formData = new FormData();
        $.ajax({
            url: '/whynull/writeAjaxPost',
            processData: false,
            contentType: false,
            data: formData,
            formData,type: 'POST',
            dataType: 'json',
        });
    });
});
</script>
</body>
</html>