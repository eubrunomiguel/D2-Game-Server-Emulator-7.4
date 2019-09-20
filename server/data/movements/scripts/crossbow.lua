local crossbow = 2455
local bolt = 2543
local boltCount = 50

function onEquip(cid, item, slot)
local equipedHands = false
local equipedbolt = false
if ((getPlayerSlotItem(cid, 5).itemid == crossbow) or (getPlayerSlotItem(cid, 6).itemid == crossbow)) then
	if (slot == 10) then
	--equipped on bolt with already crossbow on hands
	equipedHands = true
	end
end 
if ((getPlayerSlotItem(cid, 10).itemid == crossbow)) then
	if ((slot == 5) or (slot == 6)) then
	-- equipped on bolt, and tried to put on hads
	equipedbolt = true
	end
end

if equipedbolt or equipedHands then
removecrossbow(cid,item)
end

end

function removecrossbow(cid,item)
doRemoveItem(item.uid)
doPlayerAddItem(cid, bolt, boltCount)
end