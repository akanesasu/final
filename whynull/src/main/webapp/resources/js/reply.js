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

    return {
        write:write,
        getList:getList,
        remove:remove,
        modify:modify,
        read:read,
    };
})();