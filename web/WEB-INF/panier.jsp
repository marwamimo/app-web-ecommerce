<%-- 
    Document   : panier
    Created on : 2019-09-19, 19:52:05
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
            <title></title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1"> 
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
            <link href="bootstrap/bootstrap.min.css" type="text/css" rel="stylesheet" />
            <link rel='stylesheet' type='text/css' href='styles.css' />
        </head>
        <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand"> <img src="images/coeur-avec-souris.png" width="50" height="30"  alt="éléctronique"/></a>
                    </div>
                </div>
            </nav>  
            <div>
                <ul class="nav navbar-nav navbar-right  margeLg">
                    <li><a href="<%request.getRequestURL();%>?locale=fr"><img src="images/france.png" width="50" height="30"/></a></li>
                    <li><a href="<%request.getRequestURL();%>?locale=en"><img src="images/bretagne.png" width="50" height="30"/></a></li>
                    
                </ul>
</div> 
            <div class="container-fluid">
                <div class="text-center">
                    <h2><fmt:message key="commande"/></h2>
                    <a href="index.jsp?locale=${loc}"><img src="images/retour.png" align="left"/></a> 
                    <h4></h4>
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default text-center">
                        <c:forEach var="article" items="${listeArticle}" >
                            <div class="panel-body">
                                <div class="col-sm-2">
                                    <img src="images/${article.noarticle}.png" width="100" height="100" alt=""/>
                                </div>
                                <div class="col-sm-3">
                                    <h4>${article.marque} , ${article.description}</h4>
                                </div>
                                <div class="col-sm-2">
                                    <h4 >$  ${article.prixunitaire}</h4>
                                </div>
                                <div class="col-sm-3">
                                    <h4 > <fmt:message key="quantite"/> :${article.quantiteenstock}</h4>
                                </div>
                                <div class="col-sm-2 center">
                                    <a href="MajPanier?noarticle=${article.noarticle}&locale=${loc}"><img src="images/retourner-un-produit.png" width="20%" height="20%" alt=""/></a>
                                </div>
                            </div>
                        </c:forEach>  
                        <div class="panel-body">
                            <div class="col-sm-5">
                                <img src="images/livraison.png" alt=""/>
                            </div>    
                            <div class="col-sm-2">
                                <h2><fmt:message key="livraison"/></h2>
                            </div> 
                            <div class="col-sm-3" align="center">
                                <table>
                                    <tr>
                                        <td colspan="3"><h2><fmt:message key="sommaire"/></h2></td>
                                    </tr>
                                    <tr>
                                        <td> <h5><fmt:message key="totalPartielPrix"/></h5></td>

                                        <td id="prix" name="prix">${prix}</td>
                                    </tr>
                                    <tr>
                                        <td><h5><fmt:message key="taxes"/></h5></td>
                                        <td id="taxe" name="taxe">${taxe}</td>
                                    </tr>
                                    <tr>
                                        <td><h5><fmt:message key="total"/></h5></td>
                                        <td id="total" name="total">${total}</td>
                                    </tr>

                                </table>
                            </div> 
                            <div class="col-sm-2" >
                                <h2><fmt:message key="confirmer"/></h2>
                                <a href="ConfirmerCmd?locale=${loc}"><button class="btn btn-lg text-center"/>
                                    <img src="images/confirmer1.png" alt=""/></a>
                            </div> 
                        </div> 
                      

                    </div>      
                </div> 

            </div>


        </body>
    </fmt:bundle>
</html>
