<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>

<%@include file="../includes/header.jsp"%>

<body>
<div class="container">
<sec:authentication var='principal' property='principal'/>
<!-- BODY -->
<h2 class="display-6 fw-bold">
    <c:choose>
        <c:when test="${read.board_num eq '1'}">자유게시판</c:when>
        <c:when test="${read.board_num eq '2'}">정보게시판</c:when>
        <c:when test="${read.board_num eq '3'}">홍보게시판</c:when>
        <c:when test="${read.board_num eq '4'}">코드질답게시판</c:when>
    </c:choose>
</h2>
<hr class="my-4"/>
<div class="fs-5 my-2 fw-bold">
    [<c:out value="${read.subject_content}"/>]
    <c:out value="${read.post_title}"/>
</div>
<div class="row">
    <div class="col-6 text-start">
        <c:out value="${read.mem_id}"/>
    </div>
    <div class="col-6 text-end">
        <span><fmt:formatDate value="${read.writing_date}" pattern="yyyy/MM/dd HH:mm:ss"/></span>
        <span class="sep"></span>
        <span>조회수</span>
        <span><c:out value="${read.post_view_count}"/></span>
        <span class="sep"></span>
        <span>댓글</span>
        <span>#</span>
    </div>
</div>
<hr class="my-4"/>
<p class="read"><c:out value="${read.post_content}"/></p>

<div class="row">
    <div class="col-4 text-start">
        <button type="button" class="btn" style="background-color:#FFAD41;">스크랩</button>
        <button type="button" class="btn" style="background-color:#FF7A7A;">신고</button>
    </div>
    <div class="col-4 d-flex" style="justify-content: center; align-items: center;">
        <span class="fw-bold mx-1 fs-6">추천수</span>
        <button type="button" class="btn btn-primary mx-1">추천</button>
        <button type="button" class="btn btn-danger mx-1">비추</button>
        <span class="fw-bold mx-1 fs-6">비추수</span>
    </div>
    <div class="col-4 text-end">
        <c:if test="${principal.username eq read.mem_id}"><button type="button" data-oper='edit' class="btn btn-secondary mx-1">수정</button></c:if>
        <c:if test="${principal.username eq read.mem_id}"><button type="button" data-oper='delete' class="btn btn-secondary">삭제</button></c:if>
    </div>
</div>

<hr class="my-4"/>
</div>


<!-- 댓글 -->
<div class="container reply_total">
<div class="reply_wrapper">
    <ul class="reply_item" style="list-style:none; padding-left:0px;">
    </ul>
</div>
<div class="reply_paging">

</div>
<hr class='my-4'/>

<div class="reply_write" style="background-color: rgb(241, 241, 241)">
    <div class='row mb-3 p-2'>
        <div class='col-2 text-start form-group'><input class="form-control fw-bold" name="replyer" value="<sec:authentication property='principal.username'/>" disabled></div>
        <div class='p-0 col-9 form-group'><textarea rows="2" cols="150" class="replyTA form-control" name="reply"></textarea></div>
        <div class='col-1 text-end'><button class="btn btn-primary" id="writeReply" style="background-color:#00487F;">등록</button></div>
    </div>
</div>
</div> <!-- END Container -->

<!-- Modal -->
<div class="modal fade" id="modalReply" data-bs-backdrop="static" data-bs-keyboard="false">
<div class="modal-dialog">
<div class="modal-content">
    <div class="modal-body">
        <div class='p-2 text-start form-group w-50'><input class="form-control fw-bold" id="modalReplyInputReplyer" name="replyer" value="<sec:authentication property='principal.username'/>" disabled></div>
        <div class='p-2 form-group'><textarea rows="2" cols="300" id="modalReplyInputTA", class="replyTA form-control" name="reply"></textarea></div>
    </div>
    <div class="modal-footer">
        <button id="modalReplyModBtn" type="button" class="btn btn-sm" style="background-color:#00487F; color:white">수정</button>
        <button id="modalReplyRmvBtn" type="button" class="btn btn-sm" style="background-color:#EF0000; color:white">삭제</button>
        <button id="modalReplyCloseBtn" type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">취소</button>
    </div>
</div>
</div>
</div>

<%@include file="../includes/footer.jsp"%>

<%-- <script type="text/javascript" src="/resources/js/reply.js"></script> --%>

