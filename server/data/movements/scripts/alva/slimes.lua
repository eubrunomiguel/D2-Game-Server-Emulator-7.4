function onStepIn(cid, item, pos)
		local heart = 2353
		local final = {x = 33357, y = 32023, z = 8} -- 20206
		
		if isPlayer(cid) then
			if item.actionid == 20165 then
					doTeleportThing(cid, final) 
			end
		end	
	return TRUE
end