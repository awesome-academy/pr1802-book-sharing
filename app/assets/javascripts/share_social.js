$(document).on('turbolinks:load', function() {
  $('#twitter').on('click', function(){
    window.open('https://twitter.com/intent/tweet?text=' + $(this).attr('data-book') 
      + ' by ' + $(this).attr('data-user') + '- &amp;url=' + $(this).attr('data-url'), 
      '_blank', 'width=800, height=500, top=200, left=300');
    void(0); 
  });

  $('#facebook').on('click', function(){
    window.open('http://www.facebook.com/sharer/sharer.php?u=' + $(this).attr('data-url'), 
      '_blank', 'width=800, height=500, top=200, left=300'); 
    void(0);
  });

  $('#googleplus').on('click', function(){
    window.open('https://plus.google.com/share?url=' + $(this).attr('data-url'), 
      '_blank', 'width=800, height=500, top=200, left=300'); 
    void(0);
  });
})
