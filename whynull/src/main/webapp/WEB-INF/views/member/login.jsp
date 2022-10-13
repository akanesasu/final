<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

<style>
    #abc {
        color: black;
        text-decoration: none;
    }

    #abc :hover {
        color: black;
        text-decoration: underline;
    }

    #abc1 {
        color: #677077;
        text-decoration: none;
    }

    #codeL {
        /* margin-top: 50px;
        width: 55%; */
        background-color: #191e1e;

        /* box-shadow: 0 9px 15px 0 rgb(0, 0, 0/20%);
        border-radius: 5px;
        padding: 60px; */
    }

    #ip {
        border:none;
    }

    input:focus {
        border-width:0;
    }

    #ip, #ip:focus {
            border-width: 0;
            outline: none;
    }
</style>
</head>
<body>
<div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5 ">
        <div class="hellow col-lg-7 text-center text-lg-start text-white" style="height: 450px; background-color: #191e1e;">
            <samll class=" fw-bold lh-1 mb-3 ">System.out.println("HELLO WHY NULL.")</samll>
            <p> </p>
            <!-- <small class="col-lg-10 fs-4    " data-bs-toggle="modal" data-bs-target="#exampleModal">HELLO WHY NULL.</small> -->

            <button type="button" class="btn btn-black text-white " data-bs-toggle="modal" data-bs-target="#exampleModal" >
                HELLO WHY NULL.
            </button>
        </div>
        <div class="col-md-10 mx-auto col-lg-5">
            <form class="p-4 p-md-5 border rounded-3 bg-light">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInput" placeholder="ID">
                    <label for="floatingInput">아이디</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">비밀번호</label>
                </div>
                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-id"> 아이디 저장
                    </label>
                    <div class="user" id="abc">
                        <a href="create account" class="create account" id="abc">회원가입</a>

                        <a href="idpwfind" class="idpw-find" id="abc">아이디/비밀번호 찾기</a>

                    </div>
                </div>

                <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
                <hr class="my-4">
                <small class="text-muted">회원가입을 클릭하면 이용약관에 동의하게 됩니다.</small>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="container col-xl-10 col-xxl-8 px-4 py-5">
                <div class="row align-items-center g-lg-5 py-5">
                    <div class="col-lg-7 text-center text-lg-start " id="codeL" style="height: 450px;">
                        <p>
                            <span id="code1" style="color: #85d9eb;"> @SpringBootApplication <br>
                                    @RestController </span> <br>
                            <span style="color: #56e27a;"> ID :</span>
                                <input type="id" id="ip" style="background-color: #191e1e; color:white " >
                             <br><br>

                            <span style="color: #85d9eb;"> @GetMapping</span>
                            <span style="color: #d4f088;">"/Helloworld"</span> <br>
                            <span style="color: #56e27a;">PW :</span> <span style="color: white;">
                                <input type="password" id="ip" style="background-color: #191e1e; color:white" >
                            </span><br><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: white;">
                                <button class="btn btn-lg btn-block" type="submit" style="color: white;">Login</button>
                            </span>
                        </p>
                    </div>
                    <div class="col-md-10 mx-auto col-lg-5">
                        <form class="p-4 p-md-5 border rounded-3 bg-light">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" placeholder="ID">
                                <label for="floatingInput">아이디</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                                <label for="floatingPassword">비밀번호</label>
                            </div>
                            <div class="checkbox mb-3">
                                <label>
                                    <input type="checkbox" value="remember-id"> 아이디 저장
                                </label>
                                <div class="user">
                                    <a href="create account" class="create account" id="abc">회원가입</a>
                                    <a href="idpwfind" class="idpw-find" id="abc">아이디/비밀번호 찾기</a>
                                </div>
                            </div>

                            <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
                            <hr class="my-4">
                            <small class="text-muted">회원가입을 클릭하면 이용약관에 동의하게 됩니다.</small>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- END MODAL -->

</body>
</html>