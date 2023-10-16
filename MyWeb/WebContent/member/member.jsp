<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<jsp:include page="../include/indexheader.jsp" />

<body>
    
<div class="container">
		<div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Profile</strong>
                    </h2>
                    <hr>
                </div>
                
                
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/사힙가족과.jpg" alt="">
                    <h3>Baby
                        <small>Hael</small>
                    </h3>
                </div>
               
                <div class="col-sm-4 text-center">
                    
                </div>
                <div class="col-sm-4 text-center">
                  	<img class="img-responsive" src="${pageContext.request.contextPath}/img/하엘음식.jpg" alt="">
                    <h3>Age
                        <small>6</small>
                    </h3>
                </div>
                <div class="clearfix"></div>
                
            </div>
        </div>



        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>화보</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/공항단체.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/귀령하엘.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/하엘.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
		<div class="row">
            <div class="box">
                
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/온가족.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/침대우리가족.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="col-sm-4 text-center">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/img/하엘이대상.jpg" alt="">
                    <h3>
                        <small></small>
                    </h3>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        
        
    </div>
    <!-- /.container -->
    
   
	<jsp:include page="../include/indexfooter.jsp" />
   
	
</body>
</html>