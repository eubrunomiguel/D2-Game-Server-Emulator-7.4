local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
		[1001] = {pos={x = 33195, y = 31503, z = 13, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[1002] = {pos={x = 33493, y = 31398, z = 15, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[1003] = {pos={x = 33278, y = 31504, z = 12, stackpos=1}, value=3, text="Entering The Vats"},
		[1004] = {pos={x = 33167, y = 31462, z = 15, stackpos=1}, value=4, text="Entering The Arcanum"},
		[1005] = {pos={x = 33325, y = 31408, z = 12, stackpos=1}, value=5, text="Entering The Hive"},
		[1006] = {pos={x = 33236, y = 31403, z = 12, stackpos=1}, value=6, text="Entering The Shadow Nexus"}
		},
	mainroom={---aid, position, lowest value that can use this portal, text
		[2001] = {pos={x = 33195, y = 31503, z = 13, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[2002] = {pos={x = 33493, y = 31398, z = 15, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[2003] = {pos={x = 33278, y = 31504, z = 12, stackpos=1}, value=3, text="Entering The Vats"},
		[2004] = {pos={x = 33167, y = 31462, z = 15, stackpos=1}, value=4, text="Entering The Arcanum"},
		[2005] = {pos={x = 33325, y = 31408, z = 12, stackpos=1}, value=5, text="Entering The Hive"}	},
	portals={---aid, position, text
		[3000] = {pos={x = 33289, y = 31429, z = 14}, text="Escaping back to the Retreat!"},
		[3001] = {pos={x = 33226, y = 31417, z = 11}, text="Entering The Ward of Ushuriel"},
		[3002] = {pos={x = 33295, y = 31476, z = 13}, text="Entering The Undersea Kingdom"},
		[3003] = {pos={x = 33192, y = 31414, z = 11}, text="Entering The Ward of Zugurosh"},
		[3004] = {pos={x = 33477, y = 31374, z = 12}, text="Entering The Foundry"},
		[3005] = {pos={x = 33170, y = 31450, z = 11}, text="Entering The Ward of Madareth"},
		[3006] = {pos={x = 33352, y = 31372, z = 13}, text="Entering The Battlefield"},
		[3007] = {pos={x = 33199, y = 31447, z = 11}, text="Entering The Ward of The Demon Twins"},
		[3008] = {pos={x = 33220, y = 31295, z = 11}, text="Entering The Soul Wells"},
		[3009] = {pos={x = 33260, y = 31445, z = 11}, text="Entering The Ward of Annihilon"},
		[3010] = {pos={x = 33230, y = 31455, z = 11}, text="Entering The Ward of Hellgorak"},
		[3011] = {pos={x = 32319, y = 32247, z = 9}, text="Entering The Reward Room"}		},
	storage=56123,---storage used in boss and mainroom portals
	e={}	}----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if item.itemid ~= 1387 then
		return false
		end
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if getPlayerStorageValue(cid, config.storage)< t.value then
				setPlayerStorageValue(cid, config.storage, t.value)
			end
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, fromPosition)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
		end
	end
end
