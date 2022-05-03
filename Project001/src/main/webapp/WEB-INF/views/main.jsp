<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- main/css -->
    <link rel="stylesheet" href="resources/css/main.css">  
    <link rel="stylesheet" href="resources/css/reset.css">

<title>Le Labo Fragrances | Niche Perfumes and Candles</title>
</head>
<body>
<!-- header -->
<%@include file="includes/layout/nav_whi.jsp" %>

<div class="container part_01" style="margin-bottom: 10vw;">
  <!-- video Part-->
  <div id="intro">
    <div class="bgMovie">
          <video autoplay loop muted poster="resources/imgs/vd_bg.png" id="bgvid">
            <source src="resources/video/back_vd.webm" type="video/webm">
            <source src="resources/video/back_vd.mp4" type="video/mp4">
            <!--<source src="video/bw.ogv" type="video/ogv">-->
          </video>
    </div>
  </div>
  <!-- main title part -->
  <div class="main_title_part">
    <h1 class="main_title">TO MAKE LIFE</h1>
    <h1 class="main_title"">MORE BEAUTIFUL</h1>
    <p class="main_title_content">우리가 하려는 말이 침묵보다 가치 있는 것인지 확인해야 합니다.<br>
       우리의 목표는 삶을 보다 아름답게 만드는 것입니다.</p>
    <div class="main_title_sub">
        <a href="/about-us"><span class="main_title_move">FULL STROY</span></a>
    </div>
  </div>
  
</div> 
      
      
<div class="part_02">
  <div class="intro_part">
    <div class="intro_title" >
      <div class="part_02_space"></div>
      <h1 class="part_02_title">YOU MAKE IT PERFECT</h1>
      <p class="part_02_text">르 라보의 가장 중요한 미션은 우리의 작품과 그 아름다움을 세상에 공유하는 것입니다.</p>
      <div style="height: 180px"></div>
    </div>
    
    <div class="keyword_01">
      <div class="key_img01_box"></div>
      <div class="container keyword01_div">
        <div class="keyword_01_box">
          <h4 style="">정제된 자연 / REFINED NATURE</h4>
        </div>
        <div class="keyword_01_text">
          <p>르라보의 향수는 천연향료와 희귀재료 등 고급원료를 사용하여<br>
             수백번의 시향과정을 거쳐 탄생하게 됩니다. 비싼원료를 사용했다는 이유만으로<br>
             르라보를 뿌리는게 아닌 뿌렸을 때 당신의 얼굴에 미소를 돌게합니다.
          </p>
        </div>
      </div>
    </div>
    
    <div class="space_box" style="height: 180px"></div>
    
    <div class="keyword_02" style="text-align: -webkit-right">
      <div class="key_img02_box"></div>
      <div class="container keyword02_div">
        <div class="keyword_02_box">
          <h4 style="">독점적인 / EXCLUSIVE</h4>
        </div>
        <div class="keyword_02_text">
          <p>르라보의 향수는 천연향료와 희귀재료 등 고급원료를 사용하여<br>
             향수를 고르는 과정은 시향을 통해 향수를 정하면 전문 테크니션이 레시피에 따라<br>
             향료와 베이스를 블렌딩 합니다. 이 과정에서 소비자는 자신의 향수에 들어가는 <br>
             원재료와 조향사들이 일하는 과정을 보게되고 향수 제작과정에 대한 호기심<br>
             또한 해결됩니다.
          </p>
        </div>
      </div>
    </div>
    
    <div class="space_box" style="height: 180px"></div>
    
    <div class="keyword_03">
      <div class="key_img03_box"></div>
      <div class="container keyword01_div">
        <div class="keyword_03_box">
          <h4>개성 있는 경험 / UNIQUE EXPERIENCE</h4>
        </div>
        <div class="keyword_03_text">
          <p>
             향수 표지에는 제조 날짜와 장소 및 고객의 이름 혹은 원하는 메세지가 들어가는데<br>
             향수 구입에 있어 경험이 고스란히 기록되는 고유의 방식입니다.
          </p>
        </div>
      </div>
    </div>
    
    <div class="space_box" style="height: 300px"></div>
    
  </div>
</div>

