local config = {
	[8000] = {fromx =32261, fromy=32193, fromz=7, tox = 32273, toy = 32205, toz = 7, topos = {x = 32268, y = 32194, z = 7}, creaturepos = {x = 32268, y = 32198, z = 7}},
	[8001] = {fromx =32263, fromy=32217, fromz=7, tox = 32274, toy = 32230, toz = 7, topos = {x = 32268, y = 32219, z = 7}, creaturepos = {x = 32269, y = 32223, z = 7}},
	[8002] = {fromx =32238, fromy=32218, fromz=7, tox = 32250, toy = 32230, toz = 7, topos = {x = 32245, y = 32219, z = 7}, creaturepos = {x = 32245, y = 32223, z = 7}}
}


function onStepIn(cid, item, pos, frompos)
	local taskselect = config[item.actionid]
	local room = {     
	        fromX = taskselect.fromx,
	        fromY = taskselect.fromy,
	        fromZ = taskselect.fromz,
	        --------------
	        toX = taskselect.tox,
	        toY = taskselect.toy,
	        toZ = taskselect.toz
	        }
    local player_room = 0
    for x = room.fromX, room.toX do
        for y = room.fromY, room.toY do
            for z = room.fromZ, room.toZ do
                local pos = {x=x, y=y, z=z,stackpos = 253}
                local thing = getThingfromPos(pos)
                if thing.itemid > 0 then
                    if isPlayer(thing.uid) == TRUE then
                        player_room = player_room+1
                    end
                end
            end
        end
    end
    if player_room >= 1 then
		done = false
    elseif player_room == 0 then
		done = true
        for x = room.fromX, room.toX do
            for y = room.fromY, room.toY do
                for z = room.fromZ, room.toZ do
                    local pos = {x=x, y=y, z=z,stackpos = 253}
                    local thing = getThingfromPos(pos)
                    if thing.itemid > 0 then
                        doRemoveCreature(thing.uid)
                    end
                end
            end
        end
    end

	for i = 1, 40 do 
		if getPlayerStorageValue(cid, 81500) == i then
			taskid = i
		end
	end
	if getPlayerStorageValue(cid, 81500) == -1 then
		doPlayerSendTextMessage(cid,19,"You do not have access to any boss.")
		doTeleportThing(cid, frompos)
	elseif done == true then
		doTeleportThing(cid, taskselect.topos)
		doSummonCreature(tasks[taskid].bossName,taskselect.creaturepos)
		cleanPlayerTaskTimer(cid)
		local event = addEvent(removePlayerFromTask,1*60*1000,cid,30)
		setPlayerStorageValue(cid,ONTASKSTORAGE,event)
		doPlayerSendTextMessage(cid,19,"You have 5 minutes to finish the boss, good luck!")
	elseif done == false then
		doTeleportThing(cid, frompos)
		doPlayerSendTextMessage(cid,19,"There is someone on this boss room, please select another one or wait.")
	end
	return TRUE
end