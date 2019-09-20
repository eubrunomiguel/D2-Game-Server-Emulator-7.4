function onKill(cid, target, lastHit)
	local members = getPartyMembers(cid)
	local validTaskT = {}
	
	if not isSummon(target) then
			if not members then
				taskFunctions(cid, target, false)
			else
				if lastHit then
					checkPlayerOnScreen(cid, members, validTaskT)
						for i, validTaskMembers in ipairs(validTaskT) do
							taskFunctions(validTaskMembers, target, true)
						end
				end
			end
	end

	return true
end

function taskFunctions(value, target, isParty)
	local started = getPlayerStartedTasks(value)
	if isPlayer(target) then return true end
		if started and #started > 0 then
			for _, id in ipairs(started) do
				if isInArray(tasks[id].creatures, getCreatureName(target):lower()) then
					if getPlayerStorageValue(value, KILLSSTORAGE_BASE + id) < 0 then
					setPlayerStorageValue(value, KILLSSTORAGE_BASE + id, 0)
					end
					if getPlayerStorageValue(value, KILLSSTORAGE_BASE + id) < tasks[id].killsRequired then
					setPlayerStorageValue(value, KILLSSTORAGE_BASE + id, getPlayerStorageValue(value, KILLSSTORAGE_BASE + id) + 1)
					doPlayerSendTextMessage(value, MESSAGE_STATUS_CONSOLE_ORANGE, getPlayerStorageValue(value, KILLSSTORAGE_BASE + id) .. "/" .. tasks[id].killsRequired .. " " .. tasks[id].raceName .. " already killed.")
					end
				end
			end
		end
end

function checkPlayerOnScreen(cid, membersT, validTaskT)
	local rangeX, rangeY = 7, 7
	local spectators = getSpectators(getCreaturePosition(cid), rangeX, rangeY, false)
		if spectators then
			for _, spectator in ipairs(spectators) do
					if isPlayer(spectator) then
						for __, member in ipairs(membersT) do
							if member == spectator then
								table.insert(validTaskT, member)
							end
						end
					end
			end
		end
end