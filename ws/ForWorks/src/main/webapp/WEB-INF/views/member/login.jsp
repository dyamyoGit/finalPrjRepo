<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ForWorks</title>
    <script src="https://kit.fontawesome.com/3a92c85ff9.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
      crossorigin="anonymous"
    ></script>

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${root}/resources/css/common/bootstrap.css" />

    <link rel="stylesheet" href="${root}/resources/vendors/perfect-scrollbar/perfect-scrollbar.css" />
    <!-- <link rel="stylesheet" href="resources/vendors/bootstrap-icons/bootstrap-icons.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${root}/resources/css/common/app.css" />
    <link rel="stylesheet" href="${root}/resources/css/common.css" />

    <link rel="stylesheet" href="${root}/resources/css/member/login-style.css" />
    <style>
      body {
        background-color: #fff;
      }
    </style>
  </head>
  <body>
    <%@ include file="/WEB-INF/views/common/toastify.jsp" %>

    <div class="container">
      <div class="form-container">
        <div class="signin">
          <form action="" class="signin-form" method="post">
            <h1 class="title">FOR-WORKS</h1>
            <h5 class="sub-title">????????? ??? ?????? ????????? ????????????</h5>
            <div class="input-field">
              <i class="fas fa-user"></i>
              <input name="empId" value="${cookie.mid.value}" type="text" placeholder="?????????" required />
            </div>
            <div class="input-field">
              <i class="fa-solid fa-shield-halved"></i>
              <input name="empPwd" type="password" placeholder="????????????" required />
            </div>
            <div class="login-info">
              <div class="save-id form-check form-switch">
                <input name="saveId" id="saveCheck" class="form-check-input" type="checkbox" role="switch" checked />
                <label for="saveCheck" class="form-check-label">????????? ??????</label>
              </div>
              <div class="find-idpwd">
                <button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalFindId">????????? ??????</button> |
                <button type="button" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modalFindPwd">???????????? ??????</button>
              </div>
            </div>
            <input type="submit" value="?????????" class="login-btn solid" />
          </form>
          <div class="media-panel">
            <span>?????? ????????? ??????????????????! &nbsp; <a href="${root}/join">????????????</a></span>
          </div>
        </div>
      </div>
      <div class="panel-container">
        <div class="panel">
          <div class="content">
            <h3 style="color: #7d6cff">????????? ??????????????????!</h3>
            <p>????????? ??????????????? FOR-WORKS??? ?????? ????????? ?????? ????????? ????????? ?????????.</p>
            <a href="${root}/join" class="btn login-btn transparent" id="signup-btn">????????????</a>
          </div>
          <img src="${root}/resources/img/member-imgs/undraw_remotely_-2-j6y.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <!-- ????????? ?????? ?????? -->
    <div class="modal fade" tabindex="-1" role="dialog" id="modalFindId">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
            <h1 class="fw-bold mb-0 fs-2">????????? ??????</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body p-5 pt-0">
            <form>
              <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-4" id="findIdName" placeholder="name@example.com" />
                <label for="findIdName">??????</label>
              </div>
              <div class="form-floating mb-3">
                <input type="email" class="form-control rounded-4" id="findIdEmail" placeholder="Password" />
                <label for="findIdEmail">?????????</label>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="button" onclick="findId();">????????? ??????</button>
	          <hr id="findid-hr" class="my-4" style="display:none"/>
              <strong class="text-muted" id="foundId">
                <div id="findid-spinner" class="spinner-border spinner-border-sm text-primary" style="display: none" role="status">
                  <span class="visually-hidden">Loading...</span>
                </div>
              </strong>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- ???????????? ??????(??????) ??????-->
    <div class="modal fade" tabindex="-1" role="dialog" id="modalFindPwd">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-4 shadow">
          <div class="modal-header p-5 pb-4 border-bottom-0">
            <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
            <h1 class="fw-bold mb-0 fs-2">???????????? ??????</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body p-5 pt-0">
            <form>
              <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-4" id="findPwdId" placeholder="?????????"/>
                <label for="findPwdName">?????????</label>
              </div>
              <div class="form-floating mb-3">
                <input type="text" class="form-control rounded-4" id="findPwdName" placeholder="??????"/>
                <label for="findPwdName">??????</label>
              </div>
              <div class="form-floating mb-3">
                <input type="email" class="form-control rounded-4" id="findPwdEmail" placeholder="??????????????? ????????? ?????????"/>
                <label for="findPwdEmail">???????????????</label>
                <p style="margin-left: 5px">
                  <small class="text-muted me-1"> * ??????????????? ????????? ???????????????</small>
                </p>
              </div>
              <button class="w-100 mb-2 btn btn-lg rounded-4 btn-secondary" type="button" onclick="tempPwd();">?????? ???????????? ??????</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script>
      //?????? ?????????
      $(".modal").on("hidden.bs.modal", function (e) {
        $(this).find("form")[0].reset();

        const foundId = document.querySelector("#foundId");
        foundId.innerText = "";
      });
    </script>

    <script>
      //????????? ??????
      function findId() {
        const empName = document.querySelector("#findIdName").value;
        const empEmail = document.querySelector("#findIdEmail").value;
        const foundId = document.querySelector("#foundId");
	
        $("#findid-hr").css("display", "block");
        $("#findid-spinner").show();

        $.ajax({
          url: "${root}/findId",
          type: "post",
          data: {
            empName: empName,
            empEmail: empEmail,
          },
          success: function (data) {
            if (data == "") {
              $("#findid-spinner").hide();
              foundId.innerText = "???????????? ?????? ??? ????????????.";
            } else {
              $("#findid-spinner").hide();
              foundId.innerText = "????????? : " + data;
            }
          },
          error: function (e) {
        	  console.log("????????????");
          },
        });
      }
    </script>
    
    <script>
    	var deleteCookie = function(name) {
    		document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
    	}
    
	    $(document).ready(function(){
			$("#saveCheck").on("click", function() {
				if($(this).prop('checked')) {
					
				} else {
					deleteCookie('mid');
					$("#saveCheck").is("checked") == false;
				}
			})
		});
    </script>
    
    <script>
    	function tempPwd() {
    		const empPwdId = document.querySelector("#findPwdId").value;
    		const empPwdName = document.querySelector("#findPwdName").value;
            const empPwdEmail = document.querySelector("#findPwdEmail").value;
            
            $.ajax({
               url: "${root}/findPwd",
               type: "post",
               data: {
            	 empId: empPwdId,
                 empName: empPwdName,
                 empEmail: empPwdEmail,
               },
               success: function (data) {
                 if (data == "1") {
                	 toastContent.innerText = "???????????? ????????????????????? ?????????????????????.";                	 
			         $(".modal-backdrop").remove();
			         $("#modalFindPwd").modal("hide");
                 } else if (data == "-1") {
                	 toastContent.innerText = "???????????? ????????? ????????????.";
                 }
               },
               error: function (e) {
            	   console.log("????????????");
            	   toastContent.innerText = "???????????? ????????? ????????????.";
               },
             });
    	}
    </script>
  </body>
</html>
