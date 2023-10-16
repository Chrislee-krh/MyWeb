<c:choose>
                       <c:when test="${sessionScope.user_id != null }">
                    <li>
                      
                       <a href="/myweb/user/logout.jsp" style="color: #ff006e;">LogOut</a>
                    </li>
                    <li>
                       <a href="/myweb/user/mypage.jsp">MyPage</a>
               </li>
                    </c:when>
                       <c:otherwise>
                    <li>
                       
                       <a href="/myweb/user/login.jsp">LogIn</a>
                     </li>  
                     <li>
                       
                       <a href="/myweb/user/join.jsp" style="color: #ff006e;">JOIN</a>
                   </li>
                    </c:otherwise>
                 </c:choose>