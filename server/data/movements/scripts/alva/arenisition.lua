function onStepIn(cid, item, pos)
		
		local final = {x = 33340, y = 32028, z = 8} -- 20206
		
		if isPlayer(cid) then
			if item.actionid == 20164 then
					doTeleportThing(cid, final) 
			end
		end
			
		
	return TRUE
end