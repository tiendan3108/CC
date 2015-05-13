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
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="js/angular.js"></script>
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/shoppingCart.js" type="text/javascript"></script>
        <script>
            var cats = ${requestScope.cats};//danh sách hãng
            var specialProduct = ${requestScope.specialProduct};// special product
            var newProduct = ${requestScope.newProduct};// new product
        </script>
    </head>
    <body>
        <div id="main_container" ng-controller="loadCheckoutPage">
            <div class="top_bar">
                <div class="top_search">
                </div>
                <div class="languages">
                    <div class="lang_text">Languages:</div>
                    <a href="#" class="lang"><img src="images/vn.gif" alt="" border="0" width="27px" height="16px"/></a> <a href="#" class="lang"><img src="images/en.gif" alt="" border="0" width="27px" height="16px"/></a> </div>
            </div>
            <div id="header">
                <div id="logo"> <a href="#"><img src="images/logo.png" alt="" border="0" width="237" height="140" /></a> </div>
                <div class="oferte_content">
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
                <span><a href="LoadHomePage">Home  </a></span> > 
                <span><a href="LoadCategoryPage?cat=${requestScope.category}">  ${requestScope.category}</a></span>
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
                <p class="text-info">
                    Cám ơn bạn đã tin tưởng Eletronix Store.<br />
                    Đây là giỏ hàng của bạn.
                </p>
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span8">
                            <table class="table table-bordered">
                                <tr class="well">
                                    <td><b>Sản phẩm</b></td>
                                    <td class="tdCenter"><b>Số lượng</b></td>
                                    <td class="tdRight"><b>Giá</b></td>
                                    <td />
                                </tr>
                                <tr ng-hide="cart.getTotalCount() > 0" >
                                    <td class="tdCenter" colspan="4">
                                        Giỏ hàng của bạn trống.
                                    </td>
                                </tr>
                                <tr ng-repeat="item in cart.items| orderBy:'name'">
                                    <td>{{item.name}}</td>
                                    <td class="tdCenter">
                                        <div class="input-append">
                                            <input class="span3 text-center" type="tel" ng-model="item.quantity" ng-change="cart.saveItems()" />
                                            <button class="btn btn-success" type="button" ng-disabled="item.quantity >= 1000" ng-click="cart.addItem(item.id, item.name, item.price, +1)">+</button>
                                            <button class="btn btn-inverse" type="button" ng-disabled="item.quantity <= 1"ng-click="cart.addItem(item.id, item.name, item.price, -1)">-</button>
                                        </div>
                                    </td>
                                    <td class="tdRight">{{item.price * item.quantity| number:0}} VNĐ</td>
                                    <td class="tdCenter" title="remove from cart">
                                        <button ng-click="cart.addItem(item.id, item.name, item.price, -10000000)">Xóa</button>
                                    </td>
                                </tr>
                                <tr class="well">
                                    <td><b>Total</b></td>
                                    <td class="tdCenter"><b>{{cart.getTotalCount()}}</b></td>
                                    <td class="tdRight"><b>{{cart.getTotalPrice() | number:0}} VNĐ</b></td>
                                    <td />
                                </tr>
                                <tr >
                                    <td><button class="btn btn-success" onclick="window.location.href = 'LoadHomePage'">Về trang chủ</button></td>
                                    <td><button class="btn btn-block btn-danger" ng-click="cart.clearItems()" ng-disabled="cart.getTotalCount() < 1" >Xóa giỏ hàng</button></td>
                                    <td><form method="POST" action="PrintPDFFile">
                                            <input type="submit" name="btnAction" value="In Hóa Đơn" ng-disabled="cart.getTotalCount() < 1)"/>
                                            <input type="hidden" name="productList" value="{{cart.productList()}}"/>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of center content -->
            <div class="right_content">
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