<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../header.jsp"%>

<body>
<div class="container">
<!-- BODY -->
<div class="body">
    <div class="row">
        <div class="col-lg-10">
            <h2 class="display-6 fw-bold">
                <c:choose>
                    <c:when test="${page.cri.boardNum == '1'}">자유게시판</c:when>
                    <c:when test="${page.cri.boardNum == '2'}">정보게시판</c:when>
                    <c:when test="${page.cri.boardNum == '3'}">홍보게시판</c:when>
                    <c:when test="${page.cri.boardNum == '4'}">코드질답게시판</c:when>
                </c:choose>
            </h2>
            <div class="text-end">
                <ul class="nav mb-2 justify-content-end mb-md-0">
                    <c:choose>
                        <c:when test="${page.cri.boardNum == '1'}">
                            <c:forEach items="${headList}" var="outer" varStatus="status">
                                <c:forEach items="${outer}" var="inner">
                                    <li><a class="nav-link px-2 link-dark" href="javascript:" onclick="searchHead(${status.index})">${inner}</a></li>
                                </c:forEach>
                            </c:forEach>
                        </c:when>
                        <c:when test="${page.cri.boardNum == '2'}">
                            <c:forEach items="${headList}" var="outer" varStatus="status">
                                <c:forEach items="${outer}" var="inner">
                                    <li><a class="nav-link px-2 link-dark" href="javascript:" onclick="searchHead(${status.index})">${inner}</a></li>
                                </c:forEach>
                            </c:forEach>
                        </c:when>
                        <c:when test="${page.cri.boardNum == '3'}">
                            <c:forEach items="${headList}" var="outer" varStatus="status">
                                <c:forEach items="${outer}" var="inner">
                                    <li><a class="nav-link px-2 link-dark" href="javascript:" onclick="searchHead(${status.index})">${inner}</a></li>
                                </c:forEach>
                            </c:forEach>
                        </c:when>
                        <c:when test="${page.cri.boardNum == '4'}">
                            <c:forEach items="${headList}" var="outer" varStatus="status">
                                <c:forEach items="${outer}" var="inner">
                                    <li><a class="nav-link px-2 link-dark" href="javascript:" onclick="searchHead(${status.index})">${inner}</a></li>
                                </c:forEach>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </ul>
            </div>

            <div class="board">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="width:7%" class="text-center">글번호</th>
                        <th style="width:10%" class="text-center">말머리</th>
                        <th style="width:50%" class="text-center">제목</th>
                        <th style="width:15%" class="text-center">작성자</th>
                        <th style="width:10%" class="text-center">작성일</th>
                        <th style="width:8%" class="text-center">조회수</th>
                    </tr>
                    </thead>

                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td class="text-center"><c:out value="${board.post_num}"/></td>
                            <td class="text-center"><c:out value="${board.subject_content}"/></td>
                            <td class="text-start px-2"><a class="read" href="/whynull/board/read?bdn=<c:out value='${board.boardNum}'/>&ptn=<c:out value='${board.post_num}'/>" style="text-decoration:none; color:black;"><c:out value="${board.post_title}"/></a></td>
                            <td class="text-center"><c:out value="${board.mem_id}"/></td>
                            <td class="text-center"><fmt:formatDate pattern="MM/dd HH:mm" value="${board.writing_date}"/></td>
                            <td class="text-center"><c:out value="${board.post_view_count}"/></td>
                        </tr>
                    </c:forEach>
                </table>
                <hr/>

                <div class="board_bottom">
                    <div class="row">
                        <form class="col-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <select class="form-select form-select-sm">
                                        <option value="all">전체</option>
                                        <option value="title_content">제목/내용</option>
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                        <option value="nickname">글쓴이</option>
                                    </select>
                                </div>
                                <input type="text" class="form-control form-control-sm">
                                <div class="input-group-append">
                                    <button class="btn btn-sm btn-secondary" type="submit" id="button-addon">검색</button>
                                </div>
                            </div>
                        </form>

                        <div class="col-8 text-end">
                            <button id="regBtn" class="btn btn-outline-dark" href="write.jsp" role="button">글쓰기</button>
                        </div>
                    </div>

                    <br>

                    <div class="page">
                        <ul class="pagination" style="justify-content: center">
                            <c:if test="${page.prev}">
                                <li class="page-item">
                                  <a class="page-link" href="${page.start-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                  </a>
                                </li>
                            </c:if>

                            <c:forEach var="num" begin="${page.start}" end="${page.end}">
                                <li class="page-item ${page.cri.pageNum == num ? "active" : ""}">
                                    <a class="page-link" href="${num}">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${page.next}">
                                <li class="page-item">
                                  <a class="page-link" href="${page.end+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                </li>
                            </c:if>
                        </ul>
                    </div> <!-- pagination -->

                    <form id='actionForm' action="/whynull/board/list" method='get'>
                        <input type='hidden' id='boardNum' name='boardNum' value='${page.cri.boardNum}'>
                        <input type='hidden' name='pageNum' value='${page.cri.pageNum}'>
                        <input type='hidden' name='type' value='<c:out value="${page.cri.type}"/>'>
                        <input type='hidden' name='keyword' value='<c:out value="${page.cri.keyword}"/>'>
                    </form>
                </div> <!-- board_bottom -->
            </div> <!-- board -->
        </div> <!-- col-lg-10 -->
        <div class="col-2">
            <p class="ad text-center">광고</p>
        </div>
    </div>
</div>

<%@include file="../footer.jsp"%>
</div> <!-- container -->

<script type="text/javascript">
$(document).ready(function() {
    $("#regBtn").on("click", function() {
        let boardNum = $("#boardNum").val();
        self.location="/whynull/board/write?boardNum=" + boardNum;
    });

    let actionForm = $("#actionForm");

    $(".page-item a").on("click", function (e) {
        e.preventDefault();
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
    });
});

let searchHead = function(headId) {
	let url = makeUrl('search_head', headId);
	$(location).attr('href', url);
}

let makeUrl = function(param, value) {
    let url = "/whynull/board/list";
    let pageNum = $("#pageNum").val();
    let boardNum = $("#boardNum").val();

    url += "?boardNum=" + boardNum;

    if(param == "search_head") {
        if(value != 0) url += "&head=" + value;
    } else {
        url += "&head=";
    }

    if(param == "search_head") {
        url += "&pageNum=1";
    } else {
        url += "&pageNum="+pageNum;
    }

    return url;
}

</script>
</body>
</html>