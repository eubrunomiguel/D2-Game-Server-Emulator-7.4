-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 9023 then
  queststatus = getPlayerStorageValue(cid,9023)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 100 platinum coins.")
   item_uid = doPlayerAddItem(cid,2152,100)
   setPlayerStorageValue(cid,9023,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

