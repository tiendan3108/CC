/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
var myApp = angular.module("myApp", []);
myApp.factory("DataService", function () {
    var cart = new shoppingCart("myCart");
    return {
        cart: cart
    };
});
myApp.controller("loadHomePage", function ($scope, DataService) {
    $scope.newLaps = newLaps;// laptop mới
    $scope.hotLaps = hotLaps;// laptop bán chạy
    $scope.cats = cats;// danh sách hãng 
    $scope.newProduct = newProduct;// new product
    $scope.specialProduct = specialProduct;// special product 
    $scope.cart = DataService.cart;
    $scope.isClear = isClear;
    if ($scope.isClear = "yes") {
        $scope.cart.clearItems();
    }
});
myApp.controller("loadDetailPage", function ($scope, DataService) {
    $scope.result = result;
    $scope.cats = cats;
    $scope.closeBrand = closeBrand;
    $scope.closePrice = closePrice;
    $scope.newProduct = newProduct;
    $scope.specialProduct = specialProduct;
    $scope.cart = DataService.cart;
});
myApp.controller("loadCategoryPage", function ($scope, DataService) {
    $scope.lapSource = laps;
    $scope.cats = cats;
    $scope.newProduct = newProduct;
    $scope.specialProduct = specialProduct;
    $scope.cart = DataService.cart;
    $scope.lapsPerPage = 9;
    $scope.currentPage = 0;
    $scope.totalItems = $scope.lapSource.length;
    $scope.laps = $scope.lapSource.slice(0, $scope.lapsPerPage);
    $scope.pageCount = Math.ceil($scope.totalItems / $scope.lapsPerPage)-1;
    $scope.previousPage = function () {
        var begin = (($scope.currentPage - 1) * $scope.lapsPerPage);
        var end = begin + $scope.lapsPerPage;
        $scope.laps = $scope.lapSource.slice(begin, end);
        $scope.currentPage = $scope.currentPage - 1;
    };
    $scope.nextPage = function () {
        var begin = (($scope.currentPage + 1) * $scope.lapsPerPage);
        var end = begin + $scope.lapsPerPage;
        if (end > $scope.lapSource.lenght) {
            $scope.laps = $scope.lapSource.slice(begin, $scope.lapSource.lenght);
            $scope.currentPage = $scope.currentPage + 1;
        } else {
            $scope.laps = $scope.lapSource.slice(begin, end);
            $scope.currentPage = $scope.currentPage + 1;
        }
    };
});
myApp.controller("loadCheckoutPage", function ($scope, DataService) {
    $scope.cats = cats;
    $scope.newProduct = newProduct;
    $scope.specialProduct = specialProduct;
    $scope.cart = DataService.cart;
});
myApp.controller("loadSearchPage", function ($scope, DataService) {
    $scope.lapSource = laps;
    $scope.cats = cats;
    $scope.newProduct = newProduct;
    $scope.specialProduct = specialProduct;
    $scope.cart = DataService.cart;
    $scope.lapsPerPage = 9;
    $scope.currentPage = 0;
    $scope.totalItems = $scope.lapSource.length;
    $scope.laps = $scope.lapSource.slice(0, $scope.lapsPerPage);
    $scope.pageCount = Math.ceil($scope.totalItems / $scope.lapsPerPage)-1;
    $scope.previousPage = function () {
        var begin = (($scope.currentPage - 1) * $scope.lapsPerPage);
        var end = begin + $scope.lapsPerPage;
        $scope.laps = $scope.lapSource.slice(begin, end);
        $scope.currentPage = $scope.currentPage - 1;
    };
    $scope.nextPage = function () {
        var begin = (($scope.currentPage + 1) * $scope.lapsPerPage);
        var end = begin + $scope.lapsPerPage;
        if (end > $scope.lapSource.lenght) {
            $scope.laps = $scope.lapSource.slice(begin, $scope.lapSource.lenght);
            $scope.currentPage = $scope.currentPage + 1;
        } else {
            $scope.laps = $scope.lapSource.slice(begin, end);
            $scope.currentPage = $scope.currentPage + 1;
        }
    };
    $scope.isEmpty = function(){
        if ($scope.laps.isEmpty) {
            return true;
        }else{
            return false;
        }
    }
});