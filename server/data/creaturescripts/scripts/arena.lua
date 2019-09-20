local config = {
   ["frozendo"] = {time = 60, toPos = {x = 32143, y = 32229, z = 7}, tpPos = {x = 32148, y = 32229, z = 7}, next = "guardian dwarf", where = {x = 32138, y = 32229, z = 7}},
   ["guardian dwarf"] = {time = 60, toPos = {x = 32127, y = 32229, z = 7}, tpPos = {x = 32132, y = 32229, z = 7}, next = "beclops", where = {x = 32121, y = 32229, z = 7}},
   ["beclops"] = {time = 60, toPos = {x = 32111, y = 32229, z = 7}, tpPos = {x = 32116, y = 32229, z = 7}, next = "matrix", where = {x = 32106, y = 32229, z = 7}},
   ["matrix"] = {time = 60, toPos = {x = 32151, y = 32212, z = 7}, tpPos = {x = 32100, y = 32229, z = 7}, next = "hym", where = {x = 32143, y = 32212, z = 7}},
   ["hym"] = {time = 60, toPos = {x = 32134, y = 32212, z = 7}, tpPos = {x = 32140, y = 32212, z = 7}, next = "devil of fire", where = {x = 32132, y = 32214, z = 7}},
   ["devil of fire"] = {time = 60, toPos = {x = 32118, y = 32212, z = 7}, tpPos = {x = 32125, y = 32212, z = 7}, next = "bonelord", where = {x = 32109, y = 32211, z = 7}},
   ["bonelord"] = {time = 60, toPos = {x = 32143, y = 32196, z = 7}, tpPos = {x = 32109, y = 32212, z = 7}, next = "dragona", where = {x = 32134, y = 32196, z = 7}},
   ["dragona"] = {time = 60, toPos = {x = 32127, y = 32199, z = 7}, tpPos = {x = 32133, y = 32196, z = 7}, next = "harry", where = {x = 32120, y = 32193, z = 7}},
   ["harry"] = {time = 60, toPos = {x = 32134, y = 32180, z = 7}, tpPos = {x = 32119, y = 32199, z = 7}, next = "lucifer", where = {x = 32125, y = 32181, z = 7}},
   ["lucifer"] = {time = 60, toPos = {x = 32104, y = 32197, z = 7}, tpPos = {x = 32125, y = 32180, z = 7}, next = "rat", where = {x = 32126, y = 32180, z = 7}}
}
local function deleteTeleport(tp)
   local teleport = getTileItemById(tp, 1387).uid
   if(teleport > 0) then
     doRemoveItem(teleport)
     doSendMagicEffect(tp, CONST_ME_POFF)
   end
   return true
end

function onKill(cid, target)
  local monster = config[getCreatureName(target):lower()]

  if(isPlayer(target) or not monster) then
    return true
  end

  if getTileItemById(monster.tpPos,1387).uid > 0  then
    doCreatureSay(cid, "Teleport is already open, hurry up!", TALKTYPE_ORANGE_1)
  else
    doCreateTeleport(1387, monster.toPos, monster.tpPos)
    doCreatureSay(cid, "You have "..monster.time.." seconds to enter the teleport!", TALKTYPE_ORANGE_1)
    addEvent(deleteTeleport, monster.time * 1000, monster.tpPos)
    if monster.next ~= "rat" then
      doSummonCreature(monster.next, monster.where)
    end
  end 
  return true
end

