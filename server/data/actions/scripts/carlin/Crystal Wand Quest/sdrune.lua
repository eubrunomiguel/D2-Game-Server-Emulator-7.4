function onUse(cid, item, frompos, item2, topos)
if item.uid == 9004 then
  queststatus = getPlayerStorageValue(cid,9004)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a sudden death rune.")
   doPlayerAddItem(cid,2268,6)
   setPlayerStorageValue(cid,9004,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

