local toArena = {cost = 110, location = {x = 32388, y = 31821, z = 6}}


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local talkState, xmsg = {}, {}

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid)  end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid)  end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()  npcHandler:onThink()  end

function creatureSayCallback(cid, type, msg)

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

    local tm = config[msg:lower()]

    if msgcontains(msg, "pass") then
        if isPzLocked(cid) then 
            npcHandler:say("I cannot attend you right now " .. getCreatureName(cid) .. ".", cid)
            return
        end

        if doPlayerRemoveMoney(cid, toArena.cost) then
            npcHandler:say("Good luck.", cid)
            doTeleportThing(cid, toArena.location)
        else
            npcHandler:say("You do not have enough money, it costs ".. toArena.cost .." gold coins to pass.", cid)
        end
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())