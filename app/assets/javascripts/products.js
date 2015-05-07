$(document).on('ready page:load', function(){
  $("#search-form").on('keyup', function(e){
    e.preventDefault();
    var searchValue = $('#search').val();
    $.ajax({
      url: '/products?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function(data){
      $('.products').html(data);
    });
  });
  // var fetchMoreResults = true;

  // $('#products').on('scroll', function() {
  //   var self = $(this),
  //       distanceFromBottom = ( $(document).height() - ( $(window).height() + $(window).scrollTop() ) );
  //   if ( distanceFromBottom < 100 && fetchMoreResults ) {
  //     fetchMoreResults = false;

  //     $.ajax({ 
  //       url: $('[rel="next"]').attr('href'),
  //       type: 'GET',
  //       dataType: 'script'
  //     }).done(function(response){
  //       fetchMoreResults = true;
  //     })
  //   }
  // });
});