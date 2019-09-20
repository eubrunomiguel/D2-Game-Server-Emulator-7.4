-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)
if item.uid == 10106 then
  queststatus = getPlayerStorageValue(cid,10106)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Giant smithhammer.")
   doPlayerAddItem(cid, 2321, 1)
   setPlayerStorageValue(cid,10106,1)

  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

