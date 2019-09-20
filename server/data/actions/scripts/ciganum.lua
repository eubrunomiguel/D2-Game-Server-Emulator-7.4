function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerStorageValue(cid,7000) == -1 then
setPlayerStorageValue(cid,7000,1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You now have access to Ciganum.")
doRemoveItem(item.uid)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already have access to Ciganum.")
end
return true
end
