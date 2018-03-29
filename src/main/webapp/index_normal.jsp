<%-- 
    Document   : index
    Created on : Apr 17, 2013, 10:49:20 AM
    Author     : GHarieb
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax chat</title>
        <style>
            form {
                border: 3px solid #f1f1f1;
                width: 60%;            
            }

            input[type=text]{
                width: 100%;
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
                width: 20%;

            }

            button:hover {
                opacity: 0.8;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            img.avatar {
                width: 40%;
                height: 10%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }



            #customers {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
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
            var req1;
            function send() {

                // 1. Create AJAX Req
                 if (window.XMLHttpRequest)
                     req1 = new XMLHttpRequest();
                  else
                  if (window.ActiveXObject)
                      req1 = new ActiveXObject("Microsoft.XMLHTTP");
                // 2. Define CallBack function
                    req1.onreadystatechange = handleReq1;
                // 3. Get Form parameters
                name = document.getElementById("username").value;
                msg = document.getElementById("message").value;
                // 4. open and send req1   
                req1.open("GET", "chatServlet1?name=" + name + "&msg=" + msg, true);
                    req1.send(null);
            }
            function handleReq1()
            {
                if (req1.readyState == 4)
                    console.log(req1.responseText);
            }
            var req2;
            function check_for_msgs() {
                // 1. Create AJAX Req
                 if (window.XMLHttpRequest)
                     req2 = new XMLHttpRequest();
                  else
                  if (window.ActiveXObject)
                      req2 = new ActiveXObject("Microsoft.XMLHTTP");
                // 2. Define CallBack function
                req2.onreadystatechange = handleReq2;
                // 3. open and send req2   
                req2.open("Post", "chatServlet1?x=" + new Date(), true);
                    req2.send(null);
            }
            function handleReq2()
            {
                if (req2.readyState == 4 && req2.responseText1!=="0") {
                    //1. parse the comming JSON response
                    
                    jsonRes = JSON.parse(req2.responseText);
                    //2. loop
                    var chatContent = "<table id=\"customers\"><tr><th>User</th><th>Message</tr>";
                    for (i = 0; i < jsonRes.length; i++) {
                        chatContent += "<tr>";
                        chatContent += "<td>";
                        chatContent += jsonRes[i].user_name;
                        chatContent += "</td>";
                        chatContent += "<td>";
                        chatContent += jsonRes[i].body;
                        chatContent += "</td>";
                        chatContent += "</tr>";
                    }
                    chatContent += "</table>";
                    document.getElementById("container").innerHTML = chatContent;
                }
            }
        </script>
    </head>
    <body onload="setInterval('check_for_msgs()', 2000)">
    <center>
        <form id="form1" action="chatservlet" method="post">
            <div class="imgcontainer">
                <img src="Livechat.jpg" alt="Avatar" class="avatar">
            </div>
            <div class="container">
                <label><b>Your Name</b></label>
                <input type="text" placeholder="Enter your name" name="username" id="username" required>

                <label><b>Your Message</b></label>
                <input type="text" placeholder="Enter Your Msg" name="message" id="message" required>

                <button type="button" onclick="send();">Send</button>

            </div>   

            <br><br>
            <font color=red size=5 > Chat Messages: </font>
            <div id="container" align="left"> </div>

            </div>
        </FORM>

    </center>
</body>
</html>
