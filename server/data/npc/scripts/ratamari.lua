local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	if(npcHandler.focus ~= cid) then
		return false
	end
		
		local storeThisMission = getPlayerStorageValue(cid, 35604)
		local storeThisMissionBefore = getPlayerStorageValue(cid, 35603)
		if storeThisMission > 0 then
		npcHandler:say('You already talked to me.')
		return true
		end
		if storeThisMissionBefore == -1 then
		npcHandler:say('You need to talk to Fa\'Hradin.')
		return true
		end
		
		if msgcontains(msg, 'PIEDPIPER') then
		npcHandler:say('Meep? I mean - hello! Sorry, Player... Being a rat has kind of grown on me.')
		talk_state = 1
		elseif msgcontains(msg, 'report') and talk_state == 1 then
		npcHandler:say('Ok, have you brought me the cheese, I\'ve asked for?')
		if doPlayerRemoveItem(cid, 2696, 1) then
		setPlayerStorageValue(cid,35604,1)
		doPlayerAddItem(cid, 2345, 1)
	    npcHandler:say('Meep! Meep! Great! Here is the spyreport for you!')
		else 
		npcHandler:say('You do not have a Cheese.')
	    end
		end
				     
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())