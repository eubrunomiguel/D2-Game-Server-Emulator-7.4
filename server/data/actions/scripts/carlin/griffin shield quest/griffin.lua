function onUse(cid, item, frompos, item2, topos)
if item.uid == 9001 then
  queststatus = getPlayerStorageValue(cid,9001)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a griffin shield.")
   doPlayerAddItem(cid,2533,1)
   setPlayerStorageValue(cid,9001,1)
  else
   doPlayerSendTextMessage(cid,22,"The dead skeleton is empty.")
  end
else
  return 0
end
return 1
end

