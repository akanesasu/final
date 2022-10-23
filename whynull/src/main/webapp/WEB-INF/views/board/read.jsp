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
        <button type="button" class="btn" style="background-color:#FF7A7A;" data-bs-toggle="modal" data-bs-target="#staticBackdropLive">신고</button>
    </div>
    <div class="col-4 d-flex" style="justify-content: center; align-items: center;">
        <span class="fw-bold mx-1 fs-6">추천수</span>
        <button type="button" class="btn btn-primary mx-1">추천</button>
        <button type="button" class="btn btn-danger mx-1">비추</button>
        <span class="fw-bold mx-1 fs-6">비추수</span>
    </div>
    <div class="col-4 text-end">
        <c:if test="${principal.username eq read.mem_id}"><button type="button" class="btn btn-secondary mx-1">수정</button></c:if>
        <c:if test="${principal.username eq read.mem_id}"><button type="button" class="btn btn-secondary">삭제</button></c:if>
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

<div class="reply_write" style="background-color: rgb(241, 241, 241)">
    <div class='row mb-3 p-2'>
        <div class='col-2 text-start form-group'><input class="form-control fw-bold" name="replyer" value="<sec:authentication property='principal.username'/>" disabled></div>
        <div class='p-0 col-9 form-group'><textarea rows="2" cols="150" class="replyTA form-control" name="reply"></textarea></div>
        <div class='col-1 text-end'><button class="btn btn-primary" id="writeReply" style="background-color:#00487F;">등록</button></div>
    </div>
</div>

</div> <!-- END Container -->

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
                if(callback) { callback(data); }
            }
        ).fail(function(xhr, status, err) {
            if(error) { error(); }
        });
    }

    function remove(replyNum, callback, error) {
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

    function modify(reply, callback, error) {
        console.log("replyNum : " + reply.replyNum);
        $.ajax({
            type: 'post',
            url: '../reply/' + reply.boardNum + "/"  + reply.postNum + "/" + reply.replyNum,
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

    function read(replyNum, callback, error) {
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
        modify:modify,
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
        replyService.getList({boardNum:boardNum, postNum:postNum, page:page||1}, function(list) {
            let str="";
            if(list==null || list.length==0) {
                replyUl.html("");
                return;
            }
            for(let i=0, len=list.length||0; i<len; i++) {
                str += "<li class='left clearfix' data-rno='" + list[i].replyNum + "'>";
                str += "    <div class='row mb-3'>";
                str += "        <div class='col-2 text-start fw-bold'>" + list[i].replyer + "</div>";
                str += "        <div class='p-0 col-7 comment_text'>" + list[i].reply + "</div>";
                str += "        <div class='col-3 text-end'>"
                str += "            <span>" + replyService.displayTime(list[i].replyDate) + "</span>"
                str += "            <span class='sep'></span>"
                str += "            <a class='hrs' href='#' id='reportReply'>신고</a>"
                str += "            <span class='sep'></span>"
                str += "            <a class='hrs' href='#' id='reReply'>답글</a>"
                str += "            <span class='sep'></span>"
                str += "            <a class='hrs' href='#' id='modReply'>수정</a>"
                str += "            <span class='sep'></span>"
                str += "            <a class='hrs' href='#' id='rmvReply'>삭제</a>"
                str += "        </div>"
                str += "    </div>"
                str += "</li>"
                str += "<hr class='my-4'/>";
            }
            replyUl.html(str);
        });
    } //showList

    let replyTotal = $(".reply_total");
    let replyInputTA = replyTotal.find("textarea[name='reply']");
    let replyInputReplyer = replyTotal.find("input[name='replyer']");
    let writeReply = $("#writeReply");
    let replyReportReply = $("#reportReply");
    let replyReReply = $("#reReply");
    let replyModReply = $("#modReply");
    let replyRmvReply = $("#rmvReply");

    writeReply.on("click", function(e) {
        let reply = {
            reply: replyInputTA.val(),
            replyer: replyInputReplyer.val(),
            boardNum: boardNum,
            postNum: postNum,
        };

        replyService.write(reply);
        showList(1);
    });
});

</script>

</body>
</html>
