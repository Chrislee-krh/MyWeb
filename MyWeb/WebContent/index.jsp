<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
<!-- header -->
<%@ include file = "include/indexheader.jsp" %>
    <div class="container">
    
        <div class="row ">
 
            <div class="box">
        
                <div class="col-lg-6 text-center">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"><!-- data-ride="carousel" 자동 슬라이드 기능 -->
                       
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="img/귀령이20.jpg">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/예쁜귀령이.jpg" height="1054" width="1080"> <!-- img-full 옵션 class -->
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/세여자.jpg" height="1054" width="1080">
                            </div>   
                        </div>

                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>     
                </div>
                
                <div class="col-lg-6 text-center align-item-center" >    
                   
						<h2>My family</h2>
						<p>
							Lana, Hael, Chris
						</p>
						<hr>
						<h3>Memory</h3>
						
						<iframe width="500" height="350" src="https://www.youtube.com/embed/i7NoXjssMv4" title="‎@HIHAEL 부산사투리 배워보기 2탄_&quot;딱딱하다&quot;, &quot;단단하다&quot;_59개월" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
					
                 </div>   
 
            </div>

        </div>

        <div class="row">
            <div class="box">

                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Hael world
                        <strong>You are so lucky to be here! That's for sure.</strong>
                    </h2>
                    <hr>
		                <div class="inner" align="center">
		                    <img class="img-responsive img-center" src="img/태국가족.jpg" alt=""><!-- img-border --> 
		                    
		                    <hr class="visible-xs">
		                   
		                    <p></p>
		               	
	                    </div>
                </div>
            </div>
        </div>

    <!-- /.container -->
    </div>
<jsp:include page="include/indexfooter.jsp"/>    
	
	
	
</body>
</html>