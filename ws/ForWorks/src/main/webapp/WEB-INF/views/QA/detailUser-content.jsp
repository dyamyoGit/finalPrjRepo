<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
    	table{margin: auto;}
tr, td{
    border: 1px solid rgba(0, 0, 0, 0.144);
    margin: auto;
    text-align: center;
    vertical-align: middle;
}


table {
    border-spacing: 0;
    border-collapse: initial;
}


table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
    .cic{
        
        height: 60vh;
        border-left: 1px dashed rgba(121, 121, 121, 0.555);
        
    }
    .modal2{ 
    position:absolute; width:20%; height:20%; top:12%; left:0; display:none;
    /* background-color: gray; */
    
    margin-top: 12.5%;
    margin-left:400px;
    }

    .modal_content2{
    width:200px; height:100px;
    
    position:relative; top:-100%; left:-50%;
    margin-top:90px; margin-left:400px;
    text-align:center;
    box-sizing:border-box; padding:74px 0;
    line-height:23px; cursor:pointer;
    }
</style>
<div id="content" style="height: 70vh;">
    <div class="dcontent" style="float: left; margin-left: 25%; overflow-y: scroll;">
        <div class="mglt" style="margin-top: 30px;">
            
            <h3>
                <a href="${root}/QA/list/1">
                <button type="button" class=" myBtn ps">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill"
                        viewBox="0 0 16 16">
                        <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
                    </svg>
                </button>
            </a>
            <label for="">${qavo.qaTitle}</label></h3>

            <!-- <label class="text-subtitle text-muted">?????????</label> -->
            
        <div class="table">
            <table class="table table-striped">   

            <tr>
            <td class="text-subtitle text-muted" style="font-weight: 900;">??????</td>
            <td><h6>${qavo.qaSdate}~${qavo.qaEdate}</h6></td>
            </tr>
            <div class="md-3"> 
                <tr>
                <td><label for="title" class="form-label">??????</label>
                <td><h5>${qavo.qaContent}</h5></td>
                </tr>
            </div>

            
            <c:if test="${qaatList.qaatChange ne null}">
                <tr>
                    <td style="width: 15%; background: white;"><label for="f" class="form-label">????????????</label> </td>
                    <td style=" background : white;" style="width: 30%;">
                        <a href="${root}/resources/upload/QA/${qaatList.qaatChange}" download ><span style="text-decoration: underline;">${qaatList.qaatChange}</span></a>
                    </td>
                </tr>
            </c:if>
            <c:if test="${qaatList.qaatChange eq null}">
                
                    <tr>
                        <td style="width: 15%; background: white;" ><label for="f" class="form-label">????????????</label> </td>
                        <td style="background: white;" style="width: 30%;">????????????.</td>
                    </tr>
                </c:if>
                
            <c:if test="${check == 0}">
                <tr><td>????????????</td><td><span>???????????? ????????????</span></td></tr> 
            </c:if>
            </table>
            
            
            <c:if test="${qaatList.qaatChange ne null}">
                <button class="btn btn-primary" id="ig">?????????????????????</button>
                <div class="modal2">
                    <div class="modal_content2" title="???????????? ?????? ????????????.">
                        <img src="${root}/resources/upload/QA/${qaatList.qaatChange}" alt="" width="100%" height="120px">
                    </div>
                </div>
            </c:if>

            <br><br>

            <c:forEach items="${qacgList}" var="cg" varStatus="status">
                <span id="cgName" style="visibility: hidden;">${cg.qacgName}</span>
            <div class="form-check form-control" style="border: 1px solid rgba(128, 128, 128, 0.253); border-radius: 0.5;" >
                <label for="title" class="form-label">??????${cg.rownum}???</label>
                <input type="text" style="width: 90%;" class="form-control" id="title" name="title" value="${cg.qacgName}" disabled>
                &nbsp;&nbsp;&nbsp;
                
                <c:set var="x" value="${fn:length(chaw)}"/>
                <c:set var="check" value="${check}"/>
                
                <i class="bi bi-arrow-return-right"></i>
                <c:choose>
                    <c:when test="${check == 0}">
                        <div class="form-contorl" style="display: inline;">????????? ?????? ????????????.</div>
                    </c:when>
                
                    <c:when test="${x == 0}">
                        ????????????x
                        <input type="text" name="qaawContent" class="form-control" placeholder="????????? ??????????????????" required>
                    </c:when>
                    
                    <c:when test="${x != 0}">
                        ??????:<input type="text" name="qaawContent" class="form-control" style="display: inline; font-weight: 200; width: 85%;" value="${chaw[status.index].qaawContent }" required></input>
                    </c:when>
                </c:choose>
                
                

            </div>
            </c:forEach>



        </div>

    </div>   

    <script>
        var x = '${chaw}';
        console.log(${fn:length(chaw)});
        console.log(${check});
        console.log("cccc:: "+x.length);
    </script>


<script>
    $(function(){ 

    $("#ig").click(function(){
    $(".modal2").fadeIn();
    });

    $(".modal2").click(function(){
    $(".modal2").fadeOut();
    });

    });
</script>
