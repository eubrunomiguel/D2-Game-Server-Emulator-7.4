local config = {
   ["femor hills"] = {cost = 60, location = {x = 32535, y = 31837, z = 4}},
   ["edron"] = {cost = 60, location =  {x=33193, y=31783, z=3} }
}

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
     if msgcontains(msg, "bring me to") then
         for mes, t in pairs(config) do
             if msgcontains(msg, mes) then
                 if doPlayerRemoveMoney(cid, t.cost) then
                     npcHandler:say("You paid ".. t.cost .." gold coins to travel to " .. msg .. ".", cid)
                     doTeleportThing(cid, t.location)
                 else
                     npcHandler:say("You do not have enough money, it costs ".. t.cost .." gold coins to travel.", cid)
                 end
             end
         end
     elseif tm then
         if getPlayerMoney(cid) >= tm.cost then
             npcHandler:say("Do you want to go to ".. msg .." for ".. tm.cost .." gold coins?", cid)
             talkState[talkUser] = 1
             xmsg[cid] = msg
         else
                     npcHandler:say("You do not have enough money, it costs ".. tm.cost .." gold coins to travel to " .. msg ..".", cid)
         end
     elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         local tm = config[xmsg[cid]:lower()]
         if doPlayerRemoveMoney(cid, tm.cost) == true then
                     npcHandler:say("You paid ".. tm.cost .." gold coins to travel to " .. msg .. ".", cid)
             doTeleportThing(cid, tm.location)
         else
                     npcHandler:say("You do not have enough money, it costs ".. tm.cost .." gold coins to travel to " .. msg ..".", cid)
         end
         talkState[talkUser] = 0
     elseif msgcontains(msg, "no") and talkState[talkUser] > 0 then
         npcHandler:say("Ok.", cid)
         talkState[talkUser] = 0
     end
     return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())