<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.btn{
	color:#fff;
	font-style: bolder;
}
</style>
</head>
<body>
    <!-- footer part start -->
     <div class="row" id="bottom" style="margin:0px;">
        <div class="container" style="background-color: black;">
            <div class="row bottom-nav">
                <!-- <a href=" " class="btn col-xs-6 col-sm-3 col-md-2">Undefined 소개</a> -->
                <a data-toggle="modal" data-target="#notice0" class="btn col-xs-6 col-sm-3 col-md-2">Undefined 소개</a>
                <a data-toggle="modal" data-target="#notice1" class="btn col-xs-6 col-sm-3 col-md-2">공지사항</a>
                <a data-toggle="modal" data-target="#notice2" class="btn col-xs-6 col-sm-3 col-md-2">참가자 약관</a>
            </div>
            <div class="row bottom-info">
                <div>
                    <p>
                        #UNDEFINED | (주) HBI 연구소 Acorn 아카데미
                        : 서울특별시 중구 다동88 동아빌딩15층 <br>
                       	 대표: UNDEFINED | K Y J 
                        TEL: 010-0000-0000
                        <br>
                        COPYRIGHT(C) #UNDEFINED
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- 공지사항 참가자약관 취소환불 알림창 START-->
    <div id="notice1" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                   <h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem commodi est ullam quis recusandae! Impedit necessitatibus, rem ut esse repellat, dolorem maiores officia. Nostrum maiores est in explicabo saepe vitae!
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto eius doloremque beatae iste culpa, temporibus modi velit asperiores dolores veniam, id officia? Cumque, commodi ipsa optio magnam tenetur repellendus ullam!</p></h3>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <div id="notice2" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                   <h3><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat sunt possimus cupiditate sapiente. Nesciunt obcaecati provident excepturi at eaque quaerat molestiae cupiditate corporis, ipsa? Ea aut cum, sed repudiandae id.</p></h3>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <div id="notice3" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                   <h3><p>TriLorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat, id, eligendi. Necessitatibus molestias, dolorum iure recusandae ullam eos soluta magnam quisquam beatae repellat dolores obcaecati ducimus perferendis aut quis tempora!</p></h3>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 공지사항 참가자약관 취소환불 알림창 END-->
    <!-- footer part start END-->
</body>
</html>