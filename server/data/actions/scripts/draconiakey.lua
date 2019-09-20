function onUse(cid, item, frompos, item2, topos) 
if item.actionid == item2.actionid then 
if item2.itemid == 1219 then 
doTransformItem(item2.actionid,item2.itemid+1) 
elseif item2.itemid == 1220 then 
doTransformItem(item2.actionid,item2.itemid-1) 

end 
else 
return 0 
end 
return 1 
end