<!-- part_03 -->
<div class="part_03 container">
  <!-- title_part -->
  <div class="part_03_title">
    <h2>SIGNATURE PERFUME</h2>
    <p> 제품을 판매하는 차원이 아니라, 르 라보에서<br>
        감각적인 경험과 추억, 새로운 과정을 제공하는 것입니다.
    </p>
  </div>
  
  <div class="space_box" style="height: 160px"></div>
  
  <!-- sgp_01 -->
  <div class="sgp_01">
    <div class="sgp_01_img"></div>
    <div class="sgp_01_content">
      <div class="sgp_01_text">
        <h4>BAIE 19(베이 19)</h4>
        <p>
          오랜 가뭄 끝에 내린 소나기로 읺해 촉촉하고 풍요롭게 반짝이는 나무, 잎,<br>
          열매와 상쾌한 대지의 공기가 만들어내는 신비로운 자연의 향기
        </p>
        <div class="sgp_01_btn">
          <a><span>View All</span></a>
        </div>
      </div>
      <div class="sgp_01_imgs">
        <img class="sgp_01_img01" src="resources/imgs/sn01_sub01_ver01.jpg">
        <img class="sgp_01_img02" src="resources/imgs/sn01_sub02_ver01.jpg">
        <img class="sgp_01_img03" src="resources/imgs/sn01_sub03_ver01.jpg">
      </div>
    </div>
  </div>
  
  <div class="space_box" style="height: 180px"></div>
  
  <!-- sgp_02 -->
  <div class="sgp_02" style="text-align: -webkit-right;">
    <div class="sgp_02_img"></div>
    <div class="sgp_02_content">
      <div class="sgp_02_text">
        <h4>ANOTHER 13(어나더 13)</h4>
        <p>
          어나더 매거진과의 특별한 콜라보로 탄생한 매력적 우디 머스크 향
        </p>
        <div class="sgp_02_btn">
          <a><span>View All</span></a>
        </div>
      </div>
      <div class="sgp_02_imgs">
        <img class="sgp_02_img01" src="resources/imgs/sn02_sub01_ver01.jpg">
        <img class="sgp_02_img02" src="resources/imgs/sn02_sub02_ver01.jpg">
        <img class="sgp_02_img03" src="resources/imgs/sn02_sub03_ver01.jpg">
      </div>
    </div>
  </div>
  
  <div class="space_box" style="height: 180px"></div>
  
  <!-- sgp_03 -->
  <div class="sgp_03">
    <div class="sgp_03_img"></div>
    <div class="sgp_03_content">
      <div class="sgp_03_text">
        <h4>ROSE 31(로즈 31)</h4>
        <p>
          남성적인 매력이 더해져 신비롭고 관능적인 스파이시 로즈 향수
        </p>
        <div class="sgp_03_btn">
          <a><span>View All</span></a>
        </div>
      </div>
      <div class="sgp_03_imgs">
        <img class="sgp_03_img01" src="resources/imgs/sn03_sub01_ver01.jpg">
        <img class="sgp_03_img02" src="resources/imgs/sn03_sub02_ver01.jpg">
        <img class="sgp_03_img03" src="resources/imgs/sn03_sub03_ver01.jpg">
      </div>
    </div>
  </div>
  
  <div class="space_box" style="height: 180px"></div>
  
  <!-- sgp_04 -->
  <div class="sgp_04" style="text-align: -webkit-right;">
    <div class="sgp_04_img"></div>
    <div class="sgp_04_content">
      <div class="sgp_04_text">
        <h4>SANTAL 33 (상탈 33)</h4>
        <p>
          말보로 맨에서 영감을 받아 탄생한 센슈얼하고 스모키한 머스크향
        </p>
        <div class="sgp_04_btn">
          <a><span>View All</span></a>
        </div>
      </div>
      <div class="sgp_04_imgs">
        <img class="sgp_04_img01" src="resources/imgs/sn04_sub01_ver01.jpg">
        <img class="sgp_04_img02" src="resources/imgs/sn04_sub02_ver01.jpg">
        <img class="sgp_04_img03" src="resources/imgs/sn04_sub03_ver01.jpg">
      </div>
    </div>
  </div>
  
</div>

<div class="space_box" style="height: 480px"></div>

