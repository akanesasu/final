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
            <h2 class="display-6 fw-bold">자유게시판</h2>

            <div class="text-end">
                <ul class="nav mb-2 justify-content-end mb-md-0">
                    <li><a class="nav-link px-2 link-dark" href="#" role="button">베스트</a></li>
                    <li><a class="nav-link px-2 link-dark" href="#" role="button"><span class="fw-bold">전체</span></a></li>
                    <li><a class="nav-link px-2 link-dark" href="#" role="button">일반</a></li>
                    <li><a class="nav-link px-2 link-dark" href="#" role="button">질문</a></li>
                    <li><a class="nav-link px-2 link-dark" href="#" role="button">IT</a></li>
                    <li><a class="nav-link px-2 link-dark" href="#" role="button">공지</a></li>
                </ul>
            </div>

            <div class="board">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th style="width:10%" class="text-center">글번호</th>
                        <th style="width:10%" class="text-center">말머리</th>
                        <th style="width:50%" class="text-center">제목</th>
                        <th style="width:10%" class="text-center">작성자</th>
                        <th style="width:10%" class="text-center">작성일</th>
                        <th style="width:10%" class="text-center">조회수</th>
                    </tr>
                    </thead>

                    <c:forEach items="${free}" var="board">
                        <tr>
                            <td class="text-center"><c:out value="${board.post_num}"/></td>
                            <td class="text-center"><c:out value="${board.subject_content}"/></td>
                            <td class="text-center"><a href='/whynull/board/read?board_num=<c:out value="${board.board_num}"/>&post_num=<c:out value="${board.post_num}"/>'><c:out value="${board.post_title}"/></a></td>
                            <%-- <td class="text-center"><a class='move' href='<c:out value="${board.post_num}"/>'><c:out value="${board.post_title}"/></a></td> --%>
                            <td class="text-center"><c:out value="${board.mem_id}"/></td>
                            <td class="text-center"><fmt:formatDate pattern="yyyy/MM/dd" value="${board.writing_date}"/></td>
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

                    <div class='text-center'>
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev}">
                                <li class="paginate_button previous"><a href="${pageMaker.start-1}">Previous</a></li>
                            </c:if>

                            <c:forEach var="num" begin="${pageMaker.start}" end="${pageMaker.end}">
                                <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}">
                                    <a href="${num}">${num}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${pageMaker.next}">
                                <li class="paginate_button next"><a href="${pageMaker.end+1}">Next</a></li>
                            </c:if>
                        </ul>
                    </div>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#regBtn").on("click", function() {
        self.location="/whynull/board/write";
    });

    var actionForm = $("#actionForm");

    $('.move').on("click", function(e) {
        e.preventDefault();
        actionForm.append("<input type='hidden' name='board_num' value='" + $(this).attr("href") + "'>");
        actionForm.append("<input type='hidden' name='post_num' value='" + $(this).attr("href") + "'>");
        actionForm.attr("action", "/whynull/board/read");
        actionForm.submit();
    });
});

</script>
</body>
</html>