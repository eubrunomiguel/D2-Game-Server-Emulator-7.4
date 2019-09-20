local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local smallReward = {2152, 100}
local bigReward = {2160, 5}
local hardcoreReward = 20 -- max points

local function RewardAmount(num)
	local amount =  math.random(num)
	return amount
end

local function addSmall(cid)
	local success = false
	local playerPos = getCreaturePosition(cid)
	local itemID = smallReward[1]
	local amount = RewardAmount(smallReward[2])
	local item = doCreateItemEx( itemID, amount )
	if( item ~= false )then
		if( doPlayerAddItemEx( cid, item, true ) ~= RETURNVALUE_NOERROR )then
			doRemoveItem( item )
			doPlayerSendTextMessage( cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item could not be summoned." )
			doSendMagicEffect( playerPos, CONST_ME_POFF )
			success = false
		else
			doDecayItem( item )
			doSendMagicEffect( playerPos, CONST_ME_MAGIC_GREEN )
			success = true
			doPlayerSendTextMessage( cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have received " .. amount .. " platinum coins" )
		end
	end
	return success
end

local function addBig(cid)
	local success = false
	local playerPos = getCreaturePosition(cid)
	local itemID = bigReward[1]
	local amount = RewardAmount(bigReward[2])
	local item = doCreateItemEx( itemID, amount )
	if( item ~= false )then
		if( doPlayerAddItemEx( cid, item, true ) ~= RETURNVALUE_NOERROR )then
			doRemoveItem( item )
			doPlayerSendTextMessage( cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item could not be summoned." )
			doSendMagicEffect( playerPos, CONST_ME_POFF )
			success = false
		else
			doDecayItem( item )
			doSendMagicEffect( playerPos, CONST_ME_MAGIC_GREEN )
			success = true
			doPlayerSendTextMessage( cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have received " .. amount .. " crystal coins" )
		end
	end
	return success
end

local function addHardcore(cid)
	local amount = RewardAmount(hardcoreReward)
	doAddPoints(cid,amount)
	doPlayerSendTextMessage( cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have received " .. amount .. " premium points" )
end

local choice = 0

function creatureSayCallback(cid, type, msg)

	local smallFeathers = 10
	local bigFeathers = 40
	local hardcoreFeathers = 100
	local featherID = 2366
	
	if npcHandler.focus ~= cid then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid

	if isInArray({"feather", "event"}, msg:lower()) and talkState[talkUser] ~= 2 then
		--selfSay("There is no event available at the moment.")
		selfSay("small, big or hardcore?")
		talkState[talkUser] = 1
		--talkState[talkUser] = 0
	elseif(msgcontains(msg, 'small')) and talkState[talkUser] == 1 then
		choice = 1
		selfSay("Huh... " .. smallFeathers .. " feathers for maximum of " .. smallReward[2] .. " " .. getItemName(smallReward[1]) .. "?")
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'big')) and talkState[talkUser] == 1 then
		choice = 2
		selfSay("Huh... " .. bigFeathers .. " feathers for maximum of " .. bigReward[2] .. " " .. getItemName(bigReward[1]) .. "?")
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'hardcore')) and talkState[talkUser] == 1 then
		choice = 3
		selfSay("Huh... " .. hardcoreFeathers .. " feathers for maximum of " .. hardcoreReward .. " premium points?")	
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes')) and talkState[talkUser] == 2 then
		if choice == 1 then
			if getPlayerItemCount(cid, featherID) >= smallFeathers and doPlayerRemoveItem(cid, featherID, smallFeathers) then
				addSmall(cid)
				selfSay("Nice try!")
			else
				selfSay("You don't have enought feathers")
			end
		elseif choice == 2 then
			if getPlayerItemCount(cid, featherID) >= bigFeathers and doPlayerRemoveItem(cid, featherID, bigFeathers) then
				addBig(cid)
				selfSay("Nice try!")
			else
				selfSay("You don't have enought feathers")
			end
		elseif choice == 3 then
			if getPlayerItemCount(cid, featherID) >= hardcoreFeathers and doPlayerRemoveItem(cid, featherID, hardcoreFeathers) then
				addHardcore(cid)
				selfSay("Nice try!")
			else
				selfSay("You don't have enought feathers")
			end
		end
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'no')) and talkState[talkUser] == 2 then
		selfSay("So what? Small, big or hardcore?")
		talkState[talkUser] = 1
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
