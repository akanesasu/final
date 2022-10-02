<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WHY NULL</title>

    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css"/>

    <!-- FONTS-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600;900&family=Yeon+Sung&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
<%@include file="../header.jsp"%>

<!-- BODY -->
<div class="body">
    <div class="row">
        <div class="col-lg-10">
            <h2 class="display-6" style="font-weight: bold">자유게시판</h2>

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
                        <th style="width:60%" class="text-center">제목</th>
                        <th style="width:10%" class="text-center">작성자</th>
                        <th style="width:20%" class="text-center">작성일</th>
                    </tr>
                    </thead>

                    <c:forEach items="${board_free}" var="board">
                        <tr>
                            <td class="text-center"><c:out value="${board.post_num}"/></td>
                            <td class="text-center"><a class='move' href='<c:out value="${board.post_num}"/>'><c:out value="${board.post_title}"/></a></td>
                            <td class="text-center"><c:out value="${board.mem_id}"/></td>
                            <td class="text-center"><fmt:formatDate pattern="yyyy/MM/dd" value="${board.writing_date}"/></td>
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
                            <a class="btn btn-outline-dark" href="board_write.html" role="button">글쓰기</a>
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
</div> <!-- container -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@include file="../footer.jsp"%>

</body>
</html>