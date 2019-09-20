 -- Script by Colandus!
-- Free to edit!
 
function onUse(cid, item, frompos, item2, topos)
	-- Item ID and Uniqueid --
	switchUniqueID = 10102
	switchID = 1945
	switch2ID = 1946
	swordID	= 2376
	crossbowID = 2455
	appleID	= 2674
	spellbookID	= 2175
	requiredItem = 0
	
	-- Level to do the quest --
	questlevel = 20
 
	piecePos = {x=32673, y=32087, z=8, stackpos=1} -- Where the piece will be placed
	getpiece = getThingfromPos(piecePos)

	playerPos = {x=32673, y=32088, z=8, stackpos=253} -- Where player1 will stand before pressing lever
	player = getThingfromPos(playerPos)
 	if player.itemid == 0 then 			doPlayerSendCancel(cid,"Sorry, you need to be in the correct position.") return end
	
	playerVoc = getPlayerVocation(player.uid)   -- The vocation of player
 
	nplayerPos = {x=32672, y=32070, z=8} -- The new position of player
 
	playerLevel = getPlayerLevel(player.uid) -- Checking the level of player
 
	if playerVoc == 4 or playerVoc == 8 then requiredItem = swordID
		elseif playerVoc == 3 or playerVoc == 7 then requiredItem = crossbowID
			elseif playerVoc == 2 or playerVoc == 6 then requiredItem = appleID
				elseif playerVoc == 1 or playerVoc == 5 then requiredItem = spellbookID end
	 
	-- Check if all players are standing on the correct positions
	if player.itemid > 0 then
		if playerLevel >= questlevel then
			if item.uid == switchUniqueID and item.itemid == switchID and getpiece.itemid == requiredItem then
				doSendMagicEffect(playerPos,2)
				doTeleportThing(player.uid, nplayerPos)
				doSendMagicEffect(nplayerPos,10)
				doRemoveItem(getpiece.uid,1)
				doTransformItem(item.uid,item.itemid+1)
			elseif item.uid == switchUniqueID and item.itemid == switch2ID then
				doTransformItem(item.uid,item.itemid-1)
			else
				doPlayerSendCancel(cid,"Sorry, you need to put a " .. getItemName(requiredItem) .. ".")
			end
			else
			doPlayerSendCancel(cid,"Sorry, you need to be at level level " .. questlevel .. "." )
			return 0
			end
	else
	doPlayerSendCancel(cid,"Sorry, you need to be in the correct position.")
	end
		
	return 1
end