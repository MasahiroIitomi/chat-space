$(function(){
  function buildHTML(message){
    var html = `<div class="message">
                  <div class="upper-message">
                    <div class="upper-message__user-name">
                      ${ message.user_name }
                    </div>
                    <div class="upper-message__date">
                      ${ message.created_at }
                    </div>
                  </div>
                  <div class="lower-message__content">
                    ${ message.body }
                  </div>
                  <div class="lower-message__content--image">
                    <img src="${ message.image }">
                  </div>
                </div>`
    return html;
  }
  $('#comment_form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('.text-input').val('');
      $(".send-btn").prop("disabled", false);
      $(".messages").animate({
        scrollTop: $(".messages")[0].scrollHeight
      });
    })
    .fail(function(){
      $(".send-btn").prop("disabled", false);
      alert('error');
    });
  });
});