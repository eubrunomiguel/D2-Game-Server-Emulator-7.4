function onUse(cid, item, fromPosition, itemEx, toPosition)
local charpos = getPlayerPosition(cid)
    if item.uid == 10281 and charpos.x == 346 and (charpos.y == 1419 or charpos.y == 1418) and charpos.z == 12 then
        if getPlayerStorageValue(cid,10274) == -1 or getPlayerStorageValue(cid,10275) == -1 or getPlayerStorageValue(cid,10276) == -1 or getPlayerStorageValue(cid,10277) == -1 or getPlayerStorageValue(cid,10278) == -1 or getPlayerStorageValue(cid,10279) == -1 or getPlayerStorageValue(cid,10280) == -1 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You did not absorb enough energy!')
        else
          local newPos = {x=344, y=1419, z=12}
        doTeleportThing(cid, newPos)
        doSendMagicEffect(newPos, 10)
        end
		
	    elseif item.uid == 10281 and charpos.x == 344 and (charpos.y == 1419 or charpos.y == 1420) and charpos.z == 12 then
          local newPos = {x=346, y=1419, z=12}
		 doSendMagicEffect(getPlayerPosition(cid), 2)
        doTeleportThing(cid, newPos)

        doSendMagicEffect({x=346,y=1419,z=12}, 10)
        end
    return 1
end