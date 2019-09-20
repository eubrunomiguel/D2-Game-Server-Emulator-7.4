function onUse(cid, item, frompos, item2, topos)
if item.uid == 3002 then
  queststatus = getPlayerStorageValue(cid,3002)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a 12 arrows and 40 gold coins.")
   item_uid = doPlayerAddItem(cid,2544,12)
   item_uid = doPlayerAddItem(cid,2148,40)
   setPlayerStorageValue(cid,3002,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

