-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 9022 then
  queststatus = getPlayerStorageValue(cid,9022)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a stealth ring.")
   item_uid = doPlayerAddItem(cid,2165,1)
   setPlayerStorageValue(cid,9022,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

