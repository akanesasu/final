<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>

<body>
<div class="container">
    <div class="row">
      <!-- 게시판 -->
      <div class="col-lg-10" style="border: solid 4px black">
        <!-- 카드1열 -->
        <!-- 카드1 -->

        <div class="row">
          <div class="row col-sm-6" style="margin-right: 36px">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>

          <!-- 카드2 -->
          <div class="row col-sm-6">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>

        <p></p>

        <!-- 게시판 2열 -->

        <!-- 카드1 -->
        <div class="row">
          <div class="row col-sm-6" style="margin-right: 36px">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>

          <!-- 카드2 -->
          <div class="row col-sm-6">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>

        <p></p>

        <!-- 카드 3열 -->

        <!-- 카드1 -->
        <div class="row">
          <div class="row col-sm-6" style="margin-right: 36px">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>

          <!-- 카드2 -->
          <div class="row col-sm-6">
            <div class="card text-center">
              <div class="card-header">Featured</div>
              <ul class="list-group list-group-flush">
                <li class="list-group-item">An item</li>

                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
                <li class="list-group-item">A second item</li>
                <li class="list-group-item">A third item</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- 게시판끝 -->

      <div class="col-lg-2" style="border: solid 4px black">
        <p style="height: 800px; width: 150px; border: solid 2px red">배너</p>
      </div>
    </div>

    <%@include file="./includes/footer.jsp"%>
  </div>
</body>
</html>