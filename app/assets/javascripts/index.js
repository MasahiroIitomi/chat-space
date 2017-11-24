$(function(){

  function searchUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user.name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }
// 検索したユーザーから追加するメソッド
  function addMember(user){
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${$(user).data('user-id')}'>
                  <input name='group[user_ids][]' type='hidden' value='${$(user).data('user-id')}'>
                  <p class='chat-group-user__name'>${$(user).data('user-name')}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $(".added-group-member").append(html);
  }
  // 追加したユーザーリストから削除するメソッド
  function removeMember(user){
    var id = $(user).siblings('input').attr("value");
    var name = $(user).siblings('p').text();
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${name}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${id}" data-user-name="${name}">追加</a>
                </div>`
    $("#user-search-result").append(html);
  }

  $("#user-search-field").on("keyup", function(){
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users){
      users.forEach(function(user){
        searchUser(user);
      })
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました')
    })
  });

// 追加機能と追加項目列から消去
  $(document).on('click', '.user-search-add', function(){
    addMember(this);
    $(this).parent().remove();
  });

// 削除機能と削除項目列から消去
  $(document).on('click', '.user-search-remove', function(){
    removeMember(this);
    $(this).parent().remove();
  });
});
