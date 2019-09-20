local function getContentDescription(uid, comma)
	local ret, i, containers = '', 0, {}
	while i < getContainerSize(uid) do
		local v, s = getContainerItem(uid, i), ''
		local k = getItemDescriptions(v.itemid)
		if k.name ~= '' then
			if v.type > 1 then
				s = v.type .. ' ' .. getItemDescriptions(v.itemid).plural
			else
				local article = k.article
				s = (article == '' and '' or article .. ' ') .. k.name
			end
			ret = ret .. (i == 0 and not comma and '' or ', ') .. s
			if v.itemid == 1987 then
				bc = getContainerSize(v.uid)
				kd = v.uid
				table.insert(containers, bc)
			end
		else
			ret = ret .. (i == 0 and not comma and '' or ', ') .. 'an item of type ' .. v.itemid .. ', please report it to gamemaster'
		end
		i = i + 1
	end
	for i = 1, #containers do
		ret = ret .. getContentDescription(kd, true)
	end
	return ret
end

local function send(cid, pos, name, party)
	local corpse = getTileItemByType(pos, ITEM_TYPE_CONTAINER).uid
	local ret = isContainer(corpse) and getContentDescription(corpse)
	if party then
		local members = getPartyMembers(cid)
		for _, pid in ipairs(members) do
			doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, 'Loot of ' .. name .. ': ' .. (ret ~= '' and ret or 'nothing'))
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Loot of ' .. name .. ': ' .. (ret ~= '' and ret or 'nothing'))
	end
end

function onKill(cid, target, lastHit)
	if getPlayerStorageValue(cid, 96587) == 1 then
		return true
	end
	if not isPlayer(cid) then
		return true
	end
	if isSummon(target) then
		return true
	end
	if not isPlayer(target) and lastHit then
		addEvent(send, 0, cid, getThingPos(target), getCreatureName(target), getPartyMembers(cid))
	end
	return true
end