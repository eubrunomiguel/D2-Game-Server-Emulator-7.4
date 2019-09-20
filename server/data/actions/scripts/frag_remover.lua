function onUse(cid, item, frompos, item2, topos)
local skull = getPlayerSkullType(cid) 
local bad_skulls = {SKULL_RED,SKULL_BLACK}
if(isInArray(bad_skulls, skull)) then
setPlayerSkullType(cid, 0)
doRemoveItem(item.uid, 1)
db.executeQuery('UPDATE `killers`, `player_killers` SET `player_killers`.`unjustified` = 0 WHERE `player_killers`.`unjustified` = 1 AND `player_killers`.`player_id` = ' .. getPlayerGUID(cid) .. ' AND `killers`.`id` = `player_killers`.`kill_id`')
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your skull has been removed!")
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You do not have red/black skull!")
end
return true
end