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

local hearts = 0
local storage = 0
local order = ""
local cash = 0
task = 0

if getPlayerStorageValue(cid, 12000) == 6 then
selfSay("You already completed all tasks!")
return true
end


if getPlayerStorageValue(cid, 12000) == -1 then
hearts = 50
storage = 1
order = "first"
cash = 5
task = 5

elseif getPlayerStorageValue(cid, 12000) == 1 then
hearts = 150
storage = 2
order = "second"
cash = 10
task = 10

elseif getPlayerStorageValue(cid, 12000) == 2 then
hearts = 250
storage = 3
order = "third"
cash = 15
task = 15


elseif getPlayerStorageValue(cid, 12000) == 3 then
hearts = 350
storage = 4
order = "fourth"
cash = 20
task = 20

elseif getPlayerStorageValue(cid, 12000) == 4 then
hearts = 450
storage = 5
order = "fifth"
cash = 25
task = 25


elseif getPlayerStorageValue(cid, 12000) == 5 then
hearts = 550
order = "last"
storage = 6
cash = 30
task = 30

end

if isInArray({"task", "tasks", "quest", "burning heart"}, msg:lower()) and talkState[talkUser] ~= 2 then
selfSay("You are on the " .. order .. " quest stage. Bring me " .. hearts .. " burning hearts, " .. cash .."0000 gold coins, and " .. task .." premium points. Do you have it?")
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes')) and talkState[talkUser] == 1 then
selfSay("Thanks for playing, you are now able to do the next stage.")
if getPlayerItemCount(cid, 2353) >= hearts then
if doPlayerRemoveItem(cid, 2353, hearts) then
doPlayerAddItem(cid, 2160, cash)
doAddPoints(cid, task)
--db.executeQuery("UPDATE `accounts` SET `task_points` = `task_points` + " .. task .. " WHERE `id` = " .. getPlayerAccountId(cid) .. ";")
setPlayerStorageValue(cid, 12000, storage)
end
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
