

function onUse(cid, item, fromPosition, itemEx, toPosition)
local room = {     -- room with demons

        fromX = 33297,
        fromY = 32031,
        fromZ = 8,
        --------------
        toX = 33309,
        toY = 32043,
        toZ = 8
        }

        local monster_pos = {
        [1] = {pos = {33302, 32033, 8}, monster = "Juggernaut"},
        [2] = {pos = {33304, 32033, 8}, monster = "Juggernaut"},
        [3] = {pos = {33303, 32032, 8}, monster = "Demon"},
        [4] = {pos = {33303, 32031, 8}, monster = "Demon"},
		
		[5] = {pos = {33304, 32041, 8}, monster = "Juggernaut"},
        [6] = {pos = {33302, 32041, 8}, monster = "Juggernaut"},
        [7] = {pos = {33303, 32042, 8}, monster = "Demon"},
        [8] = {pos = {33303, 32043, 8}, monster = "Demon"}		
        }

        local players_pos = {
        {x = 33298, y = 32055, z = 8, stackpos = 253}, -- kina
        {x = 33307, y = 32055, z = 8, stackpos = 253}, -- kina
        {x = 33303, y = 32054, z = 8, stackpos = 253}, -- pally
        {x = 33303, y = 32056, z = 8, stackpos = 253}, -- pally
		{x = 33309, y = 32052, z = 8, stackpos = 253}, -- mage
        {x = 33309, y = 32058, z = 8, stackpos = 253}, -- mage
        {x = 33310, y = 32051, z = 8, stackpos = 253}, -- mage
        {x = 33310, y = 32059, z = 8, stackpos = 253}  -- mage
        }

		local new_player_pos = {
        {x = 33303, y = 32034, z = 8}, -- kina
        {x = 33303, y = 32035, z = 8}, -- palla
        {x = 33302, y = 32036, z = 8}, -- druid
        {x = 33304, y = 32036, z = 8},  -- sorc		
		{x = 33303, y = 32040, z = 8}, -- kina
        {x = 33303, y = 32039, z = 8}, -- palla
        {x = 33302, y = 32038, z = 8}, -- druid
        {x = 33304, y = 32038, z = 8}  -- sorc
        }

        local playersOnly = "yes"
        local questLevel = 150
	local all_ready, monsters, player, level = 0, 0, {}, 0
	
	-- heart
	local heartErrorMessage = "Burning Hearts are not in place"
	local heartsOnPlace = false
    local heart = 2353
	
	item1 = {x = 33297, y = 32055, z = 8, stackpos=1}
	item2 = {x = 33303, y = 32053, z = 8, stackpos=1}
	item3 = {x = 33303, y = 32057, z = 8, stackpos=1}
	item4 = {x = 33305, y = 32053, z = 8, stackpos=1}
	item5 = {x = 33305, y = 32057, z = 8, stackpos=1}
	item6 = {x = 33308, y = 32048, z = 8, stackpos=1}
	item7 = {x = 33308, y = 32062, z = 8, stackpos=1}
	item8 = {x = 33309, y = 32053, z = 8, stackpos=1}
	item9 = {x = 33309, y = 32057, z = 8, stackpos=1}
	item10 = {x = 33311, y = 32051, z = 8, stackpos=1}
	item11 = {x = 33311, y = 32059, z = 8, stackpos=1}
	
	-- getting hearts
