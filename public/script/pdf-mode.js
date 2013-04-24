PDFJS.workerSrc = '/script/lib/pdf2.js';
function pdf_mode() {
  PDFJS.getDocument('/scenarios/pdfs/helloworld.pdf').then(function(pdf) {
    // Using promise to fetch the page
    pdf.getPage(2).then(function(page) {
      var scale = 2;
      var viewport = page.getViewport(scale);

      //
      // Prepare canvas using PDF page dimensions
      //
      var canvas = document.getElementById('pdf-canvas');
      var context = canvas.getContext('2d');
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      //
      // Render PDF page into canvas context
      //
      var renderContext = {
        canvasContext: context,
        viewport: viewport
      };
      page.render(renderContext);
    });
  });
}


Zepto(function($) {
  pdf_mode();
});
