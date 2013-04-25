PDFJS.workerSrc = '/script/lib/pdf.js';
function pdf_mode() {
  var pdf_scope,
  canvas = document.getElementById('pdf-canvas'),
  context = canvas.getContext('2d'),
  scale = 0.8,
  page_number = 1;

  function renderPage(num) {
    page_number = num;
    pdf_scope.getPage(num).then(function(page) {
      var viewport = page.getViewport(scale);
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      page.render({
        canvasContext: context,
        viewport: viewport
      });
    });
  }

  function set_page_delta(delta) {
    if (page_number + delta < 1) { return; }
    if (page_number + delta > pdf_scope.numPages) { return; }

    renderPage(page_number + delta);
  }

  // Initializiation
  PDFJS.getDocument('/scenarios/pdfs/helloworld.pdf').then(function(pdf) {
    pdf_scope = pdf;
    renderPage(page_number);
  });

  return {
    render_page   : renderPage,
    next_page     : function() { set_page_delta(1); },
    previous_page : function() { set_page_delta(-1); }
  }
}


Zepto(function($) {
  pdf = new pdf_mode();

});
