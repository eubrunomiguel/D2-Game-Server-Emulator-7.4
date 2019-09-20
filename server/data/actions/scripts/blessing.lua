local exhaust = createConditionObject(CONDITION_EXHAUSTED)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigInfo('minactionexinterval'))
function onUse(cid, item, fromPosition, itemEx, toPosition) 
	
	if(hasCondition(cid, CONDITION_EXHAUSTED) ) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return false
	end

    if isBlessed(cid) then
        doPlayerSendTextMessage(cid, 22, "You are blessed!") 
    else
        doPlayerSendTextMessage(cid, 22, "You do not have any blessing.") 
    end
	
	doAddCondition(cid, exhaust)
    return TRUE 
end