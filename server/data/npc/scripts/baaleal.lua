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
	
		local storeThisMissionPartos = getPlayerStorageValue(cid, 35504)
		local storeThisMissionBefore = getPlayerStorageValue(cid, 35501)
		local storeThisMission = getPlayerStorageValue(cid, 35502)
		local storeThisMissionAfterPartos = getPlayerStorageValue(cid, 35505)
		
		if storeThisMission > 0 and storeThisMissionPartos == -1 then
		npcHandler:say('You already talked to me.')
		return true
		end
		if storeThisMissionAfterPartos > 0 then
		npcHandler:say('You already talked to me.')
		return true
		end
		if storeThisMissionBefore == -1 and storeThisMissionPartos == -1 then
		npcHandler:say('You need to talk to Ubaid.')
		return true
		end
		
		if msgcontains(msg, 'mission') and storeThisMissionPartos == -1 then
		npcHandler:say('Since you are no djinn, there is something you could help us with. Are you interested, human?')
		talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 and storeThisMissionPartos == -1 then
		npcHandler:say('Now go! Travel to the northern city Carlin! Keep your eyes open and look around for something that might give you a clue!')
		setPlayerStorageValue(cid,35502,1)
		end
				    
		if msgcontains(msg, 'mission') and storeThisMissionPartos == 1 then					
		npcHandler:say('Did you find the thief of our supplies?')
		talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 and storeThisMissionPartos == 1 then
		npcHandler:say('Finally! What is his name then?')
		talk_state = 2
		elseif msgcontains(msg, 'partos') and talk_state == 2 and storeThisMissionPartos == 1 then
		npcHandler:say('Since you have proven to be a capable soldier, we have another mission for you. ... Baa\'leal: If you are interested go to Alesar and ask him about it.')
		talk_state = 3
		elseif msgcontains(msg, 'malor') and talk_state == 3 and storeThisMissionPartos == 1 then
		npcHandler:say('Hail to our great leader!')
		doPlayerAddItem(cid, 2152, 6)
		setPlayerStorageValue(cid,35505,1)
		end	 
		
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())