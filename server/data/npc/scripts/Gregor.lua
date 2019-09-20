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

if isInArray({"arena", "pvp", "enter"}, msg:lower()) and talkState[talkUser] ~= 2 then
selfSay("Whata bassass!? I can give you access to death for 100000 gps. Do you want to enter?")
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes')) and talkState[talkUser] == 1 then
if getPlayerMoney(cid) >= 100000 then
doPlayerRemoveMoney(cid, 100000)
setPlayerStorageValue(cid,7666,1)
else
selfSay("You don\'t have enough money.")
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