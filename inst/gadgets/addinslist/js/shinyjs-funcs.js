shinyjs.init = function() {
  // Close the addin when Esc key is pressed
  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      Shiny.onInputChange('cancel', 1);
    }
  });

  // When clicking on a row in the table, tell Shiny what package was chosen
  $('#addinstable').on('click', 'tbody tr.pkgrow', function(event) {
    var target = event.target;
    var row;
    if (target.nodeName == 'A') {  // ignore clicks on links
      return;
    } else if (target.nodeName == 'TR') {
      row = $(target);
    } else {
      row = $($(target).closest('tr'));
    }
    var pkgname = row.data('pkgname');
    Shiny.onInputChange('rowclick', [pkgname, Math.random()]);
  });
};

// Show a sweetalerts message
shinyjs.swal = function(params) {
  var defaultParams = {
    title: null,
    text: null,
    type: null
  };
  params = shinyjs.getParams(params, defaultParams);
  swal(params);
};

// show a sweetalerts confirmation box (for installing/uninstalling a package)
shinyjs.confirmation = function(params) {
  var defaultParams = {
    type: null,
    package: null
  };
  params = shinyjs.getParams(params, defaultParams);
  if (params.type == 'install') {
    params.colour = 'green';
  } else {
    params.colour = '#DD6B55';
  }

  swal({
    title: 'Are you sure you want to <strong>' + params.type + ' ' + params.package + '</strong>?',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: params.colour,
    confirmButtonText: 'Yes, ' + params.type + ' away!',
    closeOnConfirm: true,
    html: true
  }, function() {
    Shiny.onInputChange(params.type, [params.package, Math.random()]);
  });
};