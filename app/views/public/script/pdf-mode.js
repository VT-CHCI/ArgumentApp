PDFJS.workerSrc = '/script/lib/pdf.js';
function pdf_mode() {
  var pdf_scope,
  viewport,
  canvas = document.getElementById('pdf-canvas'),
  context = canvas.getContext('2d'),
  scale = 2,
  page_number = 1;

  function renderPage(num) {
    page_number = num;
    pdf_scope.getPage(num).then(function(page) {
      viewport = page.getViewport(scale);
      canvas.height = viewport.height;
      canvas.width = viewport.width;

      page.render({
        canvasContext: context,
        viewport: viewport
      });
    });
  }

  function zoom(delta) {
    scale = page_number * delta;
    console.log(scale);
    renderPage(page_number);
  }

  function set_page_delta(delta) {
    if (page_number + delta < 1) { return; }
    if (page_number + delta > pdf_scope.numPages) { return; }

    renderPage(page_number + delta);
  }

  function load_pdf(path) {
    PDFJS.getDocument(path).then(function(pdf) {
      pdf_scope = pdf;
      renderPage(page_number);
    });
  }

  return {
    viewport : viewport,
    render_page   : renderPage,
    next_page     : function() { set_page_delta(1); },
    previous_page : function() { set_page_delta(-1); },
    zoom_in       : function() { zoom(1.2); },
    zoom_out      : function() { zoom(-1.2); },
    load_pdf      : load_pdf
  }
}
