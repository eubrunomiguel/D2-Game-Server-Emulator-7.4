function onSay(cid, words, param, channel)
	local guild = getPlayerGuildId(cid)
	if(not guild or getPlayerGuildLevel(cid) < 3) then
		doPlayerSendCancel(cid, "You cannot execute this talkaction.")
		return TRUE
	end
 
	local t = string.explode(param, ",")
	if(not t[2]) then
		doPlayerSendCancel(cid, "Not enough param(s).")
		return TRUE
	end
 
	local enemy = getGuildId(t[2])
	if(enemy == LUA_ERROR) then
		doPlayerSendCancel(cid, "Guild \"" .. t[2] .. "\" does not exists.")
		return TRUE
	end
 
	if(enemy == guild) then
		doPlayerSendCancel(cid, "You cannot perform war action on your own guild.")
		return TRUE
	end
 
	local enemyName, tmp = "", db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. enemy)
	if(tmp:getID() ~= -1) then
		enemyName = tmp:getDataString("name")
		tmp:free()
	end
 
	if(isInArray({"accept", "reject", "cancel"}, t[1])) then
		local query = "`guild_id` = " .. enemy .. " AND `opponent_id` = " .. guild
		if(t[1] == "cancel") then
			query = "`guild_id` = " .. guild .. " AND `opponent_id` = " .. enemy
		end
 
		tmp = db.getResult("SELECT `id`, `declaration_date`, `end_date`, `guild_fee` FROM `guild_wars` WHERE " .. query .. " AND `status` = 0")
		if(tmp:getID() == -1) then
			doPlayerSendCancel(cid, "Currently there's no pending invitation for a war with " .. enemyName .. ".")
			return TRUE
		end
 
		if(t[1] == "accept") then
			local _tmp = db.getResult("SELECT `balance` FROM `guilds` WHERE `id` = " .. guild)
			local state = _tmp:getID() < 0 or _tmp:getDataInt("balance") < tmp:getDataInt("guild_fee")
 
			_tmp:free()
			if(state) then
				doPlayerSendCancel(cid, "Your guild balance is too low to accept this invitation.")
				return TRUE
			end
 
			db.executeQuery("UPDATE `guilds` SET `balance` = `balance` - " .. tmp:getDataInt("guild_fee") .. " WHERE `id` = " .. guild)
		end
 
		query = "UPDATE `guild_wars` SET "
		local msg = "accepted " .. enemyName .. " invitation to war."
		if(t[1] == "reject") then
			query = query .. "`end_date` = " .. os.time() .. ", `status` = 2"
			msg = "rejected " .. enemyName .. " invitation to war."
		elseif(t[1] == "cancel") then
			query = query .. "`end_date` = " .. os.time() .. ", `status` = 3"
			msg = "canceled invitation to a war with " .. enemyName .. "."
		else
			query = query .. "`declaration_date` = " .. os.time() .. ", `end_date` = " .. (tmp:getDataInt("end_date") > 0 and (os.time() + ((tmp:getDataInt("declaration_date") - tmp:getDataInt("end")) / 86400)) or 0) .. ", `status` = 1"
		end
 
		query = query .. " WHERE `id` = " .. tmp:getDataInt("id")
		if(t[1] == "accept") then
		local warId = tmp:getDataInt("id")
		db.executeQuery("UPDATE `guild_wars` SET `status` = '1' WHERE `id` = " .. warId .. ";")
		doUpdateGuildWar(warId)	
		end
 
		tmp:free()
		db.executeQuery(query)
		doBroadcastMessage(getPlayerGuildName(cid) .. " has " .. msg, MESSAGE_EVENT_ADVANCE)
		return TRUE
	end
 
	if(t[1] == "invite") then
		local str = ""
                tmp = db.getResult("SELECT `guild_id`, `status` FROM `guild_wars` WHERE `guild_id` IN (" .. guild .. "," .. enemy .. ") AND `opponent_id` IN (" .. enemy .. "," .. guild .. ") AND `status` IN (0, 1)")
                if(tmp:getID() ~= -1) then
                        if(tmp:getDataInt("status") == 0) then
                                if(tmp:getDataInt("guild_id") == guild) then
                                        str = "You have already invited " .. enemyName .. " to war."
                                else
                                        str = enemyName .. " have already invited you to war."
                                end
			else
				str = "You are already on a war with " .. enemyName .. "."
			end
 
			tmp:free()
		end
 
		if(str ~= "") then
			doPlayerSendCancel(cid, str)
			return TRUE
		end
 
		local frags = tonumber(t[3])
		if(frags ~= nil) then
			frags = math.max(10, math.min(1000, frags))
		else
			frags = 100
		end
 
		local payment = tonumber(t[4])
		if(payment ~= nil) then
			payment = math.max(100000, math.min(1000000000, payment))
			tmp = db.getResult("SELECT `balance` FROM `guilds` WHERE `id` = " .. guild)
 
			local state = tmp:getID() < 0 or tmp:getDataInt("balance") < payment
			tmp:free()
			if(state) then
				doPlayerSendCancel(cid, "Your guild balance is too low for such payment.")
				return TRUE
			end
 
			db.executeQuery("UPDATE `guilds` SET `balance` = `balance` - " .. payment .. " WHERE `id` = " .. guild)
		else
			payment = 0
		end
 
		local begining, ending = os.time(), tonumber(t[5])
		if(ending ~= nil and ending ~= 0) then
			ending = begining +  86400
		else
			ending = begining +  86400
		end
 
		db.executeQuery("INSERT INTO `guild_wars` (`guild_id`, `opponent_id`, `declaration_date`, `end_date`, `frag_limit`, `guild_fee`) VALUES (" .. guild .. ", " .. enemy .. ", " .. begining .. ", " .. ending .. ", " .. frags .. ", " .. payment .. ");")
		doBroadcastMessage(getPlayerGuildName(cid) .. " has invited " .. enemyName .. " to war till " .. frags .. " frags.", MESSAGE_EVENT_ADVANCE)
		return TRUE
	end
 
	if(not isInArray({"end", "finish"}, t[1])) then
		return FALSE
	end
 
	local status = (t[1] == "end" and 1 or 4)
	tmp = db.getResult("SELECT `id` FROM `guild_wars` WHERE `guild_id` = " .. guild .. " AND `opponent_id` = " .. enemy .. " AND `status` = " .. status)
	if(tmp:getID() ~= -1) then
		local query = "UPDATE `guild_wars` SET `end_date` = " .. os.time() .. ", `status` = 5 WHERE `id` = " .. tmp:getDataInt("id")
		local warId = tmp:getDataInt("id")
		doUpdateGuildWar(warId)
		tmp:free()
 
		db.executeQuery(query)
		doBroadcastMessage(getPlayerGuildName(cid) .. " has " .. (status == 4 and "mend fences" or "ended up a war") .. " with " .. enemyName .. ".", MESSAGE_EVENT_ADVANCE)
		return TRUE
	end
 
	if(status == 4) then
		doPlayerSendCancel(cid, "Currently there's no pending war truce from " .. enemyName .. ".")
		return TRUE
	end
 
	tmp = db.getResult("SELECT `id`, `end_date` FROM `guild_wars` WHERE `guild_id` = " .. enemy .. " AND `opponent_id` = " .. guild .. " AND `status` = 1")
	if(tmp:getID() ~= -1) then
		if(tmp:getDataInt("end") > 0) then
			tmp:free()
			doPlayerSendCancel(cid, "You cannot request ending for war with " .. enemyName .. ".")
			return TRUE
		end
 
		local query = "UPDATE `guild_wars` SET `status` = 4, `end_date` = " .. os.time() .. " WHERE `id` = " .. tmp:getDataInt("id")
		tmp:free()
 
		db.executeQuery(query)
		doBroadcastMessage(getPlayerGuildName(cid) .. " has signed an armstice declaration on a war with " .. enemyName .. ".", MESSAGE_EVENT_ADVANCE)
		return TRUE
	end
 
	doPlayerSendCancel(cid, "Currently there's no active war with " .. enemyName .. ".")
	return TRUE
end