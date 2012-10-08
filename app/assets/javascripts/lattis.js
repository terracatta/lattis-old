var Lattis = {
  // Public: Method that initializes the Lattis application functionality.
  init: function(){
    Lattis.wireFlashMessages();
    Lattis.wireNavSelection();
  },

  wireNavSelection: function() {
    $('#primary-nav ul > li > a').each(function(index) {
      if (document.URL == this.href) {
        $(this).parent('li').addClass('selected');
      }
    });
  },

  wireFlashMessages: function() {
    $('div.flash').fadeIn('slow')

    // handle clicks of the flash close button
    $('div.flash span.close').on('click', function(event){
      $(this).parent().fadeOut()
    })
  }
}

$(document).ready(function(){
  Lattis.init()
})
