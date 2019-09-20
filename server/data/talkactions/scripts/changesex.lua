local config = {
costMoney = 50000 
}

function onSay(cid, words, param, channel)
if(getPlayerSex(cid) >= 2) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot change your gender.")
return TRUE
end

if(getPlayerMoney(cid) < config.costMoney) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sorry, not enough money - changing gender costs " .. config.costMoney .. ".")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
return TRUE
end

if(getPlayerMoney(cid) >= config.costMoney) then
doPlayerRemoveMoney(cid, config.costMoney)
end

if(getPlayerSex(cid) == 1) then
doPlayerSetSex(cid, 0)
else
doPlayerSetSex(cid, 1)
end

doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have changed your gender and paid " .. config.costMoney .. " money.")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
return TRUE
end
