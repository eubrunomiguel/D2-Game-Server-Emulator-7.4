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
		
		local storeThisMission = getPlayerStorageValue(cid, 35509)
		local storeThisMissionBefore = getPlayerStorageValue(cid, 35508)
		
		local storeMissionLamp = getPlayerStorageValue(cid, 35511) -- lamp part
		local questCompleted = getPlayerStorageValue(cid, 35515) -- quest completed
		

		
		if storeThisMission > 0 and storeMissionLamp < 0 then
		npcHandler:say('You already talked to me.')
		return true
		end
		if storeThisMissionBefore < 0 then
		npcHandler:say('You need to talk to Alesar.')
		return true
		end
		if questCompleted > 0 then
		npcHandler:say('You already completed the Green Djinn Quest.')
		return true
		end
		if msgcontains(msg, 'mission') and storeMissionLamp < 0 then
		npcHandler:say('But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this mission?')
		talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 and storeMissionLamp < 0 then
		npcHandler:say('If you succeed, the war could be over one night later!')
		setPlayerStorageValue(cid,35509,1)
		elseif msgcontains(msg, 'mission') and storeMissionLamp > 0 then
		npcHandler:say('Have you found Fa\'hradin\'s lamp and placed it in Malor\'s personal chambers?')
		talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 and storeMissionLamp > 0 then
		npcHandler:say('But that\'s in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to. ...')
		setPlayerStorageValue(cid,35515,1)
		end
				     
		
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())