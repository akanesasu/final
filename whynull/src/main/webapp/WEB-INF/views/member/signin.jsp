<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <style>
        .input-form {
            max-width: 680px;
            margin-top: 80px;
            padding: 32px;

            /* background: #fff; */
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.18);
        }
    </style>
</head>

<body>
<div class="container">
    <div class="input-form-background row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원가입</h4>

            <form class="validation-form" novalidate>
                <div class="form-group mb-3">
                    <label for="username" class="mb-2">닉네임</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="닉네임을 입력해주세요">
                    <button class="btn btn-sm btn-primary" type="submit" id="button-addon">중복확인</button>
                    <div class="invalid-feedback">닉네임을 입력해주세요.</div>
                </div>
                <div class="form-group mb-3">
                    <label for="userid" class="mb-2">아이디</label>
                    <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디을 입력해주세요">
                    <button class="btn btn-sm btn-primary" type="button" id="button-addon">중복확인</button>
                    <div class="invalid-feedback">아이디를 입력해주세요.</div>
                </div>
                <div class="form-group mb-3">
                    <label for="password" class="mb-2">비밀번호</label>
                    <input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호를 입력해주세요." required>
                    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                </div>
                <div class="form-group mb-3">
                    <label for="password_repeat" class="mb-2">비밀번호 확인</label>
                    <input type="password_repeat" class="form-control" id="userpw_repeat" placeholder="비밀번호 확인" required>
                </div>
                <div class="custom-control custom-checkbox mb-4">
                    <input type="checkbox" class="custom-control-input" id="agreement" required>
                    <label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
                </div>
                <div class="d-flex" style="justify-content:center">
                    <button class="btn btn-primary btn-lg btn-block mx-2" type="submit">가입하기</button>
                    <button class="btn btn-secondary btn-lg btn-block mx-2" type="submit">돌아가기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });
}, false);

/* 메시지 박스 */
function result() {
    if (userid.value=="") {
        alert("ID는 필수 입력사항입니다.");
    } else if(userpw.value=="") {
        alert("비밀번호는 필수 입력사항입니다.");
    } else if(userpw.value != userpw_repeat.value) {
        alert("입력하신 두 비밀번호가 다릅니다.");
    }
}
</script>
</body>
</html>