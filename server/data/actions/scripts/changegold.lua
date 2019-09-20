local exhaust = createConditionObject(CONDITION_EXHAUSTED)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigInfo('minactionexinterval'))
function onUse(cid, item, frompos, item2, topos)
		if(hasCondition(cid, CONDITION_EXHAUSTED) ) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			return false
		end
        -- Variables --
    local gold = 2148
    local platinum = 2152
    local crystal = 2160
    local scarab = 2159
local pos = getPlayerPosition(cid)
        -- Variables *END* --

        -- Script BODY --
    if(item.itemid == gold) and (item.type < 100) then
    elseif(item.itemid == gold) and (item.type == 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_TEAL)
doAddCondition(cid, exhaust)
        doRemoveItem(item.uid, 100)
        doPlayerAddItem(cid, platinum, 1)
    elseif(item.itemid == platinum) and (item.type < 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_YELLOW)
doAddCondition(cid, exhaust)
        doRemoveItem(item.uid, 1)
        doPlayerAddItem(cid, gold, 100)
    elseif(item.itemid == platinum) and (item.type == 100) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_LIGHTBLUE)
doAddCondition(cid, exhaust)
        doRemoveItem(item.uid, 100)
        doPlayerAddItem(cid, crystal, 1)
    elseif(item.itemid == crystal) then
        doSendAnimatedText(pos,"$$$",TEXTCOLOR_TEAL)
doAddCondition(cid, exhaust)
        doRemoveItem(item.uid, 1)
        doPlayerAddItem(cid, platinum, 100)
    end
        -- Script BODY *END* --

return 1 -- Simple RETURN, but this is unused in this script :) --
end