<script>
//temporary reply.js codes because of tomcat 404 error about local static files
console.log("Reply Module Initiated");
let replyService = (function() {
    function write(reply, callback, error) {
        $.ajax({
            type: "post",
            url: "../reply/new",
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success : function (result, status, xhr) {
                if(callback) { callback(result); }
            },
            error : function (xhr, status, er) {
                if(error) {error(er)};
            }
        })
    }

    function getList(param, callback, error) {
        let page = param.page || 1;
        let postNum = param.postNum;
        let boardNum = param.boardNum;

        $.getJSON("../reply/pages/" + boardNum + "/" + postNum + "/" + page,
            function(data) {
                if(callback) { callback(data.replyCount, data.list); }
            }
        ).fail(function(xhr, status, err) {
            if(error) { error(); }
        });
    }

    function remove(param, callback, error) {
        let postNum = param.postNum;
        let boardNum = param.boardNum;
        let replyNum = param.replyNum;
        $.ajax({
            type: 'delete',
            url: '../reply/' + boardNum + "/"  + postNum + "/" + replyNum,
            success: function(deleteResult, status, xhr) {
                if(callback) { callback(deleteResult); }
            },
            error: function(xhr, status, er) {
                if(error) { error(er); }
            }
        });
    }

    function edit(param, reply, callback, error) {
        let postNum = param.postNum;
        let boardNum = param.boardNum;
        let replyNum = param.replyNum;
        $.ajax({
            type: 'post',
            url: '../reply/' + boardNum + "/"  + postNum + "/" + replyNum,
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr) {
                if(callback) { callback(result); }
            },
            error: function(xhr, status, er) {
                if(error) { error(er); }
            }
        });
    }

    function read(param, callback, error) {
        let postNum = param.postNum;
        let boardNum = param.boardNum;
        let replyNum = param.replyNum;

        $.get("../reply/" + boardNum + "/"  + postNum + "/" + replyNum, function(result) {
            if(callback) { callback(result); }
        }).fail(function(xhr, status, err) {
            if(error) { error(); }
        });
    }

    function displayTime(timeValue) {
        let today = new Date();
        let gap = today.getTime() - timeValue;
        let dataObj = new Date(timeValue);

        if (gap < 1000 * 60 * 60 * 24) {
            let hh = dataObj.getHours();
            let mi = dataObj.getMinutes();
            let ss = dataObj.getSeconds();

            return [
                (hh > 9 ? "" : "0") + hh,
                ":",
                (mi > 9 ? "" : "0") + mi,
                ":",
                (ss > 9 ? "" : "0") + ss,
            ].join("");
        } else {
            let yy = dataObj.getFullYear();
            let mm = dataObj.getMonth() + 1;
            let dd = dataObj.getDate();

            return [
                yy,
                "/",
                (mm > 9 ? "" : "0") + mm,
                "/",
                (dd > 9 ? "" : "0") + dd,
            ].join("");
        }
    }

    return {
        write:write,
        getList:getList,
        remove:remove,
        edit:edit,
        read:read,
        displayTime:displayTime,
    };
})();
// END of reply.js ------------------
</script>


