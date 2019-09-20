function onUse(cid, item, frompos, item2, topos)
if item.uid == 3005 then
  queststatus = getPlayerStorageValue(cid,3005)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found 2 salmon's.")
   item_uid = doPlayerAddItem(cid,2668,2)
   setPlayerStorageValue(cid,3005,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

