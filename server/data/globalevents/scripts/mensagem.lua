function onThink(interval, lastExecution)
MENSAGEM = {
    "Para qualquer dúvida, caso não estivermos online, envie mensagem para nossa página no facebook. www.facebook.com/d2server",
	"Para dividir xp, digite: /party enable. Para desativar: /party disable",
	"To enable party sharing, type /party enable. To desactivate: /party disable ",
	"Check our Character Market, buy or sell your character! http://d2server.net/?view=auction",
	"Check your current tasks by typing !tasks",
	"Rookgaard can be accessed though Thais boat! New hunts for low and high level players, quests and houses",
	"Check out a video from our tester player Chiclete chilling in Rookgaard https://www.facebook.com/d2server/videos/1093076760751078/",
	"Cast System is avaiable, to turn on type: /cast on",
	"To enable or disable loot message on screen, type /loot enable or /loot disable",
	"Tasks are fun, give you experience, items and also premium points to spend on our Donate Shop! http://d2server.net/?view=shop",
	"Bugs, suggestion, tutor application, bot report? http://d2server.net/?view=forum",
	"You can access new hunts on Alva, located at south of Cormaya, and Rookgaard which can be accessed through any boat NPC, for more information access http://d2server.net/?view=map",
	"Check out our offline trade system to buy, and sells itens on the market! http://d2server.net/?view=trade",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],MESSAGE_STATUS_CONSOLE_ORANGE)
return TRUE
end
