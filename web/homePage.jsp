<%-- 
    Document   : homePage
    Created on : Apr 4, 2015, 9:35:41 AM
    Author     : Tien Dan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <title>Electronix Store - Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="js/angular.js"></script>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/shoppingCart.js" type="text/javascript"></script>
        <script src="js/windowopen.js" type="text/javascript"></script>
        <script src="js/boxOver.js" type="text/javascript"></script>
        <script>
            var cats = ${requestScope.cats};
            var hotLaps = ${requestScope.hotLaps};
            var newLaps = ${requestScope.newLaps};
            var specialProduct = ${requestScope.specialProduct};
            var newProduct = ${requestScope.newProduct};
            var isClear = ${requestScope.isClear};
        </script>
    </head>
    <body>
        <div id="main_container" ng-controller="loadHomePage">
            <div class="top_bar">
                <div class="top_search">
                    <form action="SearchServlet" method="POST">
                    <input type="text" class="search_input" name="search"/>
                    <input type="submit" class="search_bt" name="btnAction" value="Tìm Kiếm"/>
                    </form>
                </div>
                <div class="languages">
                    <div class="lang_text">Languages:</div>
                    <a href="#" class="lang"><img src="images/vn.gif" alt="" border="0" width="27px" height="16px"/></a> <a href="#" class="lang"><img src="images/en.gif" alt="" border="0" width="27px" height="16px"/></a> </div>
            </div>
            <div id="header">
                <div id="logo"> <a href="#"><img src="images/logo.png" alt="" border="0" width="237" height="140" /></a> </div>
                <div class="oferte_content">
                    <!--                    javascript load sản phẩm recommend-->
                    <div class="top_divider"><img src="images/header_divider.png" alt="" width="1" height="164" /></div>
                    <div class="oferta">
                        <div class="oferta_content">
                            <img class="topbanner" src="images/topbanner.jpg" alt=""/>
                        </div>
                    </div>
                    <div class="top_divider"><img src="images/header_divider.png" alt="" width="1" height="164" /></div>
                </div>
                <!-- end of oferte_content-->
            </div>
            <div id="main_content"></div>
            <div class="crumb_navigation"> Navigation: 
                <span><a href="LoadHomePage">Home</a></span>
            </div>
            <div class="left_content">
                <div class="title_box">Hãng</div>
                <ul class="left_menu">
                    <span ng-repeat="cat in cats">
                        <li class="odd"><a href="LoadCategoryPage?cat={{cat.brandName}}">{{cat.brandName}}</a></li>
                    </span>
                </ul>
                <div class="title_box">Sản phẩm mới</div>
                <div class="border_box">
                    <div class="product_title"><a href="LoadDetailPage?id={{specialProduct.id}}">{{specialProduct.name}}</a></div>
                    <div class="product_img"><a href="LoadDetailPage?id={{specialProduct.id}}"><img src="images/products/{{specialProduct.pictureURL}}" alt="" border="0" width="94" height="92"/></a></div>
                    <div class="prod_price"><span class="reduce">{{58999000|number:0}} VNĐ</span></div>
                    <div class="prod_price"><span class="price">{{specialProduct.price|number:0}} VNĐ</span></div>
                </div>
                <div class="title_box"></div>
                <div class="border_box">
                    <div class="banner_adds"> <a href="#"><img src="images/banner1.jpg" alt="" border="0" width="190" height="240"/></a> </div>
                </div>
            </div>
            <!-- end of left content -->
            <div class="center_content">
                <div class="center_title_bar">Sản phẩm mới</div>
                <div class="prod_box"ng-repeat="lap in newLaps| filter:search | orderBy:'price'">
                    <div class="top_prod_box"></div>
                    <div class="center_prod_box">
                        <div class="product_title">
                            <a href="LoadDetailPage?id={{lap.id}}">{{lap.name}}</a>
                        </div>
                        <div class="product_img">
                            <a href="LoadDetailPage?id={{lap.id}}">
                                <img src="images/products/{{lap.pictureURL}}" alt="" border="0" width="94" height="92"/>
                            </a>
                        </div>
                        <div class="prod_price">
                            <span class="price">{{lap.price| number:0}} VNĐ</span>
                        </div>
                    </div>
                    <div class="bottom_prod_box"></div>
                    <div class="prod_details_tab">
                        <a href="#" title="header=[Add to cart] body=[&nbsp;] fade=[on]" href="" ng-click="cart.addItem(lap.id, lap.name, lap.price, 1)">
                            <img src="images/cart.gif" alt="" border="0" class="left_bt" />
                        </a>
                        <a></a>
                        <a></a>
                        <a href="LoadDetailPage?id={{lap.id}}" class="prod_details">details</a>
                    </div>
                </div>
                <div class="center_title_bar">Sản phẩm bán chạy</div>
                <div class="prod_box" ng-repeat="lap in hotLaps| orderBy:'-price'">
                    <div class="top_prod_box"></div>
                    <div class="center_prod_box">
                        <div class="product_title">
                            <a href="LoadDetailPage?id={{lap.id}}">{{lap.name}}</a>
                        </div>
                        <div class="product_img">
                            <a href="LoadDetailPage?id={{lap.id}}">
                                <img src="images/products/{{lap.pictureURL}}" alt="" border="0" width="94" height="92"/>
                            </a>
                        </div>
                        <div class="prod_price">
                            <span class="price">{{lap.price| number:0}} VNĐ</span>
                        </div>
                    </div>
                    <div class="bottom_prod_box"></div>
                    <div class="prod_details_tab">
                        <a href ="#" title="header=[Add to cart] body=[&nbsp;] fade=[on]" ng-click="cart.addItem(lap.id, lap.name, lap.price, 1)">
                            <img src="images/cart.gif" alt="" border="0" class="left_bt" />
                        </a>
                        <a></a>
                        <a></a>
                        <a href="LoadDetailPage?id={{lap.id}}" class="prod_details">details</a>
                    </div>
                </div>
            </div>
            <!-- end of center content -->
            <div class="right_content">
                <div class="shopping_cart">
                    <div class="cart_title">Shopping cart</div>
                    <div class="cart_details"> {{cart.getTotalCount()}} items <br />
                        <span class="border_cart"></span> Total: <span class="price">{{cart.getTotalPrice()|number:0}} VNĐ</span> </div>
                    <div class="cart_icon"><a href="LoadCheckoutPage" title="header=[Checkout] body=[&nbsp;] fade=[on]" ng-disabled="cart.getTotalCount() < 1" ><img src="images/shoppingcart.png" alt="" width="48" height="48" border="0" /></a></div>
                </div>
                <div class="title_box">Bán chạy</div>
                <div class="border_box">
                    <div class="product_title"><a href="LoadDetailPage?id={{lap.id}}">{{newProduct.name}}</a></div>
                    <div class="product_img"><a href="LoadDetailPage?id={{lap.id}}"><img src="images/products/{{newProduct.pictureURL}}" alt="" border="0" width="94" height="92"/></a></div>
                    <div class="prod_price"><span class="price">{{newProduct.price|number:0}} VNĐ</span></div>
                </div>
                <div class="title_box"></div>
                <ul class="left_menu">
                </ul>
                <div class="banner_adds"> <a href="#"><img src="images/banner2.jpg" alt="" border="0" width="185" height="165"/></a> </div>
            </div>
            <!-- end of right content -->
        </div>
        <!-- end of main content -->
        <div class="footer">
            <div class="left_footer"> <img src="images/footer_logo.png" alt="" width="170" height="49"/> </div>
            <div class="center_footer"> Template name. All Rights Reserved 2008<br />
                <a href="http://csscreme.com"><img src="images/csscreme.jpg" alt="csscreme" border="0" /></a><br /></div>
            <div class="right_footer"> <a href="#">home</a> <a href="#">about</a> <a href="#">sitemap</a> <a href="#">rss</a> <a href="contact.html">contact us</a> </div>
        </div>
    </body>
</html>