--[[
	!---------------------------------!
	!---Created by Teh Maverick-------!
	!-------www.otland.net------------!
	!---------------------------------!
]]

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talktopic, amount, playerLevel = {}, {}, {}
local str = ""

--Config
local highLevelPrice = 20000 --(Real Tibia Price: 20000) price for players level 120+, per blessing
local lowLevelPrice = 2000 --(Real Tibia Price: 2000) price for players level 30 and lower, per blessing
local pricePerLevel = 200 --(Real Tibia Price: 200) this price only applies to players between level 30 & 120, formula=((pricePerLevel*playerLevel)+lowLevelPrice)
--Text
local text = "Do you want to buy all five blessings for " --leave this unfinished (it will add the price to the end)
local thankyou = "You have bought all 5 of my blessings for " --leave this unfinished (it will add the price to the end)
local help = "I can give all of you my {blessings} for free. Blessings will protect you from losing items on death and reduce the amount of levels you lose when you die."
local already = "You already have my blessings."
local nomoney = "You don\'t have enough money for all five blessings."

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg) 			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink() 					npcHandler:onThink()					end

function greetCallback(cid)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	talktopic[talkUser], amount[talkUser], playerLevel[talkUser] = 0, 0, 0
    return true
end

function creatureSayCallback(cid, type, msg)

talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if npcHandler.focus ~= cid then
		return false
	end
	
playerLevel[talkUser] = getPlayerLevel(cid)
amount[talkUser] = 0

	if isBlessed(cid) then
		npcHandler:say(already, cid)
		return false
	else
		if playerLevel[talkUser] <= 30 then
		  amount[talkUser] = lowLevelPrice*5
		  str = "{"..amount[talkUser].."}gp?"
			elseif playerLevel[talkUser] > 30 and playerLevel[talkUser] < 120 then
				amount[talkUser] = (((playerLevel[talkUser]-30)*pricePerLevel)+lowLevelPrice)*5
				str = "{"..amount[talkUser].."}gp?"
					elseif playerLevel[talkUser] >= 120 then
						amount[talkUser] = highLevelPrice*5
						str = "{"..amount[talkUser].."}gp?"
		end
	end
	
	str = text..str
	
		if (msgcontains(msg, "help") or msgcontains(msg, "job")) then
			talktopic[talkUser] = 0
			npcHandler:say(help, cid)
	
		elseif talktopic[talkUser] == 0 and (msgcontains(msg, "yes") or msgcontains(msg, "blessings") or msgcontains(msg, "blessing")) then
			talktopic[talkUser] = 1
			npcHandler:say(str, cid)
			
		elseif talktopic[talkUser] == 1 and (msgcontains(msg, "yes") or msgcontains(msg, "ok")) then
			talktopic[talkUser] = 2
				if doPlayerRemoveMoney(cid, amount[talkUser]) then
					doPlayerBless(cid)
					doSavePlayer(cid)
					npcHandler:say(thankyou.."{"..amount[talkUser].."}.", cid)
				else
				  npcHandler:say(nomoney, cid)
				  return false
				end
		end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. Do you want my {blessings}?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please visit again. You never know when you may need my blessings!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please visit again |PLAYERNAME|")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())