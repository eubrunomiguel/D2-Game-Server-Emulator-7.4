-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10000 then
  queststatus = getPlayerStorageValue(cid,10000)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a barbarian axe and Scimitar.")
   doPlayerAddItem(cid, 2429, 1)
   doPlayerAddItem(cid, 2419, 1)
   setPlayerStorageValue(cid,10000,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

