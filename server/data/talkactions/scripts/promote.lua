local config = {
	broadcast = true
}

function onSay(cid, words, param, channel)
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end

	local pid = getPlayerGUIDByName(param)
	if(pid == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
		return true
	end

	local newId = 2

	local str = "been promoted to tutor."
	if(not config.broadcast) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, param .. " has " .. str)
	else
		doBroadcastMessage(param .. " has " .. str, MESSAGE_EVENT_ADVANCE)
	end
	db.executeQuery("UPDATE `players` SET `group_id` = '2' WHERE `id` = '".. pid .."';")
	doPlayerSendTextMessage(pid, MESSAGE_EVENT_ADVANCE, "You have " .. str)
	return true
end

