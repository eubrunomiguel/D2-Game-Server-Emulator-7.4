function onSay(cid, words, param)

if #getPlayerStartedTasks(cid) == 0 then
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have not started any task, please go talk to Grizzly Adams to begin.")
return true
end



	-- Add basic info
	if #getPlayerStartedTasks(cid) == 1 then
	virgula = 0
	elseif #getPlayerStartedTasks(cid) == 2 then
	virgula = "and"
	elseif #getPlayerStartedTasks(cid) == 3 then
	virgula = 2
	end
	ok = false
	ok1 = false
	ok2 = false
	count = 0
	number = 0
	
    str = "Started Tasks: "
	for i = 0, 	40 do
    --str = "Started Tasks: \n"
	--str = str  .. tasks[i].raceName .. ", "
	--print(str)
	if getPlayerStartedTasks(cid)[i] ~= nil then
	
	number = getPlayerStorageValue(cid, KILLSSTORAGE_BASE + getPlayerStartedTasks(cid)[i])
	if number == -1 then 
	number = 0
	end

	
		str = str .. tasks[getPlayerStartedTasks(cid)[i]].raceName .. " [" .. number .. "/" .. tasks[getPlayerStartedTasks(cid)[i]].killsRequired .. "]"
		
		if #getPlayerStartedTasks(cid) == 2 and not ok then
		str = str .. " and "
		ok = true
		end
		
		if #getPlayerStartedTasks(cid) == 3 then
		
		if ok1 == false then
		str = str .. ", "
		ok1 = true
		end
		
		if count == 1 then
		str = str .. " and "
		end
				count = count + 1
		end
		end
		end
	str = str .. "."
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)
	return false
end