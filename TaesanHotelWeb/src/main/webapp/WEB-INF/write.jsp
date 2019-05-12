<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>글쓰기</title>
</head>
<body>
<%@include file="nav.jsp" %>
	<div class="container">
		<table class="table table-hover">
			<form id="insertBoardFrm" action="insertBoard.do" method="post" enctype="multipart/form-data">
             <tr>
                  <th>제목</th>
                  <td><input style="width: 100%" type="text" id="title" name="title" /></td>
             </tr>
              <tr>
                   <th>내용</th>
                   <td><textarea name="content" id="editor" style="width: 100%; height: 400px;"></textarea></td>
              </tr>
              <tr>
              	<th>
              		업로드
              	</th>
              	<td>
              		<input type="file" name="uploadFile"/>
              	</td>
              </tr>
			  <tr>
					<td>
					</td>
					<td>
						<input class="btn btn-default pull-right" type="button" value="취소"
						onclick="history.back()"
						/>
						<input id="insertBoard" class="btn btn-default pull-right" type="button" value="등록"/>
					</td>
				</tr>
			</form>
         </table>
	</div>
	<br><br><br>
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="./resources/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송버튼
        $("#insertBoard").click(function(){
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
    });
</script>
</body>
</html>