function onUse(cid, item, frompos, item2, topos)
if item.uid == 3023 then
  queststatus = getPlayerStorageValue(cid,3023)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found black book.")
   item_uid = doPlayerAddItem(cid,1955,1)
   doSetItemText(item_uid, "Hardek *Bozo * Sam **** Oswald Partos *** Quentin * Tark *** Harsky *** Stutch * Ferumbras * Frodo ** Noodles ****")
   setPlayerStorageValue(cid,3023,1)
  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

