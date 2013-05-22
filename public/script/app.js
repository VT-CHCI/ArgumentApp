var app = angular.module('argue', []);
app.controller('pick_a_side', function($scope, $http) {
  scenarioId = window.location.href.split('/')[3]
  $http.get('/scenario/' + scenarioId).success(function(data) {
    $scope.item = data;
  });
});

app.controller('categorize', function($scope, $http) {
  scenarioId = window.location.href.split('/')[3]
  $http.get('/scenario/' + scenarioId).success(function(data) {
    $scope.item = data;
  });
});


app.controller('article', function($scope, $http) {
  scenarioId = window.location.href.split('/')[3]
  $http.get('/scenario/' + scenarioId).success(function(data) {
    $scope.item = data;
  });
});

Zepto(function($) {
    /* categorize and then industrialists */ 
});
