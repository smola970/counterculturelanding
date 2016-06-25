function feedbackThanks() {
  $('.static-form').fadeOut('slow');
  $('#thankyou').fadeIn('slow');
}

$(document).ready(function() {
  $('#feedback-field-button').on('click', function () {
    var usersFeedback = $('#feedback-field').val();
    captureFeedback( usersFeedback );
  });
});

function captureFeedback(input) {
  var usersFeedback = input
  $.ajax({
    url: '/update_user_feedback',
    data: { feedback: usersFeedback },
    method: 'post',

    success: function(data) {
      feedbackThanks(data.name)
    }
  })
}