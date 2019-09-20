local bow = 2456
local arrow = 2544
local arrowCount = 50

function onEquip(cid, item, slot)
local equipedHands = false
local equipedArrow = false
if ((getPlayerSlotItem(cid, 5).itemid == bow) or (getPlayerSlotItem(cid, 6).itemid == bow)) then
	if (slot == 10) then
	--equipped on arrow with already bow on hands
	equipedHands = true
	end
end 
if ((getPlayerSlotItem(cid, 10).itemid == bow)) then
	if ((slot == 5) or (slot == 6)) then
	-- equipped on arrow, and tried to put on hads
	equipedArrow = true
	end
end

if equipedArrow or equipedHands then
removeBow(cid,item)
end

end

function removeBow(cid,item)
doRemoveItem(item.uid)
doPlayerAddItem(cid, arrow, arrowCount)
end