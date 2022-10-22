<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<body>
<div class="container">
<div class="row">
    <div class="col-10">
        <div class="row" style="justify-content: center;">
            <div class="row col-6">
                <div class="board my-2 p-3">
                    <p><h4 class="text-center fw-bold">자유게시판</h4></p>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="width:80%" class="text-center">제목</th>
                            <th style="width:20%" class="text-center">작성시간</th>
                        </tr>
                        </thead>

                        <c:forEach items="${list1}" var="board">
                            <tr>
                                <td class="text-start px-2"><a class="read" href="/whynull/board/read?boardNum=1&postNum=<c:out value='${board.post_num}'/>" style="text-decoration:none; color:black;"><c:out value="${board.post_title}"/></a></td>
                                <td class="text-center"><fmt:formatDate pattern="HH:mm" value="${board.writing_date}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div class="row col-6">
                <div class="board my-2 p-3">
                    <p><h4 class="text-center fw-bold">정보게시판</h4></p>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="width:80%" class="text-center">제목</th>
                            <th style="width:20%" class="text-center">작성시간</th>
                        </tr>
                        </thead>

                        <c:forEach items="${list2}" var="board">
                            <tr>
                                <td class="text-start px-2"><a class="read" href="/whynull/board/read?boardNum=2&postNum=<c:out value='${board.post_num}'/>" style="text-decoration:none; color:black;"><c:out value="${board.post_title}"/></a></td>
                                <td class="text-center"><fmt:formatDate pattern="HH:mm" value="${board.writing_date}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class="row" style="justify-content: center;">
            <div class="row col-6">
                <div class="board my-2 p-3">
                    <p><h4 class="text-center fw-bold">홍보게시판</h4></p>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="width:80%" class="text-center">제목</th>
                            <th style="width:20%" class="text-center">작성시간</th>
                        </tr>
                        </thead>

                        <c:forEach items="${list3}" var="board">
                            <tr>
                                <td class="text-start px-2"><a class="read" href="/whynull/board/read?boardNum=3&postNum=<c:out value='${board.post_num}'/>" style="text-decoration:none; color:black;"><c:out value="${board.post_title}"/></a></td>
                                <td class="text-center"><fmt:formatDate pattern="HH:mm" value="${board.writing_date}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div class="row col-6">
                <div class="board my-2 p-3">
                    <p><h4 class="text-center fw-bold">코드질답게시판</h4></p>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th style="width:80%" class="text-center">제목</th>
                            <th style="width:20%" class="text-center">작성시간</th>
                        </tr>
                        </thead>

                        <c:forEach items="${list4}" var="board">
                            <tr>
                                <td class="text-start px-2"><a class="read" href="/whynull/board/read?boardNum=4&postNum=<c:out value='${board.post_num}'/>" style="text-decoration:none; color:black;"><c:out value="${board.post_title}"/></a></td>
                                <td class="text-center"><fmt:formatDate pattern="HH:mm" value="${board.writing_date}"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-2">
        <p>배너</p>
    </div>
</div>

<%@include file="./includes/footer.jsp"%>
</div>
</body>
</html>