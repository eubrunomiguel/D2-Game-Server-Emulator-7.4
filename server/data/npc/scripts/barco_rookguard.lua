local config = {
   ["carlin"] = {cost = 110, location = {x = 32388, y = 31821, z = 6}},
   ["thais"] = {cost = 110, location = {x=32310, y=32210, z=6} },
   ["venore"] = {cost = 170, location = {x=32954, y=32022, z=6}  },
   ["edron"] = {cost = 110, location = {x=33176, y=31764, z=6} },
   ["port hope"] = {cost = 160, location = {x=32530, y=32784, z=6}  },
   ["darashia"] = {cost = 10, location = {x=33290, y=32481, z=6}  },
   ["ankrahmun"] = {cost = 150, location = {x=33092, y=32884, z=6}  },
   ["ab\'dendriel"] = {cost = 130, location = {x = 32734, y = 31669, z = 6}},
   ["CARLIN"] = {cost = 110, location = {x = 32388, y = 31821, z = 6}},
   ["THAIS"] = {cost = 110, location = {x=32310, y=32210, z=6} },
   ["VENORE"] = {cost = 170, location = {x=32954, y=32022, z=6}  },
   ["EDRON"] = {cost = 110, location = {x=33176, y=31764, z=6} },
   ["PORT HOPE"] = {cost = 160, location = {x=32530, y=32784, z=6}  },
   ["DARASHIA"] = {cost = 10, location = {x=33290, y=32481, z=6}  },
   ["ANKRAHMUN"] = {cost = 150, location = {x=33092, y=32884, z=6}  },
                                   --["YALAHAR"] = {cost = 150, location = {x=32348, y=31170, z=6}  },
                               -- ["yalahar"] = {cost = 150, location = {x=32348, y=31170, z=6}  },
   ["AB\'DENDRIEL"] = {cost = 130, location = {x = 32734, y = 31669, z = 6}}
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
     if msgcontains(msg, "bring me to")  then
		if isPzLocked(cid) then 
		npcHandler:say("I cannot attend you right now " .. getCreatureName(cid) .. ".", cid)
		return
		end
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