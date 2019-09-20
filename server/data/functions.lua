-- Backward compatibility
getConfigInfo = getConfigValue
doPlayerRemOutfit = doPlayerRemoveOutfit
doPlayerRemOutfitEx = doPlayerRemoveOutfitEx
getThingfromPos = getThingFromPos
getPlayerBalance = getPlayerAccountBalance
getPlayersByAccountNumber = getPlayerByAccountNumber

function setExperienceRate(cid, value)
	return doPlayerSetRate(cid, LEVEL_EXPERIENCE, value)
end

function setMagicRate(cid, value)
	return doPlayerSetRate(cid, LEVEL_MAGIC, value)
end

function setSkillRate(cid, skillid, value)
	return doPlayerSetRate(cid, skillid, value)
end

function doPlayerAddHealth(cid, health, filter)
	filter = filter == false and false or true
	if isPlayer(cid) == true then
		if doCreatureAddHealth(cid, health, filter) then
			return true
		end
	end

	return false
end

function getPlayerPosition(cid)
	if isPlayer(cid) == true then
		local position = getCreaturePosition(cid)
		if position ~= false then
			return position
		end
	end

	return false
end

function getPlayerHealth(cid)
	if isPlayer(cid) == true then
		local health = getCreatureHealth(cid)
		if health ~= false then
			return health
		end
	end

	return false
end

function getPlayerMaxHealth(cid)
	if isPlayer(cid) == true then
		local maxHealth = getCreatureMaxHealth(cid)
		if maxHealth ~= false then
			return maxHealth
		end
	end

	return false
end

function getPlayerName(cid)
	if isPlayer(cid) == true then
		local name = getCreatureName(cid)
		if name ~= false then
			return name
		end
	end

	return false
end

function getPlayerByName(name)
	local player = getCreatureByName(name)
	if player ~= LUA_NULL and isPlayer(player) == true then
		return player
	end

	return LUA_NULL
end

function doPlayerSay(cid, text, textType)
	if isPlayer(cid) == true then
		if doCreatureSay(cid, text, textType) then
			return true
		end
	end

	return false
end

function getPlayerLight(cid)
	if isPlayer(cid) == true then
		local light = getCreatureLight(cid)
		if light ~= false then
			return light
		end
	end

	return false
end

function getPlayerLookDir(cid)
	if isPlayer(cid) == true then
		local lookDir = getCreatureLookDir(cid)
		if lookDir ~= false then
			return lookDir
		end
	end

	return false
end

function doSetPlayerLight(cid, lightLevel, lightColor, lightTime)
	if isPlayer(cid) == true then
		if doSetCreatureLight(cid, lightLevel, lightColor, lightTime) then
			return true
		end
	end

	return false
end

function getCreaturePos(pos)
	return getCreaturePosition(pos)
end

function getPlayerPos(pos)
	return getPlayerPosition(pos)
end

-- Other functions
function isPlayer(cid)
	if (isCreature(cid) == true and cid >= PLAYER_ID_RANGE and cid < MONSTER_ID_RANGE) then
		return true
	end

	return false
end

function isMonster(cid)
	if (isCreature(cid) == true and cid >= MONSTER_ID_RANGE and cid < NPC_ID_RANGE) then
		return true
	end

	return false
end

function isNPC(cid)
	if (isCreature(cid) == true and cid >= NPC_ID_RANGE) then
		return true
	end

	return false
end

function isSorcerer(cid)
	if(isPlayer(cid) == false) then
		debugPrint("isSorcerer: Player not found.")
		return false
	end

	return (isInArray({1,5}, getPlayerVocation(cid)) == true)
end

function isDruid(cid)
	if(isPlayer(cid) == false) then
		debugPrint("isDruid: Player not found.")
		return false
	end

	return (isInArray({2,6}, getPlayerVocation(cid)) == true)
end

function isPaladin(cid)
	if(isPlayer(cid) == false) then
		debugPrint("isPaladin: Player not found.")
		return false
	end

	return (isInArray({3,7}, getPlayerVocation(cid)) == true)
end

function isKnight(cid)
	if(isPlayer(cid) == false) then
		debugPrint("isKnight: Player not found.")
		return false
	end

	return (isInArray({4,8}, getPlayerVocation(cid)) == true)
end

function getDirectionTo(pos1, pos2)
	local dir = NORTH
	if(pos1.x > pos2.x) then
		dir = WEST
		if(pos1.y > pos2.y) then
			dir = NORTHWEST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHWEST
		end
	elseif(pos1.x < pos2.x) then
		dir = EAST
		if(pos1.y > pos2.y) then
			dir = NORTHEAST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHEAST
		end
	else
		if(pos1.y > pos2.y) then
			dir = NORTH
		elseif(pos1.y < pos2.y) then
			dir = SOUTH
		end
	end
	return dir
end

function getDistanceBetween(pos1, pos2)
	local xDif = math.abs(pos1.x - pos2.x)
	local yDif = math.abs(pos1.y - pos2.y)

	local posDif = math.max(xDif, yDif)
	if (pos1.z ~= pos2.z) then
		posDif = (posDif + 9 + 6)
	end
	return posDif
end

function getPlayerLookPos(cid)
	return getPosByDir(getThingPos(cid), getPlayerLookDir(cid))
end

function getPosByDir(basePos, dir)
	local pos = basePos
	if(dir == NORTH) then
		pos.y = pos.y-1
	elseif(dir == SOUTH) then
		pos.y = pos.y + 1
	elseif(dir == WEST) then
		pos.x = pos.x-1
	elseif(dir == EAST) then
		pos.x = pos.x+1
	elseif(dir == NORTHWEST) then
		pos.y = pos.y-1
		pos.x = pos.x-1
	elseif(dir == NORTHEAST) then
		pos.y = pos.y-1
		pos.x = pos.x+1
	elseif(dir == SOUTHWEST) then
		pos.y = pos.y+1
		pos.x = pos.x-1
	elseif(dir == SOUTHEAST) then
		pos.y = pos.y+1
		pos.x = pos.x+1
	end
	return pos
end

function getPlayerMoney(cid)
	return ((getPlayerItemCount(cid, ITEM_CRYSTAL_COIN) * 10000) + (getPlayerItemCount(cid, ITEM_PLATINUM_COIN) * 100) + getPlayerItemCount(cid, ITEM_GOLD_COIN))
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name)
	return (getPlayerGUIDByName(name) ~= 0)
