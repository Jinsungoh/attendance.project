<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<html>
<head>
<title></title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>		   
		 function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 '동/로/가'로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById('extraAddress').value = extraAddr;
                
                } else {
                    document.getElementById('extraAddress').value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('extraAddress').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('detailAddress').focus();
            }
        }).open();
    }
		
</script>
<style>
    form {
      margin-bottom: 7rem;
    }

    label {
      line-height: 1.6rem;
    }
    
    #searchpost{
      background-color: lightgray;
        color: black;
        margin-left: 1rem;    
    }
    #extraAddress{
        margin-top: 0.5rem;
    }
    #detailAddress {
      margin-left: .5rem;
      margin-top: .5rem;
    }
    #dropdown{
      margin-left: 0.5rem;
    }
</style>
<body>
<div class='container'>
    <div class='row title'></div>
    <div class='row'>
        <div class='col'></div>
        <div class='col-6'>
              <form class='form_box'>
                <label for='input-id'>아이디</label>
                <div class='input-group'>
                  <input type='text' class='form-control' id='input-id' name='input-id' placeholder='숫자, 문자 포함 12자이하로 입력하세요'>
                  <button class='btn' type='button'id='duplicate-check' onclick='checkDuplicate()'>중복확인</button>
                </div>
                <br>
                <label for='password'>비밀번호</label>
                <input type='password' class='form-control' id='password' placeholder='숫자, 문자 포함 6자이상 15자이하로 입력하세요'>
                <br>
                <label for='password_confirm'>비밀번호 확인</label>
                <input type='password' class='form-control' id='password_confirm' placeholder='비밀번호를 다시 입력하세요'>
                <br>
                <label for='company_name'>회사명</label>
                <input type='text' class='form-control' id='company_name' placeholder='-제외'>
                <br>
                <label for='company_number'>사업자번호</label>
                <input type='text' class='form-control' id='company_number' placeholder='-제외'>
                <br>
                <div class='form-group'>
                    <label for='input-postcode'>주소</label>
                    <div class='input-group '>
                      <input type='text' class='form-control' id='postcode' name='postcode' placeholder='우편번호'>
                      <div class='input-group-append'>
                        <button class='btn' type='button' onclick='DaumPostcode()' id='searchpost'>우편번호찾기</button>
                      </div>
                    </div>     
                    <div class='input-group'>
                      <input type='text' id='extraAddress' class='form-control' name='extraAddress'>
                      <input type='text' id='detailAddress' class='form-control' name='detailAddress' placeholder='상세주소'>         
                    </div>                 
                </div>
                <br>
                <label for='representative_name'>대표자명</label>
                <input type='text' class='form-control' id='representative_name' >
                <br>
                <div class='form-group'>
                    <label for='input-email'>대표 메일</label>
                    <div class='input-group'>
                        <input type='text' class='form-control' id='input-email' name='email' >
                        <h4>&nbsp; @ &nbsp;</h4>
                        <input type='text' class='form-control' id='sub-email' name='sub-email'>
                        <div class='dropdown'>
                          <button type='button' class='btn dropdown-toggle' data-bs-toggle='dropdown'></button>
                          <div class='dropdown-menu'>
                              <a class='dropdown-item' href='#'>직접입력</a>
                              <a class='dropdown-item' href='#'>naver.com</a>
                              <a class='dropdown-item' href='#'>daum.net</a>
                              <a class='dropdown-item' href='#'>gmail.com</a>
                          </div>
                        </div>
                    </div>
                </div>
                <br>
                <label for='representative_phone'>대표 전화번호</label>
                <input type='tel' class='form-control' id='representative_phone' placeholder='-제외'>
                <br>
                <br>
                <input type='submit' id='newuser' class='btn btn-blue text-center' value='회 원 가 입'/><br>
            </form>
        </div>
        <div class='col'></div>
    </div>
</div>
<div class='modal fade' id='modal'>
  <div class='modal-dialog'>
      <div class='modal-content'>
          <div class='modal-header'>
              <button type='button' class='btn-close' data-bs-dismiss='modal'></button>
          </div>
          <div class='modal-body'>
            <p id='modalMsg'></p>
          </div>
          <div class='modal-footer'>
            <button type='button' class='btn btn-blue' id='okBtn'>확인</button>
          </div>
        </div>
    </div>
</div>
</body>