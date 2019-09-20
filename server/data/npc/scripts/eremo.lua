local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end


local node1 = keywordHandler:addKeyword({'wisdom of solitude'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to buy the wisdom of solitude for 10000 gold?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, bless = 4, premium = 1, cost = 10000})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Too expensive, eh?'})

npcHandler:addModule(FocusModule:new())




function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	if msgcontains(msg, 'teleport') or msgcontains(msg, 'pemaret') or msgcontains(msg, 'back') or msgcontains(msg, 'cormaya') or msgcontains(msg, 'edron') then
	npcHandler:say('Should I teleport you back to Pemaret?')
	talk_state = 2
	
	elseif msgcontains(msg, 'yes') and talk_state == 2 then
	npcHandler:say('Here you go!')
	doTeleportThing(cid, {x=33288,y=31956,z=6})
	
	elseif msgcontains(msg, 'no') and talk_state == 2 then
	npcHandler:say('Maybe later.')
	talk_state = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())