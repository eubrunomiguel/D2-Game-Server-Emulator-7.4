local function cleanupPlayersExtraPromotion()
	local str = getGlobalStorageValue(15001)
	if str ~= 1 then
		local players = db.getResult("SELECT `id`,`loss_experience`,`loss_mana`,`loss_skills` FROM `players` WHERE `vocation` > 4;")
		if(players:getID() ~= -1) then
			while (true) do
				local id = players:getDataInt("id")
				local lossmana = players:getDataInt("loss_mana") + 11
				local lossexperience = players:getDataInt("loss_experience") + 11
				local lossskills = players:getDataInt("loss_skills") + 11
				db.executeQuery("UPDATE `players` SET `loss_experience` = '".. lossexperience .."', `loss_mana` = '".. lossmana .."', `loss_skills` = '".. lossskills .."' WHERE id = '".. id .."';")
				if not(players:next()) then
					break
				end
			end
			players:free() 
			setGlobalStorageValue(15001, 1)
		end
	end
end

function onStartup()
	setBonusExp(false)
	db.executeQuery("UPDATE players SET loss_experience = 55;")
	db.executeQuery("UPDATE accounts SET guild_points_stats = 0;")
	db.executeQuery("UPDATE guilds SET last_execute_points = 0;")
	db.executeQuery("UPDATE `players` SET `init_exp` = `experience`;")
	db.executeQuery("UPDATE `players` SET `exp_made` = '0';")
	db.executeQuery("UPDATE `players` SET `looktype` = '130' WHERE `looktype` = '0';")
	doSetGameState(GAME_STATE_SHUTDOWN)
	cleanHouses()
	updateExpDaily()
	return true
end
