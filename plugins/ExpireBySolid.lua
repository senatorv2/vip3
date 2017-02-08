do

  local function msgDump(chat_id, msg_id, value, file)
    local dump = serpent.block(value, {comment=false})
    if file then
      local textfile = '/tmp/msgdump_' .. os.date('%y%m%d-%H%M%S', value.date_) .. '.json'
      local info =  _msg('From: %s\nID: %s\nDate: %s'):format(value.chat_id_, value.id_, os.date('%c', value.date_))
      saveConfig(value, textfile, 'noname')
      td.sendDocument(_config.bot.id, 0, 0, 1, nil, textfile, info)
      os.remove(textfile)
    else
      if #dump > 4000 then
        local text = _msg('Message is more than 4000 characters.\n'
                .. 'Use <code>%sdumptext</code> instead.'):format(_config.cmd)
      else
        sendText(chat_id, msg_id, '<code>' .. util.escapeHtml(dump) .. '</code>')
      end
    end
  end
  