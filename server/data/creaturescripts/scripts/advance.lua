local function giveWandRod(cid, skill, oldLevel, newlevel)
	local items = {
	{13,2191,2186,-1},
	{19,2188,2185,0},
	{26,2189,2181,2},
	{33,2187,2183,3},
	{99999999999}
	}
	local stuff = {2190,2182,2191,2188,2189,2187,2186,2185,2181,2183}
	local place = 0
	local st = 23636
	local blala = newLevel
	if isInArray({1,2,5,6},getPlayerVocation(cid)) then
		if skill == 8 then
			for x = 1, #items do
				if newlevel >= items[x][1] and newlevel < items[x+1][1] then
					place = x
				end
			end
			if place > 0 then
				if getPlayerStorageValue(cid,st) <= items[place][4] then
					local byvoc = getPlayerVocation(cid)
					if getPlayerVocation(cid) > 4 then
						byvoc = getPlayerVocation(cid)-4
					end
					if isInArray(stuff,getPlayerSlotItem(cid,5).itemid) then
						doRemoveItem(getPlayerSlotItem(cid,5).uid)
					elseif isInArray(stuff,getPlayerSlotItem(cid,6).itemid) then
						doRemoveItem(getPlayerSlotItem(cid,6).uid)
					end
					doPlayerAddItem(cid,items[place][byvoc+1],1)
					doPlayerSendTextMessage(cid,4,"You have received ".. getArticle(items[place][byvoc+1]) .." "..getItemNameById(items[place][byvoc+1])..".")
					setPlayerStorageValue(cid,st,items[place][4]+1)
				end
			end
		end
	end
end

local function fullMPHP(cid)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
	doPlayerAddMana(cid, getPlayerMaxMana(cid)) 
end

function onAdvance(cid, skill, oldLevel, newLevel)
	if skill == LEVEL_EXPERIENCE then
		-- recover mana
		fullMPHP(cid) 
		-- check stage
		checkStageChange(cid)
		-- update rod
		giveWandRod(cid, skill, oldLevel, newLevel)
	end
	return true
end
