local function run(msg, matches)
tg.sendMessage(msg.chat_id, 0, 0,  "<b>سناتور همیشه انلاینه</b>", 0)
end
return {
  patterns = {
	"^[!#/]([Ss][Ee][Nn][Aa][Tt][Oo][Rr])$",
  },
  run = run
}

--@Lv_t_m
