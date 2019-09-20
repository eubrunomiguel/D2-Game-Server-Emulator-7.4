function onUse(cid, item, frompos, item2, topos)
if item.uid == 3014 then
  queststatus = getPlayerStorageValue(cid,3014)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   container = doPlayerAddItem(cid, 1987, 1)
   doAddContainerItem(container,2111,4)
   doAddContainerItem(container,1294,5)
   setPlayerStorageValue(cid,3014,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

