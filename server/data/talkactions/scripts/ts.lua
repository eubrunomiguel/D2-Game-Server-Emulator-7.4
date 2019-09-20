 
function onSay(cid, words, param, channel)
		local password = 0
		local playerID = getPlayerGUID(cid)
		local guildID = getPlayerGuildId(cid)
		local guildName = getPlayerGuildName(cid)

		

        Query = db.getResult("SELECT * FROM `teamspeak` WHERE created = '0'")	
        if(Query:getID() ~= -1) then
				password = Query:getDataInt("password")
			    for i = 1, Query:getRows() do
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "ID: " .. Query:getDataInt("id") ..", Channel Name: "  .. Query:getDataString("channel") .. ", Password: " .. Query:getDataString("password") .. ", by: " .. getPlayerNameByGUID(Query:getDataInt("leader")))
                Query:next()
				end
		else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Empty.")
		end
		
		if param ~= "" then
		db.executeQuery("UPDATE `teamspeak` SET `created` = 1 WHERE `id` = '" .. param .."';")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Channel Created")
		end
		
		--db.executeQuery("UPDATE `bans` SET `reason` = 19, `action` = 2, `comment` = 'botting detected manually or thru forums report' WHERE `reason` = '0' and `action` = '0';")
				--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, param[2])
	
        return false
end