var Lattis = {
  // Public: Method that initializes the Lattis application functionality.
  init: function(){
    Lattis.wireFlashMessages();
    Lattis.wireNavSelection();
    Lattis.wireDataTables();
  },

  wireNavSelection: function() {
    $('#primary-nav ul > li > a').each(function(index) {
      if (document.URL == this.href) {
        $(this).parent('li').addClass('selected');
      }
    });
  },

  wireDataTables: function() {
    $('table.datatable').dataTable({
      sPaginationType: "bootstrap",
      iDisplayLength: 25,
      bLengthChange: false,
      oLanguage: { sSearch: "" },
      fnInitComplete: function(){
        $('div.dataTables_filter input').attr('placeholder', 'Search Table')
        $('div.dataTables_filter label').prepend('<i class="search inactive"></i>')
      }
    })

    $('table.datatable tbody tr').on('click', function() {
      var url = $(this).data('url')
      window.location = url
    })

    $(document).keydown(function(event) {
      if ($('table.datatable').length) {
        var keyCode = event.which, arrow = {left: 37, right: 39}
        var table = $('table.datatable').dataTable()
        switch (keyCode) {
          case arrow.left:
            table.fnPageChange('previous')
            event.preventDefault()
          break

          case arrow.right:
            table.fnPageChange('next')
            event.preventDefault()
          break
        }
      }
    })

    $(document).keydown(function(event) {
      var keyCode = event.which, key = {down: 40, up: 38, enter: 13}
      switch (keyCode) {
        case key.down:
          if ($('table.datatable').length) {
            event.preventDefault()
            if ($('tbody tr.keyboard-highlight').length) {
              $('tbody tr.keyboard-highlight').next('tr').addClass('keyboard-highlight')
              $('tbody tr.keyboard-highlight:first').removeClass('keyboard-highlight')
              if (!$("tbody tr.keyboard-highlight:in-viewport").length) {
                var pos = $('tbody tr.keyboard-highlight:first').offset().top - 100
                $('html,body').animate({scrollTop: pos}, 500);
              }
            } else {
              $('tbody tr:first').addClass('keyboard-highlight')
            }
          }
        break

        case key.up:
          if ($('table.datatable').length) {
            event.preventDefault()
            if ($('tbody tr.keyboard-highlight').length) {
              $('tbody tr.keyboard-highlight').prev('tr').addClass('keyboard-highlight')
              $('tbody tr.keyboard-highlight:last').removeClass('keyboard-highlight')
              if (!$("tbody tr.keyboard-highlight:in-viewport").length) {
                var pos = $('tbody tr.keyboard-highlight:first').offset().top - 300
                $('html,body').animate({scrollTop: pos}, 500)
              }
            } else {
              $('tbody tr:first').addClass('keyboard-highlight')
            }
          }
        break

      case key.enter:
        if ($('table.datatable').length) {
          var url = $('table.datatable tbody tr.keyboard-highlight:last').data('url')
          window.location = url
        }
      break
      }
    })
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
