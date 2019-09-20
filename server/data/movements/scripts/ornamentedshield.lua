function onEquip(cid, item, slot)
local shield = 2524
if ((getPlayerSlotItem(cid, 5).itemid == shield) or (getPlayerSlotItem(cid, 6).itemid == shield)) then
doItemSetAttribute(item, "magicpoints", 1)
doItemSetAttribute(item, "magic", 1)
end 
end

