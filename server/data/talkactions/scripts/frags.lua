function onSay(cid, words, param)
	local table = getPlayerUnjustKills(cid)
	local timestamp = getPlayerSkullEndTime(cid)
	local skulltype = getPlayerSkullType(cid)
	local dateTable = os.date("*t", timestamp)
	local now = os.date("*t")
	
	local manyDays =  dateTable.day - now.day 
	local manyHour =  dateTable.hour - now.hour 
	local manyMinute =   dateTable.min - now.min
	local manySeconds = dateTable.sec -  now.sec 
	
	local str = "You will loose your Red Skull in "
	local coma = false
	if manyDays > 0 then
		str = str .. manyDays .. " days"
		if coma then
			str = str .. ", "
			coma = false
		end
		coma = true
	end
	if manyHour > 0 then
		if coma then
			str = str .. ", "
			coma = false
		end
		coma = true
	str = str .. manyHour .. " hours"
	end
	if manyMinute > 0 then
		if coma then
			str = str .. ", "
			coma = false
		end
		coma = true
		str = str ..  manyMinute .. " minutes"
	end
	if manySeconds > 0 then
		if coma then
			str = str .. " and "
			coma = false
		end
		coma = true
	str = str ..  manySeconds .. " seconds."
	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Day: " .. table.day .. " (red skull:" .. table.dayRedSkull .. ")")

	  if (skulltype == 4) then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)
	  end

	return false
end