if getTileItemById(item1, heart).uid > 0 then
	if getTileItemById(item2, heart).uid > 0 then
		if getTileItemById(item3, heart).uid > 0 then
			if getTileItemById(item4, heart).uid > 0 then
				if getTileItemById(item5, heart).uid > 0 then
					if getTileItemById(item6, heart).uid > 0 then
						if getTileItemById(item7, heart).uid > 0 then
							if getTileItemById(item8, heart).uid > 0 then
								if getTileItemById(item9, heart).uid > 0 then
									if getTileItemById(item10, heart).uid > 0 then
										if getTileItemById(item11, heart).uid > 0 then
											heartsOnPlace = true
										else
											doPlayerSendTextMessage(cid, 22, heartErrorMessage)
										end 
									else
										doPlayerSendTextMessage(cid, 22, heartErrorMessage)
									end 
								else
									doPlayerSendTextMessage(cid, 22, heartErrorMessage)
								end 
							else
								doPlayerSendTextMessage(cid, 22, heartErrorMessage)
							end 
						else
							doPlayerSendTextMessage(cid, 22, heartErrorMessage)
						end 
					else
						doPlayerSendTextMessage(cid, 22, heartErrorMessage)
					end 
				else
					doPlayerSendTextMessage(cid, 22, heartErrorMessage)
				end 
			else
				doPlayerSendTextMessage(cid, 22, heartErrorMessage)
			end 
		else
			doPlayerSendTextMessage(cid, 22, heartErrorMessage)
		end 
	else
		doPlayerSendTextMessage(cid, 22, heartErrorMessage)
	end 
else
	doPlayerSendTextMessage(cid, 22, heartErrorMessage)
end
	if heartsOnPlace then
	if item.uid == 20163 then
        if item.itemid == 1945 then
                for i = 1, #players_pos do
                        table.insert(player, 0)
                end
                for i = 1, #players_pos do
                        player[i] = getThingfromPos(players_pos[i])
                        if player[i].itemid > 0 then
                                if string.lower(playersOnly) == "yes" then
                                        if isPlayer(player[i].uid) == TRUE then
                                                all_ready = all_ready+1
                                        else
                                                monsters = monsters+1
                                        end
                                else
                                        all_ready = all_ready+1
                                end
                        end
                end
                if all_ready == #players_pos then
                        for i = 1, #players_pos do
                                player[i] = getThingfromPos(players_pos[i])
                                if isPlayer(player[i].uid) == TRUE then
                                        if getPlayerLevel(player[i].uid) >= questLevel then
                                                level = level+1
                                        end
                                else
                                        level = level+1
                                end
                        end
                        if level == #players_pos then
                                if string.lower(playersOnly) == "yes" and monsters == 0 or string.lower(playersOnly) == "no" then
                                        for _, area in pairs(monster_pos) do
                                                        doSummonCreature(area.monster,{x=area.pos[1],y=area.pos[2],z=area.pos[3]})
                                        end
                                        for i = 1, #players_pos do
                                                doSendMagicEffect(players_pos[i], CONST_ME_POFF)
                                                doTeleportThing(player[i].uid, new_player_pos[i])
                                                doSendMagicEffect(new_player_pos[i], CONST_ME_ENERGYAREA)
                                                doTransformItem(item.uid,1946)
                                        end
											doRemoveItem(getTileItemById(item1, heart).uid,1)
											doRemoveItem(getTileItemById(item2, heart).uid,1)
											doRemoveItem(getTileItemById(item3, heart).uid,1)
											doRemoveItem(getTileItemById(item4, heart).uid,1)
											doRemoveItem(getTileItemById(item5, heart).uid,1)
											doRemoveItem(getTileItemById(item6, heart).uid,1)
											doRemoveItem(getTileItemById(item7, heart).uid,1)
											doRemoveItem(getTileItemById(item8, heart).uid,1)
											doRemoveItem(getTileItemById(item9, heart).uid,1)
											doRemoveItem(getTileItemById(item10, heart).uid,1)
											doRemoveItem(getTileItemById(item11, heart).uid,1)
                                else
                                        doPlayerSendTextMessage(cid,19,"Only players can do this quest.")
                                end
                        else
                                doPlayerSendTextMessage(cid,19,"All Players have to be level "..questLevel.." to do this quest.")
                        end
                else
                        doPlayerSendCancel(cid,"You need "..table.getn(players_pos).." players to do this quest.")
                end
        elseif item.itemid == 1946 then
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
                        doPlayerSendTextMessage(cid,19,"There is already a team in the quest room.")          
                elseif player_room == 0 then
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
                        doTransformItem(item.uid,1945)
                end
        end
	end	
	
	else
	doPlayerSendTextMessage(cid, 22, heartErrorMessage)
	end
	
	return TRUE
end