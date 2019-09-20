local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA) 

local area = createCombatArea(AREA_SQUARE1X1) 
setCombatArea(combat, area) 
function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength) 
    local hit = (getPlayerLevel(cid) * 1.4 + weaponSkill * 2.2 + weaponAttack * 1.7 + (getPlayerMagLevel(cid)+1) / 3) * 1.4  
    local damage = -(math.random(hit * 0.7, hit)) 
        return damage, damage 
        end 
        setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage") 
         
        function onCastSpell(cid, var) 
        return doCombat(cid, combat, var) 
        end