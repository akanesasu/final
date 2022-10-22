<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WHY NULL</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/css/style.css" />

    <!-- FONTS-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;600;900&family=Yeon+Sung&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<div class="container">
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/whynull/main" class="d-flex align-items-center col-2 mb-2 mb-md-0 text-dark text-decoration-none">
        <h1 class="logo_alt display-6">WHY NULL</h1>
    </a>

    <ul class="nav col-6 mb-2 justify-content-center mb-md-0 fs-5">
        <li><a class="nav-link px-4 link-dark" href="/whynull/board/list?boardNum=1&pageNum=1" role="button">자유</a></li>
        <li><a class="nav-link px-4 link-dark" href="/whynull/board/list?boardNum=2&pageNum=1" role="button">정보</a></li>
        <li><a class="nav-link px-4 link-dark" href="/whynull/board/list?boardNum=3&pageNum=1" role="button">홍보</a></li>
        <li><a class="nav-link px-4 link-dark" href="/whynull/board/list?boardNum=4&pageNum=1" role="button">코드질답</a></li>
    </ul>

    <div class="row col-4" style="flex-wrap: nowrap; align-items: center;">
        <form class="input-group my-0 mx-4 p-0" action="/whynull/board/allResult" method="get" style="width:250px;">
            <input type="text" class="form-control" placeholder="통합검색"><span><button class="input-group-text btn btn-dark">검색</button></span>
        </form>
        <div class="dropdown text-end d-flex">
            <a href="#" class="d-block link-dark text-decoration-none" id="dropdownUser1" data-bs-toggle="dropdown">
                <span class="fw-bold"><sec:authentication property="principal.username"/>${username}</span> 님
            </a>
            <ul class="dropdown-menu text-small">
                <li><a class="dropdown-item" href="/whynull/member/mypage">마이페이지</a></li>
                <li><a class="dropdown-item" href="/whynull/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>
</header>
</div>