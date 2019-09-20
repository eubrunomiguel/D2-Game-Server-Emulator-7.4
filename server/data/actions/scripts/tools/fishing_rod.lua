-- Fishing system + formulas by Rodrigo (Nottinghster) - Tibia World RPG OldSchool

local ITEM_WORM = 3976
local ITEM_FISH = 2667

function onUse(cid, item, frompos, item2, topos)

	if doPlayerRemoveItem(cid, ITEM_WORM, 1) == 1 then
		if item2.itemid == 4820 or item2.itemid == 4821 or item2.itemid == 4822 or 
			item2.itemid == 4616 or item2.itemid == 4608 or item2.itemid == 4609 or 
			item2.itemid == 4610 or item2.itemid == 4611 or item2.itemid == 4612 or 
			item2.itemid == 4613 or item2.itemid == 4614 or item2.itemid == 4615 or 
			item2.itemid == 4617 or item2.itemid == 4618 or item2.itemid == 4619 or 
			item2.itemid == 4620 or item2.itemid == 4621 or item2.itemid == 4622 or 
			item2.itemid == 4623 or item2.itemid == 4624 or item2.itemid == 4625 then
			fishingskill = getPlayerSkill(cid,6)
			formula = math.random(1,(100+fishingskill/10))
			if formula <= fishingskill then
				doDecayItem(item2.uid)
				doSendMagicEffect(topos,1)
				doPlayerAddSkillTry(cid,6,2)
				doPlayerAddItem(cid,ITEM_FISH,1)
			else
				doSendMagicEffect(topos,1)
				doPlayerAddSkillTry(cid,6,1)
			end
		elseif item2.itemid == 491 or item2.itemid == 492 then
			doSendMagicEffect(topos,1)
		end
	end
	return 1
end
