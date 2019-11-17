<%-- 
    Document   : index
    Created on : 2019-09-01, 13:28:23
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
                    <div style="text-align:right">
                    </div>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>                        
                        </button>
                        <a class="navbar-brand" href="#myPage"> <img src="images/coeur-avec-souris.png" width="50" height="30" alt="éléctronique"/></a>
                    </div>

                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#about"><fmt:message key="about"/></a></li>
                            <li><a href="#magasinez"><fmt:message key="magasinez"/></a></li>
                            <li><a href="#marques"><fmt:message key="marques"/></a></li>
                            <li><a href="#contact"><fmt:message key="contact"/></a></li>
                            <li class="marge"><a href="afficherPanier?locale=${loc}" class="panier"></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div>
                <ul class="nav navbar-nav navbar-right  margeLg">
                    <li><a href="index.jsp?locale=fr"><img src="images/france.png" width="50" height="30"/></a></li>
                    <li><a href="index.jsp?locale=en"><img src="images/bretagne.png" width="50" height="30"/></a></li>
                    <input type="hidden" name="locale" value="${loc}"/>
                </ul>
            </div>
            <div class="jumbotron text-center">
                <form>
                    <div class="input-group">
                        <input type="text" class="form-control" size="50" placeholder="<fmt:message key="rechercher"/>" required>
                        <div class="input-group-btn">
                            <button type="button" class="btn"><img src="images/chercher.png" width="50" height="16" alt="rechercher" /></button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- About  -->
            <!-- Slideshow container -->
            <div id="about" class="slideshow-container">

                <!-- images -->
                <div class="mySlides fade">
                    <img src="images/img1.jpg" style="width:100%">
                </div>

                <div class="mySlides fade">
                    <img src="images/img2.jpg" style="width:100%">
                </div>

                <div class="mySlides fade">
                    <img src="images/img3.jpg" style="width:100%">
                </div>
                
                <!-- Next and previous buttons -->
                <a class="prev" onclick="plusSlides(-1)"><img src="images/prev.png" alt=""/></a>
                
                <a class="next" onclick="plusSlides(1)"><img src="images/right.png" alt=""/></a>
           
            </div>
            <br>

            <!-- slides -->
            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>

            <!-- (magasinez) -->
            <div id="magasinez" class="container-fluid">
                <div class="text-center">
                    <h2><fmt:message key="magasinez"/></h2>
                    <h4></h4>
                </div>
                <div class="row slideanim">
                    <c:forEach var="article" items="${articles}" >
                        <div class="col-sm-4 col-xs-12">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                </div>
                                <div class="panel-body">
                                    <img src="images/${article.noarticle}.png" width="250" height="250" alt=""/>
                                </div>
                                <div class="panel-footer">
                                    <h4>${article.description}</h4>
                                    <h3>$  ${article.prixunitaire}</h3>
                                    <a href="ajouterCommande?noarticle=${article.noarticle}"><button class="btn btn-lg text-center"/>
                                        <img src="images/ajouter-au-panier1.png" alt=""/></a>
                                     </div>
                                      
                            </div>      
                        </div>  
                    </c:forEach>  
                </div>
            </div>
            <!-- marques -->
            <div id="marques" class="container-fluid text-center">
                <h2><fmt:message key="marques"/></h2>
                <h4></h4>
                <br>
                <div class="row slideanim">
                    <c:forEach var="marque" items="${marques}" >
                        <div class="col-sm-3 marque">
                            <img src="images/${marque}.png" alt=""/>
                        </div>
                    </c:forEach>
                </div>
            </div>          
            <!-- Contact -->
            <div id="contact" class="container-fluid">
                <h2 class="text-center">CONTACT</h2>
                <div class="container-fluid text-center">
                        <p><fmt:message key="p"/></p>
                        <p><img src="images/maps.png" alt=""/> Montréal, Canada</p>
                        <p><img src="images/tel.png" alt=""/>  +00 1515151515</p>
                        <p><img src="images/email.png" alt=""/>  myemail@something.com</p>
                    </div>
                    
                  
             
                        <footer class="container-fluid text-center">
                <a href="#myPage" title="Haut"><img src="images/chevron-haut.png" width="80" height="80" alt="haut"/>
                </a>
                <p>copyright-2019</p>
            </footer>
            </div>
            

            <script>
                $(document).ready(function () {
                    // Add smooth scrolling to all links in navbar + footer link
                    $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
                        // Make sure this.hash has a value before overriding default behavior
                        if (this.hash !== "") {
                            // Prevent default anchor click behavior
                            event.preventDefault();

                            // Store hash
                            var hash = this.hash;

                            // Using jQuery's animate() method to add smooth page scroll
                            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                            $('html, body').animate({
                                scrollTop: $(hash).offset().top
                            }, 900, function () {

                                // Add hash (#) to URL when done scrolling (default click behavior)
                                window.location.hash = hash;
                            });
                        } // End if
                    });

                    $(window).scroll(function () {
                        $(".slideanim").each(function () {
                            var pos = $(this).offset().top;

                            var winTop = $(window).scrollTop();
                            if (pos < winTop + 600) {
                                $(this).addClass("slide");
                            }
                        });
                    });
                })

                var slideIndex = 1;
                showSlides(slideIndex);

                // Next/previous controls
                function plusSlides(n) {
                    showSlides(slideIndex += n);
                }

                // Thumbnail image controls
                function currentSlide(n) {
                    showSlides(slideIndex = n);
                }

                function showSlides(n) {
                    var i;
                    var slides = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("dot");
                    if (n > slides.length) {
                        slideIndex = 1
                    }
                    if (n < 1) {
                        slideIndex = slides.length
                    }
                    for (i = 0; i < slides.length; i++) {
                        slides[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" active", "");
                    }
                    slides[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " active";
                }
            </script>

        </body>
    </fmt:bundle>
</html>

