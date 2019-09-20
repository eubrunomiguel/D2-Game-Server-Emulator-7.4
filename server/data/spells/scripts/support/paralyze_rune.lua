local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
setConditionFormula(condition, -0.93, 0, -0.92, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)

paralyzeMana = 1000 -- Alterar para a quantidade que a paralyze rune gasta ao ser utilizada

if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
if getPlayerMana(cid) >= paralyzeMana then
doPlayerAddMana(cid, -paralyzeMana)
doPlayerAddManaSpent(cid, paralyzeMana)
return doCombat(cid, combat, var)
else
doPlayerSendCancel(cid, "You do not have enough mana.")
end
else
doPlayerSendCancel(cid, "You need to be a druid to use this rune.")
end


end