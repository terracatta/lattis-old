var Lattis = {
  // Public: Method that initializes the Lattis application functionality.
  init: function(){
    Lattis.wireFlashMessages();
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
