function onUse(cid, item, frompos, item2, topos)
if item.uid == 8011 then
  queststatus = getPlayerStorageValue(cid,8011)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Phoenix Egg.")
   item_uid = doPlayerAddItem(cid,2328,1)
   setPlayerStorageValue(cid,8011,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

