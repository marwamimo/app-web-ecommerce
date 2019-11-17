<%-- 
    Document   : authentification
    Created on : 2019-09-21, 22:32:18
    Author     : Marwa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
    <c:set var="loc" value="en"/>
    <c:if test="${!(empty param.locale)}">
        <c:set var="loc" value="${param.locale}"/>
    </c:if>
    <fmt:setLocale  value="${loc}"  />


    <fmt:bundle basename="internationalisation">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel='stylesheet' type='text/css' href='styles.css' />
        </head>
        <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand"><img src="images/coeur-avec-souris.png" alt="éléctronique"/></a>
                    </div>
                </div>
            </nav>
                <div class="container1">
                   <a href="afficherPanier?locale=${loc}"><img src="images/retour.png" align="left"/></a> 
                </div>
                <div class="imgcontainer">
                    <img src="images/identifiants.png" alt="" class="avatar">
                </div>
                  
                <div class="container1">
                    <label><b><fmt:message key="login"/></b></label>
                    <input type="text" name="email">
                    <label><b><fmt:message key="pwd"/></b></label>
                    <input type="password" name="pwd">
                   
                </div>
                 <div class="col-sm-2" >
                                <h2><fmt:message key="confirmer"/></h2>
                                <a href="login?locale=${loc}"><button class="btn btn-lg text-center"/>
                                    <img src="images/confirmer1.png" alt=""/></a>
                            </div> 
             
                
        </body>
    </fmt:bundle>
</html>

