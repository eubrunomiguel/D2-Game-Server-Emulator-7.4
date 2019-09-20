function onUse(cid, item, frompos, item2, topos)
if item.uid == 3301 then
  queststatus = getPlayerStorageValue(cid,3301)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You have found a copper key 3301.")
   item_uid = doPlayerAddItem(cid,2089,1)
   doSetItemActionId(item_uid,3301)
   setPlayerStorageValue(cid,3301,1)
  else
   doPlayerSendTextMessage(cid,22,"The dead tree is empty.")
  end
else
  return 0
end
return 1
end

