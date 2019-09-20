local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if npcHandler.focus ~= cid then
return false
end

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid

local pos = {x = 32121, y = 32174, z = 6} -- add here the teleport position

if isInArray({"warlord", "quest", "warlord quest"}, msg:lower()) and talkState[talkUser] ~= 2 then
selfSay("Okey then! Bring me 20 'burning heart' to show you got the courage to move on.")
talkState[talkUser] = 1
elseif(msgcontains(msg, 'burning heart')) and talkState[talkUser] == 1 then
selfSay("Oh I might have mistaking you! Are you sure you want to move on?")
talkState[talkUser] = 2
elseif(msgcontains(msg, 'yes')) and talkState[talkUser] == 2 then
if getPlayerItemCount(cid, 2353) >= 20 then
doPlayerRemoveItem(cid, 2353, 20)
doTeleportThing(cid, pos)
else
selfSay("You don\'t have it.")
end
talkState[talkUser] = 0
elseif(msgcontains(msg, 'no')) and talkState[talkUser] ~= 1 then
talkState[talkUser] = 0
selfSay('Oh, well then not!', cid)
end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())