function onStepIn(cid, item, pos)
local nie = {x = 33256, y = 32064, z = 11}
    if item.uid == 5100 then
        if getPlayerStorageValue(cid,5100) == -1 then
            setPlayerStorageValue(cid,5100,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Demons큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),20)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Demon큦 spirit.')
			local wal2 = {x = 33239, y = 32052, z = 11}
			doTeleportThing(cid, wal2)
			doSendMagicEffect(wal2,17)
        end
        elseif item.uid == 5101 then
        if getPlayerStorageValue(cid,5101) == -1 then
            setPlayerStorageValue(cid,5101,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Torture큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),4)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Torture큦 spirit.')
			local wal4 = {x = 33261, y = 32052, z = 11}
			doTeleportThing(cid, wal4)
			doSendMagicEffect(wal4,17)
        end
    elseif item.uid == 5102 then
        if getPlayerStorageValue(cid,5102) == -1 then
            setPlayerStorageValue(cid,5102,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Fury큦 throne and absorbed some of his spirit.')
			doSendMagicEffect(getCreaturePosition(cid),7)
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Fury큦 spirit.')
			local wal = {x = 33238, y = 32073, z = 11}
			doTeleportThing(cid, wal)
			doSendMagicEffect(wal,17)
        end
    elseif item.uid == 5103 then
        if getPlayerStorageValue(cid,5100) == -1 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb Demon큦 energy!')
			doTeleportThing(cid, nie)
		end
		 elseif item.uid == 5104 then
        if getPlayerStorageValue(cid,5101) == -1 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb Torture큦 energy!')
			doTeleportThing(cid, nie)

			end
			 elseif item.uid == 5105 then
        if getPlayerStorageValue(cid,5102) == -1 then
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb Fury큦 energy!')
			doTeleportThing(cid, nie)

			end
        end
    end
    return 1
