<%-- 
    Document   : commande
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
    <fmt:setLocale  value="${loc}" />


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
                    <a href="afficherPanier?locale=${loc}"><img src="images/retour.png" align="left"/></a> 
                    <h4>Checkout</h4>
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div class="panel panel-default text-center">

                        <div class="panel-body">
                            <div class="col-sm-9" align="center">
                                <div class="register">
                                    <form id="regForm" action="afficherFacture?locale=${loc}">
                                        <h1><fmt:message key="registrer"/></h1>
                                        <div class="tab">
                                            <p><input placeholder="<fmt:message key="fname"/>" oninput="this.className = ''" name="fname"></p>
                                            <p><input placeholder="<fmt:message key="lname"/>" oninput="this.className = ''" name="lname"></p>
                                        </div>
                                        <div class="tab"><fmt:message key="contactInfo"/>
                                            <p><input placeholder="<fmt:message key="email"/>" oninput="this.className = ''" name="email"</p>
                                            <p><input placeholder="<fmt:message key="phone"/>" oninput="this.className = ''" name="phone"></p>
                                        </div>
                                        <div class="tab"><fmt:message key="adresseLivraison"/>
                                            <p><input placeholder="<fmt:message key="adresse"/>" oninput="this.className = ''" name="adresse"></p>
                                            <p><input placeholder="<fmt:message key="ville"/>" oninput="this.className = ''" name="ville"></p>
                                            <p><input placeholder="<fmt:message key="province"/>" oninput="this.className = ''" name="province"></p>
                                            <p><input placeholder="<fmt:message key="codePostatle"/>" oninput="this.className = ''" name="code"></p>
                                            <p><input placeholder="<fmt:message key="pays"/>" oninput="this.className = ''" name="pays"></p>
                                        </div>
                                        <div style="overflow:auto;" align="center">
                                            <div style="float:right;">
                                                <button type="button"  id="prevBtn" onclick="nextPrev(-1)"><fmt:message key="prev"/></button>
                                                <button type="button"  id="nextBtn" onclick="nextPrev(1)"><fmt:message key="next"/></button>
                                                
                                            </div>
                                        </div>
                                        <!-- Circles which indicates the steps of the form: -->
                                        <div style="text-align:center;margin-top:40px;">
                                            <span class="step"></span>
                                            <span class="step"></span>
                                            <span class="step"></span>
                                           
                                        </div>
                                    </form>
                                </div>

                            </div>
                            <div class="col-sm-3" align="center" >
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

                        </div> 


                    </div>      
                </div> 

            </div>


        </body>
    </fmt:bundle>
    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            //... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "OK";
            } else {
                var txt = document.getElementById("myBtn").innerText;
                document.getElementById("nextBtn").innerHTML=txt;
            }
            //... and run a function that will display the correct step indicator:
            fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            // Exit the function if any field in the current tab is invalid:
            if (n == 1 && !validateForm())
                return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form...
            if (currentTab >= x.length) {
                // ... the form gets submitted:
                document.getElementById("regForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        function fixStepIndicator(n) {
            // This function removes the "active" class of all steps...
            var i, x = document.getElementsByClassName("step");
            for (i = 0; i < x.length; i++) {
                x[i].className = x[i].className.replace(" active", "");
            }
            //... and adds the "active" class on the current step:
            x[n].className += " active";
        }
    </script>

</html>