<!-- part_04 -->
<div class="part_04">
  <div class="part_04_img"></div>
  <div class="container part_04">
    <div class="part_04_title">
      <h2>BODY-HAIR-FACE</h2>
      <p>
      식물성, 성별, 소유권 없음, 채식주의 사용하면서 기분 좋게<br>
      해주는 것 이외의 약속은 자유롭게 합니다.
      </p>
    </div>
    
     <div class="space_box" style="height: 100px"></div>
    
    <div class="part_04_contents">
      <div class="part_04_products">
        <div class="part_04_pro_01">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_04_pro_02">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_04_pro_03">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_04_pro_04">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
      </div>

    </div>
    
  </div>
</div>

<div class="space_box" style="height: 300px"></div>

<!-- part_05 -->
<div class="part_05">
  <div class="part_05_img"></div>
  <div class="container">
    <div class="part_05_title">
      <h2>GROOMING</h2>
      <p>
      구세계의 전통 아메리카 이발소.<br>
      레트로 느낌의 모던한 텍스처
      </p>
    </div>
    
     <div class="space_box" style="height: 100px"></div>
    
    <div class="part_05_contents">
      <div class="part_05_products">
        <div class="part_05_pro_01">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_05_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_05_pro_02">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_05_pro_03">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
        <div class="part_05_pro_04">
          <figure class="snip1200">
            <img src="resources/imgs/bhf_product01_ver01.jpg" alt="sq-sample27" />
            <figcaption>
              <div class="part_04_detail">
                <p class="p_top">
                  500 ml / 16.9 fl oz<br>
                  basil<br><br>
                </p>
                <hr>
                <p class="p_bottom">57.300 won</p>
              </div>
              <div class="heading">
                <h2>HAND LOTION</h2>
              </div>
            </figcaption>
            <a href="#"></a>
          </figure>
        </div>
      </div>

    </div>
    
  </div>
</div>

<div class="space_box" style="height: 480px"></div>

<!-- part_06 -->
<div class="part_06">
  <div class="part_06_title" style="height: 480px; padding-top: 160px;">
    <h2>HOME CREATIONS</h2>
    <p>신선하게 핸드 블렌딩 되며, 고객의 이름이나 원하는<br>
       문구를 넣는 맞춤 라벨링 서비스가 제공됩니다.
    </p>
    <div class="part_06_title_btn" style="margin-top: 20px">
      <a><span>View All</span></a>
    </div>
  </div>
  
  <div class="space_box" style="height: 160px"></div>
  
  <div class="part_06_products container">
    <div class="part_06_pro">
      <img src="resources/imgs/bhf_product01_ver01.jpg">
      <div class="part_06_detail">
        <h4>VERVEINE 32</h4>
        <p>CLASSIC CANDLE<br>
           245 g / 8.6 oz</p>
      </div>
    </div>
    <div class="part_06_pro">
      <img src="resources/imgs/bhf_product01_ver01.jpg">
      <div class="part_06_detail">
        <h4>VERVEINE 32</h4>
        <p>CLASSIC CANDLE<br>
           245 g / 8.6 oz</p>
      </div>
    </div>
    <div class="part_06_pro">
      <img src="resources/imgs/bhf_product01_ver01.jpg">
      <div class="part_06_detail">
        <h4>VERVEINE 32</h4>
        <p>CLASSIC CANDLE<br>
           245 g / 8.6 oz</p>
      </div>
    </div>
    <div class="part_06_pro">
      <img src="resources/imgs/bhf_product01_ver01.jpg">
      <div class="part_06_detail">
        <h4>VERVEINE 32</h4>
        <p>CLASSIC CANDLE<br>
           245 g / 8.6 oz</p>
      </div>
    </div>
  </div>
  
</div>
    

    
    
  <script type="text/javascript">
    $(".hover").mouseleave(
      function () {
        $(this).removeClass("hover");
      }
    );
    
    $(document).ready(function(){
    	let result = '<c:out value="${insert_result}"/>';
    	
		checkResult(result);
	    
	    function checkResult(result){
	        if(result === ''){
	            return;
	        }
	        alert("상품'${insert_result}'(을)를 등록하였습니다.'");
	    }
    });
  </script>
</body>
<!-- footer -->
<%@include file="includes/admin/footer.jsp" %>

</html>














