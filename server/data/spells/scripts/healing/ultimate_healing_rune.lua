local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 2.5, -30, 2.5, 0)

function onGetFormulaValues(cid, level, maglevel)
	min = (level * 2.5 + maglevel * 3) * 2.4
	max = (level * 2.5 + maglevel * 3) * 2.8
	
	if min < 350 then
		min = 350
	end

	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end