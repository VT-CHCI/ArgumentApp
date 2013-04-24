var app = angular.module('argue', []);
app.controller('pick_a_side', function($scope, $http) {
  $http.get('/scenario/industrialists').success(function(data) {
    $scope.item = data;
  });
});

app.controller('categorize', function($scope, $http) {
  $http.get('/scenario/industrialists').success(function(data) {
    $scope.item = data;
  });
});


Zepto(function($) {
});
