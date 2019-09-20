-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 4509 then
  queststatus = getPlayerStorageValue(cid,4509)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found dwarven ring.")
   item_uid = doPlayerAddItem(cid,2213,1)
   setPlayerStorageValue(cid,4509,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

