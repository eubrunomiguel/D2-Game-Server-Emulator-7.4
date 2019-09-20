function onSay(cid, words, param)


		local pos = getPlayerPosition(cid)
		local str = "Position: " .. "( " ..pos.x .. " / " .. pos.y .. " / " .. pos.z .. " )\n"


	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)

	return false
end
