$(document).on('turbolinks:load', function() {
  function wordCount(val){
    var wom = val.match(/\S+/g);
      return {
        words: wom ? wom.length : 0
    };
  }
  
  var textarea = document.getElementById("body");
  var result   = document.getElementById("words");
  
  textarea.addEventListener("input", function(){
    var v = wordCount( this.value );
    result.innerHTML = (
        v.words
    );
  }, false);
});