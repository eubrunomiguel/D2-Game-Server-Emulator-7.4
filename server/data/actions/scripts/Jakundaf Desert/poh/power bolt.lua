-- Fire axe Dragon Cave Quest --

function onUse(cid, item, frompos, item2, topos)
if item.uid == 10109 then
  queststatus = getPlayerStorageValue(cid,10109)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a bag.")
   container = doPlayerAddItem(cid, 1987, 1)
   doAddContainerItem(container,2377,1)
   doAddContainerItem(container,2547,5)
   doAddContainerItem(container,2546,12)
   doAddContainerItem(container,2217,1)
   setPlayerStorageValue(cid,10109,1)
  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

