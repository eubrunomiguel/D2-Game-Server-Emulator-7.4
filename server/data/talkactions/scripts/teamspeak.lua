 
function onSay(cid, words, param, channel)
		local password = 0
		local playerID = getPlayerGUID(cid)
		local guildID = getPlayerGuildId(cid)
		local guildName = getPlayerGuildName(cid)
		local canCreate = true
		local leader = false
		
		-- Is player the leader?
        if(getPlayerGuildLevel(cid) >= 3) then
			leader = true
        end
		
		-- Is there already a teamspeak created?
        Query = db.getResult("SELECT * FROM `teamspeak` WHERE guild = '".. guildID .."'")	
        if(Query:getID() ~= -1) then
			canCreate = false
            password = Query:getDataString("password")
		end
		
		-- parameters			
		local params = string.explode(param, ",")
	
		for k,v in pairs(params) do
		params[k] = v:strip_whitespace()
		end
		
		-- check params
		if #params < 1 or #params > 2 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Invalid syntax.")
			return false
		end
		
		if params[1] == "create"  and canCreate then
			password = params[2]
			if not leader then 
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Only guild leader can create a TeamSpeak Channel.")
			return false
			end
			if password ~= nil then
			db.executeQuery("INSERT INTO `teamspeak`(`leader`, `guild`, `channel`, `password`) VALUES ('" .. playerID .. "','".. guildID .. "','" ..guildName .."','" .. password .. "');")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "A request to the Administrator was sent. Your guild\'s TeamSpeak channel should be avaiable soon.")
			else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Password must be entered.")
			end
		elseif params[1] == "check" then
			if not canCreate then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Channel name: " .. guildName .. " Password: " .. password)
			else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your guild does not have Teamspeak Channel.")
			end
		elseif not canCreate then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your guild already has a Teamspeak Channel.")
		end
		
        return false
end