<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../header.jsp"%>

<body>
<div class="container">

    <!-- BODY -->
    <h2 class="display-6 fw-bold">자유게시판</h2>
    <hr/>
    <div class="fs-6"><b><c:out value="${read.post_title}"/></b></div>
    <p class="mb-2"/>

    <div class="row">
        <div class="col-6 text-start"><c:out value="${read.mem_id}"/></div>
        <div class="col-6 text-end">
            <span>작성일</span>
            <span><fmt:formatDate value="${read.writing_date}" pattern="yyyy/MM/dd HH:mm:ss"/></span>
            <span class="sep"></span>
            <span>조회수</span>
            <span><c:out value="${read.post_view_count}"/></span>
            <span class="sep"></span>
            <span>댓글</span>
            <span>#</span>
        </div>
    </div>


    <hr />
    <p>
        <c:out value="${read.post_content}"/>
    </p>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <div
                    class="btn-group"
                    role="group"
                    aria-label="Basic mixed styles example"
                >
                    <button type="button" class="btn btn-success">추천</button>
                    <button type="button" class="btn btn-danger">비추천</button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-6 text-start">
                <button type="button" class="btn btn-primary">스크랩</button>
            </div>
            <div class="col-6 text-end">
                <button type="button" class="btn btn-success">수정</button>
                <button
                    type="button"
                    class="btn btn-secondary"
                    data-bs-toggle="modal"
                    data-bs-target="#staticBackdropLive"
                >
                    신고
                </button>
            </div>
            <div
                class="modal fade"
                id="staticBackdropLive"
                data-bs-backdrop="static"
                data-bs-keyboard="false"
                tabindex="-1"
                aria-labelledby="staticBackdropLiveLabel"
                aria-hidden="true"
            >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="staticBackdropLiveLabel">
                                삭제하기
                            </h3>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>

                        <div class="modal-footer">
                            <small>정말 삭제하시겠습니까?</small>
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-bs-dismiss="modal"
                            >
                                취소하기
                            </button>
                            <button type="button" class="btn btn-danger">삭제하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />

    <!-- 댓글 -->
    <div class="container p-3" style="background-color: rgb(241, 241, 241)">
        <form class="" method="post" action="/reply/write"></form>

        <div class="comment_wrapper">
            <div class="comment_item">
                <div class="comment_info">
                    <div class="row">
                        <div class="col-6 text-start">
                            aaa
                        </div>
                        <div class="col-6 text-end">
                            <span>2022.08.22</span>
                            <span class="sep"></span>
                            <a href="">신고</a>
                            <span class="sep"></span>
                            <a href="#" class="reply-write">답글</a>
                        </div>
                    </div>
                </div>
                <div class="comment_text">test</div>
            </div>


            <div class="comment_wrapper">
                <div class="comment_item">
                    <div class="comment_info">
                        <div class="row">
                            <div class="col-6 text-start">
                                ddd
                            </div>
                            <div class="col-6 text-end">
                                <span>2022.08.25</span>
                                <span class="sep"></span>
                                <a href="">신고</a>
                                <span class="sep"></span>
                                <a href="">답글</a>
                            </div>
                        </div>
                    </div>
                    <div class="comment_text">대댓글</div>
                </div>
            </div>

        </div>
        <hr/>

        <div class="comment_wrapper">
            <div class="comment_item">
                <div class="comment_info">
                    <div class="row">
                        <div class="col-6 text-start">
                            aaa
                        </div>
                        <div class="col-6 text-end">
                            <span>2022.08.22</span>
                            <span class="sep"></span>
                            <a href="">신고</a>
                            <span class="sep"></span>
                            <a href="">답글</a>
                        </div>
                    </div>
                </div>
                <div class="comment_text">test</div>
            </div>
        </div>
        <hr/>

        <div class="comment_wrapper comment_choosed">
            <div class="comment_item">
                <div class="comment_info">
                    <div class="row">
                        <div class="col-6 text-start">
                            ccc
                        </div>
                        <div class="col-6 text-end">
                            <span><b>채택된 답변</b></span>
                            <span class="sep"></span>
                            <span>2022.08.24</span>
                            <span class="sep"></span>
                            <a href="">신고</a>
                            <span class="sep"></span>
                            <a href="">답글</a>
                        </div>
                    </div>
                </div>
                <div class="comment_text">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Sunt temporibus voluptatibus sit cumque at cum ullam quibusdam quasi
                    accusantium optio praesentium maiores ratione autem et, quam repudiandae
                    exercitationem adipisci sapiente.</div>
            </div>
        </div>
        <hr/>


        <form action="">
            <a href="">작성자</a>
            <p></p>
            <textarea rows="3" cols="115" name="content">내용</textarea>
            <p></p>

            <div class="mb-3">
                <button>이미지 첨부</button>
                <div class="text-end">
                    <input type="submit" value="등록" />
                </div>
            </div>
        </form>
    </div>

    <div class="btn-group">
        <a
            class="btn btn-secondary dropdown-toggle"
            type="button"
            id="defaultDropdown"
            data-bs-toggle="dropdown"
            data-bs-auto-close="true"
            aria-expanded="false"
        >
            답글달기
        </a>
        <ul class="dropdown-menu" aria-labelledby="defaultDropdown">
            <li>
                <form action="">
                    <a href="">작성자</a>
                    <p></p>
                    <textarea rows="3" cols="115" name="content">내용</textarea>
                    <p></p>

                    <div class="text-end">
                        <input type="submit" value="등록" />
                    </div>
                </form>
            </li>
        </ul>
    </div>
    <!-- ------------------------- -->

<%@include file="../footer.jsp"%>

</body>
</html>
