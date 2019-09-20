-- 10544 = PoI Arcane Staff.
-- 10545 = PoI Avenger.
-- 10546 = PoI Arbalest.
-- 10547 = PoI Soft Boots.
-- 10548 = PoI BackPack of Holding.
-- 10549 = PoI Stuffed Dragon.
-- 10550 = PoI Frozen Starlight.
-- 10551 = PoI Ceremonial Ankh
-- 10552 = Holy Tible

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10546 then
		if getPlayerStorageValue(cid,10544) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen an arcane staff.")
			doPlayerAddItem(cid,2453,1)
			setPlayerStorageValue(cid,10544,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10545 then
		if getPlayerStorageValue(cid,10544) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen the warlord sword.")
			doPlayerAddItem(cid,2408,1)
			setPlayerStorageValue(cid,10544,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
 	elseif item.uid == 10544 then
		if getPlayerStorageValue(cid,10544) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen a crystal arrow.")
			doPlayerAddItem(cid,2352,1)
			setPlayerStorageValue(cid,10544,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10547 then
		if getPlayerStorageValue(cid,10547) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a pair of soft boots.")
			doPlayerAddItem(cid,2358,1)
			setPlayerStorageValue(cid,10547,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10550 then
		if getPlayerStorageValue(cid,10550) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found a frozen starlight.")
			doPlayerAddItem(cid,2361,1)
			setPlayerStorageValue(cid,10550,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 10559 then
		if getPlayerStorageValue(cid,10559) == -1 then
			doPlayerSendTextMessage(cid,25,"You have found 100 platinum coins.")
			doPlayerAddItem(cid,2152,100)
			setPlayerStorageValue(cid,10559,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	end
	return true
end