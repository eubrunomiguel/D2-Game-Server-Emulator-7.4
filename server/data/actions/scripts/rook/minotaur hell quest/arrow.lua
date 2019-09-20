function onUse(cid, item, frompos, item2, topos)
if item.uid == 3022 then
  queststatus = getPlayerStorageValue(cid,3022)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a fishing rod.")
    container = doPlayerAddItem(cid,1987,1)
	doAddContainerItem(container,2545,1)
	doAddContainerItem(container,2544,1)
   setPlayerStorageValue(cid,3022,1)

  else
   doPlayerSendTextMessage(cid,22,"It\'s empty.")
  end
else
  return 0
end
return 1
end

