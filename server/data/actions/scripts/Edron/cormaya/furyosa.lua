function onUse(cid, item, frompos, item2, topos)

local gatepos = {x = 33222, y = 32042, z = 11, stackpos=1}
local telepos = {x = 33222, y = 32043, z = 11, stackpos=1}
local gopos = {x = 33240, y = 32052, z = 11, stackpos=1}

local getgate = getThingfromPos(gatepos)
local gettele = getThingfromPos(telepos)

    if item.uid == 9999 and item.itemid == 1945 and getgate.itemid == 1355 then
        doRemoveItem(getgate.uid,1)
        doTransformItem(item.uid,item.itemid+1)
        doCreateTeleport(1387, gopos, telepos)
    elseif item.uid == 9999 and item.itemid == 1946 and getgate.itemid == 0 then
        doCreateItem(1355,1,gatepos)
        doTransformItem(item.uid,item.itemid-1)
        doRemoveItem(gettele.uid,1)
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    
return TRUE
end