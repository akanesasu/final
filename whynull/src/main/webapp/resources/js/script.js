$(".body").on(
    "click",
    ".reply-link",
    
    function () {
      var t = $(this).attr("data-target");
      if ($("#replyForm" + t).length) return $("#replyForm" + t).remove(), !1;
      var e = c(),
        a = i(),
        n = !1,
        a = $("<form>")
          .addClass("reply-form")
          .attr({
            id: "replyForm".concat(t),
            action: "/b/".concat(o.slug, "/").concat(o.articleId, "/comment"),
            method: "post",
          })
          .append(
            $("<input>").attr({
              type: "hidden",
              name: "_csrf",
              value: o._csrf,
            }),
            $("<input>").attr({
              type: "hidden",
              name: "contentType",
              value: "text",
            }),
            $("<input>").attr({ type: "hidden", name: "parentId", value: t }),
            $("<div>")
              .addClass("reply-form__container" + (o.user ? "" : " recaptcha"))
              .append(
                $("<div>").addClass("reply-form__info").append(
                    $("<div>").addClass("reply-form__user-info").append(
                        $("<span>").addClass("replay-form-title").text("답글 작성"),
                        $("<div>").addClass("reply-form__user-info__avatar").append(e.gravatar.clone()),
                        o.user
                          ? $("<input>").addClass("reply-form-user-input").attr({
                              type: "text",
                              disabled: "true",
                              value: LiveConfig.nickname,
                            })
                          : $("<input>")
                              .addClass("reply-form-user-input")
                              .attr({
                                type: "text",
                                name: "nickname",
                                placeholder: "이름",
                                value: o.nickname,
                                required: "required",
                                tabindex: a,
                              }).add(
                                $("<input>").addClass("reply-form-user-input").attr({
                                    type: "password",
                                    name: "password",
                                    placeholder: "암호",
                                    value: o.password,
                                    required: "required",
                                    tabindexstart: a + 1,
                                  })
                              )
                    )
                $("<div>")
                  .addClass("reply-form-textarea-wrapper")
                  .append(
                    $("<textarea>")
                      .addClass("reply-form-textarea")
                      .attr({
                        name: "content",
                        maxlength: "8000",
                        required: "required",
                        tabindex: a + 2,
                        placeholder: e.placeholder,
                      })
                      .on("input focus", function () {
                        var t = $(this).next().outerHeight();
                        (this.style.height = "auto"),
                          (this.style.height = this.scrollHeight + t + "px");
                      }),
                    $("<div>")
                      .addClass("reply-form__submit-button-wrapper")
                      .append(
                        $("<button>")
                          .addClass("reply-form__submit-button")
                          .attr({
                            type: "submit",
                            id: "replyFormButton".concat(t),
                            tabindex: a + 3,
                          })
                          .text("작성")
                      )
                  )
              ),
      return (
        $("#c_" + t).after(a),
        a[0].scrollIntoView({ block: "center" }),
        a.find(".reply-form-textarea").focus(),
        a.find(".namlacon .thumbnails").each(function (t, e) {
          dragToMove(e);
        }),
        !1
      );
    }
  );
  