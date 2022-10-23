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
        <form role="form" action="/whynull/board/write" method="post">
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
                    <c:when test="${param.boardNum == '4'}">
                        <c:forEach items="${headList}" var="outer" varStatus="status">
                            <c:forEach items="${outer}" var="inner">
                                <div class="form-check form-check-inline">
                                   <input class="form-check-input" name="subject_content" type="radio" id="inlineRadio4" value="${inner}">
                                   <label class="form-check-label" for="inlineRadio4">${inner}</label>
                                </div>
                            </c:forEach>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <label class="label fw-bold" for="title" style="margin: 0 10px 0 0;">제목</label>
                <input type="text" name="post_title" class="form-control w-75" id="post_title" required>
            </div>
            <div class="form-group d-flex my-2" style="align-items: center;">
                <input type="hidden" name="mem_id" class="form-control w-75" id="mem_id" value="<sec:authentication property='principal.username'/>" required>
            </div>
            <input type="hidden" name="board_num" id="boardNum" value="${param.boardNum}">
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
</script>
</body>
</html>