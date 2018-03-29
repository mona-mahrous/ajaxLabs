<%-- 
    Document   : Header
    Created on : Apr 16, 2013, 5:42:45 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <!-- Header -->
<header>
    <div class="inner">
        <h1 class="logo"><a href="home.html">Pet clinic</a></h1>
        <div class="fright">
           <div class="header-meta">
                <form id="search-form" method="post">
                    <input type="text" onblur="if(this.value==''){this.value='search'}" onfocus="if(this.value=='search'){this.value=''}" value="search" name="search">
                    <a class="search-form-submit" onclick="document.getElementById('search-form').submit()"></a>
                </form>
                <div class="col-elem">
                    Welcome Sara &nbsp <a href="home.html">logout</a><br><br>
					
                </div>
				<br>
				<span class="settings">
                        <a href="home.html">Setting</a>
                    </span>
					<span>&nbsp </span>
					<span class="settings">
                        <a href="ShoppingCart.html">Shopping Cart</a>
                    </span>
            </div>
            <nav>
                <ul class="sf-menu">
                    <li class="current"><a href="home.html">main</a></li>
                    <li><a href="about.html">about</a></li>
                    <li><a href="contacts.html">contacts</a></li>
                </ul>
            </nav>
        </div>
        <div class="clear"></div>
    </div>
    <div class="slider-container">
        <div class="mp-slider">
            <ul class="items">
                <li><img src="images/slide-1.jpg" alt=""></li>
                <li><img src="images/slide-2.jpg" alt=""></li>
                <li><img src="images/slide-3.jpg" alt=""></li>
            </ul>
        </div>
    </div>
</header>
    </body>
</html>
