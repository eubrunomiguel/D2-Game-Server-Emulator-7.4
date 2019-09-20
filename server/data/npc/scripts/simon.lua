local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	-- NPC Simon (Deeper Fibula Quest) feito por Rodrigo (Nottinghster)
	-- Inicio Simon NPC
	
	local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money    = player_gold + player_plat + player_crys
	
	if msgcontains(msg, 'help') then
	selfSay('I need gold. Can you spend me 100 gold pieces?')
	talk_state = 1
	
	elseif msgcontains(msg, 'yes') and talk_state == 1 and player_money >= 100 then
	selfSay('Thank you very much. Can you spend me 500 more gold pieces? I will give you a nice hint.')
	doPlayerRemoveMoney(cid, 100)
	talk_state = 2
	elseif msgcontains(msg, 'yes') and talk_state == 1 and player_money < 100 then
	selfSay('You\'ve not enough money for me.')
	
	elseif msgcontains(msg, 'yes') and talk_state == 2 and player_money >= 500 then
	doPlayerRemoveMoney(cid, 500)
	selfSay('That\'s great! I have stolen something from Dermot. You can buy it for 200 gold. Do you want to buy it?')
	talk_state = 3
	elseif msgcontains(msg, 'yes') and talk_state == 2 and player_money < 500 then
	selfSay('You\'ve not enough money for me.')
	
	elseif msgcontains(msg, 'yes') and talk_state == 3 and player_money >= 200 then
	selfSay('Now you own the hot key.')
	doPlayerRemoveMoney(cid, 200)
	key = doPlayerAddItem(cid, 2087,1)
	doSetItemActionId(key,3940)
	talk_state = 0
	elseif msgcontains(msg, 'yes') and talk_state == 3 and player_money < 200 then
	selfSay('Pah! I said 200 gold. You don\'t have so much.')
	
	elseif msgcontains(msg, 'bye') and (talk_state >= 1 and talk_state <= 3) then
	selfSay('Have a nice day.')
	talk_state = 0
	
	end
	-- Final Simon NPC
	-- NPC Simon (Deeper Fibula Quest) feito por Rodrigo (Nottinghster)
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())