<script>
$(document).ready(function() {
    let boardNum = '<c:out value="${read.board_num}"/>';
    let postNum = '<c:out value="${read.post_num}"/>';
    let replyUl = $(".reply_item");

    showList(1);

    function showList(page) {
        replyService.getList({boardNum:boardNum, postNum:postNum, page:page||1}, function(replyCount, list) {
            if(page == -1) {
                pageNum = Math.ceil(replyCount/10.0);
                showList(pageNum);
                return;
            }

            let str="";

            if(list==null || list.length==0) {
                return;
            }
            for(let i=0, len=list.length||0; i<len; i++) {
                str += "<li class='left clearfix' id='replynum' data-replynum='" + list[i].replyNum + "'>";
                str += "    <div class='row mb-3'>";
                str += "        <div class='col-2 text-start fw-bold' data-replyer='"+ list[i].replyer + "'>" + list[i].replyer + "</div>";
                str += "        <div class='p-0 col-7 comment_text'>" + list[i].reply + "</div>";
                str += "        <div class='col-3 text-end'>"
                str += "            <span>" + replyService.displayTime(list[i].replyDate) + "</span>"
                str += "            <span class='sep'></span>"
                str += "            <a class='hrs' href='javascript:' id='modReply'>수정/삭제</a>"
                str += "        </div>"
                str += "    </div>"
                str += "</li>"
            }
            replyUl.html(str);
            showReplyPage(replyCount);
        });
    } //showList

    let pageNum = 1;
    let replyPaging = $(".reply_paging");

    function showReplyPage(replyCount) {
        let end = Math.ceil(pageNum/10.0)*10;
        let start = end - 9;
        let prev = start != 1;
        let next = false;

        if(end*10 >= replyCount) {
            end = Math.ceil(replyCount/10.0);
        }

        if(end*10 < replyCount) {
            next = true;
        }

        let str = "<ul class='pagination' style='justify-content: center'>";
        if(prev) {
            str += "<li class='page-item'><a class='page-link' href='" + (start-1) + "'>Prev</a></li>";
        }

        for(let i=start; i<=end; i++) {
            let active = pageNum == i ? "active" : "";
            str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
        }

        if(next) {
            str += "<li class='page-item'><a class='page-link' href='" + (end+1) +"'>Next</a></li>";
        }

        str += "</ul></div>";

        replyPaging.html(str);
    }

    replyPaging.on("click", "li a", function(e) {
        e.preventDefault();
        let target = $(this).attr("href");
        pageNum = target;
        showList(pageNum);
    });

    let replyTotal = $(".reply_total");
    let replyInputTA = replyTotal.find("textarea[name='reply']");
    let replyInputReplyer = replyTotal.find("input[name='replyer']");
    let writeReply = $("#writeReply");
    let replyModReply = $("#modReply");

    let modalReply = $("#modalReply");
    let modalReplyInputTA = modalReply.find("textarea[name='reply']");
    let modalReplyInputReplyer = modalReply.find("input[name='replyer']");
    let modalReplyModBtn = $("#modalReplyModBtn");
    let modalReplyRmvBtn = $("#modalReplyRmvBtn");
    let modalReplyCloseBtn = $("#modalReplyCloseBtn");

    let replyer = null;

    <sec:authorize access="isAuthenticated()">
        replyer = '<sec:authentication property="principal.username"/>';
    </sec:authorize>

    writeReply.on("click", function(e) {
        let reply = {
            reply: replyInputTA.val(),
            replyer: replyInputReplyer.val(),
            boardNum: boardNum,
            postNum: postNum,
        };

        replyService.write(reply);
        showList(-1);
    });

    $(".reply_item").on("click", "li", function() {
        let replyNum = $(this).data("replynum");
        let originalReplyer = replyInputReplyer.val();

        if(replyer != originalReplyer){
            alert("자신이 작성한 댓글만 수정이 가능합니다.");
            modal.modal("hide");
            return;
        }

        replyService.read({boardNum:boardNum, postNum:postNum, replyNum:replyNum}, function(reply) {
            modalReplyInputTA.val(reply.reply);
            modalReplyInputReplyer.val(reply.replyer);
            modalReply.data("replynum", replyNum);

            modalReply.find("button[id!='modalReplyCloseBtn']").hide();
            modalReplyModBtn.show();
            modalReplyRmvBtn.show();
            modalReplyCloseBtn.show();

            $("#modalReply").modal("show");
        });
    });

    modalReplyModBtn.on("click", function(e) {
        let reply = {
            replyNum: modalReply.data("replynum"),
            reply: modalReplyInputTA.val(),
            replyer: modalReplyInputReplyer.val(),
        };

        replyService.edit({boardNum:boardNum, postNum:postNum, replyNum:reply.replyNum}, reply, function(result) {
            modalReply.modal("hide");
            showList(pageNum);
        });
    });

    modalReplyRmvBtn.on("click", function(e) {
        let reply = {
            replyNum: modalReply.data("replynum"),
            reply: modalReplyInputTA.val(),
            replyer: modalReplyInputReplyer.val(),
        };

        replyService.remove({boardNum:boardNum, postNum:postNum, replyNum:reply.replyNum}, function(result) {
            modalReply.modal("hide");
            showList(pageNum);
        });
    });
});
</script>

<script>
$(document).ready(function() {
    let boardNum = '<c:out value="${read.board_num}"/>';
    let postNum = '<c:out value="${read.post_num}"/>';

    $('button').on("click", function() {
        let oper = $(this).data("oper");

        if(oper === 'delete') {

        } else if(oper === 'edit') {
            self.location="/whynull/board/edit?boardNum=" + boardNum  + "&postNum=" + postNum;
        }
    });
});
</script>
</body>
</html>
