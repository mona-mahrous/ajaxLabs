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
        <script src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript">
            var id = parseInt("0");

            function check_for_lastid()
            {
                $.get("chatservlet?getid=" + id + "", ajaxgetidCallBack);

            }
            function ajaxgetidCallBack(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success") {
                    // alert("External content loaded successfully!");
                    // id=parseInt(responseTxt);
                    // alert(id);

                    // $("#container").html(responseTxt);


                    // t1.id="start_div";
                    // ti.html(responseTxt);
                    // $("#container").appendChild(t1);
                    $.get("chatservlet?id=1", ajaxgetCallBack);
                }
            }
            function ajaxgetCallBack(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success") {
                    // ti=document.createElement("div");
                    //  $("#container").removeChild(t1);   
                    //var  t1=document.createElement("div");
                    //t1.id="start_div";
                    // t1.html();

                    var res = $.parseJSON(responseTxt);
                    parseJSONResponse(res);
                    //document.getElementById("container").innerHTML = (responseTxt);
                }

            }
            function parseJSONResponse(jsonRes) {
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

            function send() {
                if (($("#username").val().length > 0) && ($("#message").val().length)) {
                    $.post("chatservlet", {userName: $("#username").val(), message: $("#message").val()}, ajaxCallBack);
                    //document.getElementById("username").value = "";
                    document.getElementById("message").value = "";
                }
            }
            function ajaxCallBack(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success")
                    // alert("External content loaded successfully!");
                    if (statusTxt == "error")
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
            self.setInterval(function () {
                check_for_lastid()
            }, 2000);
        </script>
    </head>
    <body>
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
