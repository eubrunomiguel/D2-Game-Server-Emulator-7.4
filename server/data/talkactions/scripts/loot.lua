function onSay(cid, words, param)

    if param == "enable" then
			setPlayerStorageValue(cid,96587,0)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have enabled loot messages.")
        elseif param == "disable" then
			setPlayerStorageValue(cid,96587,1)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have disabled loot messages.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Say enable or disable after the talk action.")
		end
    return false
end

