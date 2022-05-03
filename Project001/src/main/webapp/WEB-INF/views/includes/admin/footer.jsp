<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <div class="clearfix"></div>
    </div>
  </div>

  <script type="text/javascript">
     $(document).ready(function(){
         $('#btn_logout').click(function(){
             // location = '../member/logout';
             $.ajax({
               type : "POST",
               url : "/member/logout",
               success : function(data){
                 alert("로그아웃 되었습니다.");
                 document.location.reload();
               }
             }); // end ajax
         }); // end btn_logout.click()
         
       
         }); // end btn_admin_page.click()
     }); // end document()
  </script>