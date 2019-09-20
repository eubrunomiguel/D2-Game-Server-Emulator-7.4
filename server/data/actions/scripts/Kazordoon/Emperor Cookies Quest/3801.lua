function onUse(cid, item, frompos, item2, topos)
if item.uid == 8019 then
  queststatus = getPlayerStorageValue(cid,8019)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid,22,"You have found key 3801.")
   item_uid = doPlayerAddItem(cid,2089,1)
   doSetItemActionId(item_uid,3801)
   setPlayerStorageValue(cid,8019,1)
  else
   doPlayerSendTextMessage(cid,22,"The chest is empty.")
  end
else
  return 0
end
return 1
end

