json.messages @messages.each do |message|
  json.user_name   message.user.name
  json.created_at  message.created_at
  json.body        message.body
  json.image       message.image.to_s
  json.id          message.id
end
