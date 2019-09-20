local function sendLoginInfo(cid)
	--Sends the login messages and also the teleport effect
	local loginMsg = getConfigValue('loginmsg')
	local lastLogin = getPlayerLastLogin(cid)
	local playerPos = getPlayerPosition(cid)
	local serverName = getConfigValue('servername')
	local str = ""

	if (string.len(loginMsg) ~= 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, loginMsg)
	end

	if (lastLogin ~= 0) then
		str = "Your last visit in "
		str = str .. serverName
		str = str .. ": "
		str = str .. os.date("%d %b %Y %X", lastLogin)
		str = str .. "."
	else
		str = "This is your first visit in "
		str = str .. serverName
		str = str .. ". Please choose an outfit.\n Noob task has been started, you must kill 50 spiders or rats, and return to Grizzly Adams."
		setPlayerStorageValue(cid, 71501, 1)
		setPlayerStorageValue(cid, 72501, 0)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)

	if(isGmInvisible(cid) == false) then
		doSendMagicEffect(playerPos, CONST_ME_TELEPORT)
	end
end

local function checkRecord(cid)
	local PlayersRecordStorage = 14301
	local i = 1
	
	for _, pid in ipairs(getPlayersOnlineList()) do
		i = i + 1
	end
	local current = i - 1
	
	if getGlobalStorageValue(PlayersRecordStorage) == nil then
		setGlobalStorageValue(PlayersRecordStorage, 0)
	end	
	
	oldRecord = getGlobalStorageValue(PlayersRecordStorage)
	
	if current > oldRecord then
		addEvent(doBroadcastMessage, 150, "New record: " .. current .. " players are logged in.", MESSAGE_STATUS_DEFAULT)
		setGlobalStorageValue(PlayersRecordStorage, current)
	end
end

function onLogin(cid)
	--Register the kill/die event
	registerCreatureEvent(cid, "lootmessage")
	registerCreatureEvent(cid, "pvparena")
	registerCreatureEvent(cid, "arena")
	registerCreatureEvent(cid, "burningheart")
	registerCreatureEvent(cid, "inquisition")
	registerCreatureEvent(cid, "task")
	registerCreatureEvent(cid, "playeradvance")
	registerCreatureEvent(cid, "playerdie")
	--registerCreatureEvent(cid, "killevent")

	-- check player current stage
	checkStageChange(cid)

	-- check record
	checkRecord(cid)

	-- send login info
	sendLoginInfo(cid)
	
	--add a backpack if it is a relogin after a death
	if getPlayerStorageValue(cid, STORAGE_DEATH_BAG) == 1 then
		if getPlayerSlotItem(cid, CONST_SLOT_BACKPACK).uid == 0 then
			local item_bag = doCreateItemEx(ITEM_BAG, 1)
			doPlayerAddItemEx(cid, item_bag, false, CONST_SLOT_BACKPACK)
		end
		setPlayerStorageValue(cid, STORAGE_DEATH_BAG, -1)
	end

	--Remove blesses if necessary
	if getPlayerStorageValue(cid, STORAGE_REMOVE_BLESSES) == 1 then
		if isBlessed(cid) then
			removePlayerBless(cid)

		end	
		setPlayerStorageValue(cid, STORAGE_REMOVE_BLESSES, -1)
		doSavePlayer(cid)
	end

	--Promotes player if necessary
	if(isPremium(cid)) then
		if(getPlayerStorageValue(cid, STORAGE_PROMOTION) == 1 and getPlayerVocation(cid) <= 4) then
			doPlayerSetVocation(cid, getPlayerVocation(cid)+4)
			doPlayerRemoveSkillLossPercent(cid, 5)
			setPlayerStorageValue(cid, STORAGE_PROMOTION, -1)
		end
		if(getPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT) == 1) then
			setPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT, -1)
		end
		return true
	end

	--Player is not premium - remove premium privileges
	--Change outfit
	if(getPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT) == -1) then
		local lookType = 128
		if(getPlayerSex(cid) == 0) then
			lookType = 136
		end
		local currentoutfit = getCreatureOutfit(cid)
		doCreatureChangeOutfit(cid, {lookType = lookType, lookHead = currentoutfit.lookHead, lookBody = currentoutfit.lookBody, lookLegs = currentoutfit.lookLegs, lookFeet = currentoutfit.lookFeet, lookAddons = 0})
		setPlayerStorageValue(cid, STORAGE_PREMIUM_ACCOUNT, 1)
	end

	--Remove promotion
	local isPromo = (getPlayerVocation(cid) > 4 and isPremium(cid) == false)
	if(isPromo) then
		doPlayerSetVocation(cid, getPlayerVocation(cid)-4)
		doPlayerRemoveSkillLossPercent(cid, -5)
		setPlayerStorageValue(cid, STORAGE_PROMOTION, 1)
	end

	return true
end
