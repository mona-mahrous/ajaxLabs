<%-- 
    Document   : index
    Created on : Apr 17, 2013, 10:49:20 AM
    Author     : GHarieb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajax chat</title>
        <script src="js/jquery-1.7.1.min.js"></script>
        <script>
            var id = parseInt("0");

            function check_for_lastid()
            {
                $.get("chat?getid=" + id + "", ajaxgetidCallBack);

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
                    $.get("chat?id=1", ajaxgetCallBack);
                }
            }
            function ajaxgetCallBack(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success") {
                    // ti=document.createElement("div");
                    //  $("#container").removeChild(t1);   
                    //var  t1=document.createElement("div");
                    //t1.id="start_div";
                    // t1.html();
                    document.getElementById("container").innerHTML = (responseTxt);
                }

            }
            function send() {
                $.post("chat", {userName: $("#username").val(), message: $("#message").val()}, ajaxCallBack);
                //document.getElementById("username").value="";
                document.getElementById("message").value = "";
            }
            function ajaxCallBack(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success")
                  //  alert("External content loaded successfully!");
                if (statusTxt == "error")
                    //alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
            self.setInterval(function () {
                check_for_lastid()
            }, 2000);
        </script>
    </head>
    <body>
    <center><h1>Ajax Chat Room </h1></center>

    <table align="center">                <tr>
            <td align=center>
                <form id="form1" action="chat" method="post">

                    <table >
                        <tr>
                            <td>Enter Your Name:</td>
                            <td><input type="text" name="username" id="username"></td>
                        </tr>
                        <tr>
                            <td>Enter Your Msg:</td>
                            <td><input type="text" name="message" id="message"></td>


                            <td><input type="button" value="send" onclick="send();"></td>
                        </tr>
                    </table>
                    <br><br>
                    <b><font color=BLUE size=4 ></font>Chat Msgs:</b>
                    <div id="container" align="left"> </div>

                    </div>
                </FORM>
            </td>
        </tr>
    </table>

</body>
</html>
