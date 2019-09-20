local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local choose = {}
local cancel = {}
local available = {}
local finishedTasks = {}

function creatureSayCallback(cid, type, msg)

	if npcHandler.focus ~= cid then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid

	if isInArray({"tasks", "task", "mission"}, msg:lower()) then
		local can = getTasksByPlayer(cid)
		if #can > 0 then
			local text = ""
			local sep = ", "
			table.sort(can, (function (a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(can) do
				t = t + 1
				if t == #can - 1 then
					sep = " and "
				elseif t == #can then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
			selfSay("The current task" .. (#can > 1 and "s" or "") .. " that you can choose " .. (#can > 1 and "are" or "is") .. " " .. text)
			talkState[talkUser] = 0
		else
			selfSay("I don't have any task for you right now.")
		end
	elseif msg ~= "" and canStartTask(cid, msg) and talkState[talkUser] == 0 then
		if #getPlayerStartedTasks(cid) >= tasksByPlayer then
			selfSay("Sorry, but you already started " .. tasksByPlayer .. " tasks.")
			return true
		end
		local task = getTaskByName(msg)
		if task and getPlayerStorageValue(cid, QUESTSTORAGE_BASE + task) > 0 then
			return false
		end
		selfSay("In this task you must defeat " .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Are you sure that you want to start this task?")
		choose[cid] = task
		talkState[talkUser] = 1
	elseif msg:lower() == "yes" and talkState[talkUser] == 1 then
		setPlayerStorageValue(cid, QUESTSTORAGE_BASE + choose[cid], 1)
		selfSay("Excellent! You can check the status of your task saying report to me.")
		choose[cid] = nil
		talkState[talkUser] = 0
	elseif msg:lower() == "report" then
		local started = getPlayerStartedTasks(cid)
		local finishedAtLeastOne = false
		local finished = 0
		if started and #started > 0 then
			local text = ""
			local sep = ", "
			local t = 0	
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " and "
				elseif t == #started then
					sep = "."
				end
				if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					table.insert(finishedTasks, (tasks[id].name or tasks[id].raceName):lower())
					text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
				end
			end
			if #finishedTasks > 0 then
				talkState[talkUser] = 5
				selfSay("The current task" .. (#finishedTasks > 1 and "s" or "") .. " that you can report " .. (#finishedTasks > 1 and "are" or "is") .. " " .. text)
			else
				selfSay("You haven't finished any task yet.")
			end
		else
			selfSay("You haven't started any task yet.")
		end
	elseif isInArray(finishedTasks, msg:lower()) and talkState[talkUser] == 5 then
		local task = getTaskByName(msg)
		if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) >= tasks[task].killsRequired then
			for _, reward in ipairs(tasks[task].rewards) do
				local deny = false
				if reward.storage then
					if getPlayerStorageValue(cid, reward.storage[1]) >= reward.storage[2] then
						deny = true
					end
				end
				if isInArray({REWARD_MONEY, "money"}, reward.type:lower()) and not deny then
					doPlayerAddMoney(cid, reward.value[1])
				elseif isInArray({REWARD_EXP, "exp", "experience"}, reward.type:lower()) and not deny then
					doPlayerAddExp(cid, reward.value[1])
					doPlayerSendTextMessage(cid, 25, "You gained " .. reward.value[1] .. " experience points.")
				elseif isInArray({REWARD_ACHIEVEMENT, "achievement", "ach"}, reward.type:lower()) and not deny then
					if doPlayerAddAchievement then
						doPlayerAddAchievement(cid, reward.value[1], true)
					end
				elseif isInArray({REWARD_STORAGE, "storage", "stor"}, reward.type:lower()) and not deny then
					setPlayerStorageValue(cid, reward.value[1], reward.value[2])
					if (isPzLocked(cid) == false) then
						doTeleportThing(cid, {x = 32357, y = 32232, z = 8})
						doPlayerSendTextMessage(cid, 19, "Good luck!")
						doSendMagicEffect(getCreaturePosition(cid), 2)
					else
						doPlayerSendTextMessage(cid, 19, "You can access the boss room Thais Depot\'s downstair.")
					end
				elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
					doAddPoints(cid, reward.value[1])
					doPlayerSendTextMessage(cid, 25, "You gained " .. reward.value[1] .. " premium points.")
				elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
					doPlayerAddItem(cid, reward.value[1], reward.value[2])
				end

				if reward.storage then
					setPlayerStorageValue(cid, reward.storage[1], reward.storage[2])
				end
			end	
			
			
			if tasks[task].norepeatable then
				setPlayerStorageValue(cid, QUESTSTORAGE_BASE + task, 2)
			else
				setPlayerStorageValue(cid, QUESTSTORAGE_BASE + task, 0)
			end
			setPlayerStorageValue(cid, KILLSSTORAGE_BASE + task, 0)
			if getPlayerStorageValue(cid, REPEATSTORAGE_BASE + task) < 1 then
				setPlayerStorageValue(cid, REPEATSTORAGE_BASE + task, 0)
			end
			setPlayerStorageValue(cid, REPEATSTORAGE_BASE + task, getPlayerStorageValue(cid, REPEATSTORAGE_BASE + task) + 1)
		end
		talkState[talkUser] = 0
	elseif msg:lower() == "started" then
		local started = getPlayerStartedTasks(cid)
		if started and #started > 0 then
			local text = ""
			local sep = ", "
			table.sort(started, (function (a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " and "
				elseif t == #started then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end

			selfSay("The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text)
		else
			selfSay("You haven't started any task yet.")
		end
	elseif msg:lower() == "cancel" then
		local started = getPlayerStartedTasks(cid)
		if started and #started > 0 then
			selfSay("Cancelling a task will make the count restart. Wich task you want to cancel?")
			talkState[talkUser] = 2
		else
			selfSay("You haven't started any task yet.")
		end
	elseif getTaskByName(msg) and talkState[talkUser] == 2 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) > 0 then
			selfSay("You currently killed " .. getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Cancelling this task will restart the count. Are you sure you want to cancel this task?")
		else
			selfSay("Are you sure you want to cancel this task?")
		end
		talkState[talkUser] = 3
		cancel[cid] = task
	elseif msg:lower() == "yes" and talkState[talkUser] == 3 then
		setPlayerStorageValue(cid, QUESTSTORAGE_BASE + cancel[cid], -1)
		setPlayerStorageValue(cid, KILLSSTORAGE_BASE + cancel[cid], -1)
		selfSay("You have cancelled the task " .. (tasks[cancel[cid]].name or tasks[cancel[cid]].raceName) .. ".")
		talkState[talkUser] = 0
	elseif isInArray({"points", "rank"}, msg:lower()) then
		selfSay("At this time, you have " .. getPlayerStorageValue(cid, POINTSSTORAGE) .. " Paw & Fur points. You " .. (getPlayerRank(cid) == 5 and "are an Elite Hunter" or getPlayerRank(cid) == 4 and "are a Trophy Hunter" or getPlayerRank(cid) == 3 and "are a Big Game Hunter" or getPlayerRank(cid) == 2 and "are a Ranger" or getPlayerRank(cid) == 1 and "are a Huntsman" or "haven't been ranked yet") .. ".")
		talkState[talkUser] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())