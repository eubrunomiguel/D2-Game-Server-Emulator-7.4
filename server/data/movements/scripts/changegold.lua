-- Gold/Platinum/Crystal/Scarab Exchange - by Killavus --
function onUse(cid, item, frompos, item2, topos)
        -- Variables --
    local gold = 2148
    local platinum = 2152
    local crystal = 2160
    local scarab = 2159
local pos = getPlayerPosition(cid)
        -- Variables *END* --

        -- Script BODY --
    if(item.itemid == gold) and (item.type < 100) then
        doPlayerSendTextMessage(cid, 19, "You need 100 gold coins to execute exchange!")
    elseif(item.itemid == gold) and (item.type == 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_TEAL)

        doRemoveItem(item.uid, 100)
        doPlayerAddItem(cid, platinum, 1)
    elseif(item.itemid == platinum) and (item.type < 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_YELLOW)

        doRemoveItem(item.uid, 1)
        doPlayerAddItem(cid, gold, 100)
    elseif(item.itemid == platinum) and (item.type == 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_LIGHTBLUE)

        doRemoveItem(item.uid, 100)
        doPlayerAddItem(cid, crystal, 1)
    elseif(item.itemid == crystal) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_TEAL)

        doRemoveItem(item.uid, 1)
        doPlayerAddItem(cid, platinum, 100)
    end
        -- Script BODY *END* --

return 1 -- Simple RETURN, but this is unused in this script :) --
end