import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
require('jquery')
require('bootstrap')
require('@fortawesome/fontawesome-free/js/all')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Keep sidebar open when redirect to other page.
sessionStorage.setItem('open_side_bar', 'false');

document.addEventListener('turbolinks:load', function() {
  // Sidebar listener
  if (sessionStorage.getItem('open_side_bar') === 'true') {
    $('#wrapper').addClass('menuDisplayed');
  }
  $('#menu-toggle').click(function(event) {
    event.preventDefault();
    $('#wrapper').toggleClass('menuDisplayed');
    let openSideBar = sessionStorage.getItem('open_side_bar');
    if (openSideBar === 'false') {
      openSideBar = 'true';
    } else {
      openSideBar = 'false';
    }
    sessionStorage.setItem('open_side_bar', openSideBar);
  });

  // Filter rating listener
  $('.statistic').click(function(event) {
    let rating = $(this).children('#rating').val();
    let action = $('#action').val();
    let book_id = $('#book_id').val();
    $.ajax({
      url: action,
      type: 'get',
      data: {rating: rating,
        book_id: book_id},
      dataType: 'script'
    });
  });

  $(document).on('click', '.rating-star', function(event) {
    let rating = $(this).data('value');
    let action = $('#create_review_action').val();
    $('#review_rating').val(rating);
    $.ajax({
      url: action,
      type: 'get',
      data: {rating: rating},
      dataType: 'script'
    });
  });
})
