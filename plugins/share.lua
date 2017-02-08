local function run(msg, matches)
  if matches[1] == 'kick' and is_momod(msg) then
    if msg.reply_to_message_id_ then
      bot.changeChatMemberStatus(msg.chat_id_, msg.reply_to_message_id_, 'Kicked') 
      bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User Kicked!</b>', 1, 'html')
    end
  end
  if matches[1] == 'kick' and is_momod(msg) then
    bot.changeChatMemberStatus(msg.chat_id_, matches[2] , 'Kicked') 
    bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User '..matches[2]..' Kicked!</b>', 1, 'html')
  end
  if matches[1] == 'ban' and is_momod(msg) then
    if msg.reply_to_message_id_ then
      bot.changeChatMemberStatus(msg.chat_id_, msg.reply_to_message_id_, 'Banned') 
      bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User Banned!</b>', 1, 'html')
    end
  end
  if matches[1] == 'ban' and is_momod(msg) then
    bot.changeChatMemberStatus(msg.chat_id_, matches[2] , 'Banned') 
    bot.sendMessage(msg.chat_id_, 0, 0, 1, nil, '<b>User '..matches[2]..' Banned!</b>', 1, 'html')
  end
  if matches[1] == 'id' then
    bot.sendMessage(msg.chat_id_, 0, 1, '<b>SuperGroup ID : '..msg.chat_id_..'\n\nYour ID : '..msg.sender_user_id_..'</b>', 1, 'html')
  end
  if matches[1] == 'setname' and is_owner(msg) then
    bot.changeChatTitle(msg.chat_id_, matches[2])
  end
  if matches[1] == 'invite' and is_sudo(msg) then
    bot.addChatMember(msg.chat_id_, matches[2])
  end
end
return {
  pattern = {
    "^[/#!](kick)$",
    "^[/#!](kick) (.*)$",
    "^[/#!](ban)$",
    "^[/#!](ban) (.*)$",
    "^[/#!](id)$",
    "^[/#!](setname) (.*)$",
    "^[/#!](invite) (.*)$",
    },
  run = run,
}