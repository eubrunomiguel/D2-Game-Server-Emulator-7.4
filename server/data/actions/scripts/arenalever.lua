local arenas = {
[7666] = {
fromPos ={
{x = 32399, y = 32203, z = 7}, --player 1 start pos
{x = 32400, y = 32203, z = 7},
{x = 32401, y = 32203, z = 7},
{x = 32401, y = 32204, z = 7},
{x = 32401, y = 32205, z = 7},
{x = 32400, y = 32205, z = 7},
{x = 32399, y = 32205, z = 7},
{x = 32399, y = 32204, z = 7} --player 2 start pos
--you can add how much you want, there are no limits
},
toPos = {
{x = 32190, y = 32225, z = 7}, --player 1 teleport position
{x = 32191, y = 32225, z = 7} --player 2 teleport position
--you can add how much you want, there are no limits
}
}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
if(item.itemid == 1946) then
doTransformItem(item.uid, 1945)
return TRUE
end

local arena = arenas[item.uid]
if(not arena) then
return FALSE
end

local players = {}
for _, pos in pairs(arena.fromPos) do
pos.stackpos = STACKPOS_TOP_CREATURE
local tmp = getThingfromPos(pos).uid
if(tmp > 0 and isCreature(tmp) == TRUE) then
table.insert(players, tmp)
end
end

if(table.maxn(players) < table.maxn(arena.fromPos)) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need 8 players for duel.")
return TRUE
end

for i, pid in pairs(players) do
doSendMagicEffect({x = 32399, y = 32203, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32400, y = 32203, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32401, y = 32203, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32401, y = 32204, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32401, y = 32205, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32400, y = 32205, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32399, y = 32205, z = 7}, CONST_ME_POFF)
doSendMagicEffect({x = 32399, y = 32204, z = 7}, CONST_ME_POFF)
doTeleportThing(players[1], {x = 32389, y = 32200, z = 7})
doTeleportThing(players[2], {x = 32389, y = 32198, z = 7})
doTeleportThing(players[3], {x = 32393, y = 32200, z = 7})
doTeleportThing(players[4], {x = 32393, y = 32198, z = 7})
doTeleportThing(players[5], {x = 32397, y = 32200, z = 7})
doTeleportThing(players[6], {x = 32397, y = 32198, z = 7})
doTeleportThing(players[7], {x = 32401, y = 32198, z = 7})
doTeleportThing(players[8], {x = 32401, y = 32200, z = 7})
doSendMagicEffect({x = 32389, y = 32200, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32389, y = 32198, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32393, y = 32200, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32393, y = 32198, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32397, y = 32200, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32397, y = 32198, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32401, y = 32198, z = 7}, CONST_ME_TELEPORT)
doSendMagicEffect({x = 32401, y = 32200, z = 7}, CONST_ME_TELEPORT)
doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "FIGHT!")
end
return TRUE
end