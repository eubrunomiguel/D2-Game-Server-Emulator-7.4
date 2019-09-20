local function serverSave()
    doSaveServer(true)
    doUpdateExpMade()	
	randomPremiumPoints()
end

local function thirdSaveWarning()
    broadcastMessage("Server is saving... and the lucky player will be...", MESSAGE_STATUS_WARNING)
    addEvent(serverSave, 1000)
end

local function secondSaveWarning()
    broadcastMessage("Server is saving game in one minute. Please mind it may freeze!", MESSAGE_STATUS_WARNING)
    addEvent(thirdSaveWarning, 59000)
end

local function firstSaveWarning()
    addEvent(secondSaveWarning, 120000)
end

function onThink(interval)
    addEvent(firstSaveWarning, 120000)
    return true
end
