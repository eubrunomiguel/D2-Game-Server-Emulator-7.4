local exhaust = createConditionObject(CONDITION_EXHAUSTED)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, getConfigInfo('minactionexinterval'))
function onSay(cid, words, param, channel)
		if(hasCondition(cid, CONDITION_EXHAUSTED) ) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
			return false
		end
if not isPzLocked(cid) then
if getPlayerMana(cid) >= 10 and doPlayerAddMana(cid, -10) then
doPlayerAddManaSpent(cid, 10)
doPlayerAddItem(cid, 2260)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_GREEN)
doCreatureSay(cid, "adori blank", 1)
		doAddCondition(cid, exhaust)
else
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
doPlayerSendCancel(cid, "You do not have enough mana (10).")
end
else
doPlayerSendCancel(cid, "You cannot conjure blank rune if pz locked.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end

		
	
        return false
end