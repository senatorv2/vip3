function INFO (i, naji)
	if naji.user_ then
		if naji.user_.username_ then
			username2 = '⏺ @'..naji.user_.username_
		else
			username2 = ''
		end 
		if naji.user_.last_name_ then 
			name2 = naji.user_.first_name_..naji.user_.last_name_
		else 
			name2 = naji.user_.first_name_
		end
		local pm = '*I👤I* '..check_markdown(name2)..'\nid *'..naji.user_.id_..'*\n'..check_markdown(username2)
		local pm1 = 'I👤I '..name2..'\nid '..naji.user_.id_..'\n'..username2
		if naji.user_.profile_photo_ then 
			tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = naji.user_.id_,offset_ = 0,limit_ = 1},
			 function (i, naji)
			    tdcli.sendPhoto(i.chat_id, i.msg_id, 0, 1, nil, naji.photos_[0].sizes_[1].photo_.persistent_id_, i.pm) 
			end, {chat_id=i.chat_id,msg_id=i.msg_id,pm=pm1})
		else
			tdcli.sendMessage(i.chat_id, i.msg_id, 1, pm, 1, "md")
		end
	else
		tdcli.sendMessage(i.chat_id, i.msg_id, 1, "_Can't Find User by that_  🆔 *ID* 🆔", 0, "md")
	end
end
local function run(msg, matches)
	if matches[1] == "info" then
	    if msg.from.username then 
			username1 = "⏺ @"..msg.from.username
		else
			username1 = ""
		end
		if msg.from.last_name then
			name1 = msg.from.first_name..msg.from.last_name
		else
			name1 = msg.from.first_name
		end
		local name = check_markdown(name1)
		local username = check_markdown(username1)
		if matches[2] then
			if tonumber(matches[2]) then
				tdcli_function ({
				    ID = "GetUserFull",
					user_id_ = matches[2],
				}, INFO, {chat_id=msg.to.id,msg_id=msg.id})
			elseif matches[2]:match("@")  then
				local username = matches[2]:gsub('@','')
				tdcli_function ({
				    ID = "SearchPublicChat",
					username_ = username
				}, function (I, Naji)
					if Naji.id_ then 
						return tdcli_function ({ID = "GetUserFull",
							user_id_ = Naji.id_
						}, INFO, {chat_id=I.chat_id,msg_id=I.msg_id})
					else
						tdcli.sendMessage(I.chat_id, I.msg_id, 1, "_Can't Find User by that_  ⏺ *Username* ⏺", 1, "md")
					end
				end, {chat_id=msg.to.id,msg_id=msg.id})
			else
				return "_User Not Found_"
			end
		else
			if tostring(msg.to.id):match('^(%d+)') then
				return tdcli.sendMessage(msg.to.id, msg.id, 1, "*🤖 🆔 : "..our_id.."*\n    ↽┄═════════┅⇀\n*I👤I* "..name.."\n🆔 *"..msg.from.id.."*\n"..username, 1, "md")
			elseif msg.reply_id then
				tdcli_function ({ID = "GetMessage",
					chat_id_ = msg.to.id,
					message_id_ = msg.reply_id
				}, function (i, naji)
					tdcli_function ({ID = "GetUserFull",user_id_ = naji.sender_user_id_}, INFO, {chat_id=naji.chat_id_,msg_id=i.msg_id})
				end, {msg_id=msg.id})
			else
				local chat_name = check_markdown(msg.to.title)
				return tdcli.sendMessage(msg.to.id, msg.id, 1, "*I👥I* "..chat_name.."\n🆔 *"..msg.to.id.."*\n    ↽┄═════════┅⇀\n*I👤I* "..name.."\n🆔 *"..msg.from.id.."*\n"..username, 1, "md")
			end
		end
	end
end
return {
patterns ={
"^[!/#]([Ii][Nn][Ff][Oo]) (.*)$",
"^[!/#]([Ii][Nn][Ff][Oo])$",
"^!!!edit:[!/#]([Ii][Nn][Ff][Oo]) (.*)$",
"^!!!edit:[!/#]([Ii][Nn][Ff][Oo])$",
},run=run}
