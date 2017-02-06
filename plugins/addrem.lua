local function addgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if not groupa then
group[tostring(msg.chat_id)] = {
        group_type = 'SuperGroup',
		by = msg.from_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
		  lock_link = "❎",
lock_username = "❎",
lock_edit = "❎",
lock_fwd = "❎",
lock_spam = "❎",
lock_sticker = "❎",				
lock_english = "❎",
lock_persian = "❎",
lock_tgservice = "❎",			
lock_tag = "❎",
lock_inline = "❎",
lock_community = "❎",				
mute_all = "❎",
mute_text = "❎",				
mute_photo = "❎",
mute_video = "❎",
mute_voice = "❎",
mute_document = "❎",
mute_gif = "❎",
mute_audio = "❎"
                  }
      }
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup 💈💈 added\n @senator_tea', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup 💈💈 add\n @senator_tea', 1)
end
end
local function remgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if groupa then
group[tostring(msg.chat_id)] = nil
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup 💈💈 removed\n @senator_tea', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup 💈💈 remove\n @senator_tea', 1)
end
end

local function run(msg, matches)
if matches[1] == 'add' and is_sudo(msg) then
addgroup(msg)
elseif matches[1] == 'rem' and is_sudo(msg) then
remgroup(msg)
end
end
return {
  patterns = {
    "^[/#!](add)$",
    "^[/#!](rem)$",
 "^!!!edit:[/#!](add)$",
    "^!!!edit:[/#!](rem)$"
  },
  run = run
}
