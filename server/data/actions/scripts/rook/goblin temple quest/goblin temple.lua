function onUse(cid, item, frompos, item2, topos)
if item.uid == 3015 then
  queststatus = getPlayerStorageValue(cid,3015)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   container = doPlayerAddItem(cid, 1987, 1)
   doAddContainerItem(container,2642,1)
   doAddContainerItem(container,2563,1)
   doAddContainerItem(container,2148,50)
   setPlayerStorageValue(cid,3015,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

