<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="../includes/header.jsp"%>

<script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>

<body>
<div class="container">

<!-- BODY -->
<div class="body">
<div class="row">
    <div class="col-lg-10">
        <form id="editForm" role="form" action="/whynull/board/edit" method="post">
            <h2 class="display-6 fw-bold">
                <c:choose>
                    <c:when test="${param.boardNum eq '1'}">자유게시판</c:when>
                    <c:when test="${param.boardNum eq '2'}">정보게시판</c:when>
                    <c:when test="${param.boardNum eq '3'}">홍보게시판</c:when>
                    <c:when test="${param.boardNum eq '4'}">코드질답게시판</c:when>
                </c:choose>
            </h2>
            <div class="form-group mt-4 mb-2">
                <c:choose>
                    <c:when test="${param.boardNum == '1'}">
                        <c:forEach items="${headList}" var="outer" varStatus="status">
                            <c:forEach items="${outer}" var="inner">
                                <div class="form-check form-check-inline">
                                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio1" value="${inner}">
                                   <label class="form-check-label" for="inlineRadio1">${inner}</label>
                                </div>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                    <c:when test="${param.boardNum == '2'}">
                        <c:forEach items="${headList}" var="outer" varStatus="status">
                            <c:forEach items="${outer}" var="inner">
                                <div class="form-check form-check-inline">
                                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio2" value="${inner}">
                                   <label class="form-check-label" for="inlineRadio2">${inner}</label>
                                </div>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                    <c:when test="${param.boardNum == '3'}">
                        <c:forEach items="${headList}" var="outer" varStatus="status">
                            <c:forEach items="${outer}" var="inner">
                                <div class="form-check form-check-inline">
                                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio3" value="${inner}">
                                   <label class="form-check-label" for="inlineRadio3">${inner}</label>
                                </div>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <label class="label fw-bold" for="title" style="margin: 0 10px 0 0;">제목</label>
                <input type="text" name="post_title" class="form-control w-75" id="post_title" value='<c:out value="${read.post_title}"/>' required>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <input type="hidden" name="mem_id" class="form-control w-75" id="mem_id" value="<sec:authentication property='principal.username'/>" required>
            </div>
            <input type="hidden" name="board_num" id="boardNum" value="${param.boardNum}">
            <input type="hidden" name="boardNum" id="boardNum" value="${param.boardNum}">
            <input type="hidden" name="post_num" id="post_num" value="${param.postNum}">
            <textarea rows="1" cols="1" id="post_content" name="post_content"><c:out value="${read.post_content}"/></textarea>
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
                <button type="submit" data-oper='edit' class="btn btn-secondary mb-3">등록</button>
                <a href="/whynull/board/read?boardNum=${param.boardNum}&postNum=${param.postNum}" class="btn btn-secondary mb-3">취소</a>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
    <div class="col-2">
        <p class="ad text-center">광고</p>
    </div>
</div>
<%@include file="../includes/footer.jsp"%>
</div> <!-- END BODY -->

<script>
$(document).ready(function() {
    let form = $("#editForm");
    $('button').on("click", function(e) {
        e.preventDefault();
        let operation = $(this).data("oper");

        if(operation === 'list') {
            history.go(-3);
        }

        form.submit();
    });
});

//말머리 체크
let subcon  = document.getElementsByName('subject_content');

for(let i=0;i<subcon.length;i++) {
    if(subcon[i].value == '<c:out value="${read.subject_content}"/>') {
        subcon[i].checked = true;
        break;
    }
}

</script>
</body>
</html>