end

function getTibiaTime()
	local worldTime = getWorldTime()
	local hours = 0
	while (worldTime > 60) do
		hours = hours + 1
		worldTime = worldTime - 60
	end

	return tostring(hours .. ':' .. worldTime)
end

exhaustion =
{

	check = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage)
		if (os.time() >= exhaust) then
			return false
		else
			return true
		end
	end,

	get = function (cid, storage)
		local exhaust = getPlayerStorageValue(cid, storage)
		local left = exhaust - os.time()
		if (left >= 0) then
			return left
		else
			return false
		end
	end,

	set = function (cid, storage, time)
		setPlayerStorageValue(cid, storage, os.time()+time)
	end,

	make = function (cid, storage, time)
		local exhaust = exhaustion.get(cid, storage)
		if (exhaust > 0) then
			return false
		else
			exhaustion.set(cid, storage, time)
			return true
		end
	end
}


table.find = function (table, value)
	for i,v in pairs(table) do
		if (v == value) then
			return i
		end
	end
	return nil
end
table.getPos = table.find

table.isStrIn = function (txt, str)
	local result = false
	for i, v in pairs(str) do
		result = (string.find(txt, v) and not string.find(txt, '(%w+)' .. v) and not string.find(txt, v .. '(%w+)'))
		if (result) then
			break
		end
	end
	return result
end

table.countElements = function (table, item)
	local count = 0
	for i, n in pairs(table) do
		if (item == n) then count = count + 1 end
	end
	return count
end

table.getCombinations = function (table, num)
	local a, number, select, newlist = {}, #table, num, {}
	for i = 1, select do
		a[#a + 1] = i
	end
	local newthing = {}
	while (1) do
		local newrow = {}
		for i = 1, select do
			newrow[#newrow + 1] = table[a[i]]
		end
		newlist[#newlist + 1] = newrow
		i = select
		while (a[i] == (number - select + i)) do
			i = i - 1
		end
		if (i < 1) then break end
			a[i] = a[i] + 1
			for j = i, select do
				a[j] = a[i] + j - i
			end
		end
	return newlist
end

string.gfind = string.gmatch
string.split = function (str)
	local t = {}
	local function helper(word) table.insert(t, word) return "" end
	if (not str:gsub("%w+", helper):find"%S") then return t end
end

string.separate = function(separator, string)
	local a, b = {}, 0
	if (#string == 1) then return string end
	while (true) do
		local nextSeparator = string.find(string, separator, b + 1, true)
		if (nextSeparator ~= nil) then
			table.insert(a, string.sub(string,b,nextSeparator-1))
			b = nextSeparator + 1
		else
			table.insert(a, string.sub(string, b))
			break
		end
	end
	return a
end

function string.explode(p, d, m)
	local limit = m or 0
	local t, ll, j
	t={}
	ll=0
	j=0
	if(#p == 1) then return p end
		while true do
			l=string.find(p,d,ll+1,true) -- find the next d in the string
			if l~=nil and (j < limit or limit == 0) then -- if "not not" found then..
				table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
				ll=l+1 -- save just after where we found it for searching next time.
				j=j+1 -- number of explosions
			else
				table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
				break -- Break at end, as it should be, according to the lua manual.
			end
		end
	return t
end

function string.strip_whitespace(str)
	if #str < 1 then return str end
	local start = string.find(str, "[^%s]") -- First non-whitespace character
	local _end = #str + 1 - string.find(str:reverse(), "[^%s]") -- Last non-whitespace character

	if start ~= nil and _end ~= nil then
		return string.sub(str, start, _end)
	elseif start ~= nil then
		return string.sub(str, start)
	elseif _end ~= nil then
		return string.sub(str, 1, _end)
	end
	return str
end

function convertIntToIP(int, mask)
	local b4 = bit.urshift(bit.uband(int,  4278190080), 24)
	local b3 = bit.urshift(bit.uband(int,  16711680), 16)
	local b2 = bit.urshift(bit.uband(int,  65280), 8)
	local b1 = bit.urshift(bit.uband(int,  255), 0)
	if mask ~= nil then
		local m4 = bit.urshift(bit.uband(mask,  4278190080), 24)
		local m3 = bit.urshift(bit.uband(mask,  16711680), 16)
		local m2 = bit.urshift(bit.uband(mask,  65280), 8)
		local m1 = bit.urshift(bit.uband(mask,  255), 0)
		if (m1 == 255 or m1 == 0) and (m2 == 255 or m2 == 0) and (m3 == 255 or m3 == 0) and (m4 == 255 or m4 == 0) then
			if m1 == 0 then b1 = "x" end
			if m2 == 0 then b2 = "x" end
			if m3 == 0 then b3 = "x" end
			if m4 == 0 then b4 = "x" end
		else
			if m1 ~= 255 or m2 ~= 255 or m3 ~= 255 or m4 ~= 255 then
				return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4 .. " : " .. m1 .. "." .. m2 .. "." .. m3 .. "." .. m4
			end
		end
	end

	return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4
end

function convertIPToInt(str)
	local maskindex = str:find(":")
	if maskindex ~= nil then
		-- IP:Mask style
		if maskindex <= 1 then
			return 0, 0
		else
			ipstring = str:sub(1, maskindex - 1)
			maskstring = str:sub(maskindex)

			local ipint = 0
			local maskint = 0

			local index = 0
			for b in ipstring:gmatch("(%d+).?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then -- Invalid
				return 0, 0
			end

			index = 0
			for b in maskstring:gmatch("(%d+)%.?") do
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(b, index))
				index = index + 8
				if index > 24 then
					break
				end
			end
			if index ~= 32 then
				return 0, 0
			end

			return ipint, maskint
		end
	else
		local ipint = 0
		local maskint = 0
		local index = 24

		for b in str:gmatch("([x%d]+)%.?") do
			if b ~= "x" then
				if b:find("x") ~= nil then
					return 0, 0
				end
				if tonumber(b) > 255 or tonumber(b) < 0 then
					return 0, 0
				end
				maskint = bit.ubor(maskint, bit.ulshift(255, index))
				ipint = bit.ubor(ipint, bit.ulshift(b, index))
			end
			index = index - 8
			if index < 0 then
				break
			end
		end
		if index ~= -8 then -- Invalid
			return 0, 0
		end
		return ipint, maskint
	end
end

function getPlayerBless(cid, blessid)
	local storageid = STORAGE_BLESSES + blessid
	if getPlayerStorageValue(cid, storageid) >= 1 then
		return true
	else
		return false
	end
end

function doPlayerRemoveSkillLossPercent(cid, amount)
	local lossvalue = getPlayerLossPercent(cid, PLAYERLOSS_EXPERIENCE)
	local newvalue = lossvalue - amount
	if newvalue < 0 then
		newvalue = 0
	end
	if newvalue > 100 then
		newvalue = 100
	end
	-- Setting experience is enough (all other types follow it)
	doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, newvalue)
	doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, newvalue)
	doPlayerSetLossPercent(cid, PLAYERLOSS_SKILL, newvalue)
end

function doPlayerSetSkillLossPercent(cid, amount)
	if newvalue < 0 then
		newvalue = 0
	end
	if newvalue > 100 then
		newvalue = 100
	end
	-- Setting experience is enough (all other types follow it)
	doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, newvalue)
end


function doPlayerBless(cid)
	--doPlayerAddBless(cid) --addbless = 1 in source, so prevent item loss, not update loss percentage
	--doPlayerRemoveSkillLossPercent(cid, 10)
end

function removePlayerBless(cid, blessid)
	--doPlayerRemoveBless(cid)
	--doPlayerRemoveSkillLossPercent(cid, -10)
end


function getPlayerRequiredExperience(cid, level)
	if isPlayer(cid) == true and level >= 1 then
		local playerLevel = getPlayerLevel(cid)
		local experienceLeft = 0
		local levelExp = 0

		if playerLevel > level then
			levelExp = Calculator:getLevelExp(level)
			experienceLeft = getPlayerExperience(cid) - levelExp
		elseif playerLevel < level then
			levelExp = Calculator:getLevelExp(level)
			experienceLeft = levelExp - getPlayerExperience(cid)
		end
		return experienceLeft
	end

	return false
end

function doPlayerAddLevel(cid, level)
	if isPlayer(cid) == true and level >= 1 then
		local experience = getPlayerRequiredExperience(cid, getPlayerLevel(cid)+level)
		return doPlayerAddExp(cid, experience)
	end

	return false
end

function doPlayerRemoveLevel(cid, level)
	if isPlayer(cid) == true and level >= 1 then
		local experience = getPlayerRequiredExperience(cid, getPlayerLevel(cid)-level)
		return doPlayerRemoveExp(cid, experience)
	end

	return false
end

-- Functions made by Jiddo
function doPlayerGiveItem(cid, itemid, count, charges)
	local hasCharges = (isItemRune(itemid) == true or isItemFluidContainer(itemid) == true)
	if(hasCharges and charges == nil) then
		charges = 1
	end

	while count > 0 do
		local tempcount = 1

		if(hasCharges) then
			tempcount = charges
		end
		if(isItemStackable(itemid) == true) then
			tempcount = math.min (100, count)
		end

		local ret = doPlayerAddItem(cid, itemid, tempcount)
		if(ret == false) then
			ret = doCreateItem(itemid, tempcount, getPlayerPosition(cid))
		end

		if(ret ~= false) then
			if(hasCharges) then
				count = count-1
			else
				count = count-tempcount
			end
		else
			return false
		end
	end
	return true
end

function doPlayerTakeItem(cid, itemid, count)
	if(getPlayerItemCount(cid,itemid) >= count) then

		while count > 0 do
			local tempcount = 0
			if(isItemStackable(itemid) == true) then
				tempcount = math.min (100, count)
			else
				tempcount = 1
			end
			local ret = doPlayerRemoveItem(cid, itemid, tempcount)

			if(ret ~= false) then
				count = count-tempcount
			else
				return false
			end
		end

		if(count == 0) then
			return true
		end
	end
	return false
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	if(doPlayerRemoveMoney(cid, cost) == true) then
		return doPlayerGiveItem(cid, itemid, count, charges)
	end
	return false
end

function doPlayerSellItem(cid, itemid, count, cost)
	if doPlayerTakeItem(cid, itemid, count) then
		if not doPlayerAddMoney(cid, cost) then
			error('Could not add money to ' .. getPlayerName(cid) .. '(' .. cost .. 'gp)')
		end
		return true
	end
	return false

end

function getContainerCapById(itemid)
	local container = doCreateItemEx(itemid, 1)
	local capacity = getContainerCap(container)
	if capacity ~= false then
		doRemoveItem(container)
		return capacity
	else
		doRemoveItem(container)
		return false
	end
end

function isThingMoveable(uid)
	if(isMoveable(uid) == true and uid > 65535) then
		return true
	end

	return false
end

function isThingDestroyable(thing)
	if(thing.uid <= 0 or isCreature(thing.uid) == true or isThingMoveable(thing.uid) == false) then
		return false
	end

	return true
end

function doCleanTileItemsByPos(pos, ignore)
	local ignore = ignore or {}
	local removed_items = 0
	local stackpos = 1

	while true do
		pos.stackpos = stackpos
		local thing = getTileThingByPos(pos)

		if(isThingDestroyable(thing) == true and isInArray(ignore, thing.itemid) == false) then
			doRemoveItem(thing.uid)
			removed_items = removed_items + 1
		else
			if thing.uid > 0 then
				stackpos = stackpos + 1
			else
				break
			end
		end
	end
	
	return removed_items
end

function isInArray(array, value, isCaseSensitive)
	local compareLowerCase = false
	if value ~= nil and type(value) == "string" and not isCaseSensitive then
		value = string.lower(value)
		compareLowerCase = true
	end
	if array == nil or value == nil then
		return (array == value), nil
	end
	local t = type(array)
	if t ~= "table" then
		if compareLowerCase and t == "string" then
			return (string.lower(array) == string.lower(value)), nil
		else
			return (array == value), nil
		end
	end
	for k,v in pairs(array) do
		local newV
		if compareLowerCase and type(v) == "string" then
			newV = string.lower(v)
		else
			newV = v
		end
		if newV == value then 
			return true, k
		end
	end
	return false
end

function doBroadcastMessage(message, class, broadcast)
    local messageClass = class or MESSAGE_STATUS_WARNING

	if broadcast == true or broadcasr == nil then
		db.executeQuery("INSERT INTO `z_ots_action`(`type`, `message`, `status`, `by`) VALUES ('1','".. message .."','1', 'D2 Automatic Message')")
	end

    for i, cid in ipairs(getPlayersOnlineList()) do
        doPlayerSendTextMessage(cid, messageClass, message)
    end
    return true
end

--for backward compatibility
broadcastMessage = doBroadcastMessage
broadcastMessageEx = broadcastMessage

--default is the returned value if the value of input is missing or invalid
function getBooleanFromString(input, default)
	if input == nil then
		return default
	end

	local tmp = type(input)
	if tmp == 'boolean' then
		return input
	end

	if tmp == 'number' then
		return (input > 0)
	end

	if tmp == 'string' then
		local str = string.lower(input)
		local number = tonumber(str)
		if (str == "yes" or str == "true" or (number ~= nil and number > 0)) then
			return true
		end
		if (str == "no" or str == "false" or (number ~= nil and number == 0)) then
			return false
		end
	end

	return default
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function doCopyItem(item, attributes)
	local attributes = attributes or false

	local ret = doCreateItemEx(item.itemid, item.type)
	if(attributes) then
		if(item.actionid > 0) then
			doSetItemActionId(ret, item.actionid)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function isInRange(position, fromPosition, toPosition)
	return (position.x >= fromPosition.x and position.y >= fromPosition.y and position.z >= fromPosition.z and position.x <= toPosition.x and position.y <= toPosition.y and position.z <= toPosition.z)
end

function doComparePositions(pos1, pos2)
    return (pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z)
end

function getItemWeightById(itemid)
        local uid = doCreateItemEx(itemid, 1)
        local ret = getItemWeight(uid)
        return ret
 end
 
function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItemContainer(cid, containerid, itemid, count, charges)
end

function getArticle(itemid)
	return getItemDescriptions(itemid).article
end

function getItemNameById(itemid)
   return getItemDescriptions(itemid).name
end

-- TASK


RANK_NONE = 0
RANK_HUNTSMAN = 1
RANK_RANGER = 2
RANK_BIGGAMEHUNTER = 3
RANK_TROPHYHUNTER = 4
RANK_ELITEHUNTER = 5

REWARD_MONEY = 1
REWARD_EXP = 2
REWARD_ACHIEVEMENT = 3
REWARD_STORAGE = 4
REWARD_POINT = 5
REWARD_ITEM = 6

QUESTSTORAGE_BASE = 71500
KILLSSTORAGE_BASE = 72500
REPEATSTORAGE_BASE = 73500
POINTSSTORAGE = 72500
ONTASKSTORAGE = 74500
tasks =
{
[1] = {bossName = "mickey", killsRequired = 50, raceName = "Noob", level = {1, 666}, premium = false, creatures = {"rat", "cave rat", "spider", "poison spider", "bug"}, rewards = {
{type = "exp", value = {8000}},
{type = "money", value = {5000}},
{type = "points", value = {1}},
{type = "storage", value = {81500,1}}
}},
[2] = {killsRequired = 50, raceName = "Orcs", level = {1, 666}, premium = false, creatures = {"orc", "orc warrior", "orc spearman", "orc berserker", "orc leader"}, rewards = {
{type = "exp", value = {10000}},
{type = "money", value = {3500}},
{type = "points", value = {1}}
}},
[3] = {bossName = "the snapper", killsRequired = 300, raceName = "Crocodiles", level = {1, 666}, premium = false, creatures = {"crocodile"}, rewards = {
{type = "exp", value = {20000}},
{type = "item", value = {2536,1}},
{type = "points", value = {1}},
{type = "storage", value = {81500,3}}
}},
[4] = {bossName = "hide", killsRequired = 300, raceName = "Tarantulas", level = {1, 666}, premium = false, creatures = {"tarantula"}, rewards = {
{type = "exp", value = {30000}},
{type = "points", value = {1}},
{type = "storage", value = {81500,4}}
}},
[5] = {bossName = "tiquanda's revenge", killsRequired = 150, raceName = "Carniphilas", level = {1, 666}, premium = false, creatures = {"carniphila"}, rewards = {
{type = "exp", value = {30000}},
{type = "item", value = {2477,1}},
{type = "points", value = {1}},
{type = "storage", value = {81500,5}}
}},
[6] = {killsRequired = 200, raceName = "Stone Golems", level = {1, 666}, premium = false, creatures = {"stone golem"}, rewards = {
{type = "exp", value = {30000}},
{type = "points", value = {1}}
}},
[7] = {killsRequired = 300, raceName = "Gargoyles", level = {1, 666}, premium = false, creatures = {"gargoyle"}, rewards = {
{type = "exp", value = {40000}},
{type = "points", value = {2}}
}},
[8] = {killsRequired = 250, raceName = "Ancient Scarabs", level = {1, 666}, premium = false, creatures = {"ancient scarab"}, rewards = {
{type = "exp", value = {60000}},
{type = "money", value = {10000}},
{type = "points", value = {2}}
}}, 
[9] = {killsRequired = 300, raceName = "Bonebeasts", level = {1, 666}, premium = false, creatures = {"bonebeast"}, rewards = {
{type = "exp", value = {40000}},
{type = "item", value = {2488,1}},
{type = "points", value = {2}}
}}, 
[10] = {bossName = "the old widow", killsRequired = 500, raceName = "Giant Spiders", level = {1, 666}, premium = false, creatures = {"giant spider"}, rewards = {
{type = "exp", value = {80000}},
{type = "item", value = {2195,1}},
{type = "points", value = {3}},
{type = "storage", value = {81500,10}}
}}, 
[11] = {bossName = "the many", killsRequired = 650, raceName = "Hydras", level = {1, 666}, premium = false, creatures = {"hydra"}, rewards = {
{type = "exp", value = {120000}},
{type = "item", value = {2498,1}},
{type = "points", value = {3}},
{type = "storage", value = {81500,11}}
}}, 
[12] = {bossName = "the noxious spawn", killsRequired = 800, raceName = "Serpent Spawns", level = {1, 9999}, premium = false, creatures = {"serpent spawn"}, rewards = {
{type = "exp", value = {120000}},
{type = "points", value = {3}},
{type = "storage", value = {81500,12}}
}}, 
[13] = {bossName = "stonecracker", killsRequired = 700, raceName = "Behemoths", level = {1, 9999}, premium = false, creatures = {"behemoth"}, rewards = {
{type = "exp", value = {120000}},
{type = "item", value = {2645,1}},
{type = "points", value = {3}},
{type = "storage", value = {81500,13}}
}}, 
[14] = {killsRequired = 1666, raceName = "Demons", level = {1, 9999}, rank = RANK_ELITEHUNTER, premium = false, creatures = {"demon"}, rewards = {
{type = "item", value = {2390, 1}},
{type = "points", value = {5}}
}},
[15] = {bossName = "The Horned Fox", killsRequired = 250, raceName = "Minotaurs", level = {1, 999}, premium = false, creatures = {"minotaur", "minotaur mage", "minotaur archer", "minotaur guard"}, rewards = { 
{type = "exp", value = {40000}},
{type = "money", value = {7000}},
{type = "points", value = {1}},
{type = "storage", value = {81500,15}}
}},
[16] = {bossName = "Necropharus", killsRequired = 600, raceName = "Necromancers and Priestess", level = {1, 9999}, norepeatable = true, premium = false, creatures = {"necromancer", "priestess"}, rewards = {
{type = "exp", value = {50000}},
{type = "item", value = {2195, 1}},
{type = "points", value = {3}},
{type = "storage", value = {81500,16}}
}}, 
[17] = {bossName = "Demodras", killsRequired = 400, raceName = "Dragons", level = {1, 999}, premium = false, creatures = {"dragon", "dragon lord", "dragon hatchling", "dragon lord hatchling", "frost dragon", "frost dragon hatchling"}, rewards = {
{type = "exp", value = {80000}},
{type = "item", value = {2160,3}},
{type = "points", value = {2}},
{type = "storage", value = {81500,17}}
}},
[18] = {killsRequired = 400, raceName = "Larvas", level = {1, 999}, premium = false, creatures = {"larva"}, rewards = {
{type = "exp", value = {20000}},
{type = "points", value = {1}}
}}, 
[19] = {killsRequired = 200, raceName = "Wasps", level = {1, 999}, premium = false, creatures = {"Wasp"}, rewards = {
{type = "exp", value = {10000}},
{type = "points", value = {1}}
}}, 
[20] = {killsRequired = 300, raceName = "Heros", level = {1, 999}, premium = false, creatures = {"Hero"}, rewards = {
{type = "exp", value = {75000}},
{type = "points", value = {2}}
}},  
[21] = {killsRequired = 500, raceName = "Rotworms", level = {1, 999}, premium = false, creatures = {"rotworm"}, rewards = {
{type = "exp", value = {21000}},
{type = "points", value = {1}}
}},
[22] = {killsRequired = 3000, raceName = "Tombs", level = {1, 999}, premium = false, creatures = {"Ghoul","Skeleton","Demon Skeleton","Ghost","Scarab","Larva","lion","poison spider","spider","Snake","cobra","scorpion","mummy","slime","stone golem","crypt shambler","stalker","gargoyle","vampire","beholder","bonebeast","ancient scarab","necromancer"}, rewards = {
{type = "exp", value = {65000}},
{type = "points", value = {2}}
}},
[23] = {killsRequired = 500, raceName = "Vampires", level = {1, 999}, premium = false, creatures = {"Vampire"}, rewards = {
{type = "exp", value = {60000}},
{type = "points", value = {2}}
}},
[24] = {killsRequired = 300, raceName = "Black Knights", level = {1, 999}, premium = false, creatures = {"Black Knight"}, rewards = {
{type = "exp", value = {90000}},
{type = "item", value = {2536,1}},
{type = "points", value = {2}}
}},    
[25] = {killsRequired = 500, raceName = "Cyclops", level = {1, 999}, premium = false, creatures = {"Cyclops", "Cyclops Drone", "Cyclops Smith"}, rewards = {
{type = "exp", value = {65000}},
{type = "points", value = {1}}
}},    
[26] = {killsRequired = 1000, raceName = "Warlocks", level = {1, 999}, premium = false, creatures = {"Warlock"}, rewards = {
{type = "exp", value = {180000}},
{type = "points", value = {3}}
}},  
[27] = {killsRequired = 700, raceName = "Dwarfs", level = {1, 999}, premium = false, creatures = {"Dwarf","Dwarf Guard","Dwarf Soldier"}, rewards = {
{type = "exp", value = {30000}},
{type = "points", value = {2}}
}},
[28] = {killsRequired = 400, raceName = "Banshees", level = {1, 999}, premium = false, creatures = {"Banshee"}, rewards = {
{type = "exp", value = {40000}},
{type = "points", value = {3}}
}},
[29] = {killsRequired = 300, raceName = "Slimes", level = {1, 999}, premium = false, creatures = {"Slime"}, rewards = {
{type = "exp", value = {10000}},
{type = "points", value = {2}}
}},
[30] = {killsRequired = 400, raceName = "Demon Skeletons", level = {1, 999}, premium = false, creatures = {"Demon Skeleton"}, rewards = {
{type = "exp", value = {20000}},
{type = "points", value = {2}}
}},
[31] = {killsRequired = 500, raceName = "Ghouls", level = {1, 999}, premium = false, creatures = {"Ghoul"}, rewards = {
{type = "exp", value = {21300}},
{type = "points", value = {2}}
}},
[32] = {killsRequired = 500, raceName = "Scarabs", level = {1, 999}, premium = false, creatures = {"Scarab"}, rewards = {
{type = "exp", value = {21300}},
{type = "points", value = {2}}
}},
[33] = {killsRequired = 300, raceName = "Stalkers", level = {1, 999}, premium = false, creatures = {"Stalker"}, rewards = {
{type = "exp", value = {10000}},
{type = "points", value = {2}}
}},
[34] = {killsRequired = 300, raceName = "Lions", level = {1, 999}, premium = false, creatures = {"Lion"}, rewards = {
{type = "exp", value = {10000}},
{type = "points", value = {2}}
}},
[35] = {killsRequired = 300, raceName = "Deers", level = {1, 999}, premium = false, creatures = {"Deer"}, rewards = {
{type = "exp", value = {7000}},
{type = "points", value = {4}}
}},
[36] = {killsRequired = 500, raceName = "Wolves", level = {1, 999}, premium = false, creatures = {"Wolf"}, rewards = {
{type = "exp", value = {7000}},
{type = "points", value = {2}}
}},
[37] = {killsRequired = 600, raceName = "Apes", level = {1, 999}, premium = false, creatures = {"Kongra","Merlkin","Sibang"}, rewards = {
{type = "exp", value = {38000}},
{type = "points", value = {2}}
}},
[38] = {killsRequired = 600, raceName = "Orcs High", level = {1, 999}, premium = false, creatures = {"Orc Berserker","Orc Warlord","Orc Warrior","Orc Spearman"}, rewards = {
{type = "exp", value = {50000}},
{type = "points", value = {2}}
}},
[39] = {killsRequired = 350, raceName = "Amazon", level = {1, 999}, premium = false, creatures = {"Amazon","Valkyrie"}, rewards = {
{type = "exp", value = {35000}},
{type = "points", value = {2}}
}},
[40] = {killsRequired = 350, raceName = "Elfs", level = {1, 999}, premium = false, creatures = {"Elf Arcanist","Elf","Elf Scout"}, rewards = {
{type = "exp", value = {35000}},
{type = "points", value = {2}}
}},
[41] = {killsRequired = 100, raceName = "Inquisition", level = {1, 999}, norepeatable = true, premium = false, creatures = {"Annihilon","Golgordan","Hellgorak","Latrivan","Madareth","Ushuriel","Zugurosh"}, rewards = {
{type = "exp", value = {300000}},
{type = "points", value = {20}}
}},
[42] = {killsRequired = 500, raceName = "Quara", level = {1, 999}, premium = false, creatures = {"quara pincher","quara hydromancer","quara predator","quara constrictor","quara constrictor scout","quara hydromancer scout","quara mantassin","quara mantassin scout", "quara pincher scout","quara predator scout"}, rewards = {
{type = "exp", value = {50000}},
{type = "points", value = {5}}
}},
[43] = {killsRequired = 500, raceName = "Icy", level = {1, 999}, premium = false, creatures = {"Ice Golem","Crystal Spider","hand of cursed fate"}, rewards = {
{type = "exp", value = {100000}},
{type = "points", value = {5}}
}},
[44] = {killsRequired = 666, raceName = "Hell", level = {1, 999}, premium = false, creatures = {"Hellfire Fighter","Hellhound","Fury","Lost Soul","Undead Dragon","Juggernaut","hand of cursed fate","diabolic imp","dark torturer","undead dragon","betrayed wraith"}, rewards = {
{type = "exp", value = {350666}},
{type = "points", value = {10}}
}},
[45] = {killsRequired = 500, raceName = "Lizards", level = {1, 999}, premium = false, creatures = {"Lizard Sentinel", "Lizard Snakecharmer", "Lizard Templar"}, rewards = {
{type = "exp", value = {55000}},
{type = "points", value = {3}}
}},





[46] = {killsRequired = 300, raceName = "Tortoise", level = {1, 999}, premium = false, creatures = {"Tortoise", "Thornback Tortoises"}, rewards = {
{type = "exp", value = {35000}},
{type = "points", value = {2}}
}},

[47] = {killsRequired = 1200, raceName = "Mutateds", level = {1, 999}, premium = false, creatures = {"Mutated Rat", "Mutated Bat", "Mutated Human", "Mutated Tiger"}, rewards = {
{type = "exp", value = {130000}},
{type = "points", value = {4}}
}},

[48] = {killsRequired = 500, raceName = "Wyvern", level = {1, 999}, premium = false, creatures = {"Wyvern"}, rewards = {
{type = "exp", value = {80000}},
{type = "points", value = {3}}
}},

[49] = {killsRequired = 500, raceName = "Werewolves", level = {1, 999}, premium = false, creatures = {"Werewold"}, rewards = {
{type = "exp", value = {70000}},
{type = "points", value = {3}}
}},

[50] = {killsRequired = 500, raceName = "Hellspawn", level = {1, 999}, premium = false, creatures = {"Hellspawn"}, rewards = {
{type = "exp", value = {110000}},
{type = "points", value = {3}}
}},

[51] = {killsRequired = 500, raceName = "Nightmare", level = {1, 999}, premium = false, creatures = {"Nightmare", "Nightmare Scion"}, rewards = {
{type = "exp", value = {100000}},
{type = "points", value = {3}}
}},

[52] = {killsRequired = 800, raceName = "Grim Reaper", level = {1, 999}, premium = false, creatures = {"Grim Reaper"}, rewards = {
{type = "exp", value = {200000}},
{type = "points", value = {5}}
}},

[53] = {killsRequired = 500, raceName = "Bog Raider", level = {1, 999}, premium = false, creatures = {"Bog Raider"}, rewards = {
{type = "exp", value = {100000}},
{type = "points", value = {3}}
}},

[54] = {killsRequired = 500, raceName = "Blobs", level = {1, 999}, premium = false, creatures = {"Acid Blob", "Death Blob", "Mercury Blob"}, rewards = {
{type = "exp", value = {100000}},
{type = "points", value = {3}}
}},

[55] = {killsRequired = 900, raceName = "Pirates", level = {1, 999}, premium = false, creatures = {"Pirate Buccaneer", "Pirate Corsair", "Pirate Cutthroat", "Pirate Ghost", "Pirate Marauder", "Pirate Skeleton"}, rewards = {
{type = "exp", value = {120000}},
{type = "points", value = {3}}
}},

[56] = {killsRequired = 300, raceName = "Zombies", level = {1, 999}, premium = false, creatures = {"Zombie"}, rewards = {
{type = "exp", value = {60000}},
{type = "points", value = {2}}
}},

[57] = {killsRequired = 300, raceName = "Barbarian", level = {1, 999}, premium = false, creatures = {"Barbarian Bloodwalker","Barbarian Brutetamer","Barbarian Headsplitter", "Barbarian Skullhunter"}, rewards = {
{type = "exp", value = {80000}},
{type = "points", value = {3}}
}},

[58] = {killsRequired = 800, raceName = "Magicians", level = {1, 999}, premium = false, creatures = {"Infernalist","Dark Apprentice","Dark Magician", "Acolyte of the Cult", "Adept of the Cult"}, rewards = {
{type = "exp", value = {130000}},
{type = "points", value = {4}}
}},

[59] = {killsRequired = 800, raceName = "Golems", level = {1, 999}, premium = false, creatures = {"War Golem","Worker Golem"}, rewards = {
{type = "exp", value = {130000}},
{type = "points", value = {4}}
}}

-- dragons, cyclops, quaras
}

tasksByPlayer = 3
repeatTimes = 3

function getPlayerRank(cid)
return (getPlayerStorageValue(cid, POINTSSTORAGE) >= 100 and RANK_ELITEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 70 and RANK_TROPHYHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 40 and RANK_BIGGAMEHUNTER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 20 and RANK_RANGER or getPlayerStorageValue(cid, POINTSSTORAGE) >= 10 and RANK_HUNTSMAN or RANK_NONE)
end

function getTaskByName(name, table)
local t = (table and table or tasks)
for k, v in pairs(t) do
if v.name then
if v.name:lower() == name:lower() then
return k
end
else
if v.raceName:lower() == name:lower() then
return k
end
end
end
return false
end

function getTasksByPlayer(cid)
local canmake = {}
local able = {}
for k, v in pairs(tasks) do
if getPlayerStorageValue(cid, QUESTSTORAGE_BASE + k) < 1 and getPlayerStorageValue(cid, REPEATSTORAGE_BASE + k) < repeatTimes then
able[k] = true
if getPlayerLevel(cid) < v.level[1] or getPlayerLevel(cid) > v.level[2] then
able[k] = false
end
if v.storage and getPlayerStorageValue(cid, v.storage[1]) < v.storage[2] then
able[k] = false
end

if v.rank then
if getPlayerRank(cid) < v.rank then
able[k] = false
end
end

if v.premium then
if not isPremium(cid) then
able[k] = false
end
end

if able[k] then
table.insert(canmake, k)
end
end
end
return canmake
end


function canStartTask(cid, name, table)
local v = ""
local id = 0
local t = (table and table or tasks)
for k, i in pairs(t) do
if i.name then
if i.name:lower() == name:lower() then
v = i
id = k
break
end
else
if i.raceName:lower() == name:lower() then
v = i
id = k
break
end
end
end
if v == "" then
return false
end
if getPlayerStorageValue(cid, QUESTSTORAGE_BASE + id) > 0 then
return false
end
if (getPlayerStorageValue(cid, REPEATSTORAGE_BASE + id) >= repeatTimes) or (v.norepeatable and getPlayerStorageValue(cid, REPEATSTORAGE_BASE + id) > 0) then
return false
end
if getPlayerLevel(cid) >= v.level[1] and getPlayerLevel(cid) <= v.level[2] then
if v.premium then
if isPremium(cid) then
if v.rank then
if getPlayerRank(cid) >= v.rank then
if v.storage then 
if getPlayerStorageValue(cid, v.storage[1]) >= v.storage[2] then
return true
end
else
return true
end
end
else
return true
end
end
else
return true
end
end
return false
end

function getPlayerStartedTasks(cid)

local tmp = {}
for k, v in pairs(tasks) do
if getPlayerStorageValue(cid, QUESTSTORAGE_BASE + k) > 0 and getPlayerStorageValue(cid, QUESTSTORAGE_BASE + k) < 2 then
table.insert(tmp, k) 
end
end
return tmp
end

function isSummon(target)
return (getCreatureMaster(target) ~= target)
end

function getAccountPoints(cid)
    local Info = db.getResult("SELECT `task_points` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
        if Info:getID() ~= LUA_ERROR then
        local Points= Info:getDataInt("task_points")
        Info:free()
        return Points
    end
     return LUA_ERROR
end



function doAddPoints(cid, points)
	local temp = getPlayerAccountId(cid)
    db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + " .. points .. " WHERE `id` = " .. temp .. ";")
end  

function doAccountRemovePoints(cid, count)
return db.executeQuery("UPDATE `accounts` SET `task_points` = '".. getAccountPoints(cid) - count .."' WHERE `name` ='"..getPlayerAccountId(cid).."'")
end

function updateBanInformation()
    db.executeQuery("UPDATE `bans` SET `reason` = 19, `action` = 2, `comment` = 'botting detected manually or thru forums report' WHERE `reason` = '0' and `action` = '0';")
end  

function isBonusActive()
local storage = getGlobalStorageValue(991491388)
if storage == -1 or storage == 0 then
return false
else
return true
end
end

function setBonusExp(enable)
if enable then
setGlobalStorageValue(991491388, 1)
else
setGlobalStorageValue(991491388, 0)
end
updateWorldStage()
return true
end

function stageUpdate(cid)
	local active = isBonusActive()
	local value = (active and 2 or 1)
	local playerLevel = getPlayerLevel(cid)
	if (playerLevel > stages[#stages].maxLevel) then
		setExperienceRate(cid, stages[#stages].multiplier * value)
		return true
	end
	for i = 1, #stages do
		if (playerLevel >= stages[i].minLevel and playerLevel <= stages[i].maxLevel) then
			setExperienceRate(cid, stages[i].multiplier * value)
			return true
		end
	end
	return false
end

function updateWorldStage()
local onlineList = getPlayersOnlineList()
for i, uid in ipairs(onlineList) do
stageUpdate(uid)
end
end

function randomPremiumPoints()
local points = 10
local onlineList = getPlayersOnlineList()
if #onlineList < 1 then 
	return true 
end
local playeruid = onlineList[math.random(#onlineList)]
local playername = getCreatureName(playeruid)
doAddPoints(playeruid, points)
broadcastMessage(playername .. " has received " .. points .. " premium points.")
end

function updateExpDaily()
	db.executeQuery("UPDATE `exp_history` SET day7 = day6, day6 = day5, day5 = day4, day4 = day3, day3 = day2, day2 = current, current = 0;")
end

function doUpdateExpMade()
	db.executeQuery("UPDATE exp_history SET current = (SELECT (cast(`experience` as signed) - init_exp) from players where id = exp_history.player_id)")
	db.executeQuery("UPDATE `players` SET `exp_made` = IF(cast(`experience` as signed) > `init_exp`,cast(`experience` as signed) - `init_exp`, 0);")	
end

function doUpdateExpPoints()
		local rewards = {[1] = {points = 8},
						 [2] = {points = 4},
						 [3] = {points = 2}}
						 
        Query = db.getResult("SELECT `account_id`, `exp_made` FROM `players` ORDER BY `exp_made` DESC LIMIT 3")	
        if(Query:getID() ~= -1) then
			    for i = 1, Query:getRows() do
				local points = rewards[i].points
				local accountID = Query:getDataInt("account_id")
				db.executeQuery("UPDATE `accounts` SET `premium_points` = `premium_points` + '".. points .."' WHERE `id` = '".. accountID .."';")
                Query:next()
				end
		else
		return LUA_ERROR
		end
end

function getPlayerByID(id)		 
        Query = db.getResult("SELECT * FROM `players` WHERE `id` = '".. id .."';")	
        if(Query:getID() ~= -1) then
			return getPlayerByName(Query:getDataString("name"))
		else
			return LUA_ERROR
		end
end

function bankDeposit(cid, amount)
	local playerName = getCreatureName(cid)
	local playerAccount = getPlayerAccountId(cid)
	db.executeQuery("INSERT INTO `bank`(`type`, `account_id`, `player`, `value`) VALUES ('deposit','".. playerAccount .."','".. playerName .."', '".. amount .."')")
end

function bankWithdraw(cid, amount)
	local playerName = getCreatureName(cid)
	local playerAccount = getPlayerAccountId(cid)
	db.executeQuery("INSERT INTO `bank`(`type`, `account_id`, `player`, `value`) VALUES ('withdraw','".. playerAccount .."','".. playerName .."', '".. amount .."')")
end

function bankTransfer(cid,toPlayer,amount)
	local playerName = getCreatureName(cid)
	local playerAccount = getPlayerAccountId(cid)
	db.executeQuery("INSERT INTO `bank`(`type`, `account_id`, `player`, `value`, `to_player`) VALUES ('transfer','".. playerAccount .."','".. playerName .."', '".. amount .."', '".. toPlayer .."')")
end

function bankPurchase(cid, amount, comment)
	local playerName = getCreatureName(cid)
	local playerAccount = getPlayerAccountId(cid)
	db.executeQuery("INSERT INTO `bank`(`type`, `account_id`, `player`, `value`,`comment`) VALUES ('purchase','".. playerAccount .."','".. playerName .."', '".. amount .."', '".. comment .."')")
end

function cleanHouses()
	local safelist = {1,2}
	local count = 0
	days = 30*3600*24
	t=os.date('*t')
	local house = db.getResult("SELECT `owner`,`id` FROM `houses`")
	if(house:getID() ~= -1) then
		while (true) do
			local owner = house:getDataInt("owner")
			local hid = house:getDataInt("id")
			local player = db.getResult("SELECT `id`,`name`,`lastlogin` FROM `players` WHERE `id` = '"..owner.."' ")
			if(player:getID() ~= -1) then
				local lastlogin = player:getDataInt("lastlogin")
				local pid = player:getDataInt("id")
				local name = player:getDataString("name")
				time=os.time(t) - lastlogin
				offline = time - days
				if offline >= 0 then
					if isInArray(safelist,hid) == FALSE then 
						setHouseOwner(hid, 0)
						count = count + 1
						db.executeQuery("INSERT INTO `cleanedhouses` (`houseid`) VALUES ('".. hid .."');")
					end
				end
				player:free()
			end
			if not(house:next()) then
				break
			end
		end
		house:free() 
	end
	broadcastMessage(count .. " houses were cleaned. Remember that you need to log each 10 days to keep your house.")
end

function playersMoneyToAccount()
	Query = db.getResult("SELECT `account_id`,`balance` FROM `players` where `balance` > 0")	
	if(Query:getID() ~= -1) then
			for i = 1, Query:getRows() do
				local balance = Query:getDataInt("balance")
				local accountID = Query:getDataInt("account_id")
				db.executeQuery("UPDATE `accounts` SET `accountbalance` = `accountbalance` + '".. balance .."' WHERE `id` = '".. accountID .."';")
				db.executeQuery("UPDATE `players` SET `balance` = '0' WHERE `account_id` = '".. accountID .."';")
				Query:next()
			end
	else
		return LUA_ERROR
	end	
end


--storage = ONTASKSTORAGE

function removePlayerFromTask(cid,time)
	if not isPlayer(cid) then return false end
	if getPlayerStorageValue(cid, 81500) <= 0 then return end
	local exitpos = {x = 32357, y = 32232, z = 8}
	if time ~= 0 then
		doPlayerSendTextMessage(cid,19,"You have ".. time .." seconds left.")
		local event = addEvent(removePlayerFromTask,time * 1000,cid, 0)
		setPlayerStorageValue(cid,ONTASKSTORAGE,event)
	else
		doPlayerSendTextMessage(cid,19,"Time is over, you lost access to the boss")
		doTeleportThing(cid, exitpos)
		setPlayerStorageValue(cid, 81500, -1)
		setPlayerStorageValue(cid,ONTASKSTORAGE,0)
	end
end

function cleanPlayerTaskTimer(cid)
	local hasEvent = getPlayerStorageValue(cid,ONTASKSTORAGE)
	if hasEvent > 0 then
        stopEvent(hasEvent)
        setPlayerStorageValue(cid,ONTASKSTORAGE,0)
	end
end

function disableExp(minutes)
	local minutes = minutes or 0
	if minutes <= 0 then
		setBonusExp(false)
		broadcastMessage("Double experience event is over.")
		return true
	end
	if minutes == 1 then
		doBroadcastMessage("Double experience event will be over in " .. minutes .. " minute.")
	else
		doBroadcastMessage("Double experience event will be over in " .. minutes .. " minutes.")
	end
	if isBonusActive() then
		addEvent(disableExp, 60000, minutes - 1)
	end
	return true
end

function enableEvent(minutes)
	local minutes = minutes or 0
	if minutes <= 0 then
		setBonusExp(true)
		broadcastMessage("Double experience event is activated. Enjoy!")
		randomPremiumPoints()
		addEvent(disableExp, 1000 * 60 * 60, 5)
		return true
	end
	if minutes == 1 then
		doBroadcastMessage("Double experience event will begin in " .. minutes .. " minute.")
		randomPremiumPoints()
	else
		doBroadcastMessage("Double experience event will being in " .. minutes .. " minutes.")
		randomPremiumPoints()
	end
	addEvent(enableEvent, 60000, minutes - 1)
	return true
end

function doPlayerAddDepotItems(name, town, item, message)
	local mailBoxPos = {x = 32314, y = 31932, z = 7}

	local parcel = doCreateItemEx(2595)
	local label = doAddContainerItem(parcel, 2599)
	doSetItemText(label, name .."\n".. town)

	doAddContainerItemEx(parcel, item)

	doTeleportThing(parcel, mailBoxPos)

	local cid = getCreatureByName(name)
	if cid ~= nil and isPlayer(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, message)
	end
	return true
end
