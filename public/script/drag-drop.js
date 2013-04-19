source = null;

function dragstart_handler(event) {
  event.dataTransfer.setData('Text', 'text');
  source = event.target;
}
function dragover_handler(event) {
  event.preventDefault();
}

function drop_handler(event) {
  console.log(event);
  target = event.target;
  console.log($(target).hasClass("sortable-set" == false));
  while($(target).hasClass("sortable-set") == false) { 
    console.log("Up a level");
    target = $(target).parent(); 
    console.log($(target).hasClass("sortable-set" == true));
  }
  console.log(target);
  $(target).append($(source));
}
