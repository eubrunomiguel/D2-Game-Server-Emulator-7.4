function onStepIn(cid, item, pos)
		local heart = 2353
		local final = {x = 33388, y = 32030, z = 9} -- 20206
		
		if isPlayer(cid) then
			if item.actionid == 20167 then
					doTeleportThing(cid, final) 
			end
		end	
	return TRUE
end