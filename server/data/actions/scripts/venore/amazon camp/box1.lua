-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 4508 then
  queststatus = getPlayerStorageValue(cid,4508)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found wolf tooth chain.")
   item_uid = doPlayerAddItem(cid,2129,1)
   setPlayerStorageValue(cid,4508,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

