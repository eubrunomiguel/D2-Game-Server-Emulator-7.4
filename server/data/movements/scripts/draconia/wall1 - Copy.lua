function onStepOut(cid, item, frompos, item2, topos) 
	pleyerpos = {x=XXXX, y=YYYY, z=Z, stackpos=1} --- Where the player should stay if he make the quest
	
	--- Nort,East,South or west poss. (or where the water vial supose to be.)
	vial1 = {x=XXX, y=YYY, z=Z, stackpos=255}
	vial2 = {x=XXX, y=YYY, z=Z, stackpos=255}
	vial3 = {x=XXX, y=YYY, z=Z, stackpos=255}
	vial4 = {x=XXX, y=YYY, z=Z, stackpos=255}

	

	getvial1 = getThingfromPos(vial1)
	getvial2 = getThingfromPos(vial2)
	getvial3 = getThingfromPos(vial3)
	getvial4 = getThingfromPos(vial4)
	
	if item.actionid == 1000 and 
		getvial1.itemid == XXXX or --- Item id for the vial of water
		getvial2.itemid == XXXX or --- Item id for the vial of water
		getvial3.itemid == XXXX or --- Item id for the vial of water
		getvial4.itemid == XXXX then --- Item id for the vial of water
		doTeleportThing(cid, playerpos)
		doPlayerSendTextMessage(cid,22,"You will not get away from here yet..")


		else
				doTransformItem(item.uid, item.itemid + 1)
		end

end

 
function onStepIn(cid, item, frompos, item2, topos)
	newvial = {x=XXX, y=YYY, z=Z, stackpos=255}

	
	getnewvial = getThingfromPos(wall1)

	
	if item.actionid == 1000 then


		doTransformItem(item.uid, item.itemid - 1)
		doCreateItem(XXXX,1,newvial) ---- Water vial id.


		else

 
end
end