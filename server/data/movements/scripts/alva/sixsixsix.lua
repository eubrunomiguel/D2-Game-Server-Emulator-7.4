function onStepIn(cid, item, pos)
		local heart = 2353
		local final = {x = 33281, y = 32064, z = 9} -- 20206
		
		if isPlayer(cid) then
			if item.actionid == 20166 then
					if doPlayerRemoveItem(cid, 2353, 1) then
					doTeleportThing(cid, final) 
					else
					doPlayerSendTextMessage(cid, 22, "You have to sacrifice a heart.")
					end
			end
		end	
	return TRUE
end