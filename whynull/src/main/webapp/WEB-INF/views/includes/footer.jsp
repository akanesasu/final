<!-- FOOTER -->
<div class="container">
<footer class="py-3 my-4">
    <ul class="nav justify-content-center pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">이용규칙</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">개인정보처리방식</a></li>
      <li class="nav-item"><a href="" class="nav-link px-2 text-muted" data-bs-toggle="modal" data-bs-target="#staticBackdropLive">문의하기</a></li>
    </ul>
    <hr/>
    <p class="text-center text-muted">&copy; WHY NULL</p>
</footer>
</div>



<!-- 문의 팝업창 -->
<div class="modal fade " id="staticBackdropLive" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
aria-labelledby="staticBackdropLiveLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <h3 class="modal-title" id="staticBackdropLiveLabel">문의하기</h3>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>

    <div class="modal-body">


      <input type="email" class="form-control" id="floatingInputGrid" placeholder="name@example.com" >
      <p> </p>
      <textarea class="form-control" id="message-text" placeholder="문의내용을 입력해주세요"cols="30" rows="10"></textarea>
      <p> </p>
    </div>

    <div class="modal-footer">
      <!-- <small>문의 후 답변은 이메일로 전송 됩니다.</small> -->
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      <div class="d-flex justify-content-between flex-wrap">
      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >문의하기</button>
    </div>
    </div>
  </div>
</div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">문의완료</h5>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    </div>
    <div class="modal-body">
     답변은 이메일로 보내드리겠습니다.
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
    </div>
  </div>
</div>
</div>