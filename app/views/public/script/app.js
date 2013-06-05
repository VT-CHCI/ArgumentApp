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
  pdfNumber = window.location.href.split('/')[5]
  $http.get('/scenario/' + scenarioId).success(function(data) {
    $scope.item = data;

    pdf = new pdf_mode();
    articlePdf = data.articles[pdfNumber].pdf_filename;
    pdf.load_pdf('/scenario/' + data.uid + '/' + articlePdf);
    $(".side-button").on("click", function(e) {
      e.preventDefault();
      console.log(this.id == "left");
      if (this.id == "left") {
        $("#right").addClass("faded");
      } else {
        $("#left").addClass("faded");
      }
      $(".justification").addClass("visible");
    });
  });
});

Zepto(function($) {
  /* categorize and then industrialists */ 
});

