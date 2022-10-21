<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Login</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/css/style.css" />

    <!-- FONTS-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600;900&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <style>
    a {
        color: black;
        text-decoration: none;
    }

    .code {
        color: #A9B7C6;
        text-decoration: none;
    }
    .code_import {
        color: #CC7832;
    }
    .code_anno {
        color: #BBB529;
    }
    </style>
</head>
<body>
<div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5 ">
        <div class="col-lg-7 p-5" style="height: 450px; background-color: #191e1e;">
            <p class="code">
                <span class="code_import">package</span> org.whynull.controller;<br>
                <br>
                <span class="code_import">import</span> lombok.extern.log4j.Log4j2;<br>
                <span class="code_import">import</span> org.springframework.stereotype.Controller;<br>
                <span class="code_import">import</span> org.springframework.web.bind.annotation.GetMapping;<br>
                <br>
                <span class="code_anno">@Controller</span><br>
                <span class="code_anno">@Log4j2</span><br>
                <span class="code_import">public class</span> LoginController {<br>
                <span class="code_anno" style="padding-left: 2rem">@GetMapping</span>(<span style="color: #56e27a;">"/login"</span>)<br>
                    <span class="import" style="padding-left: 2rem">public void</span> login() {<br>
                        <span style="padding-left: 4rem">log.info("ID : " + <span style="color:white;">whynull</span>);<br></span>
                        <span style="padding-left: 4rem">log.info("PW : " + <span style="color:white;">*********</span>);<br></span>
                    <span style="padding-left: 2rem">}<br></span>
                }
            </p>
        </div>
        <div class="col-md-10 mx-auto col-lg-5">
            <form class="p-4 p-md-5 border rounded-3 bg-light" action="/whynull/login" method="post">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" name="username" id="userid" placeholder="ID">
                    <label for="userid">아이디</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" name="password" id="userpw" placeholder="Password">
                    <label for="userpw">비밀번호</label>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox" value="remember-me"> REMEMBER ME</label>
                </div>
                <div class="d-flex my-3" style="justify-content: space-evenly">
                    <a href="/whynull/member/signin" id="signin"><small>회원가입</small></a>
                    <a href="/whynull/member/forgot" id="forgot"><small>아이디/비밀번호 찾기</small></a>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
                <hr class="my-4">
                <div class="text-center"><small class="text-muted">회원으로 가입하면 이용약관에 동의하게 됩니다.</small></div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>