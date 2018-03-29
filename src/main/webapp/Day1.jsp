<%-- 
    Document   : Day1
    Created on : Mar 7, 2014, 4:58:39 PM
    Author     : java-eman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin:0;
                padding:0;
            }
            body{
                font-family:arial,sans-serif;
                font-size:100%;
                margin:3em;
                background:#666;
                color:#fff;
            }
            h2,p{
                font-size:100%;
                font-weight:normal;
            }
            ul,li{
                list-style:none;
            }
            ul{
               
                padding:3em;
            }
            ul li a{
                text-decoration:none;
                color:#000;
                background:#ffc;
                display:block;
               
               
                padding:1em;
            }
            ul li{
                margin:1em;
                float:left;
            }
            input[type=text], input[type=password] {

                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;

            }

            button:hover {
                opacity: 0.8;
            }



            .container {
                padding: 16px;
            }


            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;

            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #4CAF50;
                color: white;
            }
        </style>
        <script type="text/javascript">
            var req1 = null;
            var req2 = null;
            var req3 = null;
            var req4 = null;
            var x = 0;
            var key="AIzaSyCJnzrRsiceCcscPuQtEjrrWIaKd309SIk";
            var lat;
            var lon;
            var placev;
            
            
            function searchplace() {

                if (window.XMLHttpRequest)
                     req4 = new XMLHttpRequest();
                  else
                  if (window.ActiveXObject)
                      req4 = new ActiveXObject("Microsoft.XMLHTTP");

                // get your location at the page load
                navigator.geolocation.getCurrentPosition(showPosition);
                // get value
                placev=document.getElementById("place").value;
                req4.onreadystatechange = handleReq4;
                req4.open("GET", "https://maps.googleapis.com/maps/api/place/textsearch/xml?location="+lat+","+lon+"&query=restaurants+in+"+placev+"&key="+key, true);
                req4.send(null);

            }
            
            function showPosition(position)
            {
               lat=position.coords.latitude;
               lon= position.coords.longitude;
                console.log(lat);
                 console.log(lon);
            }
            
            function handleReq4()
            {
                if (req4.readyState == 4)
                                      console.log(req4.responseXml);
                   else
                                      console.log(req4.status);
            }
            
            function submitForm1() {
                       if (window.XMLHttpRequest)
                     req1 = new XMLHttpRequest();
                  else
                  if (window.ActiveXObject)
                      req1 = new ActiveXObject("Microsoft.XMLHTTP");
                  req1.onreadystatechange = handleReq1;
                req1.open("GET", "data.txt", true);
                  req1.send(null);
            }
            function handleReq1()
            {
                if (req1.readyState == 4)
                                      document.getElementById("dyn").value = "Received:" + req1.responseText;
                   else
                                      document.getElementById("dyn").value = "Error code " + req1.status;
            }

            //*******************
            function startRequest() {
                if (window.ActiveXObject)
                    req2 = new ActiveXObject("Microsoft.XMLHTTP");
                else if (window.XMLHttpRequest)
                    req2 = new XMLHttpRequest();
                req2.onreadystatechange = handleStateChange;
                req2.open("GET", "innerHTML.txt?x=" + new Date(), true);
                req2.send(null);
            }
            function handleStateChange() {
                if (req2.readyState == 4)
                    document.getElementById("results").innerHTML = req2.responseText;
            }

///***********************
            function submitForm3() {
                       if (window.XMLHttpRequest)
                     req3 = new XMLHttpRequest();   
                else
                     if (window.ActiveXObject)
                      req3 = new ActiveXObject(Microsoft.XMLHTTP);

                  req3.onreadystatechange = handleStateChange3;

                yourvalue = document.getElementById("name").value;
                req3.open("GET", "ServletGetUser?uName=" + yourvalue, true);
                  req3.send(null);
            }
            function handleStateChange3() {
                if (req3.readyState == 4) {
                    xmlvalue = req3.responseText;
                    document.getElementById("err").innerHTML = xmlvalue;
                }
            }


        </script>
    </head>
    <body onload="setInterval('startRequest()', 5000);navigator.geolocation.getCurrentPosition(showPosition);">
    <center> <h3>AJAX Day 1 </h3></center>

    <ul>
        <li>
            <a href="#">
                <h2>1. Get updated Schedule with AJAX</h2>
                <p><br><div id="results"></div></p>
            </a>
        </li>
        <li>
            <a href="#">
                <h2>2.Get Hello_File with AJAX </h2>
                <p><br><div>
                    <INPUT type="text" id="dyn" value="" size="50"> 
                    <button ONCLICK="submitForm1()">Get</button>
                </div></p>
            </a>
        </li>
        <li>
            <a href="#">
                <h2>3.User Name verification with AJAX </h2>
                <p><br><div class="container">
                    <label><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" id="name" onblur="submitForm3()" required>
                    <span id="err"></span>
                    <br><label><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>

                    <br><button type="submit">Login</button>
                </div>
                </p>
            </a>
        </li>

        <li>
            <a href="#">
                <h2>4.Google Places Web Service  </h2>
                <p><br><div class="container">
                    <label><b>Place to search for restaurants in </b></label>
                    <input type="text" placeholder="Enter place" id="place" onkeyup="searchplace()" required>
                    <span id="err"></span>
                    <br><label><b>Restaurants</b></label>

                </div>
                </p>
            </a>
        </li>

    </ul>



</body>
</html>
