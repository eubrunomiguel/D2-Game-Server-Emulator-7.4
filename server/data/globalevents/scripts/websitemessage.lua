function onThink(interval, lastExecution)
	local result_plr = db.getResult("SELECT * FROM `z_ots_action` WHERE `status` = '0';")
	if(result_plr:getID() ~= -1) then
		while(true) do
			id = tonumber(result_plr:getDataInt("id"))
			msgtype = tonumber(result_plr:getDataInt("type"))
			message = tostring(result_plr:getDataString("message"))
			
			if msgtype == 1 then -- broadcast
				broadcastMessage(message, MESSAGE_STATUS_WARNING, false)
			elseif msgtype == 2 then -- action

			else -- not found

			end

			-- we are done, set message delivered
			db.executeQuery("UPDATE `z_ots_action` SET `status` = '1' WHERE `id` = '" .. id .. "';")

			if not(result_plr:next()) then
				break
			end
		end
		result_plr:free()
	end
	return true
end
