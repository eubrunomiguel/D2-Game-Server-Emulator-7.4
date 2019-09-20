-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)

local gatepos = {x=32095, y=32173, z=8, stackpos=1}
local telepos = {x=32095, y=32173, z=8, stackpos=1}

local getgate = getThingfromPos(gatepos)
local gettele = getThingfromPos(telepos)

    if item.uid == 3036 and item.itemid == 1945 and getgate.itemid == 1026 then
        doRemoveItem(getgate.uid,1)
        doTransformItem(item.uid,item.itemid+1)
    elseif item.uid == 3036 and item.itemid == 1946 and getgate.itemid == 0 then
        doCreateItem(1026,1,gatepos)
        doTransformItem(item.uid,item.itemid-1)
        else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    
return TRUE
end

