local config = {
				[7560] = {topos={x = 32458, y = 31097, z = 7}},
				[7561] = {topos={x = 32493, y = 31079, z = 9}},
				[7562] = {topos={x = 32458, y = 31097, z = 7}},
				[7563] = {topos={x = 32485, y = 31080, z = 7}}
			  }

function onStepIn(cid, item, pos)
	local topos = config[item.actionid]
	doTeleportThing(cid, topos.topos)
    doSendMagicEffect(getCreaturePosition(cid),10)
	return true
end