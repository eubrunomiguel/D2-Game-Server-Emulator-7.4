function onSay(cid, words, param, channel) 
local t = string.explode(param, ",")
local gm = getCreatureName(cid)
for _, cid in ipairs(getPlayersOnlineList()) do
local accId = getPlayersByAccountNumber(cid)
if(1 == 1) then
doPlayerAddItem(cid, 2173, 1)
--doPlayerAddItem(cid, 2160, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You received an Amulet of Loss. Enjoy D2!")
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS) 
end
end
return TRUE
end
