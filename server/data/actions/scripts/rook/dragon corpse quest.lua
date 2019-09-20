function onUse(cid, item, frompos, item2, topos)
if item.uid == 3025 then
  queststatus = getPlayerStorageValue(cid,3025)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   container = doPlayerAddItem(cid, 1987, 1)
   doAddContainerItem(container,2530,1)
   doAddContainerItem(container,2480,1)
   setPlayerStorageValue(cid,3025